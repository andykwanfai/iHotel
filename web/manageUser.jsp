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
        <title>Manage User</title>
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
        <%            if (ac == null || !ac.getUser_type().equals("ChiefManager")) {
                response.sendRedirect("index.jsp");
            }
            AccountDAO accountDAO = new AccountDAO();
            if (request.getParameter("action") == null) {
                ArrayList<Account> al = accountDAO.manageAC();
                ArrayList<UserType> user_type_list = accountDAO.getUserType();
                UserType cm = null;
                for (UserType e : user_type_list) {
                    if (e.getUser_type().equals("ChiefManager")) {
                        cm = e;
                    }
                }
                user_type_list.remove(cm);
                request.setAttribute("al", al);
                request.setAttribute("user_type_list", user_type_list);
            } else if (request.getParameter("action").equals("update")) {
                
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
                            String[] hidArray = hids.split(",");
                            ArrayList<String> hidList = new ArrayList(Arrays.asList(hidArray));
                            error = accountDAO.updateHotelManager(hidList, updateAC.getUserid());
                        }
                        acList.add(updateAC);
                    }
                    accountDAO.updateUserType(acList);
                }
                if (error != null) {
                    session.setAttribute("error", error);
                }
                response.sendRedirect("manageUser.jsp");
            }
        %>
         <div class="container-fluid">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <form method="POST" action="manageUser.jsp?action=update">
                        <table  class="table">
                            <tr>
                                <th></th><th>Email</th><th>First Name</th><th>Last Name</th><th>User Type</th><th>Manager of<br>(hid, split by comma)</th>
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
                                                    <c:forEach items="${user_type_list}" var="user_type">
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
                        <input  class="btn btn-default" type="submit" value="Update"/>
                        ${error}
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
