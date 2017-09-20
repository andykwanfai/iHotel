<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="asg2.mdoel.Account"%>
<!DOCTYPE html>
<!-- HTML5 Hello world by kirupa - http://www.kirupa.com/html5/getting_your_feet_wet_html5_pg1.htm -->
<html lang="en-us">

    <head>
        <meta charset="utf-8">
        <title>Hotel Booking Web Applciation - Find Password</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/process_bar.css">
        <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.12.0-beta.1/jquery-ui.min.js"   integrity="sha256-WyjlLy3rvVSitHOXMctYkMCOU6GAletPg+qniNKLCQM="   crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/main.css">
        <script src="js/main.js"></script>
        <script src="js/payment.js"></script>
    </head>
    <% 
        if(session.getAttribute("ac")==null){
            response.sendRedirect("index.jsp");
        }  
    %>
    <body>
                <%@ include file="navbar.jsp" %>
        <div class="row">
            <div class="col-md-2"></div>
                        <div class="col-md-8">
                            <h1>                                                                      
                                Booking Order Record
                            </h1>
                        </div>
            <div class="col-md-2"></div>
                    </div>
        <div class="container-fluid">
                        <div class="row">
                <div class="col-md-2">
                    <br>
                </div>
                <div class="col-md-8">
                    <c:forEach items="${complexObjectList}" var="complexObject">
                    <div class="panel panel-default">
                        <div class="panel-heading"><b>Order Reference:&nbsp;${complexObject.order.booking_id}</b>
                            <dl><dd>Transaction date: ${complexObject.order.book_date}</dd></dl><button name="cancel_${complexObject.order.booking_id}"value="${complexObject.order.booking_id}" type="button" class="btn btn-danger cancel_order">Cancel</button></div>
                        <table class="table">
                            <tr class="info"><th>Customer Name</th></tr>
                            <tr><td>${complexObject.order.first_name} ${complexObject.order.last_name}</td></tr>
                            <tr class="info"><th>Order Details</th></tr>
                            <tr ><td>
                                  <dl><dt>Hotel:</dt>
                                      <dd>${complexObject.hotel.h_name}</dd>
                                      <br>
                                      <dt>Address:</dt>
                                      <dd>${complexObject.hotel.address}</dd>
                                      <br>
                                      <dt>Date:</dt>
                                      <dd>
                                          ${complexObject.order.date_from}&nbsp;To&nbsp;${complexObject.order.date_to}</dd>
                                      <br>
                                      <dt>Room Type: </dt>
                                      <dd> ${complexObject.room.room_type}</dd>
                                      <br>
                                      <dt>Final Price with Tax and Discount:</dt>
                                      <dd><fmt:setLocale value="zh_HK"/>
                                                <fmt:formatNumber value="${complexObject.order.finalPrice}" type="currency"/></dd>
                                  </dl>
                                </td></tr>
                            <tr><th>Payment Method</th></tr>
                            <tr><td>${complexObject.order.credit_card_type}</td></tr>
                            <tr><th>Customer Name</th></tr>
                            <tr><td>${complexObject.order.first_name} ${complexObject.order.last_name}</td></tr>
                            <tr><th>status</th></tr>
                            <tr><td>${complexObject.order.status}</td></tr>
                        </table>
                                       
        </div>
                         </c:forEach>
                </div>                
        <div class="col-md-2">
                    <br>
                </div>
                        </div>
        </div>
    </body>
</html>