<%@page import="org.hibernate.SQLQuery"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.hibernate.Transaction"%>
<%-- <%@page import="javax.transaction.Transaction"%>
 --%><%@page import="com.model.bean.Complaint"%> 
<%@page import="java.util.List"%> 
<%@page import="org.hibernate.Query"%> 
<%@page import="com.control.HibernateUtil"%> 
<%@page import="org.hibernate.Session"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%> 
 <%@page  import= "java.time.LocalDate"
 import= "java.time.Month"
 import= "java.time.temporal.ChronoUnit"
 import= "java.time.LocalDateTime"
 import= "java.util.Calendar" 
 import= "java.util.Date" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<link href="style.css" rel="stylesheet" type="text/css"> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
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
<title>Reports</title> 
  <script type="text/javascript" src="script.js"></script>
<script type="text/javascript">

    function GetSelectedTextValue(ddlFruits) {
        var selectedText = ddlFruits.options[ddlFruits.selectedIndex].innerHTML;
        var selectedValue = ddlFruits.value;
        /* alert("Selected Text: " + selectedText + " Value: " + selectedValue);  */
       if(selectedValue==1){
    			 document.getElementById("dailysum").style.display="block"; 
    			 document.getElementById("weeklysum").style.display="none"; 
    			 document.getElementById("monthlysum").style.display="none"; 
    			 document.getElementById("dailydetail").style.display="none";  
    			 document.getElementById("weeklydetail").style.display="none";
    			 document.getElementById("monthlydetail").style.display="none"; 
       }
       if(selectedValue==2){
    	   document.getElementById("weeklysum").style.display="block"; 
    		 document.getElementById("dailysum").style.display="none"; 
    		 document.getElementById("monthlysum").style.display="none"; 
    		 document.getElementById("dailydetail").style.display="none"; 
    		 document.getElementById("weeklydetail").style.display="none";
    		 document.getElementById("monthlydetail").style.display="none"; 
       }
       if(selectedValue==3){
    	   document.getElementById("monthlysum").style.display="block"; 
    		 document.getElementById("dailysum").style.display="none"; 
    		 document.getElementById("weeklysum").style.display="none"; 
    		 document.getElementById("dailydetail").style.display="none"; 
    		 document.getElementById("weeklydetail").style.display="none";
    		 document.getElementById("monthlydetail").style.display="none"; 
       }
         if(selectedValue==4){
  		 document.getElementById("dailydetail").style.display="block"; 
		 document.getElementById("dailysum").style.display="none"; 
		 document.getElementById("weeklysum").style.display="none";
		 document.getElementById("monthlysum").style.display="none"; 
		 document.getElementById("weeklydetail").style.display="none";
		 document.getElementById("monthlydetail").style.display="none"; 
       } 
         if(selectedValue==5){
      		 document.getElementById("weeklydetail").style.display="block"; 
    		 document.getElementById("dailysum").style.display="none"; 
    		 document.getElementById("weeklysum").style.display="none";
    		 document.getElementById("monthlysum").style.display="none"; 
    		 document.getElementById("dailydetail").style.display="none";
    		 document.getElementById("monthlydetail").style.display="none"; 
           } 
         if(selectedValue==6){
      		 document.getElementById("monthlydetail").style.display="block"; 
    		 document.getElementById("dailysum").style.display="none"; 
    		 document.getElementById("weeklysum").style.display="none";
    		 document.getElementById("monthlysum").style.display="none"; 
    		 document.getElementById("weeklydetail").style.display="none";
    		 document.getElementById("dailydetail").style.display="none"; 
           } 
    }
</script>
<script type='text/javascript'>function myFunction(){window.print();}</script>
</head> 
<body onload="sortTable()"> 

