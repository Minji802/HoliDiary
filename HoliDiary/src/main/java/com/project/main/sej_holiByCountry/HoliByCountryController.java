package com.project.main.sej_holiByCountry;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.main.js.UserDAO;
import com.project.main.sej.HomePostDAO;
import com.project.main.sej.HomePostSelector;
import com.project.main.sej.TokenMaker;
import com.project.main.sm.DiaryDAO;

@Controller
public class HoliByCountryController {

	@Autowired
	private UserDAO uDAO;
	
	@Autowired
	private HomePostDAO pDAO;
	
	@RequestMapping(value = "/holiByCountry.go", method = RequestMethod.GET)
	public String holiByCountryGo(HomePostSelector pSel,HttpServletRequest req) {
		TokenMaker.make(req);
		uDAO.loginCheck(req);
		pDAO.holiByCountry(1, pSel, req);
		/*pDAO.textLengthSet(req);*/
		/*pDAO.getPost(1, req);*/
		/*req.setAttribute("contentPage", "sej_search/home_search.jsp");*/
		return "index";
	}
	
	@RequestMapping(value = "search.page.change.holi", method = RequestMethod.GET)
	public String searchPageChangeHoli(HomePostSelector pSel, HttpServletRequest req) {
		TokenMaker.make(req);
		int p = Integer.parseInt(req.getParameter("p"));
		uDAO.loginCheck(req);
		pDAO.holiByCountry(p, pSel, req);
		return "index";
	}
}
