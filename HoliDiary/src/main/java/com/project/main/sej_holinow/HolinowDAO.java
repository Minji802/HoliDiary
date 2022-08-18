package com.project.main.sej_holinow;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.main.sej.Sej_postMapper;

@Service
public class HolinowDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void getHolinow(HttpServletRequest req) {
		try {
			req.setAttribute("holinows", ss.getMapper(Sej_postMapper.class).getHolinow());	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
