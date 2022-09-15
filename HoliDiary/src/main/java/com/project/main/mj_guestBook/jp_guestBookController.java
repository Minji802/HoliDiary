package com.project.main.mj_guestBook;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.main.js.Subscribe;
import com.project.main.js.User;
import com.project.main.js.UserDAO;
import com.project.main.mj_write.Comment;
import com.project.main.mj_write.DiaryPost;
import com.project.main.sm.Category;
import com.project.main.sm.Diary;
import com.project.main.sm.DiaryDAO;

@Controller
public class jp_guestBookController {

	@Autowired
	private UserDAO uDAO;

	@Autowired
	private DiaryDAO dDAO;

	@Autowired
	private GuestBookDAO gDAO;

	@RequestMapping(value = "/jp_guestBookGo", method = RequestMethod.GET)
	public String goGuestBook(HttpServletRequest req, Diary d, @RequestParam("userId") String userId, User u,
			Category cate, GuestBook gb, Subscribe s, Comment c, DiaryPost p) {

		if (uDAO.loginCheck(req)) {
			dDAO.getDiaryInfo(req, d, userId, u, cate, s, c, p);

		} else {
			req.setAttribute("popupContentPage", "jp_popupBack.jsp");
			return "jp_ksm_main/jp_popupBack";
		}

		req.setAttribute("popupContentPage", "../jp_mj_guestBook/jp_guestBook.jsp");
		return "jp_ksm_main/jp_popup";
	}

	// 방명록 리스트
	@ResponseBody
	@RequestMapping(value = "/jp_guestBookList.do", method = RequestMethod.GET)
	public List<GuestBook> listGuestBook(HttpServletRequest req, GuestBook gb) {

		return gDAO.getGuestBookInfo(req, gb);
	}

	// 방명록 등록
	@ResponseBody
	@RequestMapping(value = "/jp_guestBoodReg.do", method = RequestMethod.GET)
	public int regGuestBook(HttpServletRequest req, GuestBook gb, User u) {

		return gDAO.getGuestBookReg(req, gb, u);
	}

	// 방명록 삭제
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/jp_guestBookDelete.do", method = RequestMethod.GET, produces = "application/json")
	public int guestBookDeleteDo(HttpServletRequest req, GuestBook gb, User u) {

		return gDAO.getGuestBookDelete(req, gb, u);
	}

}
