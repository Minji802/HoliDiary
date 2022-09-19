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
public class JPUserController {
	
	@Autowired
	private UserDAO uDAO;
	
	// 로그인 페이지 들어가기
	@RequestMapping(value = "/jp.login.go", method = RequestMethod.GET)
	public String loginGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "jp_kjs_user/login.jsp");
		req.setAttribute("loginPage", "jp_kjs_user/before_login.jsp");
		
		return "JPindex";
	}
	
	// 로그인 하기
	@RequestMapping(value = "/jp.login.do", method = RequestMethod.POST)
	public String loginDo(User u ,HttpServletRequest req) {
		
		if(uDAO.login(u,req)) {
			req.setAttribute("contentPage", "JPhome.jsp");
		} else {
			req.setAttribute("contentPage", "jp_kjs_user/login.jsp");
		}
		
		uDAO.loginCheckJP(req);
		
		return "JPindex";
	}
	
	// 회원가입 옵션 선택
	@RequestMapping(value = "/jp.join.option", method = RequestMethod.GET)
	public String joinOption(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "jp_kjs_user/join_option.jsp");
		req.setAttribute("loginPage", "jp_kjs_user/before_login.jsp");
		return "JPindex";
	}
	
	// 회원가입 페이지 들어가기
	@RequestMapping(value = "/jp.join.go", method = RequestMethod.GET)
	public String joinGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "jp_kjs_user/join.jsp");
		req.setAttribute("loginPage", "jp_kjs_user/before_login.jsp");
		return "JPindex";
	}
	
	// 회원가입하기
	@RequestMapping(value = "/jp.join.do", method = RequestMethod.POST)
	public String joinDo(User u ,HttpServletRequest req) {
		
		uDAO.join(u, req);
		
		req.setAttribute("contentPage", "jp_kjs_user/join_last.jsp");
		uDAO.loginCheckJP(req);
		return "JPindex";
	}
	
	// 마지막 사진 저장
	@RequestMapping(value = "/jp.join.file.upload", method = RequestMethod.POST)
	public String joinFileUpload(HttpServletRequest req, @RequestParam("userID") String userID, @RequestParam("userImg") MultipartFile mf) {
		
		uDAO.fileUpdate(req, userID, mf);
		
		uDAO.loginCheckJP(req);
		req.setAttribute("contentPage", "JPhome.jsp");
		return "JPindex";
	}
	
	// ID체크하기(ajax)
	@RequestMapping(value = "/jp.id.check", method = RequestMethod.GET)
	public @ResponseBody int idCheck(User u, HttpServletRequest req) {
		
		return uDAO.idCheck(u, req);
	}
	
	// 닉네임 체크하기(ajax)
	@RequestMapping(value = "/jp.nick.check", method = RequestMethod.GET, produces = "application/text;charset=utf8")
	public @ResponseBody String nickCheck(User u) {
		return uDAO.nickCheck(u);
	}
	
	// PW체크하기(ajax)
	@RequestMapping(value = "/jp.pw.check", method = RequestMethod.POST)
	public @ResponseBody int pwCheck(User u) {
		
		return uDAO.pwCheck(u);
	}
	
	// 로그아웃하기
	@RequestMapping(value = "/jp.logout.do", method = RequestMethod.GET)
	public String logoutDo(User u ,HttpServletRequest req) {
		
		uDAO.logout(req);
		uDAO.loginCheckJP(req);
		
		req.setAttribute("contentPage", "JPhome.jsp");
		return "JPindex";
	}
	
	// 카카오톡으로 회원가입 및 로그인하기
	@RequestMapping(value = "/jp.social.kakao", method = RequestMethod.GET)
	public String socialKakao(HttpServletRequest req) {
		uDAO.loginWithKakaoJP(req);
		uDAO.loginCheckJP(req);
		req.setAttribute("contentPage", "JPhome.jsp");
		
		
		return "JPindex";
	}
	
	// 카카오 연동하기
	@RequestMapping(value = "/jp.connect.kakao", method = RequestMethod.GET)
	public String connectKakao(HttpServletRequest req) {
		
		uDAO.connectKakaoJP(req);
		uDAO.loginCheckJP(req);
		req.setAttribute("contentPage", "jp_kjs_mypage/mypage_myinfo.jsp");
		
		return "JPindex";
	}
	
	// 네이버 콜백 주소(회원가입)
	@RequestMapping(value = "/jp.callback.join.naver", method = RequestMethod.GET)
	public String callbackJoinNaver(HttpServletRequest req) {

		return "jp_kjs_user/naver_callback_join";
	}
	
	// 네이버 콜백 주소(로그인)
	@RequestMapping(value = "/jp.callback.login.naver", method = RequestMethod.GET)
	public String callbackLoginNaver(HttpServletRequest req) {

		return "jp_kjs_user/naver_callback_login";
	}
	
	// 네이버 콜백 주소(연동)
	@RequestMapping(value = "/jp.callback.connect.naver", method = RequestMethod.GET)
	public String callbackConnectNaver(HttpServletRequest req) {

		return "jp_kjs_mypage/naver_callback_connect";
	}
	
	// 네이버 연동콜백
	@RequestMapping(value = "/jp.social.connect.naver", method = RequestMethod.GET)
	public String socialConnectNaver(User u, HttpServletRequest req) {
		
		uDAO.connectNaver(req);
		uDAO.loginCheckJP(req);
		req.setAttribute("contentPage", "jp_kjs_mypage/mypage_myinfo.jsp");
		
		return "JPindex";
	}
	
	// 네이버 로그인(세션저장)
	@RequestMapping(value = "/jp.social.login.naver", method = RequestMethod.GET)
	public String socialLoginNaver(User u, HttpServletRequest req) {
		
		//System.out.println(req.getParameter("naverID"));
		
		if(req.getParameter("naverID") != null) {
			uDAO.loginWithNaver(u,req);
		}
		
		if(uDAO.loginCheckJP(req)) {
			req.setAttribute("contentPage", "JPhome.jsp");
		}else {
			req.setAttribute("contentPage", "jp_kjs_user/login.jsp");
		}
		
		return "JPindex";
	}
	
	// 네이버 (회원가입: DB저장)
	@RequestMapping(value = "/jp.join.naver", method = RequestMethod.POST)
	public @ResponseBody int joinNaver(User u, HttpServletRequest req) {
		
		return uDAO.joinWithNaver(u, req);
	}
	
	// 아이디찾기 페이지 이동
	@RequestMapping(value = "/jp.find.id.go", method = RequestMethod.GET)
	public String idSearchGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "jp_kjs_user/find_id.jsp");
		req.setAttribute("loginPage", "jp_kjs_user/before_login.jsp");
		
		return "JPindex";
	}
	
	// 아이디찾기
	@RequestMapping(value = "/jp.find.id.do", method = RequestMethod.POST)
	public String idSearchDo(User u, HttpServletRequest req) {
		
		uDAO.findID(u, req);
		
		req.setAttribute("contentPage", "jp_kjs_user/find_id.jsp");
		req.setAttribute("loginPage", "jp_kjs_user/before_login.jsp");
		
		return "JPindex";
	}
	
	// 비번찾기 페이지 이동
	@RequestMapping(value = "/jp.find.pw.go", method = RequestMethod.GET)
	public String pwSearchGo(HttpServletRequest req) {
		
		req.setAttribute("contentPage", "jp_kjs_user/find_pw.jsp");
		req.setAttribute("loginPage", "jp_kjs_user/before_login.jsp");
		
		return "JPindex";
	}
	
	// 비번찾기 이메일 전송
	@RequestMapping(value = "/jp.find.pw.do", method = RequestMethod.POST)
	public String pwSearchDo(User u, HttpServletRequest req) {
		
		uDAO.findPWJP(u, req);
		
		req.setAttribute("contentPage", "jp_kjs_user/find_pw_result.jsp");
		req.setAttribute("loginPage", "jp_kjs_user/before_login.jsp");
		
		return "JPindex";
	}
	
	// 탈퇴하기
	@RequestMapping(value = "/jp.delete.do", method = RequestMethod.GET)
	public String deleteUser(HttpServletRequest req) {
		
		uDAO.delete(req);
		
		req.setAttribute("contentPage", "JPhome.jsp");
		req.setAttribute("loginPage", "jp_kjs_user/before_login.jsp");
		return "JPindex";
	}
	
	// 소셜 로그인 연동해제
	@RequestMapping(value = "/jp.disconnect.sns", method = RequestMethod.GET)
	public String disconnectSNS(HttpServletRequest req) {
	
		uDAO.disconnectSNS(req);
		uDAO.loginCheckJP(req);
		req.setAttribute("contentPage", "jp_kjs_mypage/mypage_myinfo.jsp");
		return "JPindex";
	}
	
	// 수정하기
	@RequestMapping(value = "/jp.update.do", method = RequestMethod.POST)
	public String updateUser(HttpServletRequest req, @RequestParam("userID") String userID, @RequestParam("userName") String userName, @RequestParam("userNickname") String userNickname, @RequestParam("userPhoneNumber") String userPhoneNumber, @RequestParam("userEmail") String userEmail,@RequestParam("userPW") String userPW, @RequestParam("userImg") MultipartFile mf) {
		
		User u = new User();
		
		u.setUserID(userID);
		u.setUserPW(userPW);
		
		// 비번 맞음
		if(uDAO.pwCheck(u) == 1) {
			uDAO.update(userID, userName, userEmail, userNickname,userPhoneNumber, mf, req);
			uDAO.login(u, req);
			req.setAttribute("result", "会員情報が修正されました。");
		}else {
			req.setAttribute("error", "パスワードを確認してください。");
		}
		
		uDAO.loginCheckJP(req);
		req.setAttribute("contentPage", "jp_kjs_mypage/mypage_myinfo.jsp");
		return "JPindex";
	}
	
	// 비밀번호 수정
	
	@RequestMapping(value = "/jp.update.pw", method = RequestMethod.POST)
	public String updatePW(User u, HttpServletRequest req) {
		
		// 비번 수정
		uDAO.updatePWJP(u, req);
		
		uDAO.loginCheckJP(req);
		req.setAttribute("contentPage", "jp_kjs_mypage/mypage_changePW.jsp");
		return "JPindex";
	}

}
