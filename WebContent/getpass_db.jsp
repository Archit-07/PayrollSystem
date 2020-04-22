<%@page import="payroll.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	String empid=request.getParameter("empid");
	String adhar=request.getParameter("adhar");
	
		Connection con=ConnectionProvider.getConnection();
		PreparedStatement pstmt=con.prepareStatement("select * from payroll_emp where emp_id=? and emp_adhar=?");
		pstmt.setString(1,empid);
		pstmt.setString(2,adhar);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next())
		{
			String pass=rs.getString("emp_pass");
			response.sendRedirect("forgotpass.jsp?msg=Password is :"+pass+"&color=text-success");
		}
		else
		{
			response.sendRedirect("forgotpass.jsp?msg=Invalid empid or adhar&color=text-danger");
		}
	
		con.close();

%>
</body>
</html>