/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;

/**
 *
 * @author Simon
 */
public class ImageHelper {

    ArrayList<String> al = new ArrayList<String>();
    File[] foundFiles;

    public ArrayList getImages(String type, String prefix) {
        File dir = new File("web/img/"+type);
        System.out.println(dir.getAbsolutePath());
        foundFiles = dir.listFiles(new FilenameFilter() {
            public boolean accept(File dir, String name) {
                return name.startsWith(prefix);
            }
        });
        for (File file : foundFiles) {
            // Process file
            al.add(file.getName());
        }
        return al;
    }
}
