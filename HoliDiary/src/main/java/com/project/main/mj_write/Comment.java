package com.project.main.mj_write;

import java.sql.Date;

public class Comment {

	private int commentNum;
	private String commentTxt;
	private String commentWriter;
	private Date commentDate;
	private int postNum;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Comment(int commentNum, String commentTxt, String commentWriter, Date commentDate, int postNum) {
		super();
		this.commentNum = commentNum;
		this.commentTxt = commentTxt;
		this.commentWriter = commentWriter;
		this.commentDate = commentDate;
		this.postNum = postNum;
	}

	public final int getCommentNum() {
		return commentNum;
	}

	public final void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	public final String getCommentTxt() {
		return commentTxt;
	}

	public final void setCommentTxt(String commentTxt) {
		this.commentTxt = commentTxt;
	}

	public final String getCommentWriter() {
		return commentWriter;
	}

	public final void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}

	public final Date getCommentDate() {
		return commentDate;
	}

	public final void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public final int getPostNum() {
		return postNum;
	}

	public final void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	
	
	
}
