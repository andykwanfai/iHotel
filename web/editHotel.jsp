<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="asg2.mdoel.Image"%>
<%@page import="DB.ImageDAO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<!-- HTML5 Hello world by kirupa - http://www.kirupa.com/html5/getting_your_feet_wet_html5_pg1.htm -->
<html lang="en-us">

    <head>
        <meta charset="utf-8">
        <title>Edit ${hotel.h_name}</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <link rel="stylesheet" href="css/main.css">
        <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="js/main.js"></script>
    </head>

    <body>
        <%@ include file="navbar.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <br>

                </div>
                <div class="col-md-8">
                    <br>
                    <form action='HotelController.do?action=update&hid=<%=request.getParameter("hid")%>' method='POST'>
                        <div class="row">
                            <div class="col-md-12">

                                <h1>                                                                      
                                    <input type="text" name='hotel' value="${hotel.h_name}"/>
                                </h1></div>
                        </div>
                        <div class="row">
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner" role="listbox">
                                    <%/*
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
                                         }*/
                                    %>

                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="panel panel-default">
                                    <!-- Default panel contents -->
                                    <!--<div class="panel-heading">Panel heading</div>-->

                                    <!-- Table -->
                                    <table class="table">
                                        <tr>
                                            <th>Description</th>
                                        </tr>
                                        <td>
                                            <textarea name='desc'>${hotel.h_description}</textarea>
                                        </td>
                                        <tr><th>Address</th></tr>
                                        <tr><td><textarea name='addr'>${hotel.address}</textarea></td></tr>
                                        <tr><th>Star</th></tr>
                                        <tr><td><select name="star">
                                                    <option value='5' ${(hotel.star eq 5)?"selected":""}>5</option>
                                                    <option value='4' ${(hotel.star eq 4)?"selected":""}>4</option>
                                                    <option value='3' ${(hotel.star eq 3)?"selected":""}>3</option>
                                                    <option value='2' ${(hotel.star eq 2)?"selected":""}>2</option>
                                                    <option value='1' ${(hotel.star eq 1)?"selected":""}>1</option>
                                                </select>
                                            </td></tr>
                                        <tr><th>Recommend</th></tr>
                                        <tr><td><select name="recommend">
                                                    <option value="true" ${(hotel.recommend eq 1)?"selected":""}>Yes</option>
                                                    <option value="false" ${(hotel.recommend eq 0)?"selected":""}>No</option>
                                                </select></td></tr>
                                    </table>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="panel panel-default">
                                    <!-- Default panel contents -->
                                    <!--<div class="panel-heading">Panel heading</div>-->

                                    <!-- Table -->
                                    <table class="table">
                                        <tr>
                                            <th>Room Type</th>
                                            <th>Details</th>
                                            <th>Price</th>
                                            <th>Total Number of Room</th>
                                            <th>Max</th>
                                            <th>Recommend</th>
                                        </tr>
                                        <c:forEach items="${roomList}" var="room">
                                            <tr>
                                                <td><input name="room_type_${room.rid}" type="text" value="${room.room_type}"/></td>
                                                <td><input name="description_${room.rid}" type="text" value="${room.description}"/></td>
                                                <td><input name="unitprice_${room.rid}" type="text" value="${room.unitprice}"/></td>
                                                <td><input name="total_no_${room.rid}" type="text" value="${room.total_no}"/></td>
                                                <td><input name="capacity_${room.rid}" type="text" value="${room.capacity}"/>Guest</td>
                                                <td><select name="recommend_${room.rid}">
                                                        <option value="300"<c:if test="${room.recommend==300}">selected</c:if>>
                                                                High
                                                            </option>
                                                            <option value="200"<c:if test="${room.recommend==200}">selected</c:if>>
                                                                Mid
                                                            </option>
                                                            <option value="100"<c:if test="${room.recommend==100}">selected</c:if>>
                                                                Low
                                                            </option>
                                                            <option value="0"<c:if test="${room.recommend==0}">selected</c:if>>
                                                                No
                                                            </option>
                                                        </select></td>
                                                </tr>
                                        </c:forEach>
                                    </table>

                                </div><button type="submit">Update</button>
                            </div>
                        </div></form>
                </div>
            </div>
        </div>
        <footer><%@ include file="footer.jsp" %></footer>
    </body>

</html>
