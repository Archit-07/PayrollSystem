<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<style>
form {
    border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 20%;
    border-radius: 50%;
}

.container {
    padding: 12px;
}

span.psw {
    float: right;
    padding-top: 12px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
</head>

<body>
<%@ include file="header.html"%>

<div class="container">
<div class="row">
<div class="col-lg-6">

  <div class="jumbotron">
    <h1>Payroll System</h1> 
    <p>This portal allows employees to see their information and salary record.
    Employee can also update some information like contact,contact,etc.  
    </p> 
  </div>
 </div>
<div class="col-lg-6">
<%
	String msg=request.getParameter("msg");
	String color=request.getParameter("color");

	if(msg!=null)
	{
%>
<p class="<%=color%>"><%=msg%></p>
<%
	}
%>

<form action="login.jsp">
  
  <div class="container">
    <label><b>Username/EmpId</b></label>
    <input type="text" placeholder="Enter Username" name="uname" required>

    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pass" required>
    <label><b>Select User</b></label>  
    <select name="user">
    <option>Admin</option>
    <option>Emp</option>
 
    </select>   
    <button type="submit">Login</button>
   
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <button type="reset" class="cancelbtn">Reset</button>
    <span class="psw"><a href="forgotpass.jsp">Forgot password?</a></span>
  </div>
</form>
</div>
</div>
</div>
<%@ include file="footer.html" %>
</body>
</html>