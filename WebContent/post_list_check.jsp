<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");

	Connection con = null;
	String url = "jdbc:mariadb://localhost:3306/my_blog";
	String user = "root";
	String pw = "1234";
	String title = request.getParameter("title");
	String text = request.getParameter("text");
	
	try{
		con = DriverManager.getConnection(url,user,pw);
		
		String sql = "INSERT INTO post(title,text) VALUES(?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, title);
		pstmt.setString(2, text);
		
		pstmt.execute();
		pstmt.close();
		
		con.close();
	} catch(SQLException e){
		out.println(e.toString());
	}
%>
<script language=javascript>
self.window.alert("입력한 글을 저장하였습니다.");
location.href="post_form.jsp";
</script>
</body>
</html>