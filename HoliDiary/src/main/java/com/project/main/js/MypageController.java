package com.project.main.js;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	
	@Autowired
	UserDAO uDAO;
	
	@Autowired
	SubscribeDAO sDAO;
	
	@Autowired
	VisitDAO vDAO;
	
		// 마이 페이지 들어가기(내정보)
		@RequestMapping(value = "/mypage.myinfo.go", method = RequestMethod.GET)
		public String mypageGo(HttpServletRequest req) {
			
			if(uDAO.loginCheck(req)) {
				req.setAttribute("contentPage", "kjs_mypage/mypage_myinfo.jsp");
			}else {
				req.setAttribute("contentPage", "home.jsp");
			}
			
			return "index";
		}
		
		// 마이 페이지 들어가기(나의 구독)
		@RequestMapping(value = "/mypage.mysubscribe.go", method = RequestMethod.GET)
		public String mypageMysubscribeGo(HttpServletRequest req) {
			
			if(uDAO.loginCheck(req)) {
				//구독 정보 가져오기
				sDAO.getSubscribing(req);
				req.setAttribute("contentPage", "kjs_mypage/mypage_subscribe.jsp");
			}else {
				req.setAttribute("contentPage", "home.jsp");
			}
			
			return "index";
		}
		
		// 마이 페이지 들어가기(다이어리 통계)
		@RequestMapping(value = "/mypage.mydiary.go", method = RequestMethod.GET)
		public String mypageMydiaryGo(HttpServletRequest req) {
			
			if(uDAO.loginCheck(req)) {
				//나를 구독하는 사람 가져오기
				sDAO.getSubscriber(req);
				// 통계를 위한 데이터 가져오기
				vDAO.getVisit(req);
				req.setAttribute("contentPage", "kjs_mypage/mypage_mydiary.jsp");
			}else {
				req.setAttribute("contentPage", "home.jsp");
			}
			
			return "index";
		}
		
		// 마이 페이지 들어가기(비번수정)
		@RequestMapping(value = "/mypage.changepw.go", method = RequestMethod.GET)
		public String mypageChangepwGo(HttpServletRequest req) {
			
			if(uDAO.loginCheck(req)) {
				req.setAttribute("contentPage", "kjs_mypage/mypage_changePW.jsp");
			}else {
				req.setAttribute("contentPage", "home.jsp");
			}
			
			return "index";
		}


}
