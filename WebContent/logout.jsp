<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
    <%
        String id = (String) session.getAttribute("ID");
        if (id != null){
            session.invalidate();
        	out.print("로그아웃 되었습니다.");
        }
    %>

</body>
</html>