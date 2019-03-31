<%@page import="org.hibernate.Transaction"%>
<%@page import="com.control.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.model.bean.Complaint"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resend</title>
</head>
<body>
<% session = request.getSession();

Complaint com = (Complaint)session.getAttribute("obj");
System.out.println(com.getPriority());
String str=(String)com.getPriority();

com.setPriority("High");


DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date_login = new Date();
System.out.println(date_login+"***********");
com.setDate_login(date_login);
Session ses = HibernateUtil.getSessionFactory().openSession();
Transaction tx = ses.beginTransaction();
ses.update(com);
tx.commit();
ses.close();
out.println("complaint resubmited with higher priority");
%>
</body>
</html>