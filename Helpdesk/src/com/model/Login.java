package com.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="LogEmp")
public class Login {

	@Id
	private String username;
	private String password;
	private int empId;
	private int isLocked;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	
	public int getIsLocked() {
		return isLocked;
	}
	public void setIsLocked(int isLocked) {
		this.isLocked = isLocked;
	}
	
	public Login(String username, String password, int empId, int isLocked) {
		super();
		this.username = username;
		this.password = password;
		this.empId = empId;
		this.isLocked = isLocked;
	}
	
	public Login() {
		super();
	}
	@Override
	public String toString() {
		return "Login [username=" + username + ", password=" + password + ", empId=" + empId + "]";
	}
	
	
}
