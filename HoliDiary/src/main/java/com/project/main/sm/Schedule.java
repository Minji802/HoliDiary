package com.project.main.sm;

import java.util.Date;

public class Schedule {

	private String ScheduleUserId;
	private String ScheduleTitle;
	private Date ScheduleDate;
	private String ScheduleStartTime;
	private String ScheduleEndTime;
	private int ScheduleNum;
	private String ScheduleContent;

	public Schedule() {
		// TODO Auto-generated constructor stub
	}

	public Schedule(String scheduleUserId, String scheduleTitle, Date scheduleDate, String scheduleStartTime,
			String scheduleEndTime, int scheduleNum, String scheduleContent) {
		super();
		ScheduleUserId = scheduleUserId;
		ScheduleTitle = scheduleTitle;
		ScheduleDate = scheduleDate;
		ScheduleStartTime = scheduleStartTime;
		ScheduleEndTime = scheduleEndTime;
		ScheduleNum = scheduleNum;
		ScheduleContent = scheduleContent;
	}

	public String getScheduleUserId() {
		return ScheduleUserId;
	}

	public void setScheduleUserId(String scheduleUserId) {
		ScheduleUserId = scheduleUserId;
	}

	public String getScheduleTitle() {
		return ScheduleTitle;
	}

	public void setScheduleTitle(String scheduleTitle) {
		ScheduleTitle = scheduleTitle;
	}

	public Date getScheduleDate() {
		return ScheduleDate;
	}

	public void setScheduleDate(Date scheduleDate) {
		ScheduleDate = scheduleDate;
	}

	public String getScheduleStartTime() {
		return ScheduleStartTime;
	}

	public void setScheduleStartTime(String scheduleStartTime) {
		ScheduleStartTime = scheduleStartTime;
	}

	public String getScheduleEndTime() {
		return ScheduleEndTime;
	}

	public void setScheduleEndTime(String scheduleEndTime) {
		ScheduleEndTime = scheduleEndTime;
	}

	public int getScheduleNum() {
		return ScheduleNum;
	}

	public void setScheduleNum(int scheduleNum) {
		ScheduleNum = scheduleNum;
	}

	public String getScheduleContent() {
		return ScheduleContent;
	}

	public void setScheduleContent(String scheduleContent) {
		ScheduleContent = scheduleContent;
	}

	

	
	

}
