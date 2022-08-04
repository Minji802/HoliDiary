package com.project.main.sm;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PopupController {
	
	@RequestMapping(value = "/popup.open", method = RequestMethod.GET)
	public String popupOpen(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "popupHome.jsp");
		return "ksm_main/popup";
	}
	
	//팝업창 - 홈
	@RequestMapping(value = "/popupHomeGo", method = RequestMethod.GET)
	public String popupHome(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "popupHome.jsp");
		return "ksm_main/popup";
	}
	
	//팝업창 - 스케줄
	@RequestMapping(value = "/popupScheduleGo", method = RequestMethod.GET)
	public String popupScedule(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "popupSchedule.jsp");
		return "ksm_main/popup";
	}

}
