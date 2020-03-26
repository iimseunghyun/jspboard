<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:useBean id="data" class="blog.DataManager" scope="page" />
<form action="">
    <%
        String id = (String) session.getAttribute("ID");
        if (id != null) {
            if (data.removeUser(id) != 0) {
                out.print("회원정보 삭제 성공");
                session.invalidate();
                out.print("<input type='submit' value = 'Home' name = 'cmd' />");
            } else {
                out.print("회원정보 삭제 실패");
                out.print("<input type='submit' value = 'Home' name = 'cmd' />");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
</form>
</body>
</html>