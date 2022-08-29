package com.project.main.js;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubscribeDAO {
	
	@Autowired
	private SqlSession ss;

	public void getMySubscribe(HttpServletRequest req) {
		User u = (User) req.getSession().getAttribute("loginUser");
		
		String[] subscribes = ss.getMapper(SubscribeMapper.class).getMySubscribe(u);
		
		ArrayList<SubscribeInfo> infos = new ArrayList<SubscribeInfo>();

		for (int i = 0; i < subscribes.length; i++) {
			String subscribeID = subscribes[i];
			//System.out.println(subscribeID);
			SubscribeInfo info = ss.getMapper(SubscribeMapper.class).getSubscribeInfo(subscribeID);
			infos.add(info);
			//System.out.println(i + "다이어리 : " + info.getDiaryTitle());
			//System.out.println(i + "아이디 : " + info.getUserID());
		}
		req.setAttribute("infos", infos);
	}

	// 구독 리스트 검색
	public SubscribeInfo mysubSearch(HttpServletRequest req, String search) {
		
		User u = (User) req.getSession().getAttribute("loginUser");
		
		System.out.println(u.getUserID());
		
		String userID = u.getUserID();
		
		Map<String, String> element = new HashMap<String, String>();
		element.put("search", search);
		element.put("id", userID);
		
		return ss.getMapper(SubscribeMapper.class).mysubSearch(element);
		
	}

	// 구독 취소
	public void mysubCancel(String subscribeNo) {
		if(ss.getMapper(SubscribeMapper.class).mysubCancel(subscribeNo) == 1) {
			System.out.println("구독 취소");
		}
	}

}
