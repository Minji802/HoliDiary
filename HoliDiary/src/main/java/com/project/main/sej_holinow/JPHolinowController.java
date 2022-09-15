package com.project.main.sej_holinow;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.main.js.UserDAO;
import com.project.main.sej.HomePostSelector;

@Controller
public class JPHolinowController {

	@Autowired
	private UserDAO uDAO;
	
	@Autowired
	private HolinowDAO hDAO;
	
	@RequestMapping(value = "/JPholinow.go", method = RequestMethod.GET)
	public String JPholiNowGo(HomePostSelector pSel,HttpServletRequest req) {
		uDAO.loginCheck(req);
		hDAO.getHolinow(req);
		req.setAttribute("contentPage", "jp_sej_holinow/JPholinow.jsp");
		return "JPindex";
	}
	
	
}
