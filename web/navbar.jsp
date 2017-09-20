<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="asg2.mdoel.Account"%>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Hotel Booking</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <ul class="nav navbar-nav navbar-right">
                <% Account ac = (Account) session.getAttribute("ac");
                %>
                <c:choose>
                    <c:when test="${not empty ac}">
                        <li class="dropdown">
                        <a class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                            Hi ${ac.first_name}
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" id="user-menu">
                            <li><a href="profile.jsp">Profile</a></li>
                            <li><a href="OrderController.do?action=vieworder">Modify Booking</a></li>
                                <c:if test="${ac.user_type=='ChiefManager' or ac.user_type=='Manager'}">
                                <li><a href="manage.jsp">Manage</a></li>
                                </c:if>
                        </ul>
                        </li>
                        <li><a href="logout.jsp">Logout</a></li>
                        </c:when>
                        <c:otherwise>
                        <li><a href='login.jsp'>Sign In</a></li>
                        </c:otherwise>
                    </c:choose>
            </ul>
            
        </div>
    </div>
</nav>