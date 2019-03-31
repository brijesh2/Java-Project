package com.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.model.bean.Complaint;

/**
 * Servlet implementation class RegistrationController
 */
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		
		int empId = (int)session.getAttribute("id");/*request.getParameter("empId");*/
		String empName = request.getParameter("empName");
		String dept = request.getParameter("dept");
		String complaint = request.getParameter("complaint");
		String date = request.getParameter("loginDate");
		String mobNo = request.getParameter("mobileNo");
		
		Session ses = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = ses.beginTransaction();
		
		Complaint com = new Complaint();
		System.out.println("hello1 "+empId);
		com.setEmpID(empId);
		com.setEmpName(empName);
		com.setEmpDept(dept);
		com.setComplaint(complaint);
		try {
			com.setDate_login(new SimpleDateFormat("yyyy-MM-dd").parse(date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			com.setDate_closing(new SimpleDateFormat("yyyy-MM-dd").parse(""));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		com.setTechId(0);
		com.setTechName("");
		com.setTechDept("");
		com.setTime("0");
		com.setStatus("Pending");
		com.setPriority("Low");
		com.setMobile(Long.parseLong(mobNo));
		
		ses.save(com);
		tx.commit();
		int cpId = com.getComplaintId();
		
		ses.close();
		
		String title = "Registration Successfully !!!";
	      String docType =
	         "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";

	      out.println(docType +
	         "<html>\n" +
	            "<head><link href='style.css' rel='stylesheet' type='text/css'> <script type='text/javascript'>function myFunction(){window.print();}</script></head>\n"  +
	            "<body background='1.jpg'>\n" +
	            "<center>"
	            + "<h1>Registered Successfully !! </h1>"
	            +"<h2>your complaint id :</h2>"+cpId+"\n"+
	            
	            	"<a href = './Welcome.jsp'> Back </a> </br><button class='button button1' onclick='myFunction()'>Print</button>"+
	            	"</center>\n"+
	            "</body>"+
	         "</html>"
	      );
	      
	      
			//String n=request.getParameter("uname"); 
	        session.setAttribute("complaintId",cpId);
	        
	        
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
