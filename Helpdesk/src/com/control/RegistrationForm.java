package com.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.model.Login;
import com.model.bean.Employee;

/**
 * Servlet implementation class RegistrationForm
 */
public class RegistrationForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Session ses = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = ses.beginTransaction();
		Employee emp = new Employee();
		Login login = new Login();
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		
		
		
		String empId = request.getParameter("empId");
		String empName = request.getParameter("empName");
		String dept = request.getParameter("dept");
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		
		emp.setEmpId(Integer.parseInt(empId));
		emp.setEmpDept(dept);
		emp.setEmpName(empName);
		login.setEmpId(Integer.parseInt(empId));
		login.setPassword(pass);
		login.setUsername(username);
		login.setIsLocked(0);
		
		ses.save(emp);
		ses.save(login);
		tx.commit();
		ses.close();
		
		String docType =
		         "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
		
		 pw.println(docType +
		         "<html><head>"
		         + "<script type=\'text/javascript\'>alert('Registered Successfully !!');window.location = 'AdminWelcome.jsp';"
		         + "</script></head>\n" +
		 
		         "</html>"
		      );
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
