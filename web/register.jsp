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
        <script>
            function checkPW() {
                if ($("input[name='Password Confirm']").val() != $("input[name='Password']").val()) {
                    $("#error").text("Unmatched password");
                    return false;
                }
            }
        </script>
    </head>

    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <br>
                    <div class="panel panel-default">
                        <div class="panel-heading">Register</div>
                        <div class="panel-body">

<!--                            <a href="#" class="btn btn-block btn-social btn-facebook btn-primary">
                                <span class="fa fa-facebook "></span> Register with Facebook
                            </a>

                            <div class="row">
                                <div class="col-md-12">
                                    <hr>
                                </div>

                            </div>-->
                            <form role="form" id="regAcForm" method="get" action="AccountController.do" onsubmit="return checkPW()">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="First Name"  placeholder="First Name" aria-describedby="basic-addon1" required>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="Last Name" placeholder="Last Name" aria-describedby="basic-addon1" required>
                                    </div>
                                </div>
                                <br>
                                <!--div class="input-group">
                                        <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
                                        <input type="text" class="form-control" name="User Name" placeholder="Username" aria-describedby="basic-addon1" required>
                                </div>
                                <br-->
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></span>
                                    <input type="email" class="form-control" name="Email" placeholder="Email" aria-describedby="basic-addon1" required>
                                </div>
                                <br>
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                                    <input type="password" class="form-control" name="Password" placeholder="Password" aria-describedby="basic-addon1" required>
                                </div>
                                <br>
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                                    <input type="password" class="form-control" name="Password Confirm" placeholder="Password Confirm" aria-describedby="basic-addon1" required>
                                </div>
                                <br>
                                <h5 id='error'>
                                <%
                                    if (null != request.getAttribute("errorMessage")) {
                                        out.print(request.getAttribute("errorMessage"));
                                    }
                                %>
                            </h5>
                                <input type="hidden" name="action" value="reg" />
                                <input type='submit' value="Submit" id="btn-register" href="#" class="btn btn-success">
                                <a id="btn-login" href="login.jsp" class="btn btn-default">Login With Existing Account</a>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
    </body>

</html>
