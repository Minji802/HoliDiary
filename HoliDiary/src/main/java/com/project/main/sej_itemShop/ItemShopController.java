package com.project.main.sej_itemShop;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.main.js.UserDAO;

@Controller
public class ItemShopController {

	@Autowired
	private UserDAO uDAO;
	
	@RequestMapping(value = "/itemShop.go", method = RequestMethod.GET)
	public String itemShopGo(HttpServletRequest req) {
		uDAO.loginCheck(req);
		req.setAttribute("contentPage", "sej_itemShop/itemShop.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/itemShop_sticker.go", method = RequestMethod.GET)
	public String itemShopStickerGo(HttpServletRequest req) {
		uDAO.loginCheck(req);
		req.setAttribute("contentPage", "sej_itemShop/itemShop_sticker.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/itemShop_other.go", method = RequestMethod.GET)
	public String itemShopOtherGo(HttpServletRequest req) {
		uDAO.loginCheck(req);
		req.setAttribute("contentPage", "sej_itemShop/itemShop_sticker.jsp");
		return "index";
	}
	
}
