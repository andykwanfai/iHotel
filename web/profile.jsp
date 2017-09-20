<%-- 
    Document   : profile
    Created on : Apr 23, 2016, 5:23:51 PM
    Author     : yfkwan8
--%>

<%@page import="DB.Encrypter"%>
<%@page import="DB.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <link rel="stylesheet" href="css/main.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <script>
            function checkPW() {
                if ($("input[name='Confirm']").val() != $("input[name='newPW']").val()) {
                    $("#error").text("Unmatched password");
                    return false;
                }
            }
        </script>
        <title>Profile</title>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <%            if (ac == null) {
                response.sendRedirect("index.jsp");
            } else {
                String action = request.getParameter("action");
                AccountDAO accountDAO = new AccountDAO();
                Account user = accountDAO.getSessionAC(ac.getUserid());
                request.setAttribute("user", user);
                request.removeAttribute("error");
                if (action != null) {
                    String email = user.getEmail();
                    String password = request.getParameter("password");
                    String mphash = Encrypter.encrypt(email + password);
                    if (action.equals("changeInfo")) {
                        if (accountDAO.loginAC(email, mphash) != null) {
                            Account newUser = new Account();
                            newUser.setUserid(ac.getUserid());
                            newUser.setFirst_name(request.getParameter("first_name"));
                            newUser.setLast_name(request.getParameter("last_name"));
                            newUser.setCredit_card_no(request.getParameter("credit_card_no"));
                            newUser.setCredit_card_type(request.getParameter("credit_card_type"));
                            accountDAO.updateUserInfo(newUser);
                            session.setAttribute("ac", newUser);
                            response.sendRedirect("profile.jsp");
                        } else {
                            request.setAttribute("error", "Wrong password!");
                        }
                    } else if (action.equals("changePW")) {
                        if (accountDAO.loginAC(email, mphash) != null) {
                            String newPW = Encrypter.encrypt(email + request.getParameter("newPW"));
                            accountDAO.updateUserPW(user.getUserid(), newPW);
                            response.sendRedirect("profile.jsp");
                        } else {
                            request.setAttribute("error", "Wrong password!");
                        }
                    }
                }
            }
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <br>
                    <div class="panel panel-default">
                        <div class="panel-heading">Profile</div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <b>Email: </b>
                                </div>
                                <div class="col-md-8">
                                    ${user.email}
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <b>User Type: </b>
                                </div>
                                <div class="col-md-8">
                                     ${user.user_type}
                                </div>  
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <b>Discount:  </b>
                                </div>
                                <div class="col-md-8">
                                    ${user.discount}
                                </div>
                            </div>
                            <br>
                            <hr>
                            <form method='POST' action="profile.jsp?action=changePW" onsubmit="return checkPW()">
                                <h5><b>Change Password</b></h5>
                                <br>
                                Current Password: <input  class="form-control" name="password" type="password"/>
                                <br>
                                New Password: <input class="form-control" name="newPW" type="password"/>
                                <br>
                                Confirm Password: <input class="form-control" name="Confirm" type="password"/>
                                <br>
                                <input class="btn btn-default" type="submit" value="submit"/>
                                <br>
                            </form>
                            <hr>
                            <form method='POST' action="profile.jsp?action=changeInfo">
                                <h5><b>Update User Information</b></h5>
                                <br>
                                <b id="error">${error}</b>
                                First Name: <input class="form-control" name="first_name" type="text" value="${user.first_name}"/>
                                <br>
                                Last Name: <input class="form-control" name="last_name" type="text" value="${user.last_name}"/>
                                <br>
                                Credit Card Number: <input class="form-control" name="credit_card_no" type="text" value="${user.credit_card_no}"/>
                                <br>
                                Credit Card Type: <select name="credit_card_type">
                                    <option value=""></option>
                                    <option value="Master" ${(user.credit_card_type eq 'Master')?"selected":""}>Master</option>
                                    <option value="Visa" ${(user.credit_card_type eq 'Visa')?"selected":""}>Visa</option>
                                </select>
                                <br>
                                Confirm Password: <input class="form-control" type="password" name="password"/>
                                <br>
                                <input class="btn btn-default" type="submit" value="submit"/>
                            </form>
                        </div>
                    </div>
            </div>
                <div class="col-md-4"></div>
            </div>
            <footer><%@ include file="footer.jsp" %></footer>
        </div>
        
    </body>
</html>