<%session = request.getSession(false);
if(null==session.getAttribute("uname")){
	System.out.println("Hello");
	response.sendRedirect("./login.jsp");
	System.out.println(session.getAttribute("uname"));
	
} %>
 
  
 <Button class="button button1" onclick="abc()">Report</Button><Button  class="button button1" onclick="xyz()">Department Report</Button><Button class="button button1" onclick="mno()">Status Report</Button><Button class="button button1" onclick="pqr()">Priority wise Report</Button><Button class="button button1" onclick="lmn()">Technician Report</Button><button style="align: right" class='button button1' onclick='myFunction()'>Print</button>
 <div id="default" style="display: none;">
 <br>This page will help you generate various kinds of reports based upon the catagory, department or the priority. You can print the reports generated.Data synchronization can be run on demand, or it can be scheduled to occur regularly.

The generated reports are based on the most recent data synchronization, not on current data. Activities that occur after the last data synchronization was done are captured by the next data synchronization.
</div>
<div id="option1" style="display: none;"> 


<table  width="100%">
<tr>
<td>
<font color="black"><b>Summary Report:</b></font>
<select id="ddlFruits" onchange="GetSelectedTextValue(this)">
    <option value="">Select Time Period</option>
    <option value="1">Daily Summary</option>
    <option value="2">Weekly Summary</option>
    <option value="3">Monthly Sumary</option>
 </select>
</td>
<td align= "right">
<font color="black"><b>Detailed Report:</b></font>
<select id="ddlFruits" onchange="GetSelectedTextValue(this)">
    <option value="">Select Time Period</option>
    <option value="4">Daily Detail</option>
    <option value="5">Weekly Detail</option>
    <option value="6">Monthly Detail</option>
 </select>
 </td>
 </tr>
 </table>
 <div id="dailysum" style="display: none;"> 

<%    
 Session s11 = HibernateUtil.getSessionFactory().openSession();  
 Query q11 = s11.createQuery("from Complaint where Date_login=trunc(sysdate)"); 
 List<Complaint> li11= q11.list(); 
 %> 
<div class="table100 ver6 m-b-110">
<table  data-vertable="ver6" id="myTable" > 
<thead>
<tr class="row100 head">  
<th>Complaint Number</th><th>Complaint</th><th>Status</th><th>Lodging Date</th></tr>  
</thead> <%  
for(Complaint c:li11){%>  
<tbody>
<tr class="row100"><td><%=c.getComplaintId() %></td><td><%=c.getComplaint() %></td><td><%=c.getStatus() %></td><td><%=new SimpleDateFormat("dd-MM-yyyy").format(c.getDate_login()) %></td>  
</tr> </tbody>
 <% }  
 s11.close(); 
 %> 
 </table>  
</div> </div>
<div id="weeklysum" style="display: none;"> 

<%    
 Session s1 = HibernateUtil.getSessionFactory().openSession();  
 Query q1 = s1.createQuery("from Complaint where DATE_LOGIN>=NEXT_DAY(SYSDATE,'MONDAY')-7 and DATE_LOGIN<=sysdate"); 
 List<Complaint> li1 = q1.list(); 
 %> 
<div class="table100 ver6 m-b-110">
<table  data-vertable="ver6" id="myTable" > 
<thead>
<tr class="row100 head">
 <th>Complaint Number</th><th>Complaint</th><th>Status</th><th>Lodging Date</th></tr>  
 </thead>
 <%  
for(Complaint c:li1){%>  
<tbody>
<tr class="row100"><td><%=c.getComplaintId() %></td><td><%=c.getComplaint() %></td><td><%=c.getStatus() %></td><td><%=new SimpleDateFormat("dd-MM-yyyy").format(c.getDate_login()) %></td>  
</tr> </tbody>
 <% }  
 s1.close(); 
 %> 
 </table>  </div>

</div> 

<div id="monthlysum" style="display: none;"> 
<H1>Status Report</H1> 
<%    
 Session s = HibernateUtil.getSessionFactory().openSession();  
 Query q = s.createQuery("from Complaint where extract(month from sysdate)=extract(month from DATE_LOGIN) and extract(year from sysdate)=extract(year from DATE_LOGIN) "); 
 List<Complaint> li = q.list(); 
 %> 
<div class="table100 ver6 m-b-110">
<table  data-vertable="ver6" id="myTable" > 
<thead>
<tr class="row100 head">
<th>Complaint Number</th><th>Complaint</th><th>Status</th><th>Lodging Date</th></tr>  
</thead>
 <%  
