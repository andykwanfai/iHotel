/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import asg2.mdoel.ComplexObject;
import asg2.mdoel.Country;
import asg2.mdoel.Hotel;
import asg2.mdoel.Room;
import com.google.maps.model.GeocodingResult;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Simon
 */
public class HotelDAO {
    
    IHOTEL_DB db;
    Connection cnnct = null;
    Statement stmnt = null;
    PreparedStatement pstmnt = null;
    
    public HotelDAO() {
        db = new IHOTEL_DB();
    }
    
    public Hotel getHotelDetail(String hid) {
        
        Hotel hotel = new Hotel();
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELECT_CORR_HOTEL);
            pstmnt.setString(1, hid);
            ResultSet rs = pstmnt.executeQuery();
            while (rs.next()) {
                
                hotel.setHid(rs.getInt("hid"));
                hotel.setH_name(rs.getString("h_name"));
                hotel.setAddress(rs.getString("address"));
                hotel.setCity(rs.getString("city"));
                hotel.setH_description(rs.getString("h_description"));
                hotel.setStar(rs.getInt("star"));
                hotel.setLongitude(rs.getDouble("longitude"));
                hotel.setLatitude(rs.getDouble("latitude"));
                hotel.setRecommend(rs.getString("recommend"));
                System.out.println("test: " + hotel.getRecommend());
            }
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } finally {
            if (pstmnt != null) {
                
                try {
                    pstmnt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
                    
                }
            }
            if (cnnct != null) {
                
                try {
                    cnnct.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
                    
                }
            }
        }
        return hotel;
    }
    
    public ArrayList<Hotel> getRecommendHotel() {
        ArrayList<Hotel> list = new ArrayList<Hotel>();
        cnnct = db.getConnection();
        try {
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELECT_RECOMMEND);
            ResultSet rs = pstmnt.executeQuery();
            while (rs.next()) {
                Hotel hotel = new Hotel();
                hotel.setHid(rs.getInt("hid"));
                hotel.setH_name(rs.getString("h_name"));
                hotel.setCity(rs.getString("city"));
                hotel.setStar(rs.getInt("star"));
                list.add(hotel);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HotelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList searchHotel(String name, String date_from, String date_to, String city, String star, String capacity, String numRoom) {
        
        ArrayList<Hotel> list = new ArrayList<Hotel>();
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SEARCH_HOTEL);
            pstmnt.setString(1, date_to);
            pstmnt.setString(2, date_from);
            pstmnt.setString(3, city);
            pstmnt.setString(4, capacity);
            pstmnt.setString(5, numRoom);
            pstmnt.setString(6, "%" + name + "%");
            ResultSet rs = pstmnt.executeQuery();
            while (rs.next()) {
                Hotel hotel = new Hotel();
                hotel.setHid(rs.getInt("hid"));
                hotel.setH_name(rs.getString("h_name"));
                hotel.setAddress(rs.getString("address"));
                hotel.setCity(rs.getString("city"));
                hotel.setH_description(rs.getString("h_description"));
                hotel.setStar(rs.getInt("star"));
                hotel.setLongitude(rs.getDouble("longitude"));
                hotel.setLatitude(rs.getDouble("latitude"));
                //hotel.setMuprice(rs.getInt("muprice"));
                list.add(hotel);
            }
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } finally {
            if (pstmnt != null) {
                try {
                    pstmnt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (cnnct != null) {
                try {
                    cnnct.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return list;
    }
    
    public ArrayList getHotelList(String city) {
        
        ArrayList<Hotel> list = new ArrayList<Hotel>();
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELECT_CORR_CITY_HOTEL);
            pstmnt.setString(1, city);
            ResultSet rs = pstmnt.executeQuery();
            while (rs.next()) {
                Hotel hotel = new Hotel();
                hotel.setHid(rs.getInt("hid"));
                hotel.setH_name(rs.getString("h_name"));
                hotel.setAddress(rs.getString("address"));
                hotel.setCity(rs.getString("city"));
                hotel.setH_description(rs.getString("h_description"));
                hotel.setStar(rs.getInt("star"));
                hotel.setLongitude(rs.getDouble("longitude"));
                hotel.setLatitude(rs.getDouble("latitude"));
                hotel.setMuprice(rs.getInt("muprice"));
                list.add(hotel);
            }
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } finally {
            if (pstmnt != null) {
                try {
                    pstmnt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (cnnct != null) {
                try {
                    cnnct.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return list;
    }
    
    public void updateHotel(Hotel hotel) {
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.UPDATE_HOTEL);
            pstmnt.setString(1, hotel.getH_name());
            pstmnt.setString(2, hotel.getAddress());
            pstmnt.setString(3, hotel.getH_description());
            pstmnt.setInt(4, hotel.getStar());
            pstmnt.setBoolean(5, Boolean.parseBoolean(hotel.getRecommend()));
            pstmnt.setInt(6, hotel.getHid());
            
            System.out.println(SQLSTATEMENT.UPDATE_HOTEL);
            System.out.println(pstmnt.toString());
            pstmnt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HotelDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (pstmnt != null) {
                try {
                    pstmnt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(HotelDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (cnnct != null) {
                try {
                    cnnct.close();
                } catch (SQLException ex) {
                    Logger.getLogger(HotelDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    public ArrayList getRoom(String hid) {
        ArrayList<Room> list = new ArrayList<Room>();
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELECT_ROOM);
            pstmnt.setString(1, hid);
            ResultSet rs = pstmnt.executeQuery();
            while (rs != null && rs.next() != false) {
                Room room = new Room();
                room.setRid(rs.getInt("rid"));
                room.setHid(rs.getInt("hid"));
                room.setRoom_type(rs.getString("room_type"));
                room.setDescription(rs.getString("description"));
                room.setCapacity(rs.getInt("capacity"));
                room.setTotal_no(rs.getInt("total_no"));
                room.setUnitprice(rs.getInt("unitprice"));
                room.setRecommend(rs.getInt("recommend"));
                list.add(room);
            }
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } finally {
            if (pstmnt != null) {
                try {
                    pstmnt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (cnnct != null) {
                try {
                    cnnct.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return list;
    }
    
    public ArrayList getRoom(String hid, String minCapacity, String dateFrom, String dateTo) {
        ArrayList<Room> list = new ArrayList<Room>();
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELECT_ROOM_AVAIL3);
            pstmnt.setString(1, hid);
            pstmnt.setString(2, minCapacity);
            pstmnt.setString(3, dateTo);
            pstmnt.setString(4, dateFrom);
            pstmnt.setString(5, hid);
            pstmnt.setString(6, minCapacity);
            
            ResultSet rs = pstmnt.executeQuery();
            while (rs != null && rs.next() != false) {
                Room room = new Room();
                room.setRid(rs.getInt("rid"));
                room.setHid(rs.getInt("hid"));
                room.setAva_no(rs.getInt("avail_num"));
                list.add(room);
            }
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } finally {
            if (pstmnt != null) {
                try {
                    pstmnt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (cnnct != null) {
                try {
                    cnnct.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return list;
    }
    
    public void updateRoom(ArrayList<Room> room) {
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.UPDATE_ROOM);
            
            for (Room r : room) {
                pstmnt.setString(1, r.getRoom_type());
                pstmnt.setInt(2, r.getTotal_no());
                pstmnt.setInt(3, r.getCapacity());
                pstmnt.setInt(4, r.getUnitprice());
                pstmnt.setString(5, r.getDescription());
                pstmnt.setInt(6, r.getRecommend());
                pstmnt.setInt(7, r.getRid());
                pstmnt.executeUpdate();
            }
            
        } catch (SQLException ex) {
            
            Logger.getLogger(HotelDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (pstmnt != null) {
                try {
                    pstmnt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(HotelDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            if (cnnct != null) {
                
                try {
                    cnnct.close();
                } catch (SQLException ex) {
                    Logger.getLogger(HotelDAO.class.getName()).log(Level.SEVERE, null, ex);
                    
                }
            }
        }
    }
    
    public int updateHotelGeolocation(int hid) {
        int rows = 0;
        String address = "";
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELECT_CORR_HOTEL);
            pstmnt.setInt(1, hid);
            ResultSet rs = pstmnt.executeQuery();
            while (rs.next()) {
                address = rs.getString("address");
            }
            GeolocationHelper geolocationHelper = new GeolocationHelper();
            GeocodingResult[] locResult = geolocationHelper.getGeolocation(address);
            
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.UPDATE_HOTEL_GEOLOCATION);
            pstmnt.setDouble(1, locResult[0].geometry.location.lng);
            pstmnt.setDouble(2, locResult[0].geometry.location.lat);
            pstmnt.setInt(3, hid);
            rows = pstmnt.executeUpdate();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } finally {
            if (pstmnt != null) {
                try {
                    pstmnt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (cnnct != null) {
                try {
                    cnnct.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rows;
    }
    
    public ArrayList<Room> getRoomDetail(String rid) {
        ArrayList<Room> rl = new ArrayList<Room>();
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELECT_ROOM_BY_RID);
            pstmnt.setString(1, rid);
            
            ResultSet rs = pstmnt.executeQuery();
            while (rs != null && rs.next() != false) {
                Room room = new Room();
                room.setRid(rs.getInt("rid"));
                room.setHid(rs.getInt("hid"));
                room.setRoom_type(rs.getString("room_type"));
                room.setCapacity(rs.getInt("capacity"));
                room.setDescription(rs.getString("description"));
                room.setUnitprice(rs.getInt("unitprice"));
                rl.add(room);
            }
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } finally {
            if (pstmnt != null) {
                try {
                    pstmnt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (cnnct != null) {
                try {
                    cnnct.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rl;
    }
}
