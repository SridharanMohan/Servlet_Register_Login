<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Phalcon</title>
<style type="text/css">
body {
	background-image: url("/WEB-INF/images/login.jpg");
}

input[type=text], input[type=password] {
	padding: 12px 20px;
	margin: 12px 10px;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

input[type=submit] {
	background-color: #4cafaf;
	border: none;
	color: white;
	padding: 10px 38px;
	text-decoration: none;
	margin: 6px 126px;
	cursor: pointer;
}
h1{
	text-align: center;
}
#error{
  color: red;
  font-size: 20px;
}
#success{
	color: green;
	font-size: 20px;
}
</style>
</head>
<body>


	<h1>Phalcon</h1>

	<%
		if (null != request.getAttribute("Registered")) {
	%>
	<p id = "success"><%=request.getAttribute("Registered")%>
	<p>

		<%
			}
		%>
	

		<%
			if (null != request.getAttribute("logout")) {
		%>
	
	<p id ="success"><%=request.getAttribute("logout")%>
	<p>

		<%
			}
		%>
	
	<form action="Login" method="post">
		<div>
			<label>Username</label> <input type="text"
				placeholder="Enter Username" name="username">
		</div>
		<div>
			<label>Password </label> <input type="password"
				placeholder ="Enter Password" name="password">
		</div>
		<input type="submit" value="Login">
	</form>

	<p>
		Don't you have account?<a href="Register.jsp"> Sign up</a>
	</p>

	<%
		if (null != request.getAttribute("Error")) {
	%>
	<p id ="error"><%=request.getAttribute("Error")%><p>
			<%
				}
			%>
			<%
				if (null != request.getAttribute("incorrectPassword")) {
			%>
			<p id = "error"><%=request.getAttribute("incorrectPassword")%><p>
					<%
						}
					%>
					<%
						if (null != request.getAttribute("unauthorized")) {
					%>
					<p id = "error"><%=request.getAttribute("unauthorized")%></p>
					<%
						}
					%>
				
</body>
</html>