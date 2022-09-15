package com.project.main.sej;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.main.js.User;
import com.project.main.js.UserDAO;
import com.project.main.mj_write.Comment;
import com.project.main.mj_write.DiaryPost;
import com.project.main.mj_write.DiaryPostDAO;
import com.project.main.mj_write.Like;
import com.project.main.sm.Category;
import com.project.main.sm.Diary;
import com.project.main.sm.DiaryDAO;

@Controller
public class JPSej_SearchController {

	@Autowired
	private UserDAO uDAO;
	
	@Autowired
	private HomePostDAO pDAO;
	
	@Autowired
	private DiaryDAO dDAO;
	
	@Autowired
	private DiaryPostDAO dpDAO;
	
	@RequestMapping(value = "/JPhome.search", method = RequestMethod.GET)
	public String homeSearch(HomePostSelector pSel,HttpServletRequest req) {
		TokenMaker.make(req);
		uDAO.loginCheckJP(req);
		pDAO.searchPostJP(1, pSel, req);
		/*pDAO.textLengthSet(req);*/
		/*pDAO.getPost(1, req);*/
		/*req.setAttribute("contentPage", "sej_search/home_search.jsp");*/
		return "JPindex";
	}
	
	@RequestMapping(value = "JPsearch.page.change", method = RequestMethod.GET)
	public String searchPageChange(HomePostSelector pSel, HttpServletRequest req) {
		TokenMaker.make(req);
		int p = Integer.parseInt(req.getParameter("p"));
		uDAO.loginCheckJP(req);
		pDAO.searchPostJP(p, pSel, req);
		return "JPindex";
	}
	
}
