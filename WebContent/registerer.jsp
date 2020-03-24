<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello!</title>
</head>
<body>
	<jsp:useBean id="user" class = "blog.UserInfo" scope = "page" />
	<jsp:setProperty name = "user" property= "*"/>
	<jsp:useBean id="database" class = "blog.DataManager" scope = "page" />
	<%
		String rPath = request.getContextPath();
//		database.userRegister(user);
		if (database.userRegister(user) != 0) {
            out.print("<h3>회원가입에 성공하였습니다.</h3>");
            out.print("<h3><a href=\""+rPath+"/index.jsp\">Home 화면으로 돌아가기</a></h3>");
        } else {
            out.print("<h3>회원가입에 실패하였습니다. 잠시 후 다시 시도해 주세요.</h3>");
            out.print("<h3><a href=\""+rPath+"/index.jsp\">Home 화면으로 돌아가기</a></h3>");
        }
	%>
</body>
</html>