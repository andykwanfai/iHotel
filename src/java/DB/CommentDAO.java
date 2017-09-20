/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import asg2.mdoel.Comment;
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
 * @author yfkwan8
 */
public class CommentDAO {

    IHOTEL_DB db;
    Connection cnnct = null;
    Statement stmnt = null;
    PreparedStatement pstmnt = null;

    public CommentDAO() {
        db = new IHOTEL_DB();
    }

    public ArrayList<Comment> getComment(String hid) {
        ArrayList<Comment> commentList = new ArrayList<Comment>();
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.SELECT_COMMENT);
            pstmnt.setString(1, hid);
            ResultSet rs = pstmnt.executeQuery();
            while (rs != null && rs.next()) {
                Comment cm = new Comment();
                cm.setId(rs.getString("id"));
                cm.setUserid(rs.getString("userid"));
                cm.setHid(rs.getString("hid"));
                cm.setContent(rs.getString("content"));
                cm.setRating(rs.getString("rating"));
                cm.setPost_date(rs.getString("post_date"));
                cm.setFirst_name(rs.getString("first_name"));
                cm.setLast_name(rs.getString("last_name"));
                commentList.add(cm);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        return commentList;
    }

    public void addComment(Comment cm) {
        try {
            cnnct = db.getConnection();
            pstmnt = cnnct.prepareStatement(SQLSTATEMENT.INSERT_COMMENT);
            pstmnt.setString(1, cm.getUserid());
            pstmnt.setString(2, cm.getHid());
            pstmnt.setString(3, cm.getContent());
            pstmnt.setString(4, cm.getRating());
            ResultSet rs = pstmnt.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
