<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:useBean id="user" class="blog.UserInfo" scope="page" />
    <jsp:setProperty property="*" name="user" />
    <jsp:useBean id="database" class="blog.DataManager" scope="page" />
    <%
        String id = (String) session.getAttribute("ID");
        String rPath = request.getContextPath();
        if (id != null) {
            if (database.updateUser(user) != 0) {
                out.print("<h3>회원정보 수정에 성공하였습니다.</h3>");
                out.print("<h3><a href=\""+rPath+"/user_info.jsp\">회원정보 보기 화면으로 돌아가기</a></h3>");
            } else {
                out.print("<h3>회원정보 수정에 실패하였습니다.</h3>");
                out.print("<h3><a href=\""+rPath+"/login_form.jsp\">로그인 화면으로 돌아가기</a></h3>");
            }
        } else {
            response.sendRedirect(rPath+"/index.jsp");
        }
    %>
</body>
</html>