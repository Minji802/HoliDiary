package com.project.main.js;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VisitDAO {

	@Autowired
	SqlSession ss;
	
	public void getVisit(HttpServletRequest req) {

		User u = (User) req.getSession().getAttribute("loginUser");
		Map<String, Object> visitElement = new HashMap<String, Object>();
		int[] totalVisit = new int[6];
		
		String host = u.getUserID();
		visitElement.put("host", host);
		
		LocalDateTime now = LocalDateTime.now();
		
		for (int i = 0; i < 6 ; i++) {
			LocalDateTime day = now.minusDays(i); // 2일 전
			// 포맷 정의        
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
			// 포맷 적용        
			String formatedDay = day.format(formatter);
			System.out.println(formatedDay);
			
			visitElement.put("day", formatedDay);
			int visitCount = ss.getMapper(VisitMapper.class).getVisit(visitElement);

			System.out.println(visitCount);
			totalVisit[i] = visitCount;
		}
		
		req.setAttribute("totalVisit", totalVisit);
		

		
	}

}
