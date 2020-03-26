<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="blog.UserInfo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 보기</title>
</head>
<body>
	<jsp:useBean id = "database" class = "blog.DataManager" scope = "page" />
<form action="BlogServlet" method = "post">
	<%
		String id = (String) session.getAttribute("ID");
		String rPath = request.getContextPath();
	    if (id != null) {
	        UserInfo user = database.getUser(id);
	        out.print("<table>");
	        out.print("<tr><th colspan=2>회원정보</th></tr>");
	        out.print("<tr><td>아이디</td><td>" + user.getId()+ "</td></tr>");
	        out.print("<tr><td>비밀번호</td><td>" + user.getPass()+"</td></tr>");
	        out.print("<tr><td>이름</td><td>" + user.getName()+ "</td></tr>");
	        out.print("<tr><td solspan=2><input type=\"submit\" name = \"cmd\" value=\"수정\"></td></tr>");
	        out.print("</table>");
	    } else {
	        response.sendRedirect(rPath+"/index.jsp");
	    }
%>
<input type="submit" name = "cmd" value = "로그아웃" />
<input type="submit" name = "cmd" value = "회원탈퇴"/>
</form>

</body>
</html>