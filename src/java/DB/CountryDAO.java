/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import asg2.mdoel.Country;
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
public class CountryDAO {
    IHOTEL_DB db;
    Connection cnnct = null;
    Statement stmnt = null;
    PreparedStatement pstmnt = null;
    public CountryDAO(){
        db = new IHOTEL_DB();
    }
    public ArrayList getCountryList(){
        ArrayList<Country> list = new ArrayList<Country>();
        try {
            cnnct = db.getConnection();
            stmnt = cnnct.createStatement();
            ResultSet rs = stmnt.executeQuery(SQLSTATEMENT.SELECT_ALL_COUNTRY);
            while (rs.next()) {
                Country country = new Country();
                country.setCountryCode(rs.getString("country_code"));
                country.setCountryName(rs.getString("country_name"));
                list.add(country);
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
