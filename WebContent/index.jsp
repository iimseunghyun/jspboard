<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home!</title>
</head>
<body>
<form action="BlogServlet" method = "post">
<%
	String id = (String) session.getAttribute("ID");
	if(id == null){
		out.print("안녕하세요 ! 야호 !" + "<br>");
		out.print("<input type='submit' name = 'cmd' value = '회원가입' />");
		out.print("<input type='submit' name = 'cmd' value = '로그인' />");
	}else{
		out.print(id + "님 환영합니다!" + "<br>");
		out.print("<input type = 'submit' name = 'cmd' value = '로그아웃' />");
	}

%>
</form>
</body>
</html>