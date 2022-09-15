package com.project.main.sej_itemShop;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.main.js.UserDAO;

@Controller
public class JPItemShopController {

	@Autowired
	private UserDAO uDAO;
	
	@RequestMapping(value = "/JPitemShop.go", method = RequestMethod.GET)
	public String JPitemShopGo(HttpServletRequest req) {
		uDAO.loginCheckJP(req);
		req.setAttribute("contentPage", "jp_sej_itemShop/JPitemShop.jsp");
		return "JPindex";
	}
	
	@RequestMapping(value = "/JPitemShop_sticker.go", method = RequestMethod.GET)
	public String JPitemShopStickerGo(HttpServletRequest req) {
		uDAO.loginCheckJP(req);
		req.setAttribute("contentPage", "jp_sej_itemShop/JPitemShop_sticker.jsp");
		return "JPindex";
	}
	
	@RequestMapping(value = "/JPitemShop_other.go", method = RequestMethod.GET)
	public String JPitemShopOtherGo(HttpServletRequest req) {
		uDAO.loginCheckJP(req);
		req.setAttribute("contentPage", "jp_sej_itemShop/JPitemShop_sticker.jsp");
		return "JPindex";
	}
	
}
