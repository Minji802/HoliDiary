package com.project.main.js;

import java.util.ArrayList;

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
		
		ArrayList<SubscribeInfo> subscribeInfos = new ArrayList<SubscribeInfo>();

		for (int i = 0; i < subscribes.length; i++) {
			String subscribeID = subscribes[i];
			SubscribeInfo s = ss.getMapper(SubscribeMapper.class).getSubscribeInfo(subscribeID);
			subscribeInfos.add(s);
			System.out.println(subscribeID);
		}
		
		req.setAttribute("subscribes", subscribeInfos);
		
		System.out.println(subscribes[0]);
		
		
		
	}

}
