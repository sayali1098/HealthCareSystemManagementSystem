<%@page import="com.tcs.bean.HCP"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%-- <%@include file="Mystyle.css" %>  --%>
<link rel="stylesheet" type="text/css" href="CSS/Mystyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> HCP Details</title>
<script>
function validateForm()
{
	var name=document.getElementById("name").value;
	var pass=document.getElementById("pass").value;
	if(name=="")
		{
			alert("enter name");
			return false;
		}
	else if(pass=="")
	{
		alert("enter password");
		return false;
	}
	else
		{
		return true;
		}
}
</script>
<style>
.aside_right1
{
	width:85.3%;
	height:450px;
	overflow:hidden;
	
	border-bottom:1px solid black;
	margin-left :auto;
	margin-right :auto;
	background-color:#D7BDE2  ;
	
}
input[type=text], input[type=password] {
    width: 50%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #F1948A;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 50%;
}
</style>
</head>
<body>
<center>
<form method="post" action="/Controller" onsubmit="return validateForm();">
<div class=main>
<div class=header>
	<div class=header_left>
	<img src="CSS/logo.jpg" alt="LOGO" height="100px" width="200px">
	</div>
		<%HCP h=(HCP)session.getAttribute("HCP"); %>
	<div class=header_right>Patient And Health Care Service Management
	<%if(session.getAttribute("username").equals(h.getHcpName())) {
	%> 
	
	<p align="right" style="font-size:20px;font-style: italic;">WELCOME  <%=h.getHcpName()%></p><br>
	
	</div>
</div>
<div class=nav>
<ul>

<li><a href="<%= request.getContextPath()%>/Controller?action=home">HOME</a></li>
  <li><a href="<%= request.getContextPath()%>/Controller?action=aboutus">ABOUT US</a></li>
 <li><a href="<%= request.getContextPath()%>/Controller?action=contactus">CONTACT US</a></li>
  <li><a href="<%= request.getContextPath()%>/Controller?action=viewlsp">VIEWLSP</a></li>
   <li><a href="<%= request.getContextPath()%>/Controller?action=logout">LOG OUT</a></li>
  
  
</ul>
</div>
<div class=aside>
<div class=aside_left>
<a href="<%= request.getContextPath()%>/Controller?action=viewhcp">View HCP Profile</a><br><br>
<a href="<%= request.getContextPath()%>/Controller?action=viewhcpbyid">View HCP Profile By ID</a><br><br>
<a href="<%= request.getContextPath()%>/Controller?action=patienthcpregistration">Add Patient</a><br><br>
<a href="<%= request.getContextPath()%>/Controller?action=patienthcpview&&id=<%=h.getHcpID()%>">View Patients in HCP</a><br><br>
</div>
<div class=aside_right1>
<br>
<span style="color:blue;font-style:Palatino;font-size:20px">&#8592For More Information Go To The Left Side Menu</span><br><br><br><br><br>
<img src="CSS/hcp1.jpg" alt="hcp1" height="400px" width="1040px">
<br><br>

</div>
</div>
<div class=footer><h5 style="color:blue">copyright@2017 reserved</h5></div></div>
</div>
<%} else {
RequestDispatcher rd=request.getRequestDispatcher("/JSP/patientlogin.jsp");
rd.forward(request,response);%>
	 
<%} %>
</form>

</center>
</body>
</html>