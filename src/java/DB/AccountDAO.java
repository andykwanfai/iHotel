/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import asg2.mdoel.UserType;
import asg2.mdoel.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Simon
 */
public class AccountDAO {

    IHOTEL_DB db;
    Connection cnnct = null;
    Statement stmnt = null;
    PreparedStatement pstmnt = null;

    public AccountDAO() {
        db = new IHOTEL_DB();
    }

    public int createAC(String userName, String userPassword, String firstName, String lastName) throws SQLException {
        int rows = 0;

        cnnct = db.getConnection();
        pstmnt = cnnct.prepareStatement(SQLSTATEMENT.CREATE_AC);
        pstmnt.setString(1, userName);
        pstmnt.setString(2, userPassword);
        pstmnt.setString(3, firstName);
        pstmnt.setString(4, lastName);
        pstmnt.setInt(5, 0);
        rows = pstmnt.executeUpdate();

        return rows;
    }

    public int ExistingAC(String userName) {
        int rows = 0;
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELEC_EXIST_AC);
            pstmnt.setString(1, userName);
            ResultSet rs = pstmnt.executeQuery();
            while (rs.next()) {
                rows = rs.getInt(1);
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
        return rows;
    }

    public Account loginAC(String userName, String userPassword) {

        ResultSet rs = null;
        Account ac = null;
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELEC_AUTHEN_AC);
            pstmnt.setString(1, userName);
            pstmnt.setString(2, userPassword);
            rs = pstmnt.executeQuery();
            while (rs != null && rs.next() != false) {
                ac = new Account();
                ac.setUserid(rs.getString("userid"));
                ac.setEmail(userName);
                ac.setFirst_name(rs.getString("first_name"));
                ac.setLast_name(rs.getString("last_name"));
                ac.setUser_type(rs.getString("user_type"));
                ac.setDiscount(rs.getString("discount"));
                if (ac.getUser_type().equals("Manager")) {
                    ArrayList<String> hotels = getHotelManager(ac.getUserid());
                    ac.setHid(hotels);
                }

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
        return ac;

    }

    public Account getSessionAC(String userid) {

        ResultSet rs = null;
        Account ac = null;
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELECT_SESSION_USER);
            pstmnt.setString(1, userid);
            rs = pstmnt.executeQuery();
            ac = new Account();
            while (rs != null && rs.next() != false) {

                ac.setUserid(rs.getString("userid"));
                ac.setEmail(rs.getString("email"));
                ac.setFirst_name(rs.getString("first_name"));
                ac.setLast_name(rs.getString("last_name"));
                ac.setCredit_card_no(rs.getString("credit_card_no"));
                ac.setCredit_card_type(rs.getString("credit_card_type"));
                ac.setUser_type(rs.getString("user_type"));
                ac.setDiscount(rs.getString("discount"));

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
        return ac;

    }

    public void updateUserInfo(Account ac) {
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.UPDATE_USER_INFO);
            pstmnt.setString(1, ac.getFirst_name());
            pstmnt.setString(2, ac.getLast_name());
            pstmnt.setString(3, ac.getCredit_card_no());
            pstmnt.setString(4, ac.getCredit_card_type());
            pstmnt.setString(5, ac.getUserid());
            pstmnt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateUserPW(String userid, String password) {
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.UPDATE_USER_PW);
            pstmnt.setString(1, password);
            pstmnt.setString(2, userid);
            pstmnt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int activateAC(String hash) {
        int rows = 0;
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.UPDATE_AC_LEVEL);
            pstmnt.setInt(1, 1);
            pstmnt.setString(2, hash);
            pstmnt.setInt(3, 0);
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

    public ArrayList<UserType> getUserType() {
        ArrayList<UserType> user_type_list = new ArrayList<>();
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELECT_USER_TYPE);
            ResultSet rs = pstmnt.executeQuery();
            while (rs.next()) {
                UserType user_type = new UserType();
                user_type.setUser_type_id(rs.getInt("user_type_id"));
                user_type.setUser_type(rs.getString("user_type"));
                user_type.setDiscount(rs.getFloat("discount"));
                user_type_list.add(user_type);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return user_type_list;
    }

    public ArrayList<Account> manageAC() {
        ArrayList<Account> al = new ArrayList<Account>();
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELECT_ALL_AC);
            ResultSet rs = pstmnt.executeQuery();
            while (rs.next()) {
                Account ac = new Account();
                ac.setUserid(rs.getString("userid"));
                ac.setEmail(rs.getString("email"));
                ac.setFirst_name(rs.getString("first_name"));
                ac.setLast_name(rs.getString("last_name"));
                ac.setUser_type(rs.getString("user_type"));
                if (ac.getUser_type().equals("Manager")) {
                    ArrayList<String> hotels = getHotelManager(ac.getUserid());
                    ac.setHid(hotels);
                }
                al.add(ac);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return al;
    }

    public ArrayList<String> getHotelManager(String userid) {
        ArrayList<String> hotels = new ArrayList<>();
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELECT_HOTEL_MANAGER);
            pstmnt.setString(1, userid);
            ResultSet rs = pstmnt.executeQuery();

            while (rs != null && rs.next() != false) {
                hotels.add(rs.getString("hid"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return hotels;
    }

    public void updateUserType(ArrayList<Account> al) {
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.UPDATE_USERTYPE);
            for (Account e : al) {
                pstmnt.setString(1, e.getUser_type());
                pstmnt.setString(2, e.getUserid());
                pstmnt.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String updateHotelManager(ArrayList<String> hidList, String userid) {
        String error = "";
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement("delete from hotel_manager where userid=?");
            pstmnt.setString(1, userid);
            pstmnt.executeUpdate();
            if (hidList != null) {
                pstmnt = cnnct.prepareStatement("insert into hotel_manager(hid,userid) values (?,?)");

                for (String hid : hidList) {
                    pstmnt.setString(1, hid);
                    pstmnt.setString(2, userid);
                    try {
                        pstmnt.executeUpdate();
                    } catch (SQLException ex) {
                        if (ex.getErrorCode() == 547);
                        error = error + "hid " + hid + " does not exist.<br>";
                    }
                }
            }
            return error;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateDiscount(ArrayList<UserType> list) {
        if (list.size() > 0) {
            try {
                cnnct = db.getConnection();
                pstmnt = cnnct.prepareStatement("update user_type set discount=? where user_type_id=?");
                for (UserType e : list) {
                    pstmnt.setFloat(1, e.getDiscount());
                    pstmnt.setInt(2, e.getUser_type_id());
                    pstmnt.executeUpdate();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
