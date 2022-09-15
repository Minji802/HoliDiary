package com.project.main.sm;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.main.js.Subscribe;
import com.project.main.js.User;
import com.project.main.js.UserDAO;
import com.project.main.js.VisitDAO;
import com.project.main.mj_write.Comment;
import com.project.main.mj_write.DiaryPost;

@Controller
public class jp_PopupController {

	@Autowired
	private UserDAO uDAO;

	@Autowired
	private DiaryDAO dDAO;
	
	@Autowired
	private CategoryDAO cDAO;
	
	@Autowired
	private VisitDAO vDAO;

	// 팝업창 - 오픈
	@RequestMapping(value = "/jp_popup.open", method = RequestMethod.GET)
	public String popupOpen(HttpServletRequest req, Diary d, User u, Category cate, Subscribe s,
			@RequestParam("userId") String userId, Comment c, DiaryPost p) {

		if (uDAO.loginCheck(req)) {
			dDAO.getDiaryInfo(req, d, userId, u, cate, s, c, p);
			vDAO.countVisit(userId,req);
			req.setAttribute("popupContentPage", "jp_popupHome.jsp");
			return "jp_ksm_main/jp_popup";
		} else {
			req.setAttribute("popupContentPage", "jp_popupBack.jsp");
			return "jp_ksm_main/jp_popupBack";
		}

	}

	// 팝업창 - 홈
	@RequestMapping(value = "/jp_popupHomeGo", method = RequestMethod.GET)
	public String popupHome(HttpServletRequest req, Diary d, User u, Category cate, Subscribe s, @RequestParam("userId") String userId, Comment c, DiaryPost p) {

		if (uDAO.loginCheck(req)) {
			dDAO.getDiaryInfo(req, d, userId, u, cate, s, c, p); 
			req.setAttribute("popupContentPage", "jp_popupHome.jsp");
			return "jp_ksm_main/jp_popup";			
		} else {
			req.setAttribute("popupContentPage", "jp_popupBack.jsp");
			return "jp_ksm_main/jp_popupBack";
		}
	}

	// 팝업창 - 스케줄
	@RequestMapping(value = "/jp_popupScheduleGo", method = RequestMethod.GET)
	public String popupScedule(HttpServletRequest req, Diary d, User u, Category cate, Subscribe s, 
			@RequestParam("userId") String userId, Comment c, DiaryPost p) {

		if (uDAO.loginCheck(req)) {
			dDAO.getDiaryInfo(req, d, userId, u, cate, s, c, p);
			req.setAttribute("popupContentPage", "jp_popupSchedule.jsp");
			return "jp_ksm_main/jp_popup";			
		} else {
			req.setAttribute("popupContentPage", "jp_popupBack.jsp");
			return "jp_ksm_main/jp_popupBack";
		}
	}

	
	
	// 다이어리 - 설정 관리 들어가기
	@RequestMapping(value = "/jp_updateMyPopup", method = RequestMethod.GET)
	public String updateMyPopup(HttpServletRequest req, Diary d, User u, Category cate, Subscribe s, 
			@RequestParam("userId") String userId, Comment c, DiaryPost p) {

		if (uDAO.loginCheck(req)) {
			dDAO.getDiaryInfo(req, d, userId, u, cate, s, c, p);
			req.setAttribute("popupContentPage", "jp_updateMyPopup.jsp");
			return "jp_ksm_main/jp_popup";
		} else {
			req.setAttribute("popupContentPage", "jp_popupBack.jsp");
			return "jp_ksm_main/jp_popupBack";
		}
	}

	// 다이어리 - 정보 업데이트
	@RequestMapping(value = "/jp_diary.update", method = RequestMethod.GET)
	public String updateMyDiary(HttpServletRequest req, Diary d, User u, Category cate, Subscribe s, 
			@RequestParam("diaryUserId") String userId, Comment c, DiaryPost p) {

		if (uDAO.loginCheck(req)) {
			dDAO.updateDiary(req, d, userId);
			dDAO.getDiaryInfo(req, d, userId, u, cate, s, c, p);
			req.setAttribute("popupContentPage", "jp_popupHome.jsp");
		} else {
			req.setAttribute("popupContentPage", "jp_popupBack.jsp");
			return "jp_ksm_main/jp_popupBack";
		}

		return "jp_ksm_main/jp_popup";
	}

	// 다이어리 - 카테고리 업데이트 들어가기
	@RequestMapping(value = "/jp_updateCategory", method = RequestMethod.GET)
	public String updateCategory(HttpServletRequest req, Diary d, User u, Category cate, Subscribe s,
			@RequestParam("userId") String userId, Comment c, DiaryPost p) {

		if (uDAO.loginCheck(req)) {
			dDAO.getDiaryInfo(req, d, userId, u, cate, s, c, p);
			req.setAttribute("popupContentPage", "jp_updateCategory.jsp");
			return "jp_ksm_main/jp_popup";
		} else {
			req.setAttribute("popupContentPage", "jp_popupBack.jsp");
			return "jp_ksm_main/jp_popupBack";
		}
	}
	
	// 다이어리 - 도움말 들어가기
	@RequestMapping(value = "/jp_advicePage", method = RequestMethod.GET)
	public String advicePage(HttpServletRequest req, Diary d, User u, Category cate, Subscribe s,
			@RequestParam("userId") String userId, Comment c, DiaryPost p) {
		
		if (uDAO.loginCheck(req)) {
			dDAO.getDiaryInfo(req, d, userId, u, cate, s, c, p);
			req.setAttribute("popupContentPage", "jp_advicePage.jsp");
			return "jp_ksm_main/jp_popup";
		} else {
			req.setAttribute("popupContentPage", "jp_popupBack.jsp");
			return "jp_ksm_main/jp_popupBack";
		}
	}
	
