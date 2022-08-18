package com.project.main.sej_holinow;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.main.js.UserDAO;
import com.project.main.sej.HomePostSelector;

@Controller
public class HolinowController {

	@Autowired
	private UserDAO uDAO;
	
	@Autowired
	private HolinowDAO hDAO;
	
	@RequestMapping(value = "/holinow.go", method = RequestMethod.GET)
	public String holiNowGo(HomePostSelector pSel,HttpServletRequest req) {
		uDAO.loginCheck(req);
		hDAO.getHolinow(req);
		req.setAttribute("contentPage", "sej_holinow/holinow.jsp");
		return "index";
	}
	
	
}
