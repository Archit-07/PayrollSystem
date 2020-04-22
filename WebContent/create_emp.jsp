<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="header_user.html"%>

<div class="container">
<p>Welcome Admin</p>
<div style="position: absolute;left:80%;top:10.5%;">
<a href="welcome_admin.jsp" class="nav-link">Home</a>
</div>
<%
	String msg=request.getParameter("msg");
	String color=request.getParameter("color");

	if(msg!=null)
	{
%>
<p class="<%=color%>"><%=msg%></p>
<%
	}
%>
<div class="jumbotron" >
<form action="create_emp_db.jsp" method="post">
<div>
<table cellpadding="10">
<tr>
<td>Enter Name:</td>
<td><input type="text" name="emp_name" required="required"></td>
</tr>
<tr>
<td>Enter Pass:</td>
<td><input type="password" name="emp_pass" required="required"></td>
</tr>
<tr>
<td>Enter Id:</td>
<td><input type="text" name="emp_id" required="required"></td>
</tr>
<tr>
<td>Enter Grade:</td>
<td><input type="text" name="emp_grade" required="required"></td>
</tr>
<tr>
<td>Enter Salary:</td>
<td><input type="number" name="emp_salary" required="required"></td>
</tr>
<tr>
<td>Enter Age:</td>
<td><input type="number" name="emp_age" required="required"></td>
</tr>
</table>
</div>
<div style="position: absolute;left:50%;top:32%;">
<table cellpadding="10">
<tr>
<td>Enter Department:</td>
<td><input type="text" name="emp_dept" required="required"></td>
</tr>

<tr>
<td>Enter Email:</td>
<td><input type="email" name="emp_email" required="required"></td>
</tr>
<tr>
<td>Enter Contact:</td>
<td><input type="number" name="emp_contact" required="required"></td>
</tr>
<tr>
<td>Enter Address:</td>
<td><input type="text" name="emp_address" required="required"></td>
</tr>
<tr>
<td>Enter Adhar:</td>
<td><input type="number" name="emp_adhar" required="required"></td>
</tr>
</table>
</div>

<input type="submit" value="Register" style="position:absolute;left:80%;">
</form>
</div>
</div>

</body>
</html>