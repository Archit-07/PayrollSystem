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
<div style="position: absolute;left:40%;top:13.5%;">
<form action="search_emp.jsp">
<input type="text" name="emp_id" placeholder="enter emp id">
<input type="submit" value="search">
</form>
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
%>
<div class="container">
  <table class="table table-hover">
    
    <thead>
      <tr>
        <th>Emp Name</th>
        <th>Emp Pass</th>
        <th>Emp Id</th>
        <th>Emp Grade</th>
        <th>Emp Age</th>
        <th>Emp Salary</th>
        <th>Emp Department</th>
        <th>Emp Email</th>
        <th>Emp Contact</th>
        <th>Emp Address</th>
        <th>Emp Adhar</th>
        <th>Action</th>     
      </tr>
    </thead>
    
    <tbody>
    <% 
    boolean b=false;
    	if(rs.next())
    	{
    		  b=true;
    %>
   			<tr>
    	        <td><%=rs.getString(1)%></td>
    	        <td><%=rs.getString(2)%></td>
    	        <td><%=rs.getString(3)%></td>
    	        <td><%=rs.getString(4)%></td>
    	        <td><%=rs.getString(5)%></td>
    	        <td><%=rs.getString(6)%></td>
    	        <td><%=rs.getString(7)%></td>
    	        <td><%=rs.getString(8)%></td>
    	        <td><%=rs.getString(9)%></td>
    	        <td><%=rs.getString(10)%></td>
    	        <td><%=rs.getString(11)%></td>
    	        <td width="20%;"><a href="update_emp_admin.jsp?emp_id=<%=rs.getString(3)%>" class="nav-link">Update</a><a href="delete_emp_db.jsp?emp_id=<%=rs.getString(3)%>" class="nav-link">Delete</a></td>
    	        
    	   </tr>
    		
    <%	
    con.close();
    
    	}
    	
    %>
    
     
    </tbody>
  </table>
  <%
  	if(b==false)
  	{
  		
    		%>
    		<h3><p class="text-danger">Record not found on given emp id</p></h3>
    		<a href="viewAll_emp_db.jsp" class="nav-link">Back</a>
   		<%
    	
  	}
  %>
</div>

</div>
</body>
</html>