	// 다이어리 - 카테고리 업데이트 (추가)
	@RequestMapping(value = "/jp_category.add", method = RequestMethod.GET)
	public String updateCategoryAdd(HttpServletRequest req, Diary d, User u, Subscribe s, @RequestParam("diaryUserId") String userId, Category cate, Comment c, DiaryPost p) {
		
		if (uDAO.loginCheck(req)) {
			cDAO.updateCategoryAdd(req, d, userId, cate);
			dDAO.getDiaryInfo(req, d, userId, u, cate, s, c, p);
			//req.setAttribute("popupContentPage", "popupHome.jsp");
		} else {
			req.setAttribute("popupContentPage", "jp_popupBack.jsp");
			return "jp_ksm_main/jp_popupBack";
		}
		
		d.setDiaryUserId(userId);
		return "redirect:jp_updateCategory?userId=" + userId;
		//return "ksm_main/popup";
	}
	
	// 다이어리 - 카테고리 업데이트 (수정 및 삭제)
	@RequestMapping(value = "/jp_category.update", method = RequestMethod.GET)
	public String updateCategoryUp(HttpServletRequest req, Diary d, User u, Subscribe s, @RequestParam("diaryUserId") String userId, 
			Category cate, @RequestParam("newCategory") String newCategory, Comment c, DiaryPost p) {
		
		if (uDAO.loginCheck(req)) {
			cDAO.updateCategoryup(req, d, userId, cate, newCategory);
			dDAO.getDiaryInfo(req, d, userId, u, cate, s, c, p);
			//req.setAttribute("popupContentPage", "popupHome.jsp");
		} else {
			req.setAttribute("popupContentPage", "jp_popupBack.jsp");
			return "jp_ksm_main/jp_popupBack";
		}
		
		d.setDiaryUserId(userId);
		return "redirect:jp_updateCategory?userId=" + userId;
		//return "ksm_main/popup";
	}
	
	// 다이어리 - 스케줄러 추가
	@ResponseBody
	@RequestMapping(value = "/jp_schedule.insert", method = RequestMethod.GET)
	public int insertSchedule(HttpServletRequest req, Schedule s) {
		
		if (uDAO.loginCheck(req)) {
			return dDAO.insertSchedule(req, s);			
		} else {
			req.setAttribute("popupContentPage", "jp_popupBack.jsp");
			return 0;
		}
			
	}
	
	// 다이어리 - 스케줄러 내용 삭제
	@ResponseBody
	@RequestMapping(value = "/jp_schedule.delete", method = RequestMethod.GET)
	public int deleteSchedule(HttpServletRequest req, Schedule s) {
		
		if (uDAO.loginCheck(req)) {
			return dDAO.deleteSchedule(req, s);			
		} else {
			req.setAttribute("popupContentPage", "jp_popupBack.jsp");
			return 0;
		}
	}
	
	// 스케줄러 정보 얻기
	@ResponseBody
	@RequestMapping(value = "/jp_schedule.get", method = RequestMethod.GET, produces="application/json")
	public Schedule getSchedule(HttpServletRequest req, Schedule s) {
 
		return dDAO.getSchedule(s);
	}
	
	// 다이어리 - 메인 이미지 수정 들어가기
	@RequestMapping(value = "/jp_mainImg.updateGo", method = RequestMethod.GET)
	public String updateMainImgGo(HttpServletRequest req, Diary d, User u, Category cate, Subscribe s, @RequestParam("userId") String userId, Comment c, DiaryPost p) {
		
		if (uDAO.loginCheck(req)) {
			dDAO.getDiaryInfo(req, d, userId, u, cate, s, c, p);
			req.setAttribute("popupContentPage", "jp_updateMainImg.jsp");
			return "jp_ksm_main/jp_popup";			
		} else {
			req.setAttribute("popupContentPage", "jp_popupBack.jsp");
			return "jp_ksm_main/jp_popupBack";
		}
	}
	
	// 다이어리 - 메인 이미지 (수정)
	@RequestMapping(value = "/jp_mainImg.upload", method = RequestMethod.POST)
	public String updateMainImg(HttpServletRequest req, Diary d, User u, Category cate, Subscribe s,
			@RequestParam("userId") String userId, @RequestParam("mainImg") MultipartFile file, Comment c, DiaryPost p) {
		
		if (uDAO.loginCheck(req)) {
			dDAO.updateMainImg(req, d, userId, file);
			dDAO.getDiaryInfo(req, d, userId, u, cate, s, c, p);
			req.setAttribute("popupContentPage", "jp_popupHome.jsp");
		} else {
			req.setAttribute("popupContentPage", "jp_popupBack.jsp");
			return "jp_ksm_main/jp_popupBack";
		}
		
		return "jp_ksm_main/jp_popup";
	}
	
	// 스케줄러 전체 정보 얻기
	@ResponseBody
	@RequestMapping(value = "/jp_schedule.getAllEvents", produces="application/json")
	public String[] getAllEvents(HttpServletRequest req) {
		
		uDAO.loginCheck(req);
		return dDAO.getAllEvent(req);
	}

	
	//뮤직 오픈
	@RequestMapping(value = "/jp_musicPlayer.open", method = RequestMethod.GET)
	public String musicPlayerOpen(HttpServletRequest req) {
		
		uDAO.loginCheck(req);
		return "jp_ksm_main/jp_musicPlayer";
		
	}
}
