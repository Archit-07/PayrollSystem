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
Connection con=ConnectionProvider.getConnection();
PreparedStatement pstmt=con.prepareStatement("select * from payroll_emp");
ResultSet rs=pstmt.executeQuery();
%>
<form action="generate_salary.jsp">
<table cellpadding="12">
<tr>
<td>
Select EmpId:<select name="emp_id">
<option>----select----</option>

<% 
while(rs.next())
{
%>
<option><%=rs.getString("emp_id")%></option>
<%
}
con.close();
%>
</select></td>
<td>
Select Month:<select name="month">
<option>----select----</option>
<option>January</option>
<option>Feburary</option>
<option>March</option>
<option>April</option>
<option>May</option>
<option>June</option>
<option>July</option>
<option>August</option>
<option>September</option>
<option>October</option>
<option>November</option>
<option>December</option>

</select>
</td>
<td>
Enter No of days:<input type="number" name="days" required="required" max="30">
</td>
</tr>
<tr>
<td>
Others Incentive:<input type="number" required="required" name="incentive">
</td>
<td>
<input type="submit" value="Generate Salary"> 
</td>
</tr>
</table>
</form>

</div>
<div style="position:absolute;top: 80%;">
<%@ include file="footer.html" %>
</div>
</body>
</html>