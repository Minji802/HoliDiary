package com.project.main.mj;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MapController {

	@Autowired
	private MapDAO mapDAO;
	
	
	@RequestMapping(value = "/map.go", method = RequestMethod.GET)
	public String mapGo(HttpServletRequest req) {
		

		return "mj_map/map";
	}

	@RequestMapping(value = "/save.info", method = RequestMethod.GET)
	public String infoSave(MapMemo mm, HttpServletRequest req) {
		
		mapDAO.infoSave(mm, req);
		mapDAO.getMapInfo(req);
		
		return "mj_map/map";
	}

}
