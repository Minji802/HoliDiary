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
import com.project.main.js.User;
import com.project.main.sm.Diary;

@Service
public class DiaryPostDAO {

	@Autowired
	private SqlSession ss;

	public int countPostList(HttpServletRequest req, DiaryPost p, String userId) {
		p.setPostWriter(userId);

		return ss.getMapper(DiaryPostMapper.class).countPostList(p);
	}
	
	public int countPostList2(HttpServletRequest req, DiaryPost p, String userId, String category) {
		p.setPostWriter(userId);
		p.setPostCategory(category);

		return ss.getMapper(DiaryPostMapper.class).countPostList2(p);
	}


	public void getAllList(HttpServletRequest req, String userId, DiaryPostPaging pp, int total, String nowPage,
			String cntPerPage) {
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		pp = new DiaryPostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		DiaryPost p = new DiaryPost();
		p.setPostWriter(userId);
		p.setStart(pp.getStart());
		p.setEnd(pp.getEnd());
		
		List<DiaryPost> posts = ss.getMapper(DiaryPostMapper.class).showAllPostList(p);

		req.setAttribute("DiaryPosts", posts);
		
		req.setAttribute("paging", pp);

	}
	
	public void getAllList2(HttpServletRequest req, String userId, DiaryPostPaging pp, int total, String nowPage,
			String cntPerPage) {
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "9";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "9";
		}
		pp = new DiaryPostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		DiaryPost p = new DiaryPost();
		p.setPostWriter(userId);
		p.setStart(pp.getStart());
		p.setEnd(pp.getEnd());
		
		List<DiaryPost> posts = ss.getMapper(DiaryPostMapper.class).showAllPostList(p);

		req.setAttribute("DiaryPosts", posts);
		
