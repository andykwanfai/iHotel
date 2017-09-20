/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import DB.JMailer;

/**
 *
 * @author Simon
 */
public class TestMail {
    public static void main(String[] args){
        JMailer mailer = new JMailer();
        mailer.charSet = "utf-8";
        mailer.from = "advcl06@gmail.com";  
        mailer.host = "smtp.gmail.com";//or your mail SMTP server
        mailer.subject = "JMailer example";
        mailer.body = "hi Simon.";
        mailer.smtpAuth=true;
        mailer.addAddress("chiwai92@gmail.com");
        //mailer.addBCC("son@gmail.com");
        mailer.setHTML(true);

        mailer.send();
    }
}
