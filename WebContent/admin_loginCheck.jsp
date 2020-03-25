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
		String rPath = request.getContextPath();
        String id = request.getParameter("id");
        String pass = request.getParameter("pass");
        if (database.isSuperuser(id, pass)) {
            session.setAttribute("ID", id);
            response.sendRedirect(rPath+"/admin_main.jsp");
        } else {
            response.sendRedirect(rPath);
        }
    %>
    
</body>
</html>