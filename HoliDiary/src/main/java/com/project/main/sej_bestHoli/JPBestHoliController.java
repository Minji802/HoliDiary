package com.project.main.sej_bestHoli;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.main.js.UserDAO;
import com.project.main.sej.HomePostSelector;

@Controller
public class JPBestHoliController {

	@Autowired
	private UserDAO uDAO;
	
	@Autowired
	private BestHoliDAO bDAO;
	
	@RequestMapping(value = "/JPbestHoli.go", method = RequestMethod.GET)
	public String JPbestHoliGo(HomePostSelector pSel,HttpServletRequest req) {
		uDAO.loginCheck(req);
		bDAO.getBestHoliRanking(req);
		bDAO.getBestHoli(req);
		req.setAttribute("contentPage", "jp_sej_bestHoli/JPbestHoli.jsp");
		return "JPindex";
	}
}