for(Complaint c:li){%>  
<tbody>
<tr class="row100"><td><%=c.getComplaintId() %></td><td><%=c.getComplaint() %></td><td><%=c.getStatus() %></td><td><%=new SimpleDateFormat("dd-MM-yyyy").format(c.getDate_login()) %></td>  
</tr></tbody> 
 <% }  
 s.close(); 
 %> 
 </table>  
</div>
</div> 
 <div id="dailydetail" style="display: none;"> 
<h1>Priority Wise Report</h1>
<% 
Session ses = HibernateUtil.getSessionFactory().openSession(); 
Query query = ses.createQuery("from Complaint where Date_login=trunc(sysdate)"); //... daily query  from Complaint where Date_login=trunc(sysdate)  weekly from Complaint where DATE_LOGIN>=NEXT_DAY(SYSDATE,'MONDAY')-7 and DATE_LOGIN<=sysdate  Monthly 
List<Complaint> com = query.list(); 
%> 
<div class="table100 ver6 m-b-110">
<table  data-vertable="ver6" id="myTable" > 
<thead>
<tr class="row100 head">
<th>Complaint Number</th><th>ComplaintCategory</th><th>Lodging Date</th><th>Closing Date</th><th>Department</th><th>Technician Name</th><th>Time Taken</th><th>Employee Id</th></tr> 
</thead>
<%  
for(Complaint l:com){%> 
<tbody>
<tr class="row100"><td><%=l.getComplaintId() %></td><td><%=l.getPriority() %></td><td><%=l.getDate_login() %></td><td><%=l.getDate_closing() %></td><td><%=l.getEmpDept() %></td><td><%=l.getTechName() %></td><td><%=l.getTime() %></td><td><%=l.getEmpID() %></td> 
 
</tr> </tbody>
<%} 
 
ses.close(); 
%></table></div> 
</div> 
<div id="weeklydetail" style="display: none;"> 

<% 
Session wses = HibernateUtil.getSessionFactory().openSession(); 
Query wquery = wses.createQuery("from Complaint where DATE_LOGIN>=NEXT_DAY(SYSDATE,'MONDAY')-7 and DATE_LOGIN<=sysdate"); //... daily query  from Complaint where Date_login=trunc(sysdate)  weekly from Complaint where DATE_LOGIN>=NEXT_DAY(SYSDATE,'MONDAY')-7 and DATE_LOGIN<=sysdate  Monthly 
List<Complaint> wcom = wquery.list(); 
%> 
<div class="table100 ver6 m-b-110">
<table  data-vertable="ver6" id="myTable" > 
<thead>
<tr class="row100 head">
<th>Complaint Number</th><th>ComplaintCategory</th><th>Lodging Date</th><th>Closing Date</th><th>Department</th><th>Technician Name</th><th>Time Taken</th><th>Employee Id</th></tr> 
</thead>
<%  
for(Complaint l:wcom){%> 
<tbody>
<tr class="row100"><td><%=l.getComplaintId() %></td><td><%=l.getPriority() %></td><td><%=l.getDate_login() %></td><td><%=l.getDate_closing() %></td><td><%=l.getEmpDept() %></td><td><%=l.getTechName() %></td><td><%=l.getTime() %></td><td><%=l.getEmpID() %></td> 
 
</tr> </tbody>
<%} 
 
wses.close(); 
%></table></div> 
</div> 

<div id="monthlydetail" style="display: none;"> 

