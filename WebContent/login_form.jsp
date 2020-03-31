<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style/style.css">
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<div class = "wrap">
		<div class ="form-wrap">
			<div class = "button-wrap">
				<div id = "btn"></div>
				<button type = "button" class = "togglebtn" onclick = "login()">LOGIN</button>
                <button type="button" class="togglebtn" onclick="register()">REGISTER</button>
                <button type="button" class="togglebtn" onclick="admin()">ADMIN</button>
	    	</div>
	    <form class ="input-group" id = "login" action="login_check.jsp" method="post">
			<input type="text" class ="input-field" placeholder = "User ID" name = "id"/>
			<input type="password" class ="input-field" name = "pass" placeholder="Enter Password" required/>
			<button class="submit">Login</button> <br>			
	    </form>
	    <form class ="input-group" id = "register" action = "registerer.jsp" method = "post">   
	       <input type="text" class ="input-field" placeholder = "User Id" required name="id" />
	       <input type="password" class="input-field" placeholder="Enter Password" required name = "pass">
	       <input type="text" class = "input-field" placeholder = "User Name" required name="name"/>
			<button class = "submit">REGISTER</button>
	    </form>
    	<form class ="input-group" id = "admin" action="admin_loginCheck.jsp" method="post">
			<input type="text" class ="input-field" placeholder = "ADMIN ID" name = "id"/>
			<input type="password" class ="input-field" name = "pass" placeholder="Enter Password" required/>
			<button class="submit">Login</button> <br>			
	    </form>
	    </div>
    </div>
    <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var a = document.getElementById("admin");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                a.style.left = "850px";
                z.style.left = "0px";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                a.style.left = "450px";
                z.style.left = "110px";
            }
            
            function admin(){
            	x.style.left = "-800px";
            	y.style.left = "-400px"
           		a.style.left = "50px";
                z.style.left = "230px";
            }
          
        </script>
</body>
</html>