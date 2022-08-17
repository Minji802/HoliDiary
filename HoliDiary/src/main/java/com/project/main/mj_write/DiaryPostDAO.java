package com.project.main.mj_write;

import java.io.File;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

@Service
public class DiaryPostDAO {

	@Autowired
	private SqlSession ss;

	public void getAllList(HttpServletRequest req, String userId) {

		try {
			DiaryPost p = new DiaryPost();

			p.setPostWriter(userId);
			DiaryPostMapper pm = ss.getMapper(DiaryPostMapper.class);
			List<DiaryPost> posts = pm.showAllPostList(p);
			req.setAttribute("DiaryPost", posts);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void detailPost(DiaryPost p, HttpServletRequest req) {
		DiaryPostMapper pm = ss.getMapper(DiaryPostMapper.class);
		DiaryPost posts = pm.detailPost(p);
		req.setAttribute("DiaryPost", posts);
	}

	public void regPost(HttpServletRequest req, String userId, MultipartFile mf, String postTitle, String postTxt,
			String postCategory, String postCountry) {

		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(req).getRealPath("/");
		String fileRoot = contextRoot + "resources/thumbnail/";

		String originalFileName = mf.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		System.out.println("경로1: " + contextRoot);
		System.out.println("경로2: " + fileRoot);

		System.out.println("원래 파일명 : " + originalFileName);
		System.out.println("저장될 파일명 : " + savedFileName);

		File targetFile = new File(fileRoot + savedFileName);

		try {
			InputStream fileStream = mf.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장

		} catch (Exception e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			e.printStackTrace();
		}

		DiaryPost p = new DiaryPost();

		System.out.println(postTitle);
		System.out.println(postTxt);
		System.out.println(postCategory);
		System.out.println(postCountry);

		try {
			p.setPostWriter(userId);
			p.setPostTitle(postTitle);
			p.setPostTxt(postTxt);
			p.setPostImg(savedFileName);
			savedFileName = URLEncoder.encode(savedFileName, "utf-8");
			p.setPostImg(savedFileName.replace("+", " "));
			p.setPostCategory(postCategory);
			p.setPostCountry(postCountry);

			if (ss.getMapper(DiaryPostMapper.class).regPost(p) == 1) {
				System.out.println("등록성공");
				// req.getSession().setAttribute("successToken", token);
			}

			System.out.println("유저아이디" + userId);
			System.out.println("2" + postTitle);
			System.out.println("3" + postTxt);
			System.out.println("4" + postCategory);
			System.out.println("5" + postCountry);

		} catch (Exception e) {
			e.printStackTrace();
			// new File(contextRoot + "/" + savedFileName).delete();
			targetFile.delete();
			System.out.println("등록실패");
		}
	}

	public JsonObject SummerNoteImageFile(MultipartFile file) {
		JsonObject jsonObject = new JsonObject();
		String fileRoot = "C:\\summernoteImg\\";
		String originalFileName = file.getOriginalFilename();
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));

		String saveFileName = UUID.randomUUID() + extension;

		File targetFile = new File(fileRoot + saveFileName);

		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			jsonObject.addProperty("url", "/summernoteImg/" + saveFileName);
			jsonObject.addProperty("responseCode", "succcess");
		} catch (Exception e) {
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		return jsonObject;
	}

	public void deleteDiaryPost(HttpServletRequest req, DiaryPost p) {

		try {
			if (ss.getMapper(DiaryPostMapper.class).deleteDiaryPost(p) == 1) {
				System.out.println("글 삭제 성공");
			} else {
				System.out.println("글 삭제 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("글 삭제 실패");
		}
	}

	public void diaryPostUpdate(HttpServletRequest req, String userId, MultipartFile mf, String postTitle,
			String postTxt, String postCategory, String postCountry) {
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(req).getRealPath("/");
		String fileRoot = contextRoot + "resources/thumbnail/";
		
		DiaryPost p = new DiaryPost();

		String originalFileName = p.getPostImg(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		System.out.println("경로1: " + contextRoot);
		System.out.println("경로2: " + fileRoot);

		System.out.println("원래 파일명 : " + originalFileName);
		System.out.println("저장될 파일명 : " + savedFileName);

		File targetFile = new File(fileRoot + savedFileName);

		try {
			InputStream fileStream = mf.getInputStream();
			if(fileStream == null) {
				savedFileName = originalFileName;
			} else {
				FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			}

		} catch (Exception e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			e.printStackTrace();
		}

		

		try {
			p.setPostWriter(userId);
			p.setPostTitle(postTitle);
			p.setPostTxt(postTxt);
			p.setPostImg(savedFileName);
			savedFileName = URLEncoder.encode(savedFileName, "utf-8");
			p.setPostImg(savedFileName.replace("+", " "));
			p.setPostCategory(postCategory);
			p.setPostCountry(postCountry);
			
			if (ss.getMapper(DiaryPostMapper.class).updateDiaryPost(p) == 1) {
				System.out.println("글 수정 성공");
			} 
			
			System.out.println("유저아이디" + userId);
			System.out.println("2" + postTitle);
			System.out.println("3" + postTxt);
			System.out.println("4" + postCategory);
			System.out.println("5" + postCountry);

		} catch (Exception e) {
			e.printStackTrace();
			// new File(contextRoot + "/" + savedFileName).delete();
			targetFile.delete();
			System.out.println("등록실패");
		}

	}

}
