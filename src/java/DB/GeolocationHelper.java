/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import asg2.MapServlet;
import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.model.GeocodingResult;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Simon
 */
public class GeolocationHelper {
    public GeocodingResult[] getGeolocation(String address){
         GeoApiContext context = new GeoApiContext().setApiKey("AIzaSyC7Ck4_ZjvR-nWWoUyY8LJnx5MC4RcRqb0");
        GeocodingResult[] results = null;
        try {
            results = GeocodingApi.geocode(context,address).await();
        } catch (Exception ex) {
            Logger.getLogger(MapServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return results;
    }
}
