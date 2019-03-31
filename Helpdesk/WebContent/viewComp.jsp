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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Complaint</title>
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

</head>
<script>
function enableDisable(bEnable, textBoxID,status,drop)
{
     document.getElementById(textBoxID).disabled = !bEnable;
     document.getElementById(drop).disabled =!bEnable;
     document.getElementById(status).disabled =!bEnable;
}
</script>
<body>
<%session = request.getSession(false);
if(null==session.getAttribute("uname")){
	System.out.println("Hello");
	response.sendRedirect("./login.jsp");
	System.out.println(session.getAttribute("uname"));
	
} %>
<form name="frm1" action="./Comp" method="post">
<h1>Complaint table</h1>
<%
Session s = HibernateUtil.getSessionFactory().openSession();
Query q = s.createQuery("from Complaint");
List<Complaint> li = q.list();
%>
<div class="table100 ver6 m-b-110">
<table  data-vertable="ver6" id="myTable" > 
<thead>
<tr class="row100 head">
<th>Check</th><th>Complaint ID </th><th>Complaint</th><th>Emp Id</th><th>Date_Closing</th><th>Status</th><th>Priority</th></tr>
</thead>
<%
for(Complaint c:li){
	
%>
<tbody>
<tr class="row100"><td><input type="checkbox" name="complain" value=<%=c.getComplaintId()%> onclick="enableDisable(this.checked,<%=c.getComplaintId() %>,'<%=String.valueOf(c.getComplaintId()).concat("s")%>','<%=String.valueOf(c.getComplaintId()).concat("p")%>')"></td>
<td><%=c.getComplaintId()%></td><td><%=c.getComplaint() %></td><td><%=c.getEmpID() %></td>
<td><input type="date" name="date_closing" id="<%=String.valueOf(c.getComplaintId())%>" disabled></td>
<td><input type="text" name="status" id="<%=String.valueOf(c.getComplaintId()).concat("s")%>" disabled></td>
<td><% if(c.getPriority().equalsIgnoreCase("low")) {%>
<select name="priority" id="<%=String.valueOf(c.getComplaintId()).concat("p")%>" disabled>
  <option value="Medium">Medium</option>
  <option value="High">High</option>
  <option value="Low" selected>Low</option>
  </select>
  <%
}else if(c.getPriority().equalsIgnoreCase("medium")){
  %>
  <select name="priority" id="<%=String.valueOf(c.getComplaintId()).concat("p")%>" disabled>
  <option value="Medium" selected>Medium</option>
  <option value="High">High</option>
  <option value="Low" >Low</option>
  </select>
  <%
}else if(c.getPriority().equalsIgnoreCase("high")){
  %>
  <select name="priority" id="<%=String.valueOf(c.getComplaintId()).concat("p")%>" disabled>
  <option value="Medium" >Medium</option>
  <option value="High" selected>High</option>
  <option value="Low" >Low</option>
  </select>
  <%
  }
  %>
  </td>
  </tr></tbody>
<%
}
%>
</table>
</div>

 
 <a href="./Comp"><button class="button button1">Submit</button></a>
 
</form>
</body>
</html>