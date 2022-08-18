package com.project.main.mj_write;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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

	public void detailPost(DiaryPost p, HttpServletRequest req, Comment c) {
		DiaryPostMapper pm = ss.getMapper(DiaryPostMapper.class);
		DiaryPost posts = pm.detailPost(p);
		req.setAttribute("DiaryPost", posts);
		
		CommentMapper cm = ss.getMapper(CommentMapper.class);
		List<Comment> comment = cm.showAllComments(c);
		req.setAttribute("Comment", comment);
	}

	public void regPost(HttpServletRequest req, String userId, String postImg, String postTitle, String postTxt,
			String postCategory, String postCountry) {


		DiaryPost p = new DiaryPost();

		System.out.println(postTitle);
		System.out.println(postTxt);
		System.out.println(postCategory);
		System.out.println(postCountry);

		try {
			p.setPostWriter(userId);
			p.setPostTitle(postTitle);
			p.setPostTxt(postTxt);
			p.setPostImg(postImg);
			p.setPostCategory(postCategory);
			p.setPostCountry(postCountry);

			if (ss.getMapper(DiaryPostMapper.class).regPost(p) == 1) {
				System.out.println("등록성공");
				// req.getSession().setAttribute("successToken", token);
			}

			System.out.println("유저아이디" + userId);
			System.out.println("2" + postTitle);
			System.out.println("3" + postTxt);
			System.out.println("4" + postImg);
			System.out.println("5" + postCategory);
			System.out.println("6" + postCountry);

		} catch (Exception e) {
			e.printStackTrace();
			// new File(contextRoot + "/" + savedFileName).delete();
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

	public void diaryPostUpdate(HttpServletRequest req, DiaryPost p, String userId) {
		
		int postNum = p.getPostNum();
		String postTitle = p.getPostTitle();
		String postTxt = p.getPostTxt();
		String postImg = p.getPostImg();
		String postCategory = p.getPostCategory();
		String postCountry = p. getPostCountry();
		
		try {
			p.setPostNum(postNum);
			p.setPostWriter(userId);
			p.setPostTitle(postTitle);
			p.setPostTxt(postTxt);
			p.setPostImg(postImg);
			p.setPostCategory(postCategory);
			p.setPostCountry(postCountry);
			
			if (ss.getMapper(DiaryPostMapper.class).updateDiaryPost(p) == 1) {
				System.out.println("글 수정 성공");
			} 
			
			System.out.println(postNum);
			System.out.println("수정유저아이디" + userId);
			System.out.println("수정2" + postTitle);
			System.out.println("수정3" + postTxt);
			System.out.println("수정4" + postImg);
			System.out.println("수정5" + postCategory);
			System.out.println("수정6" + postCountry);

		} catch (Exception e) {
			e.printStackTrace();
			// new File(contextRoot + "/" + savedFileName).delete();
			System.out.println("등록실패");
		}

	}


}
