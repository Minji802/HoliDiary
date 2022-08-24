package com.project.main.sm;

import java.util.Date;

public class Schedule {

	private String ScheduleUserId;
	private String ScheduleTitle;
	private Date ScheduleDate;
	private Date ScheduleStartTime;
	private Date ScheduleEndTime;

	public Schedule() {
	}

	public Schedule(String scheduleUserId, String scheduleTitle, Date scheduleDate, Date scheduleStartTime,
			Date scheduleEndTime) {
		super();
		ScheduleUserId = scheduleUserId;
		ScheduleTitle = scheduleTitle;
		ScheduleDate = scheduleDate;
		ScheduleStartTime = scheduleStartTime;
		ScheduleEndTime = scheduleEndTime;
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

	public Date getScheduleStartTime() {
		return ScheduleStartTime;
	}

	public void setScheduleStartTime(Date scheduleStartTime) {
		ScheduleStartTime = scheduleStartTime;
	}

	public Date getScheduleEndTime() {
		return ScheduleEndTime;
	}

	public void setScheduleEndTime(Date scheduleEndTime) {
		ScheduleEndTime = scheduleEndTime;
	}

}
