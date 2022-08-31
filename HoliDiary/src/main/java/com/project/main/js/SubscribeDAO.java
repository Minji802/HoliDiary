package com.project.main.js;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubscribeDAO {
	
	@Autowired
	private SqlSession ss;

	public void getSubscribing(HttpServletRequest req) {
		User u = (User) req.getSession().getAttribute("loginUser");
		
		String[] subscribes = ss.getMapper(SubscribeMapper.class).getSubscribing(u);
		
		ArrayList<SubscribeInfo> infos = new ArrayList<SubscribeInfo>();
		Subscribe s = new Subscribe(); 
		
		for (int i = 0; i < subscribes.length; i++) {
			String subscribeID = subscribes[i];
			s.setSubscribeFrom(u.getUserID());
			s.setSubscribeTo(subscribeID);
			//System.out.println(subscribeID);
			SubscribeInfo info = ss.getMapper(SubscribeMapper.class).getSubscribingInfo(s);
			infos.add(info);
			//System.out.println(i + "다이어리 : " + info.getDiaryTitle());
			//System.out.println(i + "아이디 : " + info.getUserID());
		}
		req.setAttribute("infos", infos);
	}

	// 구독 리스트 검색
	public List<SubscribeInfo> searchSubscribe(HttpServletRequest req, String search) {
		
		User u = (User) req.getSession().getAttribute("loginUser");
		
		System.out.println(u.getUserID());
		
		String userID = u.getUserID();
		
		Map<String, String> element = new HashMap<String, String>();
		element.put("search", search);
		element.put("id", userID);
		
		List<SubscribeInfo> infos = ss.getMapper(SubscribeMapper.class).searchSubscribe(element);
		System.out.println(infos.get(0).getDiaryTitle());
		
		return ss.getMapper(SubscribeMapper.class).searchSubscribe(element);
		
	}

	// 구독 취소
	public int cancelSubscribe(String subscribeNo) {
		return ss.getMapper(SubscribeMapper.class).cancelSubscribe(subscribeNo);
	}

	// 구독
	public int subscribe(HttpServletRequest req, String diaryID) {
		
		User u = (User) req.getSession().getAttribute("loginUser");
		
		Subscribe subElement = new Subscribe();		
		
		subElement.setSubscribeFrom(u.getUserID());
		subElement.setSubscribeTo(diaryID);
		
		return ss.getMapper(SubscribeMapper.class).subscribe(subElement);
		
	}

	// 나를 구독하는 사람
	public void getSubscriber(HttpServletRequest req) {
		User u = (User) req.getSession().getAttribute("loginUser");
		
		String[] subscribes = ss.getMapper(SubscribeMapper.class).getSubscriber(u);
		
		ArrayList<SubscribeInfo> infos = new ArrayList<SubscribeInfo>();
		Subscribe s = new Subscribe(); 

		for (int i = 0; i < subscribes.length; i++) {
			String subscribeID = subscribes[i];
			s.setSubscribeFrom(subscribeID);
			s.setSubscribeTo(u.getUserID());
			
			//System.out.println(subscribeID);
			SubscribeInfo info = ss.getMapper(SubscribeMapper.class).getSubscriberInfo(s);
			infos.add(info);
			//System.out.println(i + "다이어리 : " + info.getDiaryTitle());
			//System.out.println(i + "아이디 : " + info.getUserID());
		}
		req.setAttribute("infos", infos);
	}

}
