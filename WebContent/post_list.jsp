<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<script language="javascript">
function postListCheck(){
	var form = document.postlist;
	if(!form.title.value){
		alert("제목을 입력해주세요")
		form.title.focus();
		return;
	}
	if(!form.text.value){
		alert("내용을 입력해주세요");
		form.text.focus();
		return;
	}
	form.submit();
}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
 <body>
<table>
<form name=postlist method=post action="post_list_check.jsp">
	<tr>
		<td>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
				<td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
				<td>New Post</td>
      			<td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     		</tr>
    	</table>
	<table>
		<tr>
      		<td>&nbsp;</td>
      		<td align="center">Title</td>
      		<td><input name="title" size="100" maxlength="100"></td>
      		<td>&nbsp;</td>
     	</tr>
     	<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     	<tr>
      		<td>&nbsp;</td>
      		<td align="center">Text</td>
      		<td><textarea name="text" cols="100" rows="13"></textarea></td>
      		<td>&nbsp;</td>
     	</tr>
     	<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     	<tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     	<tr align="center">
      		<td>&nbsp;</td>
      		<td colspan="2"><input type=button value="Save" OnClick="javascript:postListCheck();">
       		<input type=button value="Cancle" OnClick="javascript:history.back(-1)">
      		<td>&nbsp;</td>
     	</tr>
    	</table>
   	</td>
  	</tr>
</form>
</table>
</body> 
</html>