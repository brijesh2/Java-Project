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

import com.control.HibernateUtil;
import com.model.bean.Faq;

/**
 * Servlet implementation class FAQImp
 */
public class FAQImp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQImp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		Session ses= HibernateUtil.getSessionFactory().openSession();
		Transaction tx= ses.beginTransaction();
		//String query=" from Faq";
		Query q=ses.createQuery("from Faq");
		List<Faq> fl= q.list();
		pw.println("<html><head><link href='style.css' rel='stylesheet' type='text/css'></head>");
		pw.println("<body>");
		pw.println("<center><h1>Frequently Asked Questions </h1></center><br>");
		pw.println("<table>");
		for (Faq pp : fl) {
			pw.println("<tr><td><b><font size='+1' color='Black'>");
			pw.println("Question: "+pp.getQuestion());
			pw.println("</font></b></td></tr>");
			
			pw.println("<tr><td><font size='+1'>");
			pw.println(" "+pp.getAnswer());
			pw.println("</font></td></tr><tr></tr>");
		}
		pw.println("</table><br><br><b><font size='+1' color='Black'>Add Your Own Solution:<br>");
		pw.println("<form action='./Submitfaq' method='post'>");
		pw.println("Question: <textarea rows='2' cols='50' name='question'></textarea></br>");
		pw.println("Answer: <textarea rows='10' cols='51' name='answer'></textarea></br>");
		pw.println("<button name='Submit' class='button button1' value='Submit' onclick='./submitfaq'>Submit</button></font>");
		pw.println("</form></b>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