<% 
Session mses = HibernateUtil.getSessionFactory().openSession(); 
Query mquery = mses.createQuery("from Complaint where extract(month from sysdate)=extract(month from DATE_LOGIN) and extract(year from sysdate)=extract(year from DATE_LOGIN)"); //... daily query  from Complaint where Date_login=trunc(sysdate)  weekly from Complaint where DATE_LOGIN>=NEXT_DAY(SYSDATE,'MONDAY')-7 and DATE_LOGIN<=sysdate  Monthly 
List<Complaint> mcom = mquery.list(); 
%> 
<div class="table100 ver6 m-b-110">
<table  data-vertable="ver6" id="myTable" > 
<thead>
<tr class="row100 head">
<th>Complaint Number</th><th>ComplaintCategory</th><th>Lodging Date</th><th>Closing Date</th><th>Department</th><th>Technician Name</th><th>Time Taken</th><th>Employee Id</th></tr> 
</thead>
<%  
for(Complaint l:mcom){%> 
<tbody>
<tr class="row100"><td><%=l.getComplaintId() %></td><td><%=l.getPriority() %></td><td><%=l.getDate_login() %></td><td><%=l.getDate_closing() %></td><td><%=l.getEmpDept() %></td><td><%=l.getTechName() %></td><td><%=l.getTime() %></td><td><%=l.getEmpID() %></td> 
 
</tr> </tbody>
<%} 
 
mses.close(); 
%></table> 
</div> 
</div>

</div> 


<div id="option2" style="display: none;"> 
<H1>Department Wise Report</H1> 
<% 
Session sesa = HibernateUtil.getSessionFactory().openSession(); 
Query querya = sesa.createQuery("from Complaint order by empdept"); 
List<Complaint> coma = querya.list(); 
%> 
<div class="table100 ver6 m-b-110">
<table  data-vertable="ver6" id="myTable" > 
<thead>
<tr class="row100 head">
<th>Complaint Number</th><th>ComplaintCategory</th><th>Lodging Date</th><th>Closing Date</th><th>Department</th><th>Technician Name</th><th>Time Taken</th><th>Employee Id</th></tr> 
</thead>
<%  
for(Complaint l:coma){%> 
<tbody>
<tr class="row100"><td><%=l.getComplaintId() %></td><td><%=l.getPriority() %></td><td><%=l.getDate_login() %></td><td><%=l.getDate_closing() %></td><td><%=l.getEmpDept() %></td><td><%=l.getTechName() %></td><td><%=l.getTime() %></td><td><%=l.getEmpID() %></td> 
 
</tr> </tbody>
<%} 
 
sesa.close(); 
%></table> 
</div> </div>
<div id="option3" style="display: none;"> 
<H1>Status Report</H1>
<% 
Session sessi = HibernateUtil.getSessionFactory().openSession(); 
Query qi = sessi.createQuery("from Complaint"); 

