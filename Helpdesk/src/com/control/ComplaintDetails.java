package com.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;

import com.model.bean.Complaint;

/**
 * Servlet implementation class ComplaintDetails
 */
public class ComplaintDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComplaintDetails() {
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
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		String id = request.getParameter("id");
		String eid = request.getParameter("eid");
		Session ses = HibernateUtil.getSessionFactory().openSession();
		/*Complaint com = (Complaint) ses.load(Complaint.class, Integer.parseInt(id));*/
		Query q = ses.createQuery("from Complaint where complaintId=? and empID=? ");
		q.setParameter(0, Integer.parseInt(id));
		q.setParameter(1, Integer.parseInt(eid));
		List<Complaint> l = q.list();
		
		//for getting system date
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date2 = new Date();
		System.out.println(dateFormat.format(date2));
		
		//for getting database date
		String docType =
		         "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
		if(!l.isEmpty())
		for(Complaint d:l){
		Date date3  = d.getDate_login();
		long diff = date2.getTime() - date3.getTime();
		   
	    long diffHours = diff / (60 * 60 * 1000);
	    int days = (int) (diffHours/24);
	   
	
		
		if(d.getStatus().equals("Pending")&& diffHours>48L)
		{
			pw.println("<Html><body>"
					+ "<a href='./resend.jsp'>"
					+ "<button>Resend</button>"
					+ "</a>"
					+ "</body></html>");
			HttpSession session=request.getSession();  
			session.setAttribute("obj", d);
			
			ses.close();
		}
		else if(d.getStatus().equals("Pending"))
		{
			Date date = d.getDate_login();
			pw.println(docType +
			         "<html>\n" +
			            "<head><link href='style.css' rel='stylesheet' type='text/css'></head>"  +
			            "<body>\n" +
			            "<center><br><br><h1>User Complaint Details !!!</h1><br><br><h3>"+
			            "Date:  "+format.format(date)+"<br><br>Status:  "+d.getStatus()+
			            "<br><br>Complaint Id:  "+d.getComplaintId()+
			            "<br><br>Technician Name:  "+d.getTechName()+
			            "<br><br>Time:  "+days+" days"
			            
			            +"</h3><a href='./Welcome.jsp'><br><br><br>"+
						 "<button class='large green button'>Back</button>"+
						"</a>"+
			            	"</center>\n"+
			            "</body>"+
			         "</html>");
			
		}
		
		}
		else if(l.isEmpty()){
			 pw.println(docType +
			         "<html><head>"
			         + "<script type=\'text/javascript\'>alert('Enter Valid EmployeeId and ComplaintID  !!');window.location = 'ViewComplaint.jsp';"
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
