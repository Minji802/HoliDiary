package com.project.main.mj_guestBook;

import java.sql.Date;

public class GuestBook {
	
	private int guestBookNum;
	private String guestBookWriter;
	private String guestBookTxt;
	private Date guestBookDate;
	private String guestBookOwner;
	
	public GuestBook() {
		// TODO Auto-generated constructor stub
	}

	public GuestBook(int guestBookNum, String guestBookWriter, String guestBookTxt, Date guestBookDate,
			String guestBookOwner) {
		super();
		this.guestBookNum = guestBookNum;
		this.guestBookWriter = guestBookWriter;
		this.guestBookTxt = guestBookTxt;
		this.guestBookDate = guestBookDate;
		this.guestBookOwner = guestBookOwner;
	}

	public final int getGuestBookNum() {
		return guestBookNum;
	}

	public final void setGuestBookNum(int guestBookNum) {
		this.guestBookNum = guestBookNum;
	}

	public final String getGuestBookWriter() {
		return guestBookWriter;
	}

	public final void setGuestBookWriter(String guestBookWriter) {
		this.guestBookWriter = guestBookWriter;
	}

	public final String getGuestBookTxt() {
		return guestBookTxt;
	}

	public final void setGuestBookTxt(String guestBookTxt) {
		this.guestBookTxt = guestBookTxt;
	}

	public final Date getGuestBookDate() {
		return guestBookDate;
	}

	public final void setGuestBookDate(Date guestBookDate) {
		this.guestBookDate = guestBookDate;
	}

	public final String getGuestBookOwner() {
		return guestBookOwner;
	}

	public final void setGuestBookOwner(String guestBookOwner) {
		this.guestBookOwner = guestBookOwner;
	}
	
	
}
