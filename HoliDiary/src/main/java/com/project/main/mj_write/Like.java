package com.project.main.mj_write;

public class Like {
	
	private int like_no;
	private int postNum;
	private String userId;
	private int likeCount;
	
	public Like() {
		// TODO Auto-generated constructor stub
	}

	public Like(int like_no, int postNum, String userId, int likeCount) {
		super();
		this.like_no = like_no;
		this.postNum = postNum;
		this.userId = userId;
		this.likeCount = likeCount;
	}

	public final int getLike_no() {
		return like_no;
	}

	public final void setLike_no(int like_no) {
		this.like_no = like_no;
	}

	public final int getPostNum() {
		return postNum;
	}

	public final void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public final String getUserId() {
		return userId;
	}

	public final void setUserId(String userId) {
		this.userId = userId;
	}

	public final int getLikeCount() {
		return likeCount;
	}

	public final void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	
}
