--------------------------------------------------------
--  File created - 星期一-四月-25-2016   
--------------------------------------------------------
REM INSERTING into "Hotel"
SET DEFINE OFF;
Insert into "Hotel" ("hid","h_name","address","city","h_description","star","longitude","latitude","recommend") values (1,'Grand Hyatt Taipei','Grand Hyatt Taipei, Songshou Road, Xinyi District, Taipei City, Taiwan','Taipei','Fitted with the latest technologies, the modern guestrooms all come with a flat-screen TV, DVD player and minibar. Most rooms include a private balcony. The en suite bathroom is equipped with a shower and free toiletries.',5,121.5769572,25.0287024,'true');
Insert into "Hotel" ("hid","h_name","address","city","h_description","star","longitude","latitude","recommend") values (2,'W Taipei','W Taipei, Taiwan, Section 5, Zhongxiao East Road, Xinyi District, Taipei City','Taipei','Guests can enjoy a relaxing swim at the outdoor pool, exercise at the fitness centre, or make travel arrangements at the tour desk. Staff are at hand 24 hours to assist with your every need. The hotel also provides a souvenir shop and laundry services.',4,121.5657156,25.0405154,'false');
Insert into "Hotel" ("hid","h_name","address","city","h_description","star","longitude","latitude","recommend") values (4,'Shinjuku Prince Hotel','Shinjuku Prince Hotel, Shinjuku, Tokyo, Japan','Tokyo','Spacious rooms at The Shinjuku Prince Hotel offer private bathrooms with marble double sinks and bathrobes, 37-inch flat-screen TV and CD/DVD player. A minibar and coffee maker are also provided.',3,139.7035494,35.6938401,'false');
Insert into "Hotel" ("hid","h_name","address","city","h_description","star","longitude","latitude","recommend") values (5,'Osaka Marriott Miyako Hotel','Osaka Marriott Miyako Hotel, Abeno Ward, Osaka Prefecture, Japan','Osaka','Guests can enjoy a rejuvenating massage at the spa for a fee, or take a dip in the hot tub. Other facilities include a 24-hour business centre, banquet facilities and a barber/beauty shop. Airport limousine buses are available at a surcharge.',4,135.5184958,34.638969,'false');
Insert into "Hotel" ("hid","h_name","address","city","h_description","star","longitude","latitude","recommend") values (6,'Swissotel Nankai Osaka','Swissotel Nankai, Osaka, Osaka, Osaka Prefecture, Japan','Osaka','The hotel’s epicurean oasis features the signature French restaurant, La Baie and Japanese restaurant Hanagatami. Guests can also enjoy Italian dishes at Splendido restaurant or sip cocktails at The Bar.',5,135.5119682,34.6533451,'false');
Insert into "Hotel" ("hid","h_name","address","city","h_description","star","longitude","latitude","recommend") values (7,'The Okura Prestige Bangkok','The Okura Prestige Bangkok Witthayu Road Bangkok Thailand','Bangkok','Dining options at Marina Bay Sands include 13 restaurants and a bar/lounge. Room service is available 24 hours a day. Recreational amenities include 3 outdoor swimming pools. Also located on site are a health club and a children''s club. This 5.0-star property has a business center and offers small meeting rooms, limo/town car service, and audio-visual equipment. Wireless and wired high-speed Internet access is available in public areas (surcharges apply). This Singapore property has event space consisting of banquet facilities, conference/meeting rooms, a ballroom, and exhibit space. The property has a complimentary area shuttle which runs to destinations within 2 mi. ;Business services, wedding services, and tour/ticket assistance are available. Guest parking is available for a surcharge. Other property amenities at this Art Deco property include a casino, valet parking, and a concierge desk. The property has designated areas for smoking. A total renovation of this property was completed in 2010.',5,100.5017651,13.7563309,'false');
Insert into "Hotel" ("hid","h_name","address","city","h_description","star","longitude","latitude","recommend") values (8,'Just Sleep Kaohsiung Zhongzheng','No. 134, Zhongzheng 1st Rd, Lingya District, Kaohsiung City, Taiwan 802','Kaohsiung','Guests can enjoy a rejuvenating massage at the spa for a fee, or take a dip in the hot tub. Other facilities include a 24-hour business centre, banquet facilities and a barber/beauty shop. Airport limousine buses are available at a surcharge.',3,120.3316217,22.6282145,'false');
Insert into "Hotel" ("hid","h_name","address","city","h_description","star","longitude","latitude","recommend") values (9,'Cityinn Hotel Plus - Fuxing N. Rd., Branch','No. 338, Fuxing N Rd, Zhongshan District, Taipei City, Taiwan 104','Taipei','The hotelâ??s epicurean oasis features the signature French restaurant, La Baie and Japanese restaurant Hanagatami. Guests can also enjoy Italian dishes at Splendido restaurant or sip cocktails at The Bar.',3,121.5425865,25.0659787,'false');
Insert into "Hotel" ("hid","h_name","address","city","h_description","star","longitude","latitude","recommend") values (10,'Amba TAIPEI XIMENDING','77 Section 2 Wuchang Street, Taipei 10843, Taiwan','Taipei','Dining options at Marina Bay Sands include 13 restaurants and a bar/lounge. Room service is available 24 hours a day. Recreational amenities include 3 outdoor swimming pools. Also located on site are a health club and a children''s club. This 5.0-star property has a business center and offers small meeting rooms, limo/town car service, and audio-visual equipment. Wireless and wired high-speed Internet access is available in public areas (surcharges apply). This Singapore property has event space consisting of banquet facilities, conference/meeting rooms, a ballroom, and exhibit space. The property has a complimentary area shuttle which runs to destinations within 2 mi. ;Business services, wedding services, and tour/ticket assistance are available. Guest parking is available for a surcharge. Other property amenities at this Art Deco property include a casino, valet parking, and a concierge desk. The property has designated areas for smoking. A total renovation of this property was completed in 2010.',4,121.5055717,25.0451617,'false');
Insert into "Hotel" ("hid","h_name","address","city","h_description","star","longitude","latitude","recommend") values (11,'Landis taipei hotel','landis taipei hotel No. 41, Section 2, Minquan E Rd, Zhongshan District, Taipei City, Taiwan 104','Taipei','The hotel’s epicurean oasis features the signature French restaurant, La Baie and Japanese restaurant Hanagatami. Guests can also enjoy Italian dishes at Splendido restaurant or sip cocktails at The Bar.',5,121.5427093,25.0792018,'false');
Insert into "Hotel" ("hid","h_name","address","city","h_description","star","longitude","latitude","recommend") values (12,'cbxcb','cvbcvbcvb','Taipei','fsdf',6,null,null,'false');
REM INSERTING into "User_Type"
SET DEFINE OFF;
Insert into "User_Type" ("user_type_id","user_type","discount") values (0,'Unverify',1.0);
Insert into "User_Type" ("user_type_id","user_type","discount") values (1,'Normal',0.9);
Insert into "User_Type" ("user_type_id","user_type","discount") values (2,'Manager',0.8999999761581421);
Insert into "User_Type" ("user_type_id","user_type","discount") values (3,'ChiefManager',0.800000011920929);
REM INSERTING into "Users"
SET DEFINE OFF;
Insert into "Users" ("userid","email","pw","first_name","last_name","credit_card_no","credit_card_type","user_type_id") values (8,'chiwai92@gmail.com','1c001704db2fabd856d42f0944899873','Simon','Wong',null,null,'1');
Insert into "Users" ("userid","email","pw","first_name","last_name","credit_card_no","credit_card_type","user_type_id") values (10,'cwwong345@gapps.cityu.edu.hk','4f83b6d2489bd9b8ab85c2a88ff4d3c0','Simon','Wong',null,null,'0');
Insert into "Users" ("userid","email","pw","first_name","last_name","credit_card_no","credit_card_type","user_type_id") values (11,'chiwai92@yahoo.com.hk','8bc25743538ba289ff4dca103064c81c','Simon','Wong',null,null,'1');
Insert into "Users" ("userid","email","pw","first_name","last_name","credit_card_no","credit_card_type","user_type_id") values (12,'qqwq@qqwq.com','f7e5789180b0afa863e4119f7d156107','asdasd','asdasd',null,'Visa','1');
Insert into "Users" ("userid","email","pw","first_name","last_name","credit_card_no","credit_card_type","user_type_id") values (18,'sdfsdf','8305770f8b1600d416f3e6b40cebc0ce','fsdf','sdfsdf',null,null,'2');
Insert into "Users" ("userid","email","pw","first_name","last_name","credit_card_no","credit_card_type","user_type_id") values (27,'123','4297f44b13955235245b2497399d7a93','123','123',null,null,'2');
Insert into "Users" ("userid","email","pw","first_name","last_name","credit_card_no","credit_card_type","user_type_id") values (29,'321','3d186804534370c3c817db0563f0e461','chief','chief',null,null,'3');
Insert into "Users" ("userid","email","pw","first_name","last_name","credit_card_no","credit_card_type","user_type_id") values (30,'1@1','996441a9c0d94e8076a2824d40c6d5b6','null','null','321123','Visa','1');
REM INSERTING into "photos"
SET DEFINE OFF;
Insert into "photos" ("photoid","path","type","hid") values (1,'hyatt-1.png',null,1);
Insert into "photos" ("photoid","path","type","hid") values (2,'hyatt-2.png',null,1);
Insert into "photos" ("photoid","path","type","hid") values (3,'hyatt-3.png',null,1);
Insert into "photos" ("photoid","path","type","hid") values (4,'cityinn-1.jpg','h',9);
Insert into "photos" ("photoid","path","type","hid") values (5,'cityinn-2.jpg','h',9);
Insert into "photos" ("photoid","path","type","hid") values (6,'cityinn-3.jpg','h',9);
Insert into "photos" ("photoid","path","type","hid") values (7,'cityinn-4.jpg','h',9);
REM INSERTING into "Booking_Order"
SET DEFINE OFF;
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (4,'123','qqwq','qwq','123','asd',1,to_timestamp('2016-04-01 00:00:00.0','null'),to_timestamp('2016-04-03 00:00:00.0','null'),to_timestamp('2016-04-08 00:00:00.0','null'),1,100.0,'0');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (5,'chiwai92@gmail.com','Simon','Wong','21334134213','Visa',2,to_timestamp('2016-03-31 15:00:00.0','null'),to_timestamp('2016-04-02 12:00:00.0','null'),to_timestamp('2016-02-28 00:00:00.0','null'),2,321.1,'unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (6,'abc.gmail.com','Sally','Li','213412321','Visa',2,to_timestamp('2016-04-01 15:00:00.0','null'),to_timestamp('2016-04-03 12:00:00.0','null'),to_timestamp('2016-03-17 00:00:00.0','null'),1,150.0,'unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (7,'test@gmail.com','Simon','Wong','221232213','Visa',3,to_timestamp('2016-03-31 00:00:00.0','null'),to_timestamp('2016-04-28 00:00:00.0','null'),to_timestamp('2016-03-31 00:00:00.0','null'),1,450.0,'unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (8,'jane@gmail.com','Melody','Chan','3213213','Visa',5,to_timestamp('2016-04-01 00:00:00.0','null'),to_timestamp('2016-04-10 00:00:00.0','null'),to_timestamp('2016-04-01 00:00:00.0','null'),1,982.0,'unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (9,'andy@kwan.com','Andy','KWAN','123','123',1,to_timestamp('2016-04-02 00:00:00.0','null'),to_timestamp('2016-04-04 00:00:00.0','null'),to_timestamp('2016-03-03 00:00:00.0','null'),1,100.0,'0');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (10,'asd','asd','asd','123','213',1,to_timestamp('2016-04-06 00:00:00.0','null'),to_timestamp('2016-04-07 00:00:00.0','null'),to_timestamp('2016-04-01 00:00:00.0','null'),1,100.0,'0');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (11,'sadf','dfsd','fsdfsd','fsdf','fsdf',1,to_timestamp('2016-04-02 00:00:00.0','null'),to_timestamp('2016-04-03 00:00:00.0','null'),to_timestamp('2016-03-01 00:00:00.0','null'),1,100.0,'0');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (12,'asd','asfafa','asd','asd','asd',1,to_timestamp('2016-04-01 00:00:00.0','null'),to_timestamp('2016-04-02 00:00:00.0','null'),to_timestamp('2016-03-01 00:00:00.0','null'),2,100.0,'0');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (13,'asd','asd','asd','ads','ad',1,to_timestamp('2016-03-31 00:00:00.0','null'),to_timestamp('2016-04-01 00:00:00.0','null'),to_timestamp('2016-03-01 00:00:00.0','null'),1,100.0,'0');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (19,'chiwai92@gmail.com','Simon','Wong','324324324234','Visa',1,to_timestamp('2016-04-02 00:00:00.0','null'),to_timestamp('2016-04-04 00:00:00.0','null'),to_timestamp('2016-04-24 22:00:33.857','null'),1,1035.0,'Unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (26,'may@sads.com','wong','may','','PayPal',4,to_timestamp('2016-08-25 00:00:00.0','null'),to_timestamp('2016-08-27 00:00:00.0','null'),to_timestamp('2016-04-24 23:09:38.837','null'),2,1646.8,'Unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (27,'may@sads.com','wong','may','','PayPal',4,to_timestamp('2016-08-25 00:00:00.0','null'),to_timestamp('2016-08-27 00:00:00.0','null'),to_timestamp('2016-04-24 23:09:53.757','null'),2,1646.8,'Unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (28,'may@sads.com','wong','may','','PayPal',4,to_timestamp('2016-08-25 00:00:00.0','null'),to_timestamp('2016-08-27 00:00:00.0','null'),to_timestamp('2016-04-24 23:09:57.727','null'),2,1646.8,'Unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (29,'may@sads.com','wong','may','','PayPal',4,to_timestamp('2016-08-25 00:00:00.0','null'),to_timestamp('2016-08-27 00:00:00.0','null'),to_timestamp('2016-04-24 23:10:05.943','null'),2,1646.8,'Unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (30,'may@sads.com','wong','may','','PayPal',4,to_timestamp('2016-08-25 00:00:00.0','null'),to_timestamp('2016-08-27 00:00:00.0','null'),to_timestamp('2016-04-24 23:10:06.663','null'),2,1646.8,'Unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (31,'may@sads.com','wong','may','','PayPal',4,to_timestamp('2016-08-25 00:00:00.0','null'),to_timestamp('2016-08-27 00:00:00.0','null'),to_timestamp('2016-04-24 23:10:07.227','null'),2,1646.8,'Unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (32,'may@sads.com','wong','may','','PayPal',4,to_timestamp('2016-08-25 00:00:00.0','null'),to_timestamp('2016-08-27 00:00:00.0','null'),to_timestamp('2016-04-24 23:10:07.54','null'),2,1646.8,'Unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (33,'may@sads.com','wong','may','','PayPal',4,to_timestamp('2016-08-25 00:00:00.0','null'),to_timestamp('2016-08-27 00:00:00.0','null'),to_timestamp('2016-04-24 23:10:07.85','null'),2,1646.8,'Unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (34,'asddsad2@sadsa.com','chan','andy','','PayPal',5,to_timestamp('2016-04-02 00:00:00.0','null'),to_timestamp('2016-04-04 00:00:00.0','null'),to_timestamp('2016-04-24 23:11:26.26','null'),2,3008.3999999999996,'Unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (35,'asddsad2@sadsa.com','chan','andy','','PayPal',5,to_timestamp('2016-04-02 00:00:00.0','null'),to_timestamp('2016-04-04 00:00:00.0','null'),to_timestamp('2016-04-24 23:11:33.007','null'),2,3008.3999999999996,'Unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (36,'asddsad2@sadsa.com','chan','andy','','PayPal',5,to_timestamp('2016-04-02 00:00:00.0','null'),to_timestamp('2016-04-04 00:00:00.0','null'),to_timestamp('2016-04-24 23:11:38.947','null'),2,3008.3999999999996,'Unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (37,'asddsad2@sadsa.com','chan','andy','','PayPal',5,to_timestamp('2016-04-02 00:00:00.0','null'),to_timestamp('2016-04-04 00:00:00.0','null'),to_timestamp('2016-04-24 23:11:39.197','null'),2,3008.3999999999996,'Unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (38,'asddsad2@sadsa.com','chan','andy','','PayPal',5,to_timestamp('2016-04-02 00:00:00.0','null'),to_timestamp('2016-04-04 00:00:00.0','null'),to_timestamp('2016-04-24 23:11:39.383','null'),2,3008.3999999999996,'Unpaid');
Insert into "Booking_Order" ("booking_id","email","first_name","last_name","credit_card_no","credit_card_type","rid","date_from","date_to","book_date","quantity","final_price","status") values (39,'dfsasdsa@sadxsa.com','wo','ann','','PayPal',4,to_timestamp('2016-07-21 00:00:00.0','null'),to_timestamp('2016-07-23 00:00:00.0','null'),to_timestamp('2016-04-24 23:13:38.697','null'),2,1646.8,'Unpaid');
REM INSERTING into "Country"
SET DEFINE OFF;
Insert into "Country" ("country_code","country_name") values ('AUS','Australia');
Insert into "Country" ("country_code","country_name") values ('CN','China');
Insert into "Country" ("country_code","country_name") values ('FR','France');
Insert into "Country" ("country_code","country_name") values ('HK','Hong Kong');
Insert into "Country" ("country_code","country_name") values ('JP','Japan');
Insert into "Country" ("country_code","country_name") values ('KR','South Korea');
Insert into "Country" ("country_code","country_name") values ('MA','Malaysia');
Insert into "Country" ("country_code","country_name") values ('MO','Macau');
Insert into "Country" ("country_code","country_name") values ('SG','Singaphore');
Insert into "Country" ("country_code","country_name") values ('TH','Thailand');
Insert into "Country" ("country_code","country_name") values ('TW','Taiwan');
Insert into "Country" ("country_code","country_name") values ('USA','America');
REM INSERTING into "Comment"
SET DEFINE OFF;
Insert into "Comment" ("id","userid","hid","content","rating","post_date") values (2,12,1,'hi',1,to_timestamp('2016-04-23 15:26:33.183','null'));
Insert into "Comment" ("id","userid","hid","content","rating","post_date") values (3,27,1,'123',123,to_timestamp('2016-04-23 16:48:17.577','null'));
REM INSERTING into "City"
SET DEFINE OFF;
Insert into "City" ("country_code","city") values ('TH','Bangkok');
Insert into "City" ("country_code","city") values ('CN','Beijing');
Insert into "City" ("country_code","city") values ('USA','Chicago');
Insert into "City" ("country_code","city") values ('HK','Hong Kong');
Insert into "City" ("country_code","city") values ('KR','Incheon');
Insert into "City" ("country_code","city") values ('KR','Jeju');
Insert into "City" ("country_code","city") values ('TW','Kaohsiung');
Insert into "City" ("country_code","city") values ('MA','Kuala Lumpur');
Insert into "City" ("country_code","city") values ('JP','Kyoto');
Insert into "City" ("country_code","city") values ('FR','Lyon');
Insert into "City" ("country_code","city") values ('MO','Macau');
Insert into "City" ("country_code","city") values ('FR','Marseille');
Insert into "City" ("country_code","city") values ('AUS','Melbourne');
Insert into "City" ("country_code","city") values ('CN','Nanjing');
Insert into "City" ("country_code","city") values ('USA','New York');
Insert into "City" ("country_code","city") values ('JP','Osaka');
Insert into "City" ("country_code","city") values ('FR','Paris');
Insert into "City" ("country_code","city") values ('TH','Pattaya');
Insert into "City" ("country_code","city") values ('MA','Penang');
Insert into "City" ("country_code","city") values ('AUS','Perth');
Insert into "City" ("country_code","city") values ('TH','Phuket');
Insert into "City" ("country_code","city") values ('MA','Sabah');
Insert into "City" ("country_code","city") values ('KR','Seoul');
Insert into "City" ("country_code","city") values ('CN','Shanghai');
Insert into "City" ("country_code","city") values ('SG','Singaphore');
Insert into "City" ("country_code","city") values ('AUS','Sydney');
Insert into "City" ("country_code","city") values ('TW','Taichung');
Insert into "City" ("country_code","city") values ('TW','Taipei');
Insert into "City" ("country_code","city") values ('JP','Tokyo');
Insert into "City" ("country_code","city") values ('USA','Washington');
REM INSERTING into "Room"
SET DEFINE OFF;
Insert into "Room" ("rid","hid","room_type","total_no","capacity","unitprice","description","recommend") values (1,1,'Gold',10,5,500,'golden',200);
Insert into "Room" ("rid","hid","room_type","total_no","capacity","unitprice","description","recommend") values (2,1,'Luxury',30,2,385,'lol',0);
Insert into "Room" ("rid","hid","room_type","total_no","capacity","unitprice","description","recommend") values (3,1,'Cheap',1,2,300,'no money',100);
Insert into "Room" ("rid","hid","room_type","total_no","capacity","unitprice","description","recommend") values (4,2,'Garden View',50,2,358,'',0);
Insert into "Room" ("rid","hid","room_type","total_no","capacity","unitprice","description","recommend") values (5,2,'Premium',56,2,654,'',0);
Insert into "Room" ("rid","hid","room_type","total_no","capacity","unitprice","description","recommend") values (6,4,'Luxury',30,2,485,null,null);
Insert into "Room" ("rid","hid","room_type","total_no","capacity","unitprice","description","recommend") values (7,9,'Double',31,2,324,'This is a double room',null);
Insert into "Room" ("rid","hid","room_type","total_no","capacity","unitprice","description","recommend") values (8,9,'Elite',30,2,348,'The 42-inch LCD television comes with complimentary Video on Demand system (Blu-ray movies available) and Wi-Fi; the brilliant and convenient audio-visual entertainment it brings surely will delight you.',null);
Insert into "Room" ("rid","hid","room_type","total_no","capacity","unitprice","description","recommend") values (9,9,'Family',5,4,780,'With the 2 double beds in the room, this room type is ideal for friends travelling together or small families. The 42-inch LCD television comes with complimentary Video on Demand system (Blu-ray movies available) and Wi-Fi.',null);
REM INSERTING into "Hotel_Manager"
SET DEFINE OFF;
Insert into "Hotel_Manager" ("userid","hid") values (18,1);
Insert into "Hotel_Manager" ("userid","hid") values (18,4);
Insert into "Hotel_Manager" ("userid","hid") values (27,1);
Insert into "Hotel_Manager" ("userid","hid") values (27,2);
Insert into "Hotel_Manager" ("userid","hid") values (27,4);
