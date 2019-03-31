package com.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.control.HibernateUtil;
import com.model.bean.Complaint;

/**
 * Servlet implementation class Comp
 */
public class Comp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Comp() {
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
		Session ses = HibernateUtil.getSessionFactory().openSession();
//		
//		 List<Complaint> l = q1.list();
//		
	SimpleDateFormat availDate = new SimpleDateFormat("yyyy-MM-dd");
//		 String strDate = availDate.format(d2);
//		 Date d3 = null;
//		 try {
//			d3  = availDate.parse(strDate);
//		} catch (ParseException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		String[] chk= request.getParameterValues("complain");
		String[] date = request.getParameterValues("date_closing");
		String[] stat = request.getParameterValues("status");
		String[] priority = request.getParameterValues("priority");	
		Transaction t = ses.beginTransaction();
		Query q = ses.createQuery("update Complaint set priority=:p,date_closing=:d,status=:s,timetaken=:t where complaintid=:c");
		Query q1 = ses.createQuery("from Complaint where complaintid=:c");
		int count=0;
		Date d1 = null;
		for(int i=0;i<priority.length;i++){
			q.setString("c", chk[count]);
			 q1.setString("c", chk[count]);
			 List<Complaint> l = q1.list();
			 Date d2 =null;
			 for(Complaint c:l){
				 d2 = c.getDate_login();
				 
			 }
			try {
				d1 = availDate.parse(date[i]);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
			//System.out.println(d1+" "+d3+"**********");
			long duration  = d1.getTime() - d2.getTime();	
			long diffInDays = TimeUnit.MILLISECONDS.toDays(duration);
			q.setDate("d", d1);
			q.setString("s", stat[i]);
			q.setString("p", priority[i]);
			q.setLong("t",diffInDays);
			q.executeUpdate();
			count++;
		}
		t.commit();
		Session s = HibernateUtil.getSessionFactory().openSession();
		Query q2 = s.createQuery("from Complaint");
		 List<Complaint> li = q2.list();
	pw.println("<HTML><head><link href='style.css' rel='stylesheet' type='text/css'> </head><BODY>");
	pw.println("<H1>Priority are Set.</H1>");
	pw.println("<div class='table100 ver6 m-b-110'><table  data-vertable='ver6' id='myTable' > ");
	pw.println("<thead><tr class='row100 head'><th>Complaint ID </th><th>Complaint</th><th>Emp Id</th><th>Priority</th><th>TId</th><th>Time Taken</th></tr></thead>");
		for(Complaint c:li){		
			pw.println("<tbody><tr class='row100'>");
			pw.println("<td>");
			pw.println(c.getComplaintId());
			pw.println("</td>");
			pw.println("<td>");
			pw.println(c.getComplaint());
			pw.println("</td>");
			pw.println("<td>");
 		    pw.println(c.getEmpID());
			pw.println("</td>");
			pw.println("<td>");
			pw.println(c.getPriority());
			pw.println("</td>");
			pw.println("<td>");
			pw.println(c.getTechId());
			pw.println("</td>");
			pw.println("<td>");
			pw.println(c.getTime());
			pw.println("</td>");
			pw.println("</tr></tbody>");
		}
		pw.println("</table></div>");
		pw.println("</BODY></HTML>");
		s.close();
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