List<Complaint> compi = qi.list(); 
%>
<div class="table100 ver6 m-b-110">
<table  data-vertable="ver6" id="myTable" > 
<thead>
<tr class="row100 head">
<th>Complaint Number</th><th>Lodging Date</th><th>Employee Name</th><th>Employee Department</th><th>Technician Name</th><th>Employee Id</th><th>Days of Complain till now</th><th>Status</th></tr> 
<%  
for(Complaint l:compi){
	Date d=l.getDate_login();
	Calendar calendar = Calendar.getInstance();
	calendar.setTime(d);
	//YYYY,MM,dd
	LocalDate date = LocalDate.of(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
	//desired Date
	LocalDateTime current = LocalDateTime.now();
	long noOfDays = ChronoUnit.DAYS.between(date, current);

	//out.println("DAYS "+noOfDays);


%><tbody>
<tr class="row100"><td><%=l.getComplaintId() %></td><td><%=l.getDate_login() %></td><td><%=l.getEmpName() %></td><td><%=l.getEmpDept() %></td><td><%=l.getTechName() %></td><td><%=l.getEmpID() %></td> <td><%=noOfDays%></td><td><%=l.getStatus()%></td> 
 
</tr></tbody>
<%} 
sessi.close(); 
%></table></div>
<!-- <p><button onclick="sortTable()">Sort</button></p> -->
<h1><font color="Black">Status</font> Report generated based upon the <font color="Black">priority</font> of the complaints.</h1>
<% 
Session so = HibernateUtil.getSessionFactory().openSession(); 
Query qu = so.createQuery("from Complaint"); 

List<Complaint> compp = qu.list(); 
%>
<div class="table100 ver6 m-b-110">
<table  data-vertable="ver6" id="myTable" > 
<thead>
<tr class="row100 head">
<th>Complaint Number</th><th>Lodging Date</th><th>Employee Name</th><th>Employee Department</th><th>Technician Name</th><th>Employee Id</th><th>Days of Complain till now</th><th>Priority</th><th>Status</th></tr> 
</thead>
<%  
for(Complaint l:compp){
	Date d=l.getDate_login();
	Calendar calendar = Calendar.getInstance();
	calendar.setTime(d);
	//YYYY,MM,dd
	LocalDate date = LocalDate.of(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
	//desired Date
	LocalDateTime current = LocalDateTime.now();
	long noOfDays = ChronoUnit.DAYS.between(date, current);

	//out.println("DAYS "+noOfDays);


%> <tbody>
<tr class="row100"><td><%=l.getComplaintId() %></td><td><%=l.getDate_login() %></td><td><%=l.getEmpName() %></td><td><%=l.getEmpDept() %></td><td><%=l.getTechName() %></td><td><%=l.getEmpID() %></td> <td><%=noOfDays%></td><td><%=l.getPriority()%></td><td><%=l.getStatus()%></td> 
 
</tr></tbody> 
<%} 
so.close(); 
%></table></div>


</div>
<div id="option4" style="display: none;"> 
<H1>Priority Wise Report</H1> 

<h1>Complaints having <font color="Black">High</font> priority</h1>
<%
Session ss=HibernateUtil.getSessionFactory().openSession();
Transaction tx=ss.beginTransaction();
Query q1q = ss.createQuery("from Complaint where priority='High' "); 

List<Complaint> comp1 = q1q.list(); 
%>
<div class="table100 ver6 m-b-110">
<table  data-vertable="ver6" id="myTable" > 
<thead>
<tr class="row100 head">
<th>Complaint Number</th><th>Lodging Date</th><th>Employee Name</th><th>Employee Department</th><th>Technician Name</th><th>Employee Id</th><th>Days of Complain till now</th></tr> 
</thead>
<%  
for(Complaint l:comp1){
	Date d=l.getDate_login();
	Calendar calendar = Calendar.getInstance();
	calendar.setTime(d);
	//YYYY,MM,dd
	LocalDate date = LocalDate.of(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
	//desired Date
	LocalDateTime current = LocalDateTime.now();
	long noOfDays = ChronoUnit.DAYS.between(date, current);

	//out.println("DAYS "+noOfDays);


%> <tbody>
<tr class="row100 head"><td><%=l.getComplaintId() %></td><td><%=l.getDate_login() %></td><td><%=l.getEmpName() %></td><td><%=l.getEmpDept() %></td><td><%=l.getTechName() %></td><td><%=l.getEmpID() %></td> <td><%=noOfDays%></td> 
 
</tr> </tbody>
<%} 
tx.commit();
ss.close(); 
%></table>
</div>
<h1>Complaints having <font color="black">Medium</font> priority</h1>
<%
Session ss1=HibernateUtil.getSessionFactory().openSession();
Transaction tx1=ss1.beginTransaction();
Query q11q = ss1.createQuery("from Complaint where priority='Medium'"); 

List<Complaint> comp11 = q11q.list(); 
%>
<div class="table100 ver6 m-b-110">
<table  data-vertable="ver6" id="myTable" > 
<thead>
<tr class="row100 head">
<th>Complaint Number</th><th>Lodging Date</th><th>Employee Name</th><th>Employee Department</th><th>Technician Name</th><th>Employee Id</th><th>Days of Complain till now</th></tr> 
</thead>
<%  
for(Complaint l:comp11){
	Date d=l.getDate_login();
	Calendar calendar = Calendar.getInstance();
	calendar.setTime(d);
	//YYYY,MM,dd
	LocalDate date = LocalDate.of(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
	//desired Date
	LocalDateTime current = LocalDateTime.now();
	long noOfDays = ChronoUnit.DAYS.between(date, current);

	//out.println("DAYS "+noOfDays);


%>
<tbody> 
<tr class="row100"><td><%=l.getComplaintId() %></td><td><%=l.getDate_login() %></td><td><%=l.getEmpName() %></td><td><%=l.getEmpDept() %></td><td><%=l.getTechName() %></td><td><%=l.getEmpID() %></td> <td><%=noOfDays%></td> 
</tr> 
 </tbody>
<%} 
tx1.commit();
ss1.close(); 
%></table>
</div>
<h1>Complaints having <font color="black">Low</font> priority</h1>
<%
Session ss2=HibernateUtil.getSessionFactory().openSession();
Transaction tx2=ss2.beginTransaction();
Query q111 = ss2.createQuery("from Complaint where priority='Low'"); 

List<Complaint> comp111 = q111.list(); 
%>
<div class="table100 ver6 m-b-110">
<table  data-vertable="ver6" id="myTable" > 
<thead>
<tr class="row100 head">
<th>Complaint Number</th><th>Lodging Date</th><th>Employee Name</th><th>Employee Department</th><th>Technician Name</th><th>Employee Id</th><th>Days of Complain till now</th></tr> 
</thead>
<%  
for(Complaint l:comp111){
	Date d=l.getDate_login();
	Calendar calendar = Calendar.getInstance();
	calendar.setTime(d);
	//YYYY,MM,dd
	LocalDate date = LocalDate.of(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
	//desired Date
	LocalDateTime current = LocalDateTime.now();
	long noOfDays = ChronoUnit.DAYS.between(date, current);

	//out.println("DAYS "+noOfDays);


%> 
<tbody>
<tr class="row100"><td><%=l.getComplaintId() %></td><td><%=l.getDate_login() %></td><td><%=l.getEmpName() %></td><td><%=l.getEmpDept() %></td><td><%=l.getTechName() %></td><td><%=l.getEmpID() %></td> <td><%=noOfDays%></td> 
 
</tr> 
</tbody>
<%} 
tx2.commit();
ss2.close(); 
%></table>
</div>

</div>

<div id="option5" style="display: none;"> 

<h1>Technician Wise Report</h1>
<% 
Session sos = HibernateUtil.getSessionFactory().openSession(); 
//select * from complaint where techid in(select distinct(techid) from COMPLAINT);

SQLQuery qus = sos.createSQLQuery("select * from complaint order by techname "); 
qus.addEntity(Complaint.class);
out.println("<h2><font color='Black'></font></h2>");

List<Complaint> compps = qus.list(); 
%>
<div class="table100 ver6 m-b-110">
<table  data-vertable="ver6" id="myTable" > 
<thead>
<tr class="row100 head">
<th>Complaint Category</th><th>Complaint Number</th><th>Employee Id</th><th>Employee Name</th><th>Employee Department</th><th>Lodging Date</th><th>Closing Date</th><th>Time Taken</th><th><font color="black"><b>Technician Id</b></font></th><th><font color="black"><b>Technician Assigned</b></font></th><th>Status</th></tr> 
 </thead>
 <%  
for(Complaint l:compps){
	Date d=l.getDate_login();
	Calendar calendar = Calendar.getInstance();
	calendar.setTime(d);
	//YYYY,MM,dd
	LocalDate date = LocalDate.of(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
	//desired Date
	LocalDateTime current = LocalDateTime.now();
	long noOfDays = ChronoUnit.DAYS.between(date, current);
	
		
%> 
<tbody>
<tr class="row100">
<td><%=l.getPriority() %></td><td><%=l.getComplaintId() %></td><td><%=l.getEmpID()%></td><td><%=l.getEmpName() %></td><td><%=l.getEmpDept() %></td><td><%=l.getDate_login() %></td><td><%=l.getDate_closing() %></td><td><%=l.getTime()%></td><td><font color="black"><b><%=l.getTechId()%></b></font></td><td><font color="black"><b><%=l.getTechName()%></b></font></td><td><%=l.getStatus()%></td> 
</tr>
 </tbody>
<%} 
sos.close(); 

%></table></div>


</div>


</body> 
</html>
