<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="asg2.mdoel.Image"%>
<%@page import="asg2.mdoel.Account"%>
<%@page import="DB.ImageDAO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<!-- HTML5 Hello world by kirupa - http://www.kirupa.com/html5/getting_your_feet_wet_html5_pg1.htm -->
<html lang="en-us">

    <head>
        <meta charset="utf-8">
        <title>${hotel.h_name}</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <link rel="stylesheet" href="css/bootstrap-datepicker3.min.css">
        <link rel="stylesheet" href="css/main.css">
        <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="js/bootstrap-datepicker.min.js"></script>
        <script src="js/main.js"></script>
    </head>

    <body>
        <%@ include file="navbar.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                    <br>
                </div>
                <div class="col-md-8">
                    <br>
                    <div class="row">
                        <div class="col-md-12">Main > <%= request.getAttribute("country")%> > ${hotel.city} > 
                            ${hotel.h_name}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <h1>                                                                      
                                ${hotel.h_name}
                                <c:if test="${(isManager eq true)||ac.user_type=='ChiefManager'}">
                                    <a href='HotelController.do?action=edit&hid=<%=request.getParameter("hid")%>'>Edit</a>
                                </c:if>
                            </h1>
                        </div>
                    </div>
                    <div class="row">
                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                                <li data-target="#myCarousel" data-slide-to="3"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <!--div class="item active">
                                    <img width="500" src="img/city/tokyo.jpg" alt="Chania">
                                </div-->
                                <%
                                    ImageDAO imageDAO = new ImageDAO();
                                    ArrayList<Image> images = imageDAO.getImage(request.getParameter("hid"), "");
                                    for (int i = 0; i < images.size(); i++) {
                                        if (i == 0) {
                                            out.print("<div class=\"item active\">");
                                        } else {
                                            out.print("<div class=\"item\">");
                                        }
                                        out.print("<img width=\"500\" src=\"img/hotel/" + images.get(i).getPath() + "\" alt=\"Chania\">"
                                                + "</div>");
                                    }
                                %>
                                <!--div class="item">
                                    <img width="500" src="img/city/Hong Kong.jpg" alt="Chania">
                                </div>

                                <div class="item">
                                    <img width="500" src="img/city/Hong Kong.jpg" alt="Flower">
                                </div>

                                <div class="item">
                                    <img width="500" src="img/city/Hong Kong.jpg" alt="Flower">
                                </div>
                            </div-->

                                <!-- Left and right controls -->
                                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="panel panel-default">
                                <!-- Default panel contents -->
                                <!--<div class="panel-heading">Panel heading</div>-->
                                <%@ include file="datePickPanel.jsp" %>
                                <!-- Table -->
                            </div>
                        </div>





                        <div class="row">
                            <div class="panel panel-default">
                                <!-- Default panel contents -->
                                <!--<div class="panel-heading">Panel heading</div>-->

                                <!-- Table -->
                                <table class="table">
                                    <tr>
                                        <th>Description</th>
                                    </tr>
                                    <tr><td>
                                        ${hotel.h_description}
                                    </td></tr>
                                    <tr><th>Address</th></tr>
                                    <tr><td>${hotel.address}</td></tr>
                                </table>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="panel panel-default">
                                <!-- Default panel contents -->
                                <!--<div class="panel-heading">Panel heading</div>-->
                                <form id="hotel_order_form" role="form" method="GET" action="OrderController.do">
                                    <input type="hidden" name="date_from"/>
                                    <input type="hidden" name="date_to"/>
                                    <input id="input_amount" name="amount" type="hidden"/>
                                    <input type ="hidden" name="rmid"/>
                                    <input type="hidden" name="hid" value="${hotel.hid}" />
                                    <!-- Table -->
                                    <table class="table">
                                        <tr>
                                            <th>Room Type</th>
                                            <th>Details</th>
                                            <th>Max</th>
                                            <th>Per Night</th>
                                            <th>Amount</th>
                                        </tr>
                                        <c:forEach items="${roomList}" var="room">
                                            <tr>
                                                <td>${room.room_type}</td>
                                                <td>${room.description}</td>
                                                <td>${room.capacity} Guests</td>
                                                <td>$${room.unitprice}</td>
                                                <td>

                                                    <div name="amount_opt" class="btn-group">
                                                        <button id="amount_${room.rid}" class="btn btn-default btn-sm dropdown-toggle room_order_amount" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">1<span class="caret"></span></button>
                                                        <ul class="dropdown-menu">
                                                            <li><a href="#">1</a></li>
                                                            <li><a href="#">2</a></li>
                                                            <li><a href="#">3</a></li>
                                                            <li><a href="#">4</a></li>
                                                        </ul>
                                                    </div>
                                                </td><td><button id="btn_order_${room.rid}" name="action" value="${room.rid}" class="btn btn-default order_btn" disabled>Select Date</button></td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </form>
                            </div>
                            <%@include file="comment.jsp" %>
                            <footer><%@ include file="footer.jsp" %></footer>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
