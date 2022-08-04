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
	
	@RequestMapping(value = "/login.go", method = RequestMethod.GET)
	public String loginGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "kjs_user/login.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginDo(User u ,HttpServletRequest req) {
		
		uDAO.login(u,req);
		
		req.setAttribute("contentPage", "kjs_user/login.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/join.go", method = RequestMethod.GET)
	public String joinGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "kjs_user/join.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String joiDo(User u ,HttpServletRequest req) {
		
		uDAO.join(u, req);
		
		// 나중에 완성되면 home으로 이동
		req.setAttribute("contentPage", "kjs_user/join.jsp");
		return "index";
	}

}
