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
	String username=request.getParameter("uname");
	String pass=request.getParameter("pass");
	String user=request.getParameter("user");
	
	if(user.equals("Admin"))
	{
		if(username.equalsIgnoreCase("Admin")&&pass.equals("admin"))
		{
			response.sendRedirect("welcome_admin.jsp");
		}
		else
		{
			response.sendRedirect("index.jsp?msg=Invalid Username or Password&color=text-danger");
		}
	}
	else if(user.equals("Emp"))
	{
		Connection con=ConnectionProvider.getConnection();
		PreparedStatement pstmt=con.prepareStatement("select * from payroll_emp where emp_id=? and emp_pass=?");
		pstmt.setString(1,username);
		pstmt.setString(2,pass);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next())
		{
			session.setAttribute("emp_name",rs.getString("emp_name"));
			session.setAttribute("emp_pass",rs.getString("emp_pass"));
			session.setAttribute("emp_id",rs.getString("emp_id"));
			session.setAttribute("emp_grade",rs.getString("emp_grade"));
			session.setAttribute("emp_salary",rs.getString("emp_salary"));
			session.setAttribute("emp_age",rs.getString("emp_age"));
			session.setAttribute("emp_dept",rs.getString("emp_dept"));
			session.setAttribute("emp_email",rs.getString("emp_email"));
			session.setAttribute("emp_contact",rs.getString("emp_contact"));
			session.setAttribute("emp_address",rs.getString("emp_address"));
			session.setAttribute("emp_adhar",rs.getString("emp_adhar"));
			response.sendRedirect("welcome_emp.jsp");
		}
		else
		{
			response.sendRedirect("index.jsp?msg=Invalid Username or Password&color=text-danger");
		}
	
		con.close();
	}

%>
</body>
</html>