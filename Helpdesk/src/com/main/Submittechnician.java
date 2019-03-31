package com.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.control.HibernateUtil;
import com.model.bean.Complaint;
import com.model.bean.Technician;

/**
 * Servlet implementation class Submittechnician
 */
public class Submittechnician extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Submittechnician() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String[] chk= request.getParameterValues("complain");
		String[] s = request.getParameterValues("tid");
		Session ses = HibernateUtil.getSessionFactory().openSession();
		Transaction t = ses.beginTransaction();
		Query q = ses.createQuery("Update Complaint SET techid = :td where complaintid=:c");
		Query q11 = ses.createQuery("Update Technician SET workload=? where techid=?");
		Query q21 = ses.createQuery("from Technician t where techid=?");
		int count=0;
		System.out.println(chk.length);
		for(int i=0;i<s.length;i++){
			if(Integer.parseInt(s[i])>0){
			q.setInteger("c", Integer.parseInt(chk[count]));
			q21.setInteger(0, Integer.parseInt(s[i]));
			List<Technician> t1 = q21.list();
			Technician tech = t1.get(0);
			int load = tech.getWorkLoad()+1;
			q11.setInteger(0, load);
			q11.setInteger(1, Integer.parseInt(s[i]));
			q11.executeUpdate();
			q.setString("td", s[i]);			
			q.executeUpdate();
			count++;
			}		
		}	
		SQLQuery q2 = ses.createSQLQuery("update complaint set techname=(select techname from technician where complaint.techid=technician.techid)");
		SQLQuery q3 = ses.createSQLQuery("update complaint set techdept=(select techdept from technician where complaint.techid=technician.techid)");
		q2.executeUpdate();
		q3.executeUpdate();
		t.commit();
		
		Query q1 = ses.createQuery("from Complaint");
        List<Complaint> l = q1.list();
        String docType =
		         "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
        if(!l.isEmpty()){
        	pw.println(docType +
			         "<html><head>"
			         + "<script type=\'text/javascript\'>alert('Technicians are assigned');window.location = 'AdminWelcome.jsp';"
			         + "</script></head></html>"
			      );
        }
	pw.println("<HTML><BODY>");
	pw.println("<H1>Techician are assigned</H1>");
	pw.println("<table border='+1'>");
	pw.println("<tr><th>Complaint ID </th><th>Complaint</th><th>Emp Id</th><th>Priority</th><th>TId</th></tr>");
		for(Complaint c:l){		
			pw.println("<tr>");
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
			pw.println("</tr>");
		}
		pw.println("</table>");
		pw.println("</BODY></HTML>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
