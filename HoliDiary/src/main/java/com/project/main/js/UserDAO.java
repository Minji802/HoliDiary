package com.project.main.js;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class UserDAO {

	@Autowired
	private SqlSession ss;

	public void join(User u, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/kjs_profileImg");
		System.out.println(path);
		MultipartRequest mr = null;
		
		try {
			mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
			
			String userID = mr.getParameter("userID");
			String userPW = mr.getParameter("userPW");
			String userName = mr.getParameter("userName");
			String userPhoneNumber = mr.getParameter("userPhoneNumber");
			String userEmail = mr.getParameter("userEmail");
			String userImg = mr.getFilesystemName("userImg");
			String userDiaryUrl = mr.getParameter("userDiaryUrl");
			String userNickname = mr.getParameter("userNickname");
			
			System.out.println(userID);
			System.out.println(userPW);
			System.out.println(userName);
			System.out.println(userPhoneNumber);
			System.out.println(userEmail);
			System.out.println(userImg);
			System.out.println(userDiaryUrl);
			System.out.println(userNickname);
			
			u.setUserDiaryUrl(userDiaryUrl);
			u.setUserEmail(userEmail);
			u.setUserID(userID);
			u.setUserName(userName);
			u.setUserNickname(userNickname);
			u.setUserPhoneNumber(userPhoneNumber);
			u.setUserPW(userPW);
			u.setUserImg(userImg);
			
			if(ss.getMapper(UserMapper.class).join(u) == 1) {
				req.setAttribute("r", "가입성공");
			}else {
				req.setAttribute("r", "가입실패");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			String fileName = mr.getFilesystemName("userImg");
			new File(path + "/" + fileName).delete();
			req.setAttribute("r", "가입실패");
		}
	}

	public void login(User u, HttpServletRequest req) {
		
		User dbUser = ss.getMapper(UserMapper.class).getUserByID(u);
		
		if(dbUser != null) {
			if(u.getUserPW().equals(dbUser.getUserPW())) {
				req.getSession().setAttribute("loginUser", dbUser);
				req.getSession().setMaxInactiveInterval(60*10);
			}else {
				req.setAttribute("r", "로그인 실패(pw오류)");
			}
		} else {
			req.setAttribute("r", "로그인실패(ID없음)");
		}
		
	}
	
	
	
}
