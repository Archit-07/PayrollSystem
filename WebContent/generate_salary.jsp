<%@page import="java.util.Calendar"%>
<%@page import="payroll.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<html>
<body>
<%@ include file="header_user.html"%>
<%
String emp_id=request.getParameter("emp_id");
String month=request.getParameter("month");
String days=request.getParameter("days");

String incentive=request.getParameter("incentive");
Calendar c=Calendar.getInstance();
int year=c.get(Calendar.YEAR);
Connection con=ConnectionProvider.getConnection();
PreparedStatement stmt=con.prepareStatement("select * from payroll_salary where emp_id=? and month=? and year=?");
stmt.setString(1,emp_id);
stmt.setString(2,month);
stmt.setString(3,year+"");
ResultSet r=stmt.executeQuery();
if(r.next())
{
	response.sendRedirect("create_salary.jsp?msg=Salary Already Created&color=text-danger");
	r.close();
}
else
{
	r.close();
PreparedStatement pstmt=con.prepareStatement("select * from payroll_emp where emp_id=?");
pstmt.setString(1,emp_id);
ResultSet rs=pstmt.executeQuery();
rs.next();
String emp_name=rs.getString("emp_name");
double salary=Double.parseDouble(rs.getString("emp_salary"));
double perDaySalary=salary/30;
double actualSalary=perDaySalary*(Double.parseDouble(days));
double basic=(actualSalary*50)/100;
double hra=(actualSalary*20)/100;
double da=(actualSalary*20)/100;
double others=(actualSalary*10)/100;
double netSalary=actualSalary+(Double.parseDouble(incentive));
rs.close();
PreparedStatement pstmt1=con.prepareStatement("insert into payroll_salary values(?,?,?,?,?,?,?,?,?,?,?,?)");
pstmt1.setString(1,emp_id);
pstmt1.setString(2,salary+"");
pstmt1.setString(3,netSalary+"");
pstmt1.setString(4,days);
pstmt1.setString(5,basic+"");
pstmt1.setString(6,hra+"");
pstmt1.setString(7,da+"");
pstmt1.setString(8,others+"");
pstmt1.setString(9,month);

pstmt1.setString(10,year+"");
pstmt1.setString(11,incentive);
pstmt1.setString(12,emp_name);

pstmt1.executeUpdate();
response.sendRedirect("create_salary.jsp?msg=Salary Created&color=text-success");
}
con.close();
%>
</body>
</html>