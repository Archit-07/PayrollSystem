<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="header_user.html"%>

<div class="container">
<p>Welcome Admin</p>
<div align="center">
<p><a href="create_emp.jsp" class="nav-link">Create Emp</a></p>
<p><a href="viewAll_emp_db.jsp" class="nav-link">View All Emp</a></p>
<p><a href="create_salary.jsp" class="nav-link">Create Salary</a></p>
<p><a href="viewAll_salary.jsp" class="nav-link">View All Salaries</a></p>
</div>
</div>
<div style="position:absolute;top: 80%;">
<%@ include file="footer.html" %>
</div>
</body>
</html>