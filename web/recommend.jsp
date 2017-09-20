<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="asg2.mdoel.Hotel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DB.HotelDAO"%>
<%
    HotelDAO hotelDAO = new HotelDAO();
    ArrayList<Hotel> recommendList = hotelDAO.getRecommendHotel();
    request.setAttribute("recommendList", recommendList);
%>
<div class="panel panel-primary">
    <div class="panel-heading">Recommand hotel</div>
    <div class="panel-body">
        <c:forEach items="${recommendList}" var="recommendHotel">
            <a href="HotelController.do?hid=${recommendHotel.hid}">
                <div class="well">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="row">
                                ${recommendHotel.h_name}
                            </div>
                        </div>
                        <div class="col-md-2">
                            ${recommendHotel.city}
                        </div>
                        <div class="col-md-5">
                            <c:forEach begin="1" end="${recommendHotel.star}" varStatus="loop">
                                <img height="20" src="img/star.png">
                            </c:forEach>

                        </div>
                    </div>
                </div>
            </a>
        </c:forEach>
    </div>
</div>