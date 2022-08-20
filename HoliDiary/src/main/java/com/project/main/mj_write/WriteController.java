package com.project.main.mj_write;

import java.io.File;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.project.main.js.User;
import com.project.main.js.UserDAO;
import com.project.main.sej.TokenMaker;
import com.project.main.sm.Category;
import com.project.main.sm.Diary;
import com.project.main.sm.DiaryDAO;

@Controller
public class WriteController {

	@Autowired
	private UserDAO uDAO;

	@Autowired
	private DiaryPostDAO pDAO;

	@Autowired
	private DiaryDAO dDAO;
	
	// 게시글 목록 불러오기
	@RequestMapping(value = "/post-list", method = RequestMethod.GET)
	public String listGo(HttpServletRequest req, DiaryPost p, Diary d, @RequestParam("userId") String userId, User u, Category cate) {
		if (uDAO.loginCheck(req)) {
			dDAO.getDiaryInfo(req, d, userId, u, cate);
			pDAO.getAllList(req, userId);
		}

		req.setAttribute("popupContentPage", "../mj_write/post_list.jsp");
		return "ksm_main/popup";
	}

	// 게시글 상세보기
	@RequestMapping(value = "/post.detail.go", method = RequestMethod.GET)
	public String postDetailGo(DiaryPost p, Diary d, @RequestParam("userId") String userId, HttpServletRequest req, User u, Category cate, Comment c, Like l) {

		if (uDAO.loginCheck(req)) {
			dDAO.getDiaryInfo(req, d, userId, u, cate);
			pDAO.detailPost(p, req, c, l);
		}
		req.setAttribute("popupContentPage", "../mj_write/post_detail.jsp");

		return "ksm_main/popup";
	}

	// 글쓰기 페이지 바로가기
	@RequestMapping(value = "/write.go", method = RequestMethod.GET)
	public String writeGo(HttpServletRequest req, Diary d, @RequestParam("userId") String userId, User u, Category cate) {

		if (uDAO.loginCheck(req)) {
			dDAO.getDiaryInfo(req, d, userId, u, cate);
			System.out.println(userId);
		}
		req.setAttribute("popupContentPage", "../mj_write/post_write2.jsp");
		return "ksm_main/popup";
	}

	@RequestMapping(value = "/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();

		/*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */

		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot + "resources/images/";

		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		System.out.println("경로1: " + contextRoot);
		System.out.println("경로2: " + fileRoot);

		System.out.println("원래 파일명 : " + originalFileName);
		System.out.println("저장될 파일명 : " + savedFileName);

		File targetFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			jsonObject.addProperty("url", "resources/images/" + savedFileName);
			jsonObject.addProperty("responseCode", "success");

		} catch (Exception e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}

	// 글 등록
	@RequestMapping(value = "/diaryPost.reg.do", method = RequestMethod.POST)
	public String postRegDo(Diary d, @RequestParam("userId") String userId, HttpServletRequest req, @RequestParam("postImg") String postImg,
			@RequestParam("postTitle") String postTitle, @RequestParam("postTxt") String postTxt,
			@RequestParam("postCategory") String postCategory, @RequestParam("postCountry") String postCountry, User u, Category cate) {
		
		if (uDAO.loginCheck(req)) {
			dDAO.getDiaryInfo(req, d, userId, u, cate);
			pDAO.regPost(req, userId, postImg, postTitle, postTxt, postCategory, postCountry);
		}
		TokenMaker.make(req);
		pDAO.getAllList(req, userId);

		req.setAttribute("popupContentPage", "../mj_write/post_list.jsp");
		return "ksm_main/popup";
	}

	// 글 삭제
	@RequestMapping(value = "/diaryPost.delete", method = RequestMethod.GET)
	public String deleteDiaryPost(HttpServletRequest req, DiaryPost p, Diary d,
			@RequestParam("postWriter") String postWriter, @RequestParam("userId") String userId, User u, Category cate) {

		// dDAO.getDiaryInfo(req, d, userId);
		System.out.println(p.getPostNum());
		System.out.println(postWriter);
		if (uDAO.loginCheck(req)) {
			dDAO.getDiaryInfo(req, d, userId, u, cate);
			pDAO.deleteDiaryPost(req, p);
			pDAO.getAllList(req, userId);
		}
		req.setAttribute("popupContentPage", "../mj_write/post_list.jsp");
		return "ksm_main/popup";
	}

	// 글 수정하러 가기
	@RequestMapping(value = "/diaryPost.update.go", method = RequestMethod.GET)
	public String updateDiaryPost(HttpServletRequest req, Diary d, DiaryPost p, @RequestParam("userId") String userId, User u, Category cate, Comment c, Like l) {

		if (uDAO.loginCheck(req)) {
			dDAO.getDiaryInfo(req, d, userId, u, cate);
			pDAO.detailPost(p, req, c, l);
		}
		req.setAttribute("popupContentPage", "../mj_write/post_update.jsp");
		return "ksm_main/popup";
	}
	
	// 글 수정하기
	@RequestMapping(value = "/diaryPost.update.do", method = RequestMethod.POST)
	public String updateDiaryPostDo(Diary d, DiaryPost p, @RequestParam("userId") String userId, HttpServletRequest req, User u, Category cate) {
		
		if (uDAO.loginCheck(req)) {
			dDAO.getDiaryInfo(req, d, userId, u, cate);
			pDAO.diaryPostUpdate(req, p, userId);
		}
		pDAO.getAllList(req, userId);

		req.setAttribute("popupContentPage", "../mj_write/post_list.jsp");
		return "ksm_main/popup";
	}

	// 지도 만들기
	@RequestMapping(value = "/map.open", method = RequestMethod.GET)
	public String mapOpen(HttpServletRequest req) {

		return "mj_map/map";
	}
	
}
