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
import com.model.Login;

/**
 * Servlet implementation class Validate
 */
public class EmployeeValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeValidate() {
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
		HttpSession session=request.getSession();  
		//String n=request.getParameter("uname"); 
        session.setAttribute("username",username);  
		String password = request.getParameter("pword");
		Session ses = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = ses.beginTransaction();		
		Query query = ses.createQuery("from Login where username=? and password=?");
		query.setString(0, username);
		query.setString(1, password);
		List<Login> l = query.list();
		
		
		String docType =
		         "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
		Query query1 = ses.createQuery("from Login l where username=?");
		
		query1.setParameter(0, username);
		List<Login> l1=query1.list();
		if(l1.isEmpty()){
			pw.println(docType +
			         "<html><head>"
			         + "<script type=\'text/javascript\'>alert('Invalid Username and Password');window.location = 'login.jsp';"
			         + "</script></head></html>"
			      );
		}
		if(!(l1.isEmpty())&&l.isEmpty()){
			
			
			
			
			Query query2 = ses.createQuery("update Login l set isLocked=? where username=?");
			
			Login i=(Login)l1.get(0);
			
			int lock = i.getIsLocked();
			
			if(3>=(lock+1)){
				query2.setParameter(0, (lock+1));
				query2.setParameter(1, username);
				query2.executeUpdate();
				tx.commit();
				ses.close();
				int lockleft=2-(lock);
				
				System.out.println(lockleft);
				pw.println(docType +
				         "<html><head>"
				         + "<script type=\'text/javascript\'>alert('"+lockleft+" attempts left');window.location = 'login.jsp';"
				         + "</script></head></html>"
				      );		}
		
			
			
			
				if(3<=lock){
				pw.println(docType +
				         "<html><head>"
				         + "<script type=\'text/javascript\'>alert('Account Freezed');window.location = 'login.jsp';"
				         + "</script></head>\n" +
				 
				         "</html>"
				      );}
				if(l1.isEmpty()){
				pw.println(docType +
				         "<html><head>"
				         + "<script type=\'text/javascript\'>alert('Enter Valid UserName And Password !!');window.location = 'login.jsp';"
				         + "</script></head>\n" +
				 
				         "</html>"
				      );		}
		
		}
			
			
		
		else if(!(l.isEmpty())&&(3>l.get(0).getIsLocked())){
			Login log = l.get(0);
			int id1 =log.getEmpId();
			System.out.println("hello "+id1);
			session.setAttribute("id", id1);
			session.setAttribute("uname", username);
			response.sendRedirect("./Welcome.jsp");
			
		}
else if(!(l.isEmpty())&&(3==l.get(0).getIsLocked())){
			
	pw.println(docType +
	         "<html><head>"
	         + "<script type=\'text/javascript\'>alert('Please click on forget password to unfreeze your account!!!');window.location = 'login.jsp';"
	         + "</script></head>\n" +
	 
	         "</html>"
	      );
			
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
