<%@page import="java.util.Arrays"%>
<%@page import="asg2.mdoel.UserType"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="DB.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Management Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <link rel="stylesheet" href="css/main.css">
        <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <script>
            $(document).ready(function() {
                //$('select').change().parent().siblings().children('input[type=checkbox]').prop('checked', true);
                $('select').change().parentsUntil('table').children('input[type=checkbox]').prop('checked', true);
            });
        </script>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <%            if (ac == null || !ac.getUser_type().contains("Manager")) {
                response.sendRedirect("index.jsp");
            }
            String action = request.getParameter("action");
            AccountDAO accountDAO = new AccountDAO();
            if (action == null) {
                if (ac.getUser_type().contains("Manager")) {
                    ArrayList<Account> al = accountDAO.manageAC();
                    ArrayList<UserType> user_type_list = accountDAO.getUserType();
                    ArrayList<UserType> user_type_option = new ArrayList<UserType>(user_type_list);
                    UserType cm = null;
                    for (UserType e : user_type_option) {
                        if (e.getUser_type().equals("ChiefManager")) {
                            cm = e;
                        }
                    }
                    user_type_option.remove(cm);
                    request.setAttribute("al", al);
                    request.setAttribute("user_type_list", user_type_list);
                    request.setAttribute("user_type_option", user_type_option);
                }
            } else if (action.equals("updateUser")) {
                session.removeAttribute("error");
                String error = null;
                String[] checkbox = request.getParameterValues("checkbox");
                ArrayList<Account> acList = new ArrayList<Account>();
                if (checkbox != null) {
                    for (String e : checkbox) {

                        Account updateAC = new Account();
                        updateAC.setUserid(e);
                        updateAC.setUser_type(request.getParameter("user_type_" + e));
                        String hids = request.getParameter("hotels_" + e);
                        if (hids != null) {
                            if (!updateAC.getUser_type().equals("2") || hids.equals("")) {//user_type_id of manager
                                error = accountDAO.updateHotelManager(null, updateAC.getUserid());
                            } else {
                                String[] hidArray = hids.split(",");
                                ArrayList<String> hidList = new ArrayList(Arrays.asList(hidArray));
                                error = accountDAO.updateHotelManager(hidList, updateAC.getUserid());
                            }
                        }
                        acList.add(updateAC);
                    }
                    accountDAO.updateUserType(acList);
                }
                if (error != null) {
                    session.setAttribute("error", error);
                }
                response.sendRedirect("manage.jsp");
            } else if (action.equals("updateDiscount")) {
                String[] checkbox = request.getParameterValues("checkbox");
                ArrayList<UserType> updateList = new ArrayList<UserType>();
                if (checkbox != null) {
                    for (String e : checkbox) {
                        UserType newUserType = new UserType();
                        newUserType.setUser_type_id(Integer.parseInt(e));
                        newUserType.setDiscount(Float.parseFloat(request.getParameter("discount_" + e)));
                        updateList.add(newUserType);
                    }
                }
                accountDAO.updateDiscount(updateList);
                response.sendRedirect("manage.jsp");
            }
        %>
        <c:if test="${ac.user_type=='ChiefManager'}">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <b>Update User Type</b>
                        <form method="POST" action="manage.jsp?action=updateUser">
                            <table class="table">
                                <tr>
                                    <th>Edit</th><th>Email</th><th>First Name</th><th>Last Name</th><th>User Type</th><th>Manager of<br>(hid, split by comma)</th>
                                </tr>
                                <c:forEach items="${al}" var="ac">
                                    <tr>
                                        <td>
                                            <c:if test="${ac.user_type!='ChiefManager'}">
                                                <input type="checkbox" name="checkbox" value="${ac.userid}"/>
                                            </c:if>
                                        </td>
                                        <td>${ac.email}</td>
                                        <td>${ac.first_name}</td>
                                        <td>${ac.last_name}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${ac.user_type=='ChiefManager'}">
                                                    ${ac.user_type}
                                                </c:when>
                                                <c:otherwise>
                                                    <select name="user_type_${ac.userid}">
                                                        <c:forEach items="${user_type_option}" var="user_type">
                                                            <option value="${user_type.user_type_id}"
                                                                    <c:if test="${user_type.user_type==ac.user_type}">
                                                                        selected
                                                                    </c:if>
                                                                    >${user_type.user_type}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:if test="${ac.user_type=='Manager'}">
                                                <input  class="form-control" name="hotels_${ac.userid}" value="<c:forEach items="${ac.hid}" var="e" varStatus="status">${e}${(!status.last)?",":""}</c:forEach>"/>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <input class="btn btn-default" type="submit" value="Update"/>

                        </form>
                    </div>
                    <div class="col-md-4"></div>
                </div>

                ${error}
            </c:if>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <hr>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <b>Update Discount</b>
                    <form method="POST" action="manage.jsp?action=updateDiscount">
                        <table  class="table">
                            <tr><th>Edit</th><th>User Type</th><th>Discount</th></tr>
                                    <c:forEach items="${user_type_list}" var="e">
                                <tr><td><input type="checkbox" name="checkbox" value="${e.user_type_id}"/></td>
                                    <td>${e.user_type}</td>
                                    <td><input class="form-control" type="text" name="discount_${e.user_type_id}" value="${e.discount}"/></td>
                                </tr>
                            </c:forEach>
                        </table>
                        <input class="btn btn-default" type="submit" value="Update"/>
                    </form>
                </div>
            </div>
        </div>
        <footer><%@ include file="footer.jsp" %></footer>
    </body>
</html>
