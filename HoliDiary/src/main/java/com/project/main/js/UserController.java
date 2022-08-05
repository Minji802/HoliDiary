package com.project.main.js;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO uDAO;
	
	// 로그인 페이지 들어가기
	@RequestMapping(value = "/login.go", method = RequestMethod.GET)
	public String loginGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "kjs_user/login.jsp");
		req.setAttribute("loginPage", "kjs_user/before_login.jsp");
		return "index";
	}
	
	// 로그인 하기
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginDo(User u ,HttpServletRequest req) {
		
		uDAO.login(u,req);
		uDAO.loginCheck(req);
		
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}
	
	// 회원가입 페이지 들어가기
	@RequestMapping(value = "/join.go", method = RequestMethod.GET)
	public String joinGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "kjs_user/join.jsp");
		req.setAttribute("loginPage", "kjs_user/before_login.jsp");
		return "index";
	}
	
	// 회원가입하기
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String joiDo(User u ,HttpServletRequest req) {
		
		uDAO.join(u, req);
		
		// 나중에 완성되면 home으로 이동
		req.setAttribute("contentPage", "kjs_user/join.jsp");
		req.setAttribute("loginPage", "kjs_user/before_login.jsp");
		return "index";
	}
	
	// 로그아웃하기
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logoutDo(User u ,HttpServletRequest req) {
		
		uDAO.logout(req);
		uDAO.loginCheck(req);
		
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}
	
	// 카카오톡 인가코드 및 토큰 얻기
	@RequestMapping(value = "/social.go", method = RequestMethod.GET)
	public String socialGo(HttpServletRequest req) {
		uDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		
		return "index";
	}
	
	

}
