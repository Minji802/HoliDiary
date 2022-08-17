package com.project.main.sm;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.lf5.viewer.categoryexplorer.CategoryImmediateEditor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CategoryDAO {
	
	@Autowired
	private SqlSession ss;

	//카테고리 업데이트 (추가)
	public void updateCategoryAdd(HttpServletRequest req, Diary d, String userId, Category c) {
		
		try {
			
			//List<Category> categories = new ArrayList<Category>();
			
				System.out.println(c.getCategories());
			
			String categories2 = c.getCategories() + "!";
			
				System.out.println(categories2);
			
			c.setCategories(categories2);
			c.setCategoryUserId(userId);
			
				System.out.println(c.getCategories());
			
			ss.getMapper(CategoryMapper.class).addCategory(c);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}

	// 카테고리 업데이트 (수정)
	public void updateCategoryup(HttpServletRequest req, Diary d, String userId, Category c, String newCategory) {

		try {
			
			String newCategories = req.getParameter("newCategory");
			
			System.out.println(newCategories);
			
			c.setCategories(newCategories);
			c.setCategoryUserId(userId);
			
			System.out.println(c.getCategories());
			
			ss.getMapper(CategoryMapper.class).updateCategory(c);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
