<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
</head>
<body>
관리자로그인
<form action="admin_loginCheck.jsp" method="post">
   <table>
       <tr>
           <td>아이디</td>
           <td><input type="text" name="id" /></td>
       </tr>
       <tr>
           <td>비밀번호</td>
           <td><input type="password" name="pass" /></td>
       </tr>
       <tr>
           <td colspan=2><input type="submit" value="로그인" /></td>
       </tr>
   </table>
</form>
</body>
</html>