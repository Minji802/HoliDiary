package com.project.main.js;

public class SubscribeInfo {
	
	private int subscribeNo;
	private String userID;
	private String userImg;
	private String userNickname;
	private String diaryTitle;
	private String subCheck;
	
	public SubscribeInfo() {
		// TODO Auto-generated constructor stub
	}

	public SubscribeInfo(int subscribeNo, String userID, String userImg, String userNickname, String diaryTitle,
			String subCheck) {
		super();
		this.subscribeNo = subscribeNo;
		this.userID = userID;
		this.userImg = userImg;
		this.userNickname = userNickname;
		this.diaryTitle = diaryTitle;
		this.subCheck = subCheck;
	}

	public int getSubscribeNo() {
		return subscribeNo;
	}

	public void setSubscribeNo(int subscribeNo) {
		this.subscribeNo = subscribeNo;
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

	public String getSubCheck() {
		return subCheck;
	}

	public void setSubCheck(String subCheck) {
		this.subCheck = subCheck;
	}
	
	
}
