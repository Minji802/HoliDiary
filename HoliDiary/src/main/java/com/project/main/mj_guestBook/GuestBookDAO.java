package com.project.main.mj_guestBook;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.main.js.User;
import com.project.main.mj_write.CommentMapper;

@Service
public class GuestBookDAO {

	@Autowired
	private SqlSession ss;
	
	public List<GuestBook> getGuestBookInfo(HttpServletRequest req, GuestBook gb) {
		
		System.out.println(gb.getGuestBookOwner());
		System.out.println(req.getParameter("guestBookOwner"));
		List<GuestBook> guestBook = ss.getMapper(GuestBookMapper.class).showAllGuestBook(gb);
		
		return guestBook;
	}

	
	public int getGuestBookReg(HttpServletRequest req, GuestBook gb, User u) {

		if (ss.getMapper(GuestBookMapper.class).regGuestBook(gb) == 1) {
			System.out.println("나 왔다감");
			return 1;
		} else {
			return 0;
		}
	}


	public int getGuestBookDelete(HttpServletRequest req, GuestBook gb, User u) {

		System.out.println(gb.getGuestBookNum());

		int guestBookNum = gb.getGuestBookNum();

		gb.setGuestBookNum(guestBookNum);

		if (ss.getMapper(GuestBookMapper.class).guestBookDelete(gb) == 1) {
			System.out.println("방명록 삭제 성공");
			return 1;
		} else {
			return 0;
		}
	}

	
	

}
