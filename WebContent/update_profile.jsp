<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="header_user.html"%>

<div class="container">
<p>Welcome,<%=session.getAttribute("emp_name") %></p>
<div style="position: absolute;left:80%;top:10.5%;">
<a href="welcome_emp.jsp" class="nav-link">Home</a>
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
<form action="update_emp_db.jsp" method="post">
<div>
<table cellpadding="10">
<tr>
<td>Name:</td>
<td><input type="text" name="emp_name" required="required" value="<%=session.getAttribute("emp_name")%>"></td>
</tr>
<tr>
<td>Pass:</td>
<td><input type="text" name="emp_pass" required="required" value="<%=session.getAttribute("emp_pass")%>"></td>
</tr>
<tr>
<td>Id:</td>
<td><input type="text" name="emp_id" required="required" value="<%=session.getAttribute("emp_id")%>" readonly="readonly"></td>
</tr>
<tr>
<td>Grade:</td>
<td><input type="text" name="emp_grade" required="required" value="<%=session.getAttribute("emp_grade")%>" readonly="readonly"></td>
</tr>
<tr>
<td>Salary:</td>
<td><input type="number" name="emp_salary" required="required" value="<%=session.getAttribute("emp_salary")%>" readonly="readonly"></td>
</tr>
<tr>
<td>Age:</td>
<td><input type="number" name="emp_age" required="required" value="<%=session.getAttribute("emp_age")%>"></td>
</tr>
</table>
</div>
<div style="position: absolute;left:50%;top:32%;">
<table cellpadding="10">
<tr>
<td>Department:</td>
<td><input type="text" name="emp_dept" required="required" value="<%=session.getAttribute("emp_dept")%>" readonly="readonly"></td>
</tr>

<tr>
<td>Email:</td>
<td><input type="email" name="emp_email" required="required" value="<%=session.getAttribute("emp_email")%>" ></td>
</tr>
<tr>
<td>Contact:</td>
<td><input type="number" name="emp_contact" required="required" value="<%=session.getAttribute("emp_contact")%>"></td>
</tr>
<tr>
<td>Address:</td>
<td><input type="text" name="emp_address" required="required" value="<%=session.getAttribute("emp_address")%>"></td>
</tr>
<tr>
<td>Adhar:</td>
<td><input type="number" name="emp_adhar" required="required" value="<%=session.getAttribute("emp_adhar")%>" readonly="readonly"></td>
</tr>
</table>
</div>

<input type="submit" value="Update" style="position:absolute;left:80%;">
</form>
</div>
</div>

</body>
</html>