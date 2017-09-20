/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import asg2.mdoel.Hotel;
import asg2.mdoel.Image;
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
 * @author WCW055
 */
public class ImageDAO {
    IHOTEL_DB db;
    Connection cnnct = null;
    Statement stmnt = null;
    PreparedStatement pstmnt = null;
    public ImageDAO(){
        db = new IHOTEL_DB();
    }
    public ArrayList<Image> getImage(String hid, String type){
         ArrayList<Image> list = new ArrayList<Image>();
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELECT_CORR_IMAGE);
            pstmnt.setString(1, hid);
            ResultSet rs = pstmnt.executeQuery();
            while (rs.next()) {
                Image image = new Image();
                image.setPath(rs.getString("path"));
                list.add(image);
            }
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        }finally {
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
}

