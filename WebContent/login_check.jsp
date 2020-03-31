<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%
    request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:useBean id="database" class="blog.DataManager" scope="session" />
    <%
        String id = request.getParameter("id");
        String pass = request.getParameter("pass");
        if (database.isUser(id, pass)) {
            session.setAttribute("ID", id);
            response.sendRedirect("login_mainTest.jsp");
        } else {
            response.sendRedirect("login_form.jsp");
        }
    %>
</body>
</html>