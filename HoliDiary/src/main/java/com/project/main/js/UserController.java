package com.project.main.js;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO uDAO;
	
	// 로그인 페이지 들어가기
	@RequestMapping(value = "/login.go", method = RequestMethod.GET)
	public String loginGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "kjs_user/login.jsp");
		req.setAttribute("loginPage", "kjs_user/before_login.jsp");
		
		return "index";
	}
	
	// 로그인 하기
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginDo(User u ,HttpServletRequest req) {
		
		if(uDAO.login(u,req)) {
			req.setAttribute("contentPage", "home.jsp");
		} else {
			req.setAttribute("contentPage", "kjs_user/login.jsp");
		}
		
		uDAO.loginCheck(req);
		
		return "index";
	}
	
	// 회원가입 옵션 선택
	@RequestMapping(value = "/join.option", method = RequestMethod.GET)
	public String joinOption(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "kjs_user/join_option.jsp");
		req.setAttribute("loginPage", "kjs_user/before_login.jsp");
		return "index";
	}
	
	// 회원가입 페이지 들어가기
	@RequestMapping(value = "/join.go", method = RequestMethod.GET)
	public String joinGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "kjs_user/join.jsp");
		req.setAttribute("loginPage", "kjs_user/before_login.jsp");
		return "index";
	}
	
	// 회원가입하기
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String joinDo(User u ,HttpServletRequest req) {
		
		uDAO.join(u, req);
		
		req.setAttribute("contentPage", "kjs_user/join_last.jsp");
		req.setAttribute("loginPage", "kjs_user/before_login.jsp");
		return "index";
	}
	
	// 마지막 사진 저장
	@RequestMapping(value = "/join.file.upload", method = RequestMethod.POST)
	public String joinFileUpload(HttpServletRequest req, @RequestParam("userID") String userID, @RequestParam("userImg") MultipartFile mf) {
		
		uDAO.fileUpdate(req, userID, mf);
		
		uDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}
	
	// ID체크하기(ajax)
	@RequestMapping(value = "/id.check", method = RequestMethod.GET)
	public @ResponseBody int idCheck(User u, HttpServletRequest req) {
		
		return uDAO.idCheck(u, req);
	}
	
	// 닉네임 체크하기(ajax)
	@RequestMapping(value = "/nick.check", method = RequestMethod.GET, produces = "application/text;charset=utf8")
	public @ResponseBody String nickCheck(User u) {
		return uDAO.nickCheck(u);
	}
	
	// PW체크하기(ajax)
	@RequestMapping(value = "/pw.check", method = RequestMethod.POST)
	public @ResponseBody int pwCheck(User u) {
		
		return uDAO.pwCheck(u);
	}
	
	// 로그아웃하기
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logoutDo(User u ,HttpServletRequest req) {
		
		uDAO.logout(req);
		uDAO.loginCheck(req);
		
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}
	
	// 카카오톡으로 회원가입 및 로그인하기
	@RequestMapping(value = "/social.kakao", method = RequestMethod.GET)
	public String socialKakao(HttpServletRequest req) {
		uDAO.loginWithKakao(req);
		uDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		
		
		return "index";
	}
	
	// 카카오 연동하기
	@RequestMapping(value = "/connect.kakao", method = RequestMethod.GET)
	public String connectKakao(HttpServletRequest req) {
		
		uDAO.connectKakao(req);
		uDAO.loginCheck(req);
		req.setAttribute("contentPage", "kjs_mypage/mypage_myinfo.jsp");
		
		return "index";
	}
	
	// 네이버 콜백 주소(회원가입)
	@RequestMapping(value = "/callback.join.naver", method = RequestMethod.GET)
	public String callbackJoinNaver(HttpServletRequest req) {

		return "kjs_user/naver_callback_join";
	}
	
	// 네이버 콜백 주소(로그인)
	@RequestMapping(value = "/callback.login.naver", method = RequestMethod.GET)
	public String callbackLoginNaver(HttpServletRequest req) {

		return "kjs_user/naver_callback_login";
	}
	
	// 네이버 콜백 주소(연동)
	@RequestMapping(value = "/callback.connect.naver", method = RequestMethod.GET)
	public String callbackConnectNaver(HttpServletRequest req) {

		return "kjs_mypage/naver_callback_connect";
	}
	
	// 네이버 연동콜백
	@RequestMapping(value = "/social.connect.naver", method = RequestMethod.GET)
	public String socialConnectNaver(User u, HttpServletRequest req) {
		
		uDAO.connectNaver(req);
		uDAO.loginCheck(req);
		req.setAttribute("contentPage", "kjs_mypage/mypage_myinfo.jsp");
		
		return "index";
	}
	
	// 네이버 로그인(세션저장)
	@RequestMapping(value = "/social.login.naver", method = RequestMethod.GET)
	public String socialLoginNaver(User u, HttpServletRequest req) {
		
		//System.out.println(req.getParameter("naverID"));
		
		if(req.getParameter("naverID") != null) {
			uDAO.loginWithNaver(u,req);
		}
		
		if(uDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "home.jsp");
		}else {
			req.setAttribute("contentPage", "kjs_user/login.jsp");
		}
		
		return "index";
	}
	
	// 네이버 (회원가입: DB저장)
	@RequestMapping(value = "/join.naver", method = RequestMethod.POST)
	public @ResponseBody int joinNaver(User u, HttpServletRequest req) {
		
		return uDAO.joinWithNaver(u, req);
	}
	
	// 아이디찾기 페이지 이동
	@RequestMapping(value = "/find.id.go", method = RequestMethod.GET)
	public String idSearchGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "kjs_user/find_id.jsp");
		req.setAttribute("loginPage", "kjs_user/before_login.jsp");
		
		return "index";
	}
	
	// 아이디찾기
	@RequestMapping(value = "/find.id.do", method = RequestMethod.POST)
	public String idSearchDo(User u, HttpServletRequest req) {
		
		uDAO.findID(u, req);
		
		req.setAttribute("contentPage", "kjs_user/find_id.jsp");
		req.setAttribute("loginPage", "kjs_user/before_login.jsp");
		
		return "index";
	}
	
	// 비번찾기 페이지 이동
	@RequestMapping(value = "/find.pw.go", method = RequestMethod.GET)
	public String pwSearchGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "kjs_user/find_pw.jsp");
		req.setAttribute("loginPage", "kjs_user/before_login.jsp");
		
		return "index";
	}
	
	// 비번찾기 이메일 전송
	@RequestMapping(value = "/find.pw.do", method = RequestMethod.POST)
	public String pwSearchDo(User u, HttpServletRequest req) {
		
		uDAO.findPW(u, req);
		
		req.setAttribute("contentPage", "kjs_user/find_pw_result.jsp");
		req.setAttribute("loginPage", "kjs_user/before_login.jsp");
		
		return "index";
	}
	
	// 탈퇴하기
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String deleteUser(HttpServletRequest req) {
		
		uDAO.delete(req);
		
		req.setAttribute("contentPage", "home.jsp");
		req.setAttribute("loginPage", "kjs_user/before_login.jsp");
		return "index";
	}
	
	// 소셜 로그인 연동해제
	@RequestMapping(value = "/disconnect.sns", method = RequestMethod.GET)
	public String disconnectSNS(HttpServletRequest req) {
	
		uDAO.disconnectSNS(req);
		uDAO.loginCheck(req);
		req.setAttribute("contentPage", "kjs_mypage/mypage_myinfo.jsp");
		return "index";
	}
	
	// 수정하기
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String updateUser(HttpServletRequest req, @RequestParam("userID") String userID, @RequestParam("userName") String userName, @RequestParam("userNickname") String userNickname, @RequestParam("userPhoneNumber") String userPhoneNumber, @RequestParam("userEmail") String userEmail,@RequestParam("userPW") String userPW, @RequestParam("userImg") MultipartFile mf) {
		
		User u = new User();
		
		u.setUserID(userID);
		u.setUserPW(userPW);
		
		// 비번 맞음
		if(uDAO.pwCheck(u) == 1) {
			uDAO.update(userID, userName, userEmail, userNickname,userPhoneNumber, mf, req);
			uDAO.login(u, req);
			req.setAttribute("result", "회원정보가 수정되었습니다.");
		}else {
			req.setAttribute("error", "비밀번호를 확인해주세요.");
		}
		
		uDAO.loginCheck(req);
		req.setAttribute("contentPage", "kjs_mypage/mypage_myinfo.jsp");
		return "index";
	}
	
	// 비밀번호 수정
	
	@RequestMapping(value = "/update.pw", method = RequestMethod.POST)
	public String updatePW(User u, HttpServletRequest req) {
		
		// 비번 수정
		uDAO.updatePW(u, req);
		
		uDAO.loginCheck(req);
		req.setAttribute("contentPage", "kjs_mypage/mypage_changePW.jsp");
		return "index";
	}

}
