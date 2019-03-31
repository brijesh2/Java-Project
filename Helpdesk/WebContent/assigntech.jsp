<%@page import="com.model.bean.Technician"%>
<%@page import="com.model.bean.Complaint"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.control.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css"> 
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images1/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts1/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css1/util.css">
	<link rel="stylesheet" type="text/css" href="css1/main.css">
<!--===============================================================================================-->
<script>
function enableDisable(bEnable, textBoxID)
{
     document.getElementById(textBoxID).disabled = !bEnable
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign Technician</title>
</head>
<body>
<%session = request.getSession(false);
if(null==session.getAttribute("uname")){
	System.out.println("Hello");
	response.sendRedirect("./login.jsp");
	System.out.println(session.getAttribute("uname"));
	
} %>
<form name="frm1" action="./Submittechnician" method="post" onsubmit="return validLogin();">
<h1>Complaint Table</h1>
<%
Session s = HibernateUtil.getSessionFactory().openSession();
Query q = s.createQuery("from Complaint");
List<Complaint> li = q.list();
%>
<div class="table100 ver6 m-b-110">
<table  data-vertable="ver6" id="myTable" > 
<thead>
<tr class="row100 head">  
<th>Check</th><th>Complaint ID </th><th>Complaint</th><th>Emp Id</th><th>Priority</th><th>TId</th></tr>
</thead>
<% 
for(Complaint c:li){%>
<tbody>
<tr class="row100"><td><input type="checkbox" name="complain" value=<%=c.getComplaintId() %> onclick="enableDisable(this.checked, <%=c.getComplaintId() %>)"></td> <td><%=c.getComplaintId() %></td><td><%=c.getComplaint() %></td><td><%=c.getEmpID() %></td><td><%=c.getPriority() %></td><td><input type="text" name="tid" value='<%=c.getTechId() %>' id=<%=c.getComplaintId() %> disabled></td></tr>
</tbody>
<%}
%>
</table>
</div>
<h1>Technician Table</h1>
<%
Session ses = HibernateUtil.getSessionFactory().openSession();
Query q1 = ses.createQuery("from Technician");
List<Technician> l = q1.list();
%>
<div class="table100 ver6 m-b-110">
<table  data-vertable="ver6" id="myTable" > 
<thead>
<tr class="row100 head">  
<th>TID</th><th>TNAME</th><th>WORKLOAD</th></tr>
</thead>
<%
for(Technician t:l){%>
<tbody>
<tr class="row100"><td><%=t.getTechId() %></td><td><%=t.getTechName() %></td><td><%=t.getWorkLoad() %></td></tr>
</tbody>
<%
}
s.close();
%>
</table>
</div>
    <!-- <input type="submit" value="Submit" /> -->
    <a href="./Submittechnician"><button class="button button1" type="submit">Submit</button></a>
    
</form>
</body>
</html>