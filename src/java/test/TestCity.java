/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import DB.CountryDAO;
import asg2.mdoel.Country;
import java.util.ArrayList;

/**
 *
 * @author Simon
 */
public class TestCity {
    public static void main(String[] args){
        CountryDAO countryDAO = new CountryDAO();
        ArrayList al = countryDAO.getCountryList();
        for(Object c:al)
            System.out.println(((Country)c).getCountryName());
    }
}
