package com.model.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;




@Entity
@Table(name="faq")
public class Faq {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="FaqID")
	int faqid;
	@Column(name="Question")
	String question;
	@Column(name="Answer")
	String answer;
	public int getFaqid() {
		return faqid;
	}
	public void setFaqid(int faqid) {
		this.faqid = faqid;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Faq(int faqid, String question, String answer) {
		super();
		this.faqid = faqid;
		this.question = question;
		this.answer = answer;
	}
	public Faq() {
		super();
	}
	@Override
	public String toString() {
		return "Faq [faqid=" + faqid + ", question=" + question + ", answer=" + answer + "]";
	}
	


}
