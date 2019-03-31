package com.main;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.infogain.persistence.HibernateUtil;
import com.model.bean.Faq;

/**
 * Servlet implementation class Submitfaq
 */
public class Submitfaq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Submitfaq() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		Session ses = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = ses.beginTransaction();
		Faq newEntry = new Faq();
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		newEntry.setQuestion(question);
		newEntry.setAnswer(answer);
		ses.save(newEntry);
		tx.commit();
		ses.close();
		pw.println("<HTML><HEAD><script type=\'text/javascript\'>alert('Response submitted Thank you for your contribution !!');window.location = 'FAQImp';</script></Head></HTML>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
