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
로그인 되었습니다.
<%
	String id = (String) session.getAttribute("ID");
%>
<form action="BlogServlet" method = "post">
<button name = "cmd" value = "로그아웃" >로그아웃</button>
<button name = "cmd" value = "탈퇴" >회원탈퇴</button>
<input type="submit" name = "cmd" value = "나의정보" />

</form>

</body>
</html>