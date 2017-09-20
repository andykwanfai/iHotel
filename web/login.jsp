<!DOCTYPE html>
<!-- HTML5 Hello world by kirupa - http://www.kirupa.com/html5/getting_your_feet_wet_html5_pg1.htm -->
<html lang="en-us">

    <head>
        <meta charset="utf-8">
        <title>Hotel Booking Web Applciation - Sign In</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
        <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    </head>

    <body>
        <%@ include file="navbar.jsp" %>
        <% if (session.getAttribute("ac") != null) {
                response.sendRedirect("/index.jsp");
            }%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <br>
                    <div class="panel panel-default">
                        <div class="panel-heading">Sign In</div>
                        <div class="panel-body">
                            <form role="form" id="loginForm" method="get" action="AccountController.do">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></span>
                                    <input type="text" class="form-control" name="Email" placeholder="Email" aria-describedby="basic-addon1" >
                                </div>
                                <br>
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                                    <input type="password" class="form-control" name="Password" placeholder="Password" aria-describedby="basic-addon1">
                                </div>
                                <h5 id='error'>
                                    <%
                                        if (null != request.getAttribute("errorMessage")) {
                                            out.print(request.getAttribute("errorMessage"));
                                        }
                                    %>
                                </h5>
                                <br>
                                <input type="hidden" name="action" value="login" />
                                <input type='submit' value='Login' id="btn-login" href="#" class="btn btn-success">
                                <a id="btn-register" href="register.jsp" class="btn btn-default">Register  </a>
                                <br>
                                <h6><a href="findpw.jsp">forget password?</a></h6>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
        <footer><%@ include file="footer.jsp" %></footer>
    </body>

</html>
