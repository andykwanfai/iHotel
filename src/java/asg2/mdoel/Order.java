/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asg2.mdoel;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author cwwong345
 */
public class Order {

    private int booking_id;
    private String email;
    private String first_name;
    private String last_name;
    private String credit_card_no;
    private String credit_card_type;
    private int rid;
    private String date_from;
    private String date_to;
    private String book_date;
    private int quantity;
    private double finalPrice;
    private String status;
    private double subPrice;

    public int getBooking_id() {
        return booking_id;
    }

    public void setBooking_id(int booking_id) {
        this.booking_id = booking_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getCredit_card_no() {
        return credit_card_no;
    }

    public void setCredit_card_no(String credit_card_no) {
        this.credit_card_no = credit_card_no;
    }

    public String getCredit_card_type() {
        return credit_card_type;
    }

    public void setCredit_card_type(String credit_card_type) {
        this.credit_card_type = credit_card_type;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getDate_from() {
        return date_from;
    }

    public void setDate_from(String date_from) {
        this.date_from = date_from;
    }

    public String getDate_to() {
        return date_to;
    }

    public void setDate_to(String date_to) {
        this.date_to = date_to;
    }

    public String getBook_date() {
        return book_date;
    }

    public void setBook_date(String book_date) {
        this.book_date = book_date;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getFinalPrice() {
        return finalPrice;
    }

    public void setFinalPrice(double finalPrice) {
        this.finalPrice = finalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public void setSubPrice(double subPrice){
        this.subPrice = subPrice;
    }
    public double getSubPrice(){
        return subPrice;
    }
    public double calculatePrice(int unitPrice, int night, int amount) {
        return unitPrice * night * amount;
    }

    public int calDay(String dayFrom, String dayTo) {
        int days = 0;
        SimpleDateFormat myFormat = new SimpleDateFormat("MM/dd/yyyy");
        try {
            Date date1 = myFormat.parse(dayFrom);
            Date date2 = myFormat.parse(dayTo);
            long diff = date2.getTime() - date1.getTime();
            days = (int) (TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return days;
    }
}
