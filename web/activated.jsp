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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="js/bootstrap-datepicker.min.js"></script>
        <script src="js/main.js"></script>
    </head>

    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container-fluid">
                                    <%
                                        if (null != request.getAttribute("message")) {
                                            out.print(request.getAttribute("message"));
                                        }
                                        else{
                                           out.print("invalid action"); 
                                        }
                                    %>
        </div>
    </body>

</html>

