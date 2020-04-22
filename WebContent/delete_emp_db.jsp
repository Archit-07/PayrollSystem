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
	String emp_id=request.getParameter("emp_id");
	
	try
	{
		Connection con=ConnectionProvider.getConnection();
		PreparedStatement pstmt=con.prepareStatement("delete from payroll_emp where emp_id=?");
		pstmt.setString(1,emp_id);
		pstmt.executeUpdate();
		con.close();
		response.sendRedirect("viewAll_emp_db.jsp?msg=Record Deleted&color=text-success");
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("viewAll_emp_db.jsp?msg=Record not Deleted&color=text-danger");
	}
%>
</body>
</html>