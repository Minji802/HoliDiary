package com.project.main.js;

public class SubscribeInfo {
	
	private String userID;
	private String userImg;
	private String userNickname;
	private String diaryTitle;
	
	public SubscribeInfo() {
		// TODO Auto-generated constructor stub
	}

	public SubscribeInfo(String userID, String userImg, String userNickname, String diaryTitle) {
		super();
		this.userID = userID;
		this.userImg = userImg;
		this.userNickname = userNickname;
		this.diaryTitle = diaryTitle;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getDiaryTitle() {
		return diaryTitle;
	}

	public void setDiaryTitle(String diaryTitle) {
		this.diaryTitle = diaryTitle;
	}
	
	

}
