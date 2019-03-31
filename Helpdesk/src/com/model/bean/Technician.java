package com.model.bean;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Technician {
	@Id
	private int techId;
	private String techName;
	private String techDept;
	private int workLoad;
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
	
	public int getWorkLoad() {
		return workLoad;
	}
	public void setWorkLoad(int workLoad) {
		this.workLoad = workLoad;
	}
	public Technician(int techId, String techName, String techDept, int workLoad) {
		super();
		this.techId = techId;
		this.techName = techName;
		this.techDept = techDept;
		this.workLoad = workLoad;
	}
	public Technician() {
		super();
	}
	
	
	
}
