<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@page import="blog.UserInfo"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="BlogServlet" method = "post">
    <jsp:useBean id="user" class="blog.UserInfo" scope="page" />
    <jsp:setProperty property="*" name="user" />
    <jsp:useBean id="database" class="blog.DataManager" scope="page" />
    <%
        String id = (String) session.getAttribute("ID");
    	user.setId(id);
        if (id != null) {
            if (database.updateUser(user) != 0) {
                out.print("회원정보 수정에 성공하였습니다.");
            } else {
                out.print("회원정보 수정에 실패하였습니다.");            
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
<button name = "cmd" value ="나의정보">회원정보 보기</button>
<input type="submit" name = "cmd" value ="Home"/>
</form>
</body>
</html>