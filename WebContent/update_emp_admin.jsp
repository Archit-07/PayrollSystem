<%@page import="payroll.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="header_user.html"%>

<div class="container">
<p>Welcome,Admin</p>
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
	String emp_id=request.getParameter("emp_id");
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement pstmt=con.prepareStatement("select * from payroll_emp where emp_id=?");
	pstmt.setString(1,emp_id);
	ResultSet rs=pstmt.executeQuery();
	rs.next();
%><a href="viewAll_emp_db.jsp" class="nav-link">Back</a>
<div class="jumbotron" >

<form action="update_emp_db_admin.jsp" method="post">
<div>
<table cellpadding="10">
<tr>
<td>Name:</td>
<td><input type="text" name="emp_name" required="required" value="<%=rs.getString("emp_name")%>" readonly="readonly"></td>
</tr>
<tr>
<td>Pass:</td>
<td><input type="text" name="emp_pass" required="required" value="<%=rs.getString("emp_pass")%>"></td>
</tr>
<tr>
<td>Id:</td>
<td><input type="text" name="emp_id" required="required" value="<%=rs.getString("emp_id")%>" readonly="readonly"></td>
</tr>
<tr>
<td>Grade:</td>
<td><input type="text" name="emp_grade" required="required" value="<%=rs.getString("emp_grade")%>"></td>
</tr>
<tr>
<td>Salary:</td>
<td><input type="number" name="emp_salary" required="required" value="<%=rs.getString("emp_salary")%>"></td>
</tr>
<tr>
<td>Age:</td>
<td><input type="number" name="emp_age" required="required" value="<%=rs.getString("emp_age")%>" readonly="readonly"></td>
</tr>
</table>
</div>
<div style="position: absolute;left:50%;top:32%;">
<table cellpadding="10">
<tr>
<td>Department:</td>
<td><input type="text" name="emp_dept" required="required" value="<%=rs.getString("emp_dept")%>"></td>
</tr>

<tr>
<td>Email:</td>
<td><input type="email" name="emp_email" required="required" value="<%=rs.getString("emp_email")%>" readonly="readonly"></td>
</tr>
<tr>
<td>Contact:</td>
<td><input type="number" name="emp_contact" required="required" value="<%=rs.getString("emp_contact")%>" readonly="readonly"></td>
</tr>
<tr>
<td>Address:</td>
<td><input type="text" name="emp_address" required="required" value="<%=rs.getString("emp_address")%>" readonly="readonly"></td>
</tr>
<tr>
<td>Adhar:</td>
<td><input type="number" name="emp_adhar" required="required" value="<%=rs.getString("emp_adhar")%>" readonly="readonly"></td>
</tr>
</table>
</div>

<input type="submit" value="Update" style="position:absolute;left:80%;">
</form>
</div>
</div>

</body>
</html>