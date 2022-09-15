package com.project.main;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.main.js.UserDAO;

@Controller
public class JPHomeController {
	
	@Autowired
	private UserDAO uDAO;
	
	
	@RequestMapping(value = "/JPindex.go", method = RequestMethod.GET)
	public String JPindexGo(HttpServletRequest req) {
		uDAO.loginCheck(req);
		req.setAttribute("contentPage", "JPhome.jsp");
		return "JPindex";
	}
	
	
}
