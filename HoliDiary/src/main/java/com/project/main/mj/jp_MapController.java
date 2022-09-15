package com.project.main.mj;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class jp_MapController {

	@Autowired
	private MapDAO mapDAO;
	
	
	@RequestMapping(value = "/jp_map.go", method = RequestMethod.GET)
	public String mapGo(HttpServletRequest req) {
		

		return "jp_mj_map/jp_map";
	}

	@RequestMapping(value = "/jp_save.info", method = RequestMethod.GET)
	public String infoSave(MapMemo mm, HttpServletRequest req) {
		
		mapDAO.infoSave(mm, req);
		mapDAO.getMapInfo(req);
		
		return "jp_mj_map/jp_map";
	}
	
	@RequestMapping(value = "/jp_mapHelp.open", method = RequestMethod.GET)
	public String mapHelp(HttpServletRequest req) {
		
		
		return "jp_mj_map/jp_mapHelp";
	}

}
