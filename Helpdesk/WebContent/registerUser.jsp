
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register User</title>

<style>
body {font-family: Arial, Helvetica, sans-serif;/* background-color: #ADD8E6;  */
background-image: url("atmosphere-beach-blue-1384908.jpg");
background-repeat: no-repeat;
  background-size: cover;
  height: 100%;
  background-position: center;}
* {box-sizing: border-box;}

input[type=text],input[type=number], input[type=date], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
   
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
   background-color:#f5fffa; 
  width:50%;
  opacity:0.7;
  margin-left:25%;
  padding: 20px;
}


/* .container:HOVER {
	background-color: #f2f2f2;
	border-color: blue;
	border-width: 20px;
} */
</style>

</head>


<body>
<%session = request.getSession(false);
if(null==session.getAttribute("uname")){
	System.out.println("Hello");
	response.sendRedirect("./login.jsp");
	System.out.println(session.getAttribute("uname"));
	
} %>

<center><h2>Employee Registration Form !!</h2></center>

<div class="container">

  <form action="./RegistrationForm" method="post"  >
    <label for="emp" ><b>Employee Id</b></label><br>
    <input type="number" id="emp" name="empId" placeholder="Employee Id" required><br>

    <label for="en"><b>Employee Name</b></label><br>
    <input type="text" id="en" name="empName" placeholder="Employee Name" required><br>
    
    <label for="d"><b>Department</b></label><br>
    <input type="text" id="d" name="dept" placeholder="Department" required><br>
    
    <label for="u"><b>UserName</b></label><br>
    <input type="text" id="u" name="username" placeholder="Username" required><br>
    
    <label for="pas"><b>Password</b></label><br>
    <input type="text" id="pas" name="pass" placeholder="Password" required><br>
    
    
    <input type="submit" value="Submit">
  </form>
</div>

</body>
</html>