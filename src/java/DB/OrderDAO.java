/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DB;

import asg2.mdoel.ComplexObject;
import asg2.mdoel.Hotel;
import asg2.mdoel.Order;
import asg2.mdoel.Room;
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
 * @author cwwong345
 */
public class OrderDAO {
    IHOTEL_DB db;
    Connection cnnct = null;
    Statement stmnt = null;
    PreparedStatement pstmnt = null;

    public OrderDAO() {
        db = new IHOTEL_DB();
    }

    public int createOrder(Order order) throws SQLException {
        int rows = 0;
        try{
        cnnct = db.getConnection();
        pstmnt = cnnct.prepareStatement(SQLSTATEMENT.CREATE_ORDER);
        pstmnt.setString(1, order.getEmail());
        pstmnt.setString(2, order.getFirst_name());
        pstmnt.setString(3, order.getLast_name());
        pstmnt.setString(4, order.getCredit_card_type());
        pstmnt.setInt(5, order.getRid());
        pstmnt.setString(6, order.getDate_from());
        pstmnt.setString(7, order.getDate_to());
        pstmnt.setInt(8, order.getQuantity());
        pstmnt.setDouble(9, order.getFinalPrice());
        pstmnt.setString(10, order.getStatus());
        pstmnt.setString(11, (order.getCredit_card_no()==null)?"":order.getCredit_card_no());
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
    public ArrayList<ComplexObject> getUserOrder(String email){
        ArrayList<ComplexObject> list = new ArrayList<ComplexObject>();
        try{
        cnnct = db.getConnection();
        pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELECT_USER_ORDER);
        pstmnt.setString(1, email);
        ResultSet rs = pstmnt.executeQuery();
        while (rs.next()) {
                ComplexObject complexObject = new ComplexObject();
                Order order = new Order();
                order.setBooking_id(rs.getInt("booking_id"));
                order.setEmail(rs.getString("email"));
                order.setFirst_name(rs.getString("first_name"));
                order.setLast_name(rs.getString("last_name"));
                order.setCredit_card_no(rs.getString("credit_card_no"));
                order.setCredit_card_type(rs.getString("credit_card_type"));
                order.setRid(rs.getInt("rid"));
                order.setDate_from(rs.getString("date_from"));
                order.setDate_to(rs.getString("date_to"));
                order.setBook_date(rs.getString("book_date"));
                order.setQuantity(rs.getInt("quantity"));
                order.setFinalPrice(rs.getDouble("final_price"));
                order.setStatus(rs.getString("status"));
                Room room = new Room();
                room.setHid(rs.getInt("hid"));
                room.setRoom_type(rs.getString("room_type"));
                room.setCapacity(rs.getInt("capacity"));
                room.setUnitprice(rs.getInt("unitprice"));
                Hotel hotel = new Hotel();
                hotel.setH_name(rs.getString("h_name"));
                hotel.setAddress(rs.getString("address"));
                complexObject.setOrder(order);
                complexObject.setRoom(room);
                complexObject.setHotel(hotel);
                list.add(complexObject);
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
    public int deleteUserOrder(int oid, String email){
        int row=0;
        try{
        cnnct = db.getConnection();
        pstmnt = cnnct.prepareStatement(SQLSTATEMENT.DELETE_ORDER);
        pstmnt.setInt(1, oid);
        pstmnt.setString(2, email);
        row = pstmnt.executeUpdate();
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
        return row;
    }
}
