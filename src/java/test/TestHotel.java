/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import DB.HotelDAO;
import asg2.mdoel.Hotel;
import java.util.ArrayList;

/**
 *
 */
public class TestHotel {

    public static void main(String[] args) {
        HotelDAO hotelDAO = new HotelDAO();
        for(int i =4;i<=11;i++)
            hotelDAO.updateHotelGeolocation(i);
        
      //  Hotel h = hotelDAO.getHotelDetail("1");
      //      System.out.println(h.getH_name());
    }
}
