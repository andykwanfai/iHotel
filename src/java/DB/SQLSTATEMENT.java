/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

/**
 *
 * @author Simon
 */
public class SQLSTATEMENT {

    static String SELECT_ALL_COUNTRY = "SELECT * FROM COUNTRY";
    static String SELECT_ALL_CITY = "SELECT * FROM CITY";
    static String SELECT_CORR_CITY = "SELECT * FROM CITY WHERE COUNTRY_CODE = ?";
    static String CREATE_AC = "INSERT INTO Users (EMAIL, PW, FIRST_NAME, LAST_NAME, USER_TYPE_ID) VALUES (?, ?, ?, ?, ?)";
    //static String SELEC_AUTHEN_AC = "SELECT count(*) FROM [Users] WHERE EMAIL = ? AND PW = ? AND USER_TYPE_ID>0";
    //static String SELEC_AUTHEN_AC = "SELECT * FROM viewUser WHERE EMAIL = ? AND PW = ? AND USER_TYPE<>'Unverify'";
    static String SELEC_AUTHEN_AC = "SELECT * FROM viewUser WHERE EMAIL = ? AND PW = ? AND USER_TYPE<>'Unverify'";
    static String SELECT_SESSION_USER = "select * from viewUser where userid=?";
    static String UPDATE_USER_INFO = "update users set first_name=?, last_name=?, credit_card_no=?, credit_card_type=? where userid=?";
    static String UPDATE_USER_PW = "update users set pw=? where userid=?";
    static String SELECT_HOTEL_MANAGER = "select hid from hotel_manager where userid=?";
    static String SELECT_ALL_AC = "select * from viewUser";
    static String UPDATE_USERTYPE = "update users set user_type_id=? where userid=?";
    static String SELECT_USER_TYPE = "select * from user_type";
    static String SELEC_EXIST_AC = "SELECT count(*) FROM Users WHERE EMAIL = ? ";
    static String UPDATE_AC_LEVEL = "UPDATE Users SET USER_TYPE_ID = ? WHERE PW = ? AND USER_TYPE_ID= ?";
    static String SELECT_CORR_CITY_HOTEL = "SELECT hid, h_name, address, city, h_description, star, longitude, latitude,  MIN(UNITPRICE) AS muprice FROM viewROOM WHERE CITY= ? GROUP BY  hid, h_name, address, city, h_description, star, longitude, latitude";
    static String SELECT_CORR_HOTEL = "SELECT * FROM HOTEL WHERE HID = ?";
    static String SELECT_HOTEL_BY_NAME = "select * from viewHotel where h_name like ?";
    static String UPDATE_HOTEL = "update hotel set h_name=?,address=?,h_description=?,star=?, recommend=? where hid=?";
    static String SELECT_CORR_IMAGE = "SELECT * FROM PHOTOS WHERE HID = ?";
    static String SELECT_FEATURED_CITY = "SELECT country_name, city,  MIN(UNITPRICE) AS muprice FROM viewRoom GROUP BY COUNTRY_NAME, CITY";
    static String SELECT_ROOM = "select * from room where hid = ? order by recommend desc";
    static String UPDATE_ROOM = "update room set room_type=?, total_no=?, capacity=?, unitprice=?, description=?, recommend=? where rid=?";
    static String SELECT_ROOM_AVAIL = "select((select total_no from room where "
            + "hid=? and "
            + "room_type=?) - (select sum(quantity) from booking_order where "
            + "date_from<? and "
            + "date_to>? and "
            + "hid=? and "
            + "room_type=?)) as room_avail";
    static String SELECT_ROOM_AVAIL2 = "select sum(quantity) from booking_order where "
            + "date_from<? and "
            + "date_to>? and "
            + "hid=? and "
            + "room_type=? and "
            + "group by room_type";
    //static String SELECT_ROOM_TYPE_ARR = "select hid, rid, room_type ,sum(quantity) from booking_order where date_from<'2016-4-5' and date_to>'2016-4-1' and hid=1 group by hid,room_type, rid";
    static String SELECT_ROOM_TYPE_ARR = "select hid, rid ,sum(quantity) AS room_avail from booking_order where date_from<STR_TO_DATE(?, '%d/%m/%Y') and date_to>STR_TO_DATE(?, '%d/%m/%Y') and hid=? group by hid,room_type";
    static String UPDATE_HOTEL_GEOLOCATION = "UPDATE hotel SET longitude = ?, latitude = ? WHERE hotel.hid = ? ";
    static String SELECT_ALL_HOTEL = "Select * from Hotel";
    static String SELECT_ROOM_AVAIL3 = "select room.rid,room.hid, ISNULL(num,room.total_no) as avail_num from room left join"
            + "(select rid, ISNULL(total_no-sum(quantity),total_no)as num ,total_no from viewbooking_order "
            + "where hid=? and capacity>=? and date_from<cast(? as datetime) and date_to>cast(? as datetime)"
            + "group by rid,total_no) as a "
            + "on room.rid=a.rid where room.hid=? and capacity>=?" + " order by room.rid";
    static String SELECT_ROOM_BY_RID = "SELECT * FROM ROOM WHERE rid=?";
    static String CREATE_ORDER = "INSERT INTO booking_order (email, first_name, last_name, credit_card_type, rid, date_from, date_to, book_date, quantity, final_price, status, credit_card_no) VALUES (?,?,?,?,?,?,?,GETDATE(),?,?,?,?)";
    static String SELECT_USER_ORDER = "SELECT * FROM viewBooking_order where email=?";
    static String SELECT_COMMENT = "select * from viewComment where hid=? order by post_date desc";
    static String INSERT_COMMENT = "insert into comment (userid,hid,content,rating) values (?,?,?,?)";
    static String SEARCH_HOTEL = "select * from viewHotel where hid in (select distinct viewRoom.hid from viewRoom left join "
            + "(select rid, ISNULL(total_no-sum(quantity),total_no)as num ,total_no from viewbooking_order "
            + "where date_from<cast(? as datetime) and date_to>cast(? as datetime) "
            + "group by rid,total_no) "
            + "as a "
            + "on viewRoom.rid=a.rid where city=? and capacity>=? and ISNULL(num,viewRoom.total_no)>=? and h_name like ?)";
    static String DELETE_ORDER = "DELETE FROM booking_order WHERE booking_id=? and email=?";
	static String SELECT_RECOMMEND = "select top 3 count(viewBooking_order.hid) as count,hotel.city,viewBooking_order.hid, hotel.h_name,hotel.star from viewBooking_order join hotel on viewBooking_order.hid=hotel.hid where hotel.recommend=1 group by hotel.city,hotel.star,hotel.h_name,viewBooking_order.hid order by count desc";

}
