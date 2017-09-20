<%@page import="asg2.mdoel.ComplexObject"%>
<%@page import="asg2.mdoel.City"%>
<%@page import="DB.CityDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="asg2.mdoel.Country"%>
<%@page import="java.util.List"%>
<%@page import="DB.CountryDAO"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="javax.sql.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<!-- HTML5 Hello world by kirupa - http://www.kirupa.com/html5/getting_your_feet_wet_html5_pg1.htm -->
<!--jsp:useBean id="countries" class="asg2.CountryController"/-->
<html lang="en-us">

    <head>
        <meta charset="utf-8">
        <title>Hotel Booking Web Applciation</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/bootstrap-datepicker3.min.css">
        <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="js/bootstrap-datepicker.min.js"></script>
        <script src="js/main.js"></script>
        <link rel="stylesheet" href="css/bootstrap-rangeslider.css">

    </head>

    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container-fluid">

            <div class="row-fluid columns content"> 
                <div class="cover">
                    <div class="filter">
                        <div class="row ">
                            <div class="col-md-8 left_container">
                                <h1>Plan, Seek, Book - Hotel Booking System</h1>
                            </div>
                            <div class="col-md-4 ">
                                <br>
                                <%@ include file="findStay.jsp" %>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-8"></div>
                            <div class="col-md-4">
                                <%@ include file="recommend.jsp" %>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row index_circles">
                    <%                        CityDAO cityDAO = new CityDAO();
                        ArrayList<ComplexObject> cities = cityDAO.getFeaturedCity();
                        for (ComplexObject c : cities) {
                            out.print("<div class=\"col-md-3\">");
                            out.print("<a href=\"city.jsp?country=" + c.getCountry().getCountryName() + "&city=" + c.getCity().getCityName() + "\"><img src=\"img/city/" + c.getCity().getCityName() + ".jpg\" alt=\"...\" class=\"img-circle\"></a>");
                            out.print("<br>");
                            out.print("<h4>" + c.getCity().getCityName() + "</h4>$" + c.getHotel().getMuprice() + "up");
                            out.print("</div>");
                        }
                    %>

                </div>
                <br>
<footer><%@ include file="footer.jsp" %></footer>
            </div>
                    
        </div>
        
    </body>

</html>
