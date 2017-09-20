/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import DB.ImageHelper;
import java.util.ArrayList;

/**
 *
 * @author Simon
 */
public class TestImageFile {
    public static void main(String[] args){
        ImageHelper imageHelper = new ImageHelper();
        ArrayList al = imageHelper.getImages("hotel", "hyatt");
        System.out.println(al);
    }
}
