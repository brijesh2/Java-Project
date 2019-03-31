package com.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.infogain.persistence.HibernateUtil;
import com.model.Login;

/**
 * Servlet implementation class Password
 */
public class Password extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Password() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String empid = request.getParameter("EmpId");
		Session ses = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = ses.beginTransaction();		
		Query query = ses.createQuery("from Login where empid=?");
		query.setString(0, empid);
		List<Login> l = query.list();	
		if(l.isEmpty()){
			pw.println("Please Enter Correct EmpId");
		}else if(!l.isEmpty()){
			Query query1 = ses.createQuery("update Login set islocked=0 where empid=?");
			query1.setString(0, empid);
			query1.executeUpdate();
			tx.commit();
			ses.close();
			pw.println("<HTML><HEAD><link href='style.css' rel='stylesheet' type='text/css'> </HEAD><BODY background='1.jpg'><Center>");
			for(Login i:l){
				pw.println("Your Details Are: ");
				pw.println("Username: "+i.getUsername()+" Password: "+i.getPassword());
			}
			pw.println("</center></Body></Html>");
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
