package com.project.main.sej_bestHoli;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.main.sej.Sej_postMapper;

@Service
public class BestHoliDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void getBestHoli(HttpServletRequest req) {
		try {
			req.setAttribute("bestHolis", ss.getMapper(Sej_postMapper.class).getBestHoli());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
