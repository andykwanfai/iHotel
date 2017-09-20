/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import asg2.mdoel.City;
import asg2.mdoel.ComplexObject;
import asg2.mdoel.Country;
import asg2.mdoel.Hotel;
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
public class CityDAO {
    IHOTEL_DB db;
    Connection cnnct = null;
    Statement stmnt = null;
    PreparedStatement pstmnt = null;
    public CityDAO(){
        db = new IHOTEL_DB();
    }
    public ArrayList getCityList(String countryCode){
        ArrayList<City> list = new ArrayList<City>();
        try{
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELECT_CORR_CITY);
            pstmnt.setString(1, countryCode);
            ResultSet rs = pstmnt.executeQuery();
        while (rs.next()) {
                City city = new City();
                city.setCountryCode(rs.getString("country_code"));
                city.setCityName(rs.getString("City"));
                list.add(city);
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
    public ArrayList getFeaturedCity(){
        ArrayList<ComplexObject> list = new ArrayList<ComplexObject>();
        try{
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELECT_FEATURED_CITY);
            ResultSet rs = pstmnt.executeQuery();
        while (rs.next()) {
                ComplexObject complexObject = new ComplexObject();
                City city = new City();
                city.setCityName(rs.getString("City"));
                Country country = new Country();
                country.setCountryName(rs.getString("COUNTRY_NAME"));
                Hotel hotel = new Hotel();
                hotel.setMuprice(rs.getInt("muprice"));
                complexObject.setCity(city);
                complexObject.setHotel(hotel);
                complexObject.setCountry(country);
                list.add(complexObject);
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
