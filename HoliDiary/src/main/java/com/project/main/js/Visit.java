package com.project.main.js;

import java.util.Date;

public class Visit {
	private int visitNo;
	private String diaryHost;
	private String diaryVisitant;
	private Date visitTime;
	
	public Visit() {
		// TODO Auto-generated constructor stub
	}

	public Visit(int visitNo, String diaryHost, String diaryVisitant, Date visitTime) {
		super();
		this.visitNo = visitNo;
		this.diaryHost = diaryHost;
		this.diaryVisitant = diaryVisitant;
		this.visitTime = visitTime;
	}

	public int getVisitNo() {
		return visitNo;
	}

	public void setVisitNo(int visitNo) {
		this.visitNo = visitNo;
	}

	public String getDiaryHost() {
		return diaryHost;
	}

	public void setDiaryHost(String diaryHost) {
		this.diaryHost = diaryHost;
	}

	public String getDiaryVisitant() {
		return diaryVisitant;
	}

	public void setDiaryVisitant(String diaryVisitant) {
		this.diaryVisitant = diaryVisitant;
	}

	public Date getVisitTime() {
		return visitTime;
	}

	public void setVisitTime(Date visitTime) {
		this.visitTime = visitTime;
	}
	
	
}
