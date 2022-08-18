package com.project.main.sej;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.main.js.UserDAO;

@Controller
public class Sej_SearchController {

	@Autowired
	private UserDAO uDAO;
	
	@Autowired
	private HomePostDAO pDAO;
	
	@RequestMapping(value = "/home.search", method = RequestMethod.GET)
	public String homeSearch(HomePostSelector pSel,HttpServletRequest req) {
		TokenMaker.make(req);
		uDAO.loginCheck(req);
		pDAO.searchPost(1, pSel, req);
		/*pDAO.getPost(1, req);*/
		/*req.setAttribute("contentPage", "sej_search/home_search.jsp");*/
		return "index";
	}
	
	@RequestMapping(value = "search.page.change", method = RequestMethod.GET)
	public String searchPageChange(HomePostSelector pSel, HttpServletRequest req) {
		TokenMaker.make(req);
		int p = Integer.parseInt(req.getParameter("p"));
		uDAO.loginCheck(req);
		pDAO.searchPost(p, pSel, req);
		return "index";
	}
	
}
