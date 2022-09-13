package com.project.main.js;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JPMypageController {
	
	@Autowired
	UserDAO uDAO;
	
	@Autowired
	SubscribeDAO sDAO;
	
	@Autowired
	VisitDAO vDAO;
	
		// 마이 페이지 들어가기(내정보)
		@RequestMapping(value = "/jp.mypage.myinfo.go", method = RequestMethod.GET)
		public String mypageGo(HttpServletRequest req) {
			
			if(uDAO.loginCheck(req)) {
				req.setAttribute("contentPage", "jp_kjs_mypage/mypage_myinfo.jsp");
			}else {
				req.setAttribute("contentPage", "home.jsp");
			}
			
			return "index";
		}
		
		// 마이 페이지 들어가기(나의 구독)
		@RequestMapping(value = "/jp.mypage.mysubscribe.go", method = RequestMethod.GET)
		public String mypageMysubscribeGo(HttpServletRequest req) {
			
			if(uDAO.loginCheck(req)) {
				//구독 정보 가져오기
				sDAO.getSubscribing(req);
				req.setAttribute("contentPage", "jp_kjs_mypage/mypage_subscribe.jsp");
			}else {
				req.setAttribute("contentPage", "home.jsp");
			}
			
			return "index";
		}
		
		// 마이 페이지 들어가기(나의 구독자)
		@RequestMapping(value = "/jp.mypage.mysubscriber.go", method = RequestMethod.GET)
		public String mypageMysubscriberGo(HttpServletRequest req) {
			
			if(uDAO.loginCheck(req)) {
				//구독 정보 가져오기
				sDAO.getSubscriber(req);
				req.setAttribute("contentPage", "jp_kjs_mypage/mypage_subscriber.jsp");
			}else {
				req.setAttribute("contentPage", "home.jsp");
			}
			
			return "index";
		}
		
		// 마이 페이지 들어가기(다이어리 통계)
		@RequestMapping(value = "/jp.mypage.mydiary.go", method = RequestMethod.GET)
		public String mypageMydiaryGo(HttpServletRequest req) {
			
			if(uDAO.loginCheck(req)) {
				//오늘 방문자
				vDAO.getTodayVisit(req);
				req.setAttribute("contentPage", "jp_kjs_mypage/mypage_mydiary.jsp");
			}else {
				req.setAttribute("contentPage", "home.jsp");
			}
			
			return "index";
		}
		
		
		
		// 마이 페이지 들어가기(비번수정)
		@RequestMapping(value = "/jp.mypage.changepw.go", method = RequestMethod.GET)
		public String mypageChangepwGo(HttpServletRequest req) {
			
			if(uDAO.loginCheck(req)) {
				req.setAttribute("contentPage", "jp_kjs_mypage/mypage_changePW.jsp");
			}else {
				req.setAttribute("contentPage", "home.jsp");
			}
			
			return "index";
		}
		
		// 방문자 수 구하기
		@RequestMapping(value = "/jp.visit.get", method = RequestMethod.GET)
		public @ResponseBody int[] visitGet(HttpServletRequest req) {
			
			return vDAO.getVisit(req);
			
		}


}
