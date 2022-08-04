package com.project.main.mj;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MapDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void getMapInfo(HttpServletRequest req) {

		MapMapper mapm = ss.getMapper(MapMapper.class);
		List<MapMemo> memos = mapm.showAllMemo();
		req.setAttribute("memos", memos);
	}

	public void infoSave(MapMemo mm, HttpServletRequest req) {
		try {
			MapMapper mapm = ss.getMapper(MapMapper.class);
			if(mapm.regInfo(mm) == 1) {
				req.setAttribute("r", "등록성공");
			} else {
				req.setAttribute("r", "등록실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "저장 실패");
		}
		
	}

	

}
