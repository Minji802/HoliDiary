package com.project.main.mj_write;

import java.sql.Date;

public class DiaryPost {
	
	private int postNum;
	private String postTitle;
	private String postTxt;
	private Date postDate;
	private String postWriter;
	private String postCategory;
	private String postCountry;
	private int postRecommend;
	private String postImg;
	private String postWeather;
	private int postView;
	
	public DiaryPost() {
		// TODO Auto-generated constructor stub
	}

	public DiaryPost(int postNum, String postTitle, String postTxt, Date postDate, String postWriter,
			String postCategory, String postCountry, int postRecommend, String postImg, String postWeather,
			int postView) {
		super();
		this.postNum = postNum;
		this.postTitle = postTitle;
		this.postTxt = postTxt;
		this.postDate = postDate;
		this.postWriter = postWriter;
		this.postCategory = postCategory;
		this.postCountry = postCountry;
		this.postRecommend = postRecommend;
		this.postImg = postImg;
		this.postWeather = postWeather;
		this.postView = postView;
	}

	public final int getPostNum() {
		return postNum;
	}

	public final void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public final String getPostTitle() {
		return postTitle;
	}

	public final void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public final String getPostTxt() {
		return postTxt;
	}

	public final void setPostTxt(String postTxt) {
		this.postTxt = postTxt;
	}

	public final Date getPostDate() {
		return postDate;
	}

	public final void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public final String getPostWriter() {
		return postWriter;
	}

	public final void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}

	public final String getPostCategory() {
		return postCategory;
	}

	public final void setPostCategory(String postCategory) {
		this.postCategory = postCategory;
	}

	public final String getPostCountry() {
		return postCountry;
	}

	public final void setPostCountry(String postCountry) {
		this.postCountry = postCountry;
	}

	public final int getPostRecommend() {
		return postRecommend;
	}

	public final void setPostRecommend(int postRecommend) {
		this.postRecommend = postRecommend;
	}

	public final String getPostImg() {
		return postImg;
	}

	public final void setPostImg(String postImg) {
		this.postImg = postImg;
	}

	public final String getPostWeather() {
		return postWeather;
	}

	public final void setPostWeather(String postWeather) {
		this.postWeather = postWeather;
	}

	public final int getPostView() {
		return postView;
	}

	public final void setPostView(int postView) {
		this.postView = postView;
	}
	
	
	
	
	
}
