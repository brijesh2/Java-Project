<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Signout</title>
</head>
<body>

<h1><font color="Red">You are Sucessfully logged out...</font></h1>
<% session.invalidate(); 
out.println("<h1><font >You are Sucessfully logged out...</font></h1>");
//Thread.sleep(50000);
response.sendRedirect("./login.jsp");
%>

<!--         <a href="Welcome.jsp">Go-Back To Home Page</a>
 --></body>
</html>