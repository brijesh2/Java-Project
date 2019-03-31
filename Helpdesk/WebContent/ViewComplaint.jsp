<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Complaint</title>

<style>
body {font-family: Arial, Helvetica, sans-serif;background-image: url("1.jpg");
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
   background-color: #f2f2f2; 
  width:30%;
  opacity:0.9;
  margin-left:35%;
  padding: 20px;
}

</style>

</head>
<body>
<%session = request.getSession(false);
if(null==session.getAttribute("uname")){
	System.out.println("Hello");
	response.sendRedirect("./login.jsp");
	System.out.println(session.getAttribute("uname"));
	
} %>
<center><br>
<br>
<br>
<br>
<br>
<h2>View Complaint Details !!</h2>
<br>
</center>
<div class="container">
<form action="./ComplaintDetails" method="post">

<label for="d"><b>Enter Complaint Id:</b></label><br>
    <input type="number" id="d" name="id" placeholder="Complaint Id" required><br>
<label for="e"><b>Enter Employee Id:</b></label><br>
    <input type="number" id="e" name="eid" placeholder="Employee Id" required><br>
	<input type="submit" value="Submit">
</form>
</div>

</body>
</html>