package com.project.main.js;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SubscribeController {
	
	@Autowired
	UserDAO uDAO;
	
	@Autowired
	SubscribeDAO sDAO;
	
		// 나의구독 검색
		@RequestMapping(value = "/mysub.search", method = RequestMethod.GET)
		public SubscribeInfo mysubSearch(HttpServletRequest req, @RequestParam("mysubSearch") String search) {
			
			return sDAO.mysubSearch(req, search);
			
		}

		// 구독 취소
		@RequestMapping(value = "/mysub.cancel", method = RequestMethod.GET)
		public String mysubCancel(HttpServletRequest req, @RequestParam("no") String subscribeNo) {
			
			sDAO.mysubCancel(subscribeNo);
			
			sDAO.getMySubscribe(req);
			if(uDAO.loginCheck(req)) {
				req.setAttribute("contentPage", "kjs_mypage/mypage_subscribe.jsp");
			}else {
				req.setAttribute("contentPage", "home.jsp");
			}
			
			return "index";
		}

}