		req.setAttribute("paging", pp);
		
	}
	
	public void getCategoryList(HttpServletRequest req, String userId, DiaryPostPaging pp, int total, String nowPage,
			String cntPerPage, String category) {
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		pp = new DiaryPostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		DiaryPost p = new DiaryPost();
		p.setPostWriter(userId);
		p.setStart(pp.getStart());
		p.setEnd(pp.getEnd());
		p.setPostCategory(category);
		
		List<DiaryPost> posts = ss.getMapper(DiaryPostMapper.class).showCategoryPostList(p);

		req.setAttribute("DiaryPosts", posts);
		
		req.setAttribute("paging", pp);
		
	}
	
	public void getcategoryGallery(HttpServletRequest req, String userId, DiaryPostPaging pp, int total, String nowPage,
			String cntPerPage, String category) {
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "9";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "9";
		}
		pp = new DiaryPostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		DiaryPost p = new DiaryPost();
		p.setPostWriter(userId);
		p.setStart(pp.getStart());
		p.setEnd(pp.getEnd());
		p.setPostCategory(category);
		
		List<DiaryPost> posts = ss.getMapper(DiaryPostMapper.class).showCategoryPostList(p);

		req.setAttribute("DiaryPosts", posts);
		
		req.setAttribute("paging", pp);
		
	}


	public void detailPost(DiaryPost p, HttpServletRequest req, Comment c, Like l) {
		DiaryPostMapper pm = ss.getMapper(DiaryPostMapper.class);
		DiaryPost posts = pm.detailPost(p);
		req.setAttribute("DiaryPost", posts);

		LikeMapper lm = ss.getMapper(LikeMapper.class);
		List<Like> like = lm.showAllLikeUsers(l);
		req.setAttribute("Like", like);

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
		String postCountry = p.getPostCountry();

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

	/* 좋아요 관련 */
	public int likeCount(HttpServletRequest req, Like l) {

		System.out.println(l.getPostNum());
		System.out.println(l.getUserId());
		System.out.println(l.getPostNum());
		System.out.println("등록성공~!");

		return ss.getMapper(LikeMapper.class).likeCount(l);
	}

	public void insertLike(HttpServletRequest req, Like l) {

		int postNum = l.getPostNum();
		String userId = l.getUserId();
		int likeCount = l.getLikeCount();

		try {
			l.setPostNum(postNum);
			l.setUserId(userId);
			l.setLikeCount(likeCount);

			ss.getMapper(LikeMapper.class).insertLike(l);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("실패");

		}

	}

	public void updateLike(HttpServletRequest req, DiaryPost p) {

		int postNum = p.getPostNum();
		int postRecommend = p.getPostRecommend();

		System.out.println("-----------------");
		System.out.println(p.getPostNum());
		System.out.println(p.getPostRecommend());

		try {

			p.setPostNum(postNum);
			p.setPostRecommend(postRecommend);

			if (ss.getMapper(LikeMapper.class).updateLike(p) == 1) {
				System.out.println("1");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void updateLikeCount(HttpServletRequest req, Like l) {

		int postNum = l.getPostNum();
		String userId = l.getUserId();
		int likeCount = l.getLikeCount();

		try {

			l.setPostNum(postNum);
			l.setUserId(userId);
			l.setLikeCount(likeCount);

			ss.getMapper(LikeMapper.class).updateLikeCount(l);
			System.out.println("updateLikeCount 1 성공");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateLikeCount 1 실패");
		}

	}

	public void updateLikeCountCancel(HttpServletRequest req, Like l) {

		int postNum = l.getPostNum();
		String userId = l.getUserId();
		int likeCount = l.getLikeCount();

		try {

			l.setPostNum(postNum);
			l.setUserId(userId);
			l.setLikeCount(likeCount);

			ss.getMapper(LikeMapper.class).updateLikeCountCancel(l);
			System.out.println("updateLikeCount 0 성공");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateLikeCount 0 실패");
		}

	}

	public void updateLikeCancel(HttpServletRequest req, DiaryPost p) {

		int postNum = p.getPostNum();
		int postRecommend = p.getPostRecommend();

		try {

			p.setPostNum(postNum);
			p.setPostRecommend(postRecommend);

			if (ss.getMapper(LikeMapper.class).updateLikeCancel(p) == 1) {
				System.out.println("좋아요 -1");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("좋아요 -1 실패");
		}
	}

	public void deleteLike(HttpServletRequest req, Like l) {

		int postNum = l.getPostNum();
		String userId = l.getUserId();
		int likeCount = l.getLikeCount();

		try {

			l.setPostNum(postNum);
			l.setUserId(userId);
			l.setLikeCount(likeCount);

			ss.getMapper(LikeMapper.class).deleteLike(l);
			System.out.println("삭제 성공11111111");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("삭제 111111111 실패");
		}

	}

	// 조회수 증가
	public void countPostView(DiaryPost p, HttpServletRequest req, User u) {

		int postNum = p.getPostNum();
		int postView = p.getPostView();

		try {
			p.setPostNum(postNum);
			p.setPostView(postView);

			if (ss.getMapper(DiaryPostMapper.class).countPostView(p) == 1) {
				System.out.println("조회수 증가 성공");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("조회수 증가 실패");
		}

	}

	public int commentReg(HttpServletRequest req, User u, DiaryPost p, Comment c) {

		/*int postNum = c.getPostNum();
		int commentNum = c.getCommentNum();
		String CommentWriter = c.getCommentWriter();
		String commentTxt = c.getCommentTxt();
		String postWriter = c.getPostWriter();

		c.setPostNum(postNum);
		c.setCommentNum(commentNum);
		c.setCommentWriter(CommentWriter);
		c.setCommentTxt(commentTxt);
		c.setPostWriter(postWriter);
*/
		if (ss.getMapper(CommentMapper.class).commentWrite(c) == 1) {
			System.out.println("댓글 등록 성공");
			return 1;
		} else {
			return 0;

		}
	}

	public List<Comment> commentList(HttpServletRequest req, User u, DiaryPost p, Comment c) {

		CommentMapper cm = ss.getMapper(CommentMapper.class);
		List<Comment> comment = cm.showAllComments(c);

		return comment;

	}

	public int commentDelete(HttpServletRequest req, User u, DiaryPost p, Comment c) {

		System.out.println(c.getCommentNum());

		int commentNum = c.getCommentNum();

		c.setCommentNum(commentNum);

		if (ss.getMapper(CommentMapper.class).commentDelete(c) == 1) {
			System.out.println("댓글 삭제 성공");
			return 1;
		} else {
			return 0;
		}

	}

	public int commentUpdate(HttpServletRequest req, User u, DiaryPost p, Comment c) {
		
		if (ss.getMapper(CommentMapper.class).commentUpdate(c) == 1) {
			System.out.println("댓글 수정성공");
			return 1;
		} else {
			return 0;
		}
	}
	
	public int checkLike(HttpServletRequest req, Like l) {
			return ss.getMapper(LikeMapper.class).checkLike(l);
	}

	public String getPostNum(DiaryPost p) {
		
		return ss.getMapper(DiaryPostMapper.class).getPostNum(p);
		
	}

	public void getAllPastList(HttpServletRequest req, String userId, DiaryPostPaging pp, int total, String nowPage,
			String cntPerPage) {
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		pp = new DiaryPostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		DiaryPost p = new DiaryPost();
		p.setPostWriter(userId);
		p.setStart(pp.getStart());
		p.setEnd(pp.getEnd());
		
		List<DiaryPost> posts = ss.getMapper(DiaryPostMapper.class).showAllPastList(p);

		req.setAttribute("DiaryPosts", posts);
		
		req.setAttribute("paging", pp);
		
	}

	public void getAllRecommendList(HttpServletRequest req, String userId, DiaryPostPaging pp, int total,
			String nowPage, String cntPerPage) {

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		pp = new DiaryPostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		DiaryPost p = new DiaryPost();
		p.setPostWriter(userId);
		p.setStart(pp.getStart());
		p.setEnd(pp.getEnd());
		
		List<DiaryPost> posts = ss.getMapper(DiaryPostMapper.class).showAllRecommendList(p);

		req.setAttribute("DiaryPosts", posts);
		
		req.setAttribute("paging", pp);
		
	}

	public void getAllPastList2(HttpServletRequest req, String userId, DiaryPostPaging pp, int total, String nowPage,
			String cntPerPage) {
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "9";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "9";
		}
		pp = new DiaryPostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		DiaryPost p = new DiaryPost();
		p.setPostWriter(userId);
		p.setStart(pp.getStart());
		p.setEnd(pp.getEnd());
		
		List<DiaryPost> posts = ss.getMapper(DiaryPostMapper.class).showAllPastList(p);

		req.setAttribute("DiaryPosts", posts);
		
		req.setAttribute("paging", pp);
	}

	public void getAllRecommendList2(HttpServletRequest req, String userId, DiaryPostPaging pp, int total,
			String nowPage, String cntPerPage) {
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "9";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "9";
		}
		pp = new DiaryPostPaging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		DiaryPost p = new DiaryPost();
		p.setPostWriter(userId);
		p.setStart(pp.getStart());
		p.setEnd(pp.getEnd());
		
		List<DiaryPost> posts = ss.getMapper(DiaryPostMapper.class).showAllRecommendList(p);

		req.setAttribute("DiaryPosts", posts);
		
		req.setAttribute("paging", pp);
	}


}
