package com.control;

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

import com.model.Login;

/**
 * Servlet implementation class Changepassword
 */
public class Changepassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Changepassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				PrintWriter out = response.getWriter();
				response.setContentType("text/html");
				Login log = new Login();
				String old = request.getParameter("id");
				String newp = request.getParameter("eid");
			
				Session ses = HibernateUtil.getSessionFactory().openSession();
				Transaction tx = ses.beginTransaction();
				Query q = ses.createQuery("select password from Login where username=:id");
				HttpSession session=request.getSession(); 
				String id1 = (String) session.getAttribute("username");
				System.out.println(id1);
				q.setParameter("id",id1);
				List<String> pass1 = q.list();
				String pass=pass1.get(0);
				String docType =
				         "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
				System.out.println(old);
				if(old.equals(pass)){
					Query q2 = ses.createQuery("update Login set password=? where username=?");

					q2.setParameter(0, newp);
					q2.setParameter(1, id1);
					int i = q2.executeUpdate();
				
					      out.println(docType +
					         "<html><head>"
					         + "<script type=\'text/javascript\'>alert('Changed Password Successfully !!');window.location = 'login.jsp';"
					         + "</script></head>\n" +
					 
					         "</html>"
					      );
					
				}
				else{
					 out.println(docType +
					         "<html><head>"
					         + "<script type=\'text/javascript\'>alert('Enter Valid Old Password !!');window.location = 'ChangePassword.jsp';"
					         + "</script></head>\n" +
					 
					         "</html>"
					      );
				}
			
				tx.commit();
				ses.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
