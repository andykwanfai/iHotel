<%@page import="DB.HotelDAO"%>
<%@page import="asg2.mdoel.Hotel"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<!-- HTML5 Hello world by kirupa - http://www.kirupa.com/html5/getting_your_feet_wet_html5_pg1.htm -->
<html lang="en-us">

    <head>
        <meta charset="utf-8">
        <title>Hotel Booking Web Applciation - Sign In</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/bootstrap-datepicker3.min.css">
        <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="js/bootstrap-datepicker.min.js"></script>
        <script src="js/main.js"></script>
    </head>

    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <br>
                    <%@ include file="findStay.jsp" %>
                </div>
                <div class="col-md-9">
                    <br>
                    <div class="row">
                        <div class="col-md-12">Main > <% out.print(request.getParameter("country")); %> > <% out.print(request.getParameter("city")); %></div>
                    </div>
                    <div class="row">
                        <div class="col-md-12"><h1><% out.print(request.getParameter("city")); %></h1></div>
                    </div>
                    <br>
                    <div class="row">
                        <!--div class="col-md-1">
                            <nav>
                                <ul class="pagination">
                                    <li>
                                        <a href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div-->
                        <!--
                        <div class="thumbnail">
                            <img src="img/city/Hong Kong.jpg" alt="...">
                            <div class="caption">
                                <h3>XXX hotel</h3>
                                <p>$123 up</p>
                                <p><a href="HotelController.do?hid=1" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                            </div>
                        </div>
                        -->
                        <%
                            ArrayList<Hotel> hotels = new HotelDAO().getHotelList(request.getParameter("city"));
                            for (Hotel h : hotels) {
                                out.print("<div class=\"col-md-3\">");
                                out.print("<div class=\"thumbnail\">");
                                out.print("<img src=\"img/hotel/h"+h.getHid()+".jpg\" alt=\"...\">");
                                out.print("<div class=\"caption\">");
                                out.print("<h3>" + h.getH_name() + "</h3>");
                                out.print("<p>$" + h.getMuprice() + "up</p>");
                                out.print("<p><a href=\"HotelController.do?country=" + request.getParameter("country") + "&hid=" + h.getHid() + "\" class=\"btn btn-primary\" role=\"button\">Reserve Now</a></p>");
                                out.print("</div>");
                                out.print("</div>");
                                out.print("</div>");
                            }
                        %>
                        <div class="col-md-2">
                            <!--div class="col-md-1">
                                <nav>
                                    <ul class="pagination">
                                        <li>
                                            <a href="#" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div-->
                        </div>
                    </div>
                    <!--div class="row">
                        <div class="col-md-8"></div>
                        <div class="col-md-4">For more hotel ></div>
                    </div>
                    <hr>
                    <br>
                    <div class="row">
                        <div class="col-md-1">
                            <nav>
                                <ul class="pagination">
                                    <li>
                                        <a href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="col-md-3">
                            <div class="thumbnail">
                                <img src="img/city/Hong Kong.jpg" alt="...">
                                <div class="caption">
                                    <h3>XXX tower</h3>
                                    <p>abc</p>
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="thumbnail">
                                <img src="img/city/Hong Kong.jpg" alt="...">
                                <div class="caption">
                                    <h3>XXX tower</h3>
                                    <p>abcp</p>
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="thumbnail">
                                <img src="img/city/Hong Kong.jpg" alt="...">
                                <div class="caption">
                                    <h3>XXX tower</h3>
                                    <p>abc</p>
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="col-md-1">
                                <nav>
                                    <ul class="pagination">
                                        <li>
                                            <a href="#" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div-->
                    <!--div class="row">
                        <div class="col-md-8"></div>
                        <div class="col-md-4">For more spot ></div-->
                    </div>
                </div>
            </div>
        </div>
        <footer><%@ include file="footer.jsp" %></footer>
    </body>

</html>
