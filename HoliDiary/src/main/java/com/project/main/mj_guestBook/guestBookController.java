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
public class guestBookController {

	@Autowired
	private UserDAO uDAO;

	@Autowired
	private DiaryDAO dDAO;

	@Autowired
	private GuestBookDAO gDAO;

	@RequestMapping(value = "/guestBookGo", method = RequestMethod.GET)
	public String goGuestBook(HttpServletRequest req, Diary d, @RequestParam("userId") String userId, User u,
			Category cate, GuestBook gb, Subscribe s, Comment c, DiaryPost p) {

		if (uDAO.loginCheck(req)) {
			dDAO.getDiaryInfo(req, d, userId, u, cate, s, c, p);

		}

		req.setAttribute("popupContentPage", "../mj_guestBook/guestBook.jsp");
		return "ksm_main/popup";
	}

	// 방명록 리스트
	@ResponseBody
	@RequestMapping(value = "/guestBookList.do", method = RequestMethod.GET)
	public List<GuestBook> listGuestBook(HttpServletRequest req, GuestBook gb) {

		return gDAO.getGuestBookInfo(req, gb);
	}

	// 방명록 등록
	@ResponseBody
	@RequestMapping(value = "/guestBoodReg.do", method = RequestMethod.GET)
	public int regGuestBook(HttpServletRequest req, GuestBook gb, User u) {

		return gDAO.getGuestBookReg(req, gb, u);
	}

	// 방명록 삭제
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/guestBookDelete.do", method = RequestMethod.GET, produces = "application/json")
	public int guestBookDeleteDo(HttpServletRequest req, GuestBook gb, User u) {

		return gDAO.getGuestBookDelete(req, gb, u);
	}

}
