<%@page import="blog.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="database" class="blog.DataManager" scope="page" />
	<form action="updater.jsp" method = "post">
		<%
		String id = (String) session.getAttribute("ID");
	    if (id != null) {
	        UserInfo user = database.getUser(id);
	        out.print("<table>");
	        out.print("<tr><th colspan=2>회원정보</th></tr>");
            out.print("<tr><td>아이디</td><td>" + user.getId()+ "</td></tr>");
	        out.print("<tr><td>비밀번호</td><td><input type=\"password\" name=\"pass\" value=\"" + user.getPass()
	                + "\"></td></tr>");
	        out.print("<tr><td>이름</td><td><input type=\"text\" name=\"name\" value=\"" + user.getName()
	                + "\"></td></tr>");
	        out.print("<tr><td solspan=2><input type=\"submit\" value=\"변경하기\"></td></tr>");
	        out.print("</table>");
	    } else {
	        response.sendRedirect("login_form.jsp");
	    }
		%>
	</form>
<form action="BlogServlet" method = "post">
<input type="submit" name = "cmd" value = "로그아웃" />
<input type="submit" name = "cmd" value = "회원탈퇴"/>
</form>
</body>
</html>