package com.project.main.sm;

public class Category {
	
	private String categoryUserId;
	private String categories;
	
	public Category() {
		// TODO Auto-generated constructor stub
	}

	public Category(String categoryUserId, String categories) {
		super();
		this.categoryUserId = categoryUserId;
		this.categories = categories;
	}

	public String getCategoryUserId() {
		return categoryUserId;
	}

	public void setCategoryUserId(String categoryUserId) {
		this.categoryUserId = categoryUserId;
	}

	public String getCategories() {
		return categories;
	}

	public void setCategories(String categories) {
		this.categories = categories;
	}
	
	
	
	/*private String categoryUserId;
	private ArrayList<String> categories;
	
	public Category() {
		// TODO Auto-generated constructor stub
	}

	public Category(String categoryUserId, ArrayList<String> categories) {
		super();
		this.categoryUserId = categoryUserId;
		this.categories = categories;
	}

	public String getCategoryUserId() {
		return categoryUserId;
	}

	public void setCategoryUserId(String categoryUserId) {
		this.categoryUserId = categoryUserId;
	}

	public ArrayList<String> getCategories() {
		return categories;
	}

	public void setCategories(ArrayList<String> categories) {
		this.categories = categories;
	}*/

	
	

}
