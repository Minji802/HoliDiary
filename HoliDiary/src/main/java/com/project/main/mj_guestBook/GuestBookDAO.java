package com.project.main.mj_guestBook;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.main.js.User;

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

	
	

}
