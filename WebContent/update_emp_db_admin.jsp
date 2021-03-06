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
	String emp_name=request.getParameter("emp_name");
	String emp_pass=request.getParameter("emp_pass");
	String emp_id=request.getParameter("emp_id");
	String emp_grade=request.getParameter("emp_grade");
	String emp_salary=request.getParameter("emp_salary");
	String emp_age=request.getParameter("emp_age");
	String emp_dept=request.getParameter("emp_dept");
	String emp_email=request.getParameter("emp_email");
	String emp_contact=request.getParameter("emp_contact");
	String emp_address=request.getParameter("emp_address");
	String emp_adhar=request.getParameter("emp_adhar");

	try
	{
		Connection con=ConnectionProvider.getConnection();
		PreparedStatement pstmt=con.prepareStatement("update payroll_emp set emp_name=?,emp_pass=?,emp_id=?,emp_grade=?,emp_salary=?,emp_age=?,emp_dept=?,emp_email=?,emp_contact=?,emp_address=?,emp_adhar=? where emp_id=?");
		pstmt.setString(1,emp_name);
		pstmt.setString(2,emp_pass);
		pstmt.setString(3,emp_id);
		pstmt.setString(4,emp_grade);
		pstmt.setString(5,emp_salary);
		pstmt.setString(6,emp_age);
		pstmt.setString(7,emp_dept);
		pstmt.setString(8,emp_email);
		pstmt.setString(9,emp_contact);
		pstmt.setString(10,emp_address);
		pstmt.setString(11,emp_adhar);
		pstmt.setString(12,emp_id);
		
		pstmt.executeUpdate();
		con.close();
		response.sendRedirect("viewAll_emp_db.jsp?msg=Record Updated&color=text-success");
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("viewAll_emp_db.jsp?msg=Record not Updated&color=text-danger");
	}
%>
</body>
</html>