<%@page import="asg2.mdoel.Account"%>
<%@page import="asg2.mdoel.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DB.CommentDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String hid = request.getParameter("hid");
    String action = request.getParameter("action");
    if (hid != null) {
        CommentDAO commentDAO = new CommentDAO();
        if (action == null) {
            ArrayList<Comment> commentList = new ArrayList<Comment>();
            commentList = commentDAO.getComment(hid);
            request.setAttribute("commentList", commentList);
        } else if (action.equals("addComment")) {
            Comment comment = new Comment();
            Account user = (Account) session.getAttribute("ac");
            if (user != null) {
                comment.setUserid(user.getUserid());
                comment.setHid(hid);
                comment.setContent(request.getParameter("content"));
                comment.setRating(request.getParameter("rating"));
                commentDAO.addComment(comment);
            }
            response.sendRedirect("HotelController.do?hid=" + hid);
        }
    }%>
<div class="panel panel-default">
          <table  class="table">
            <tr>
                <th>
                    Name
                </th>
                <th>
                    Content
                </th>
                <th>
                    Rating
                </th>
                <th>
                    Date
                </th>
            </tr>
            
<c:forEach items="${commentList}" var="cm">
    <tr> 
        <td>${cm.first_name} ${cm.last_name}</td>
        <td>${cm.content}</td>
        <td>${cm.rating}</td>
        <td>${cm.post_date}</td>
    </tr>
</c:forEach>
    </table>
</div>
    
<c:if test="${ac!=null}">
    <div class="panel panel-default">
        <table  class="table">
            <tr>
                <th>
                    comment
                </th>
            </tr>
        </table>
        <div class="panel-body">
    <form method="POST" action="comment.jsp?action=addComment&hid=<%=request.getParameter("hid")%>">
      
        Rating: <select class="form-control" name="rating" type="text">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select>
        Comment: <textarea class="form-control" name="content"></textarea>
        <br>
        <input class="btn btn-default" type="submit" value="submit"/>
    </form>
        </div>
    </div>
</c:if>