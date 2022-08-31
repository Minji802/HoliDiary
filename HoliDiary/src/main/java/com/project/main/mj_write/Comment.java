package com.project.main.mj_write;

import java.sql.Date;

public class Comment {

	private int commentNum;
	private String commentTxt;
	private String commentWriter;
	private Date commentDate;
	private int postNum;
	private int commentParent;
	private int commentDepth;
	private boolean commentSecret;
	private String postWriter;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Comment(int commentNum, String commentTxt, String commentWriter, Date commentDate, int postNum,
			int commentParent, int commentDepth, boolean commentSecret, String postWriter) {
		super();
		this.commentNum = commentNum;
		this.commentTxt = commentTxt;
		this.commentWriter = commentWriter;
		this.commentDate = commentDate;
		this.postNum = postNum;
		this.commentParent = commentParent;
		this.commentDepth = commentDepth;
		this.commentSecret = commentSecret;
		this.postWriter = postWriter;
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

	public final int getCommentParent() {
		return commentParent;
	}

	public final void setCommentParent(int commentParent) {
		this.commentParent = commentParent;
	}

	public final int getCommentDepth() {
		return commentDepth;
	}

	public final void setCommentDepth(int commentDepth) {
		this.commentDepth = commentDepth;
	}

	public final boolean isCommentSecret() {
		return commentSecret;
	}

	public final void setCommentSecret(boolean commentSecret) {
		this.commentSecret = commentSecret;
	}

	public final String getPostWriter() {
		return postWriter;
	}

	public final void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}

	
	
	
}
