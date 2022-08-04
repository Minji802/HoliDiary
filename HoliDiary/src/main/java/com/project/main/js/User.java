package com.project.main.js;

public class User {
	
	private String userID;
	private String userPW;
	private String userName;
	private String userPhoneNumber;
	private String userEmail;
	private String userImg;
	private String userDiaryUrl;
	private String userNickname;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String userID, String userPW, String userName, String userPhoneNumber, String userEmail, String userImg,
			String userDiaryUrl, String userNickname) {
		super();
		this.userID = userID;
		this.userPW = userPW;
		this.userName = userName;
		this.userPhoneNumber = userPhoneNumber;
		this.userEmail = userEmail;
		this.userImg = userImg;
		this.userDiaryUrl = userDiaryUrl;
		this.userNickname = userNickname;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserPW() {
		return userPW;
	}

	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}

	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getUserDiaryUrl() {
		return userDiaryUrl;
	}

	public void setUserDiaryUrl(String userDiaryUrl) {
		this.userDiaryUrl = userDiaryUrl;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	
	
	
	

}
