package com.project.main.js;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VisitDAO {

	@Autowired
	SqlSession ss;
	
	public int[] getVisit(HttpServletRequest req) {

		User u = (User) req.getSession().getAttribute("loginUser");
		Map<String, Object> visitElement = new HashMap<String, Object>();
		int[] totalVisit = new int[6];
		
		String host = u.getUserID();
		visitElement.put("host", host);
		
		LocalDateTime now = LocalDateTime.now();
		
		for (int i = 0; i < 6 ; i++) {
			LocalDateTime day = now.minusDays(5-i);
			// 포맷 정의        
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
			// 포맷 적용        
			String formatedDay = day.format(formatter);
			//System.out.println(formatedDay);
			
			visitElement.put("day", formatedDay);
			int visitCount = ss.getMapper(VisitMapper.class).getVisit(visitElement);

			//System.out.println(visitCount);
			totalVisit[i] = visitCount;
			 
		}
		return totalVisit;
		
	}

	public void countVisit(String diaryID, HttpServletRequest req) {

		User u = (User) req.getSession().getAttribute("loginUser");
		Map<String, String> e = new HashMap<String, String>();
		String userID = u.getUserID();
		
		e.put("userID", userID);
		e.put("diaryID", diaryID);
		
		//System.out.println(userID);
		//System.out.println(diaryID);
		
		if(userID.equals(diaryID)) {
			System.out.println("방문 카운팅x");
			return;
		}
		
		if(ss.getMapper(VisitMapper.class).countVisit(e) == 1) {
			System.out.println("방문 카운팅");
		}
		
	}

	public void getTodayVisit(HttpServletRequest req) {
		
		User u = (User) req.getSession().getAttribute("loginUser");
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedDay = now.format(formatter);
		Map<String, String> e = new HashMap<String, String>();
		
		e.put("userID", u.getUserID());
		e.put("today", formatedDay);
		
		List<User> todayVisits = ss.getMapper(VisitMapper.class).getTodayVisit(e);
		req.setAttribute("visits", todayVisits);
		
		
	}

}
