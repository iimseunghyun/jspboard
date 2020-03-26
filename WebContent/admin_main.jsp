<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
hello admin
<form action="BlogServlet" method = "post">
<button onclick = "location='BlogServlet'" name = "cmd" value = "post관리" >postlist관리</button>
<button onclick = "location='BlogServlet'" name = "cmd" value = "로그아웃" >logout</button>
</form>

</body>
</html>