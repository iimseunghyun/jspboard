
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판폼</title>

</head>
 <body>


 <%
	Connection con =null;
	Statement stmt = null;
	ResultSet rs = null;
	int total = 0;
	String url = "jdbc:mariadb://localhost:3306/my_blog";
	String user = "root";
	String pw = "1234";
	
	try {
		con = DriverManager.getConnection(url,user,pw);
		stmt = con.createStatement();

		rs = stmt.executeQuery("SELECT * FROM post");
		
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		out.print("총 게시물 : " + total + "개");
		
		//String sqlList = "SELECT id, title, user_id, time from post order by id DESC";
		//rs = stmt.executeQuery(sqlList);
		
%>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
<tr style="background:url('img/post_form1.gif') repeat-x; text-align:center;">
   <td width="5"><img src="img/post_form.gif" width="5" height="30" /></td>
   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="7"><img src="img/post_form2.gif" width="5" height="30" /></td>
  </tr>
<%
	if(total==0) {
%>
	 		<tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">등록된 글이 없습니다.</td>
	 	  </tr>
<%
	 	} else {
	 		
		while(rs.next()) {
			int id = rs.getInt(1);
			String title = rs.getString(2);
			String user_id = rs.getString(3);
			String time = rs.getString(4);
		
%>
<tr height="25" align="center">
	<td>&nbsp;</td>
	<td><%=id %></td>
	<td align="left"><%=title %></td>
	<td align="center"><%=user_id %></td>
	<td align="center"><%=time %></td>
	<td>&nbsp;</td>
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<% 
		}
	} 
	rs.close();
	stmt.close();
	con.close();
} catch(Exception e) {
	out.println( e.toString() );
}
%>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
   <td><input type=button value="글쓰기" onClick="window.location='post_list.jsp'"></td>
  </tr>
</table>
</body> 
</html>