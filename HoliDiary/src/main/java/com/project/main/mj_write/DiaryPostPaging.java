package com.project.main.mj_write;

public class DiaryPostPaging {

	private int nowPage;
	private int startPage;
	private int endPage;
	private int total;
	private int cntPerPage;
	private int lastPage;
	private int start;
	private int end;
	private int cntPage = 15;
	
	public DiaryPostPaging() {
		// TODO Auto-generated constructor stub
	}

	public DiaryPostPaging(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	
	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if(getStartPage() < 1) {
			setStartPage(1);
		}
	}
	
	// DB 쿼리에서 사용할 start, end 값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}			
	

	public final int getNowPage() {
		return nowPage;
	}

	public final void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public final int getStartPage() {
		return startPage;
	}

	public final void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public final int getEndPage() {
		return endPage;
	}

	public final void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public final int getTotal() {
		return total;
	}

	public final void setTotal(int total) {
		this.total = total;
	}

	public final int getCntPerPage() {
		return cntPerPage;
	}

	public final void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public final int getLastPage() {
		return lastPage;
	}

	public final void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public final int getStart() {
		return start;
	}

	public final void setStart(int start) {
		this.start = start;
	}

	public final int getEnd() {
		return end;
	}

	public final void setEnd(int end) {
		this.end = end;
	}

	public final int getCntPage() {
		return cntPage;
	}

	public final void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	
	
	
	
}
