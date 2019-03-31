package com.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.infogain.persistence.HibernateUtil;
import com.model.Admin;
import com.model.Login;

/**
 * Servlet implementation class empValidation
 */
public class AdminValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminValidate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String username = request.getParameter("uname");
		pw.print(username);
		String password = request.getParameter("pword");
		pw.print(password);
		Session ses = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = ses.beginTransaction();		
		Query query = ses.createQuery("from Admin where username=? and password=?");
		query.setString(0, username);
		query.setString(1, password);
		List<Admin> l = query.list();
		HttpSession session = request.getSession();
		session.setAttribute("uname", username);
		
		String docType =
		         "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
		
		if(l.isEmpty()){
			 pw.println(docType +
			         "<html><head>"
			         + "<script type=\'text/javascript\'>alert('Enter Valid UserName And Password !!');window.location = 'login.jsp';"
			         + "</script></head>\n" +
			 
			         "</html>"
			      );
		}
		else if(!l.isEmpty()){
			response.sendRedirect("./AdminWelcome.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
