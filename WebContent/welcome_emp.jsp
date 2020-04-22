<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="header_user.html"%>

<div class="container">
<p>Welcome,<%=session.getAttribute("emp_name") %></p>
<div align="center">
<p><a href="update_profile.jsp" class="nav-link">Update Profile</a></p>
<p><a href="viewSalaryByEmp.jsp" class="nav-link">View Salary</a></p>
</div>
</div>
<div style="position:absolute;top: 80%;">
<%@ include file="footer.html" %>
</div>
</body>
</html>