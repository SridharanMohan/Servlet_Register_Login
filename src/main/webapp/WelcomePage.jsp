<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Phalcon</title>
<style>
* {box-sizing: border-box}

/* Set height of body and the document to 100% */
body, html {
    height: 100%;
    margin: 0;
    font-family: Arial;
}

/* Style tab links */
.tablink {
    background-color: #555;
    color: white;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    font-size: 17px;
    width: 25%;
}

.tablink:hover {
    background-color: #777;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
    color: black;
    display: none;
    padding: 100px 20px;
    height: 100%;
}

#Home {background-color: white;}
#News {background-color: green;}
#Contact {background-color: blue;}
#About {background-color: orange;}
input[type=text], input[type=password] {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}
input[type=submit] {
	background-color: #4cafaf;
	border: none;
	color: white;
	padding: 15px 50px;
	text-decoration: none;
	margin: 9px 0px;
	cursor: pointer;
}
#success{
	color: green;
	font-size: 20px;
}
</style>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
if (session.getAttribute("userName") == null) {
    response.sendRedirect("LoginPage.jsp");
} %>

<button class="tablink" onclick="openPage('Home', this, 'grey')">Home</button>
<button class="tablink" onclick="openPage('News', this, 'green')" id="defaultOpen">News</button>
<button class="tablink" onclick="openPage('Profile', this, 'blue')">Profile</button>
<button class="tablink" onclick="openPage('About', this, 'orange')">About</button>

<div id="Home" class="tabcontent">
  <h3>Phalcon</h3>
  <h1 align = "center">welcome ${userName}</h1>
</div>

<div id="News" class="tabcontent">
  <h3>News</h3>
  <p>Some news this fine day!</p> 
</div>

<div id="Profile" class="tabcontent">
<form action ="Logout" method ="get">
<div>
<input type="submit" value="Signout" id ="signout">
</div>
</form>
	<%
			if (null != request.getAttribute("updated")) {
		%>
	
	<p id = "success"><%=request.getAttribute("updated")%>
	<p>

		<%
			}
		%>
  <h3 align = "center">My profile</h3>
  <label><b>Username</b></label>
  <input type = "text" disabled value="<%= session.getAttribute("userName") %>">
  <form action ="PasswordUpdate" method = "post">
   <label><b>Update Password</b></label>
    <input type="password" placeholder="Enter New Password" name="updatedPassword">
    <input type="submit" value="Update">
  </form>
  </div>
  

<div id="About" class="tabcontent">
  <h3>About</h3>
  <p>Who we are and what we do.</p>
</div>

<script>
function openPage(pageName,elmnt,color) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "";
    }
    document.getElementById(pageName).style.display = "block";
    elmnt.style.backgroundColor = color;

}
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
     


</body>
</html>