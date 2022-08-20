package com.project.main.sej_bestHoli;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.main.js.UserDAO;
import com.project.main.sej.HomePostSelector;

@Controller
public class BestHoliController {

	@Autowired
	private UserDAO uDAO;
	
	@Autowired
	private BestHoliDAO bDAO;
	
	@RequestMapping(value = "/bestHoli.go", method = RequestMethod.GET)
	public String bestHoliGo(HomePostSelector pSel,HttpServletRequest req) {
		uDAO.loginCheck(req);
		bDAO.getBestHoli(req);
		req.setAttribute("contentPage", "sej_bestHoli/bestHoli.jsp");
		return "index";
	}
}
