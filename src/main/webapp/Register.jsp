<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Phalcon</title>
<style type="text/css">
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
</style>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
if(session.getAttribute("userName")!= null) {
	response.sendRedirect("WelcomePage.jsp");
}
%>
	<h1 align="center">Create your Account</h1>
		<%	if(null!=request.getAttribute("Invalid")){ %>
      <p style ="color: red;"><%=request.getAttribute("Invalid") %></p> 
   <%  } %>
	<form action="Register" method="post">
		<div>
			<label>Username</label> <input type="text"
				placeholder="Enter Username" name="username">
		</div>
		<div>
			<label>Password </label> <input type="password"
				placeholder="Enter Password" name="password">
		</div>
		<input type="submit" value="Signup">
	</form>
</body>
</html>