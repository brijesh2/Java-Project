package com.main;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.infogain.persistence.HibernateUtil;
import com.model.bean.Complaint;

public class ViewComplaintImpl {

	public List<Complaint> getTable(){
		Session ses = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = ses.beginTransaction();		
		Query query = ses.createQuery("from Complaint");
		return query.list();
	}
}
