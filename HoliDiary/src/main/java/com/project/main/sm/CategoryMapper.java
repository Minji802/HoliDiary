package com.project.main.sm;

import com.project.main.js.User;

public interface CategoryMapper {

	void categoryUserInsert(User u);

	void addCategory(Category c);

	void updateCategory(Category c);

	void deleteCategory(Category c);

	Category getCategoryInfo(Category c);


}
