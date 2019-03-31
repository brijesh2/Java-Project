package com.model.bean;

import java.util.Date;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="complaint")
public class Complaint {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="complaintId")
	private int complaintId;
	@Column(name="empID")
	private int empID;
	@Column(name="empName")
	private String empName;
	@Column(name="empDept")
	private String empDept;
	@Column(name="complaint")
	private String complaint;
	@Column(name="date_login")
	private Date date_login;
	@Column(name="date_closing")
	private Date date_closing;
	@Column(name="techId")
	private int techId;
	@Column(name="techName")
	private String techName;
	@Column(name="techDept")
	private String techDept;
	@Column(name="status")
	private String status;
	@Column(name="timeTaken")
	private String time;
	@Column(name="priority")
	private String priority;
	@Column(name="EmpMobileNo")
	private long mobile;
	public int getComplaintId() {
		return complaintId;
	}
	public void setComplaintId(int complaintId) {
		this.complaintId = complaintId;
	}
	public int getEmpID() {
		return empID;
	}
	public void setEmpID(int empID) {
		this.empID = empID;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpDept() {
		return empDept;
	}
	public void setEmpDept(String empDept) {
		this.empDept = empDept;
	}
	public String getComplaint() {
		return complaint;
	}
	public void setComplaint(String complaint) {
		this.complaint = complaint;
	}
	public Date getDate_login() {
		return date_login;
	}
	public void setDate_login(Date date_login) {
		this.date_login = date_login;
	}
	public Date getDate_closing() {
		return date_closing;
	}
	public void setDate_closing(Date date_closing) {
		this.date_closing = date_closing;
	}
	public int getTechId() {
		return techId;
	}
	public void setTechId(int techId) {
		this.techId = techId;
	}
	public String getTechName() {
		return techName;
	}
	public void setTechName(String techName) {
		this.techName = techName;
	}
	public String getTechDept() {
		return techDept;
	}
	public void setTechDept(String techDept) {
		this.techDept = techDept;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public long getMobile() {
		return mobile;
	}
	public void setMobile(long mobile) {
		this.mobile = mobile;
	}
	public Complaint(int complaintId, int empID, String empName, String empDept, String complaint, Date date_login,
			Date date_closing, int techId, String techName, String techDept, String status, String time,
			String priority, long mobile) {
		super();
		this.complaintId = complaintId;
		this.empID = empID;
		this.empName = empName;
		this.empDept = empDept;
		this.complaint = complaint;
		this.date_login = date_login;
		this.date_closing = date_closing;
		this.techId = techId;
		this.techName = techName;
		this.techDept = techDept;
		this.status = status;
		this.time = time;
		this.priority = priority;
		this.mobile = mobile;
	}
	public Complaint() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
	
}
