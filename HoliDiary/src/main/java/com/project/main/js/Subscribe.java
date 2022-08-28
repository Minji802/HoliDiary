package com.project.main.js;

public class Subscribe {
	
	private int subscribeNO;
	private String subscribeFrom;
	private String subscribeTo;
	
	public Subscribe() {
		// TODO Auto-generated constructor stub
	}

	public Subscribe(int subscribeNO, String subscribeFrom, String subscribeTo) {
		super();
		this.subscribeNO = subscribeNO;
		this.subscribeFrom = subscribeFrom;
		this.subscribeTo = subscribeTo;
	}

	public int getSubscribeNO() {
		return subscribeNO;
	}

	public void setSubscribeNO(int subscribeNO) {
		this.subscribeNO = subscribeNO;
	}

	public String getSubscribeFrom() {
		return subscribeFrom;
	}

	public void setSubscribeFrom(String subscribeFrom) {
		this.subscribeFrom = subscribeFrom;
	}

	public String getSubscribeTo() {
		return subscribeTo;
	}

	public void setSubscribeTo(String subscribeTo) {
		this.subscribeTo = subscribeTo;
	}
	
	

}
