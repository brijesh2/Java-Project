<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Password Reset</title>
<style type="text/css">
body {font-family: Arial, Helvetica, sans-serif;background-image: url("1.jpg");
background-repeat: no-repeat;
  background-size: cover;
  height: 100%;
  background-position: center;}
  * {box-sizing: border-box;}
input[type=password], select, textarea {
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
  margin-top:15%;
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
<div class="container">
<form action="./Password">
Enter the Employee Id:<input type="text" name="EmpId"><br>
<input type="submit" value="Submit"><br>
</div>
</form>
</body>
</html>