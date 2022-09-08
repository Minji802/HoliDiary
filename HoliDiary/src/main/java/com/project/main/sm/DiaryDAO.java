package com.project.main.sm;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.main.js.Subscribe;
import com.project.main.js.SubscribeDAO;
import com.project.main.js.SubscribeInfo;
import com.project.main.js.SubscribeMapper;
import com.project.main.js.User;
import com.project.main.mj_write.Comment;
import com.project.main.mj_write.DiaryPost;


@Service
public class DiaryDAO {
	
	@Autowired
	private SqlSession ss;
	

	// 다이어리 정보 불러오기
	public void getDiaryInfo(HttpServletRequest req, Diary d, String userId, User u, Category cate, Subscribe s, Comment c, DiaryPost p) {
		try {
			d.setDiaryUserId(userId);
			u.setUserID(userId);
			cate.setCategoryUserId(userId);
			c.setCommentWriter(userId);
			
			User loginUser = (User) req.getSession().getAttribute("loginUser");
			s.setSubscribeTo(userId);
			s.setSubscribeFrom(loginUser.getUserID());
			
			Diary dd = (Diary) ss.getMapper(DiaryMapper.class).getDiaryInfo(d);
			User uu = (User) ss.getMapper(DiaryMapper.class).getUserInfo(u);
			Subscribe sub = ss.getMapper(SubscribeMapper.class).checkMySubscribe(s);
			
			dd.setCategoriesArray(makeCategory(dd.getCategories()));
			
			req.setAttribute("Diary", dd);
			req.setAttribute("User", uu);
			if(sub != null) {
				req.setAttribute("Subcribe", sub);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 다이어리 카테고리 만들기
	public String[] makeCategory(String dd) {
		String categories[] = dd.split("!");
		for (String string : categories) {
		}
		return categories;
	}
	
	
	
	// 다이어리 수정 (타이틀, 소개, 컬러)
	public void updateDiary(HttpServletRequest req, Diary d, String userId) {

		try {
			
			String diaryTitle = req.getParameter("diaryTitle");
			String diaryIntroduce = req.getParameter("diaryIntroduce");
			String themeColor = req.getParameter("themeColor");

			d.setDiaryTitle(diaryTitle);
			d.setDiaryIntroduce(diaryIntroduce);
			d.setThemeColor(themeColor);

			
			if (ss.getMapper(DiaryMapper.class).diaryUpdate(d) == 1) {
				req.setAttribute("Diary", d); // 수정사항이 반영된 d를 다시 넣어줌
				System.out.println("수정 성공");
			} else {
				System.out.println("수정 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("다이어리 수정 실패");
		}

	}

	// 스케줄러 내용 추가
	public int insertSchedule(HttpServletRequest req, Schedule s) {
	try {
		SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm");
		
		req.getParameter("ScheduleStartTime1");
		req.getParameter("ScheduleEndTime1");
		s.setScheduleStartTime(req.getParameter("ScheduleStartTime1"));
		s.setScheduleEndTime(req.getParameter("ScheduleEndTime1"));
		
		if(getSchedule(s)!= null) { //이미 일정이 있으면
			if(ss.getMapper(ScheduleMapper.class).updateSchedule(s) == 1){
				System.out.println("일정변경성공");
				return 1;
			}
		} else if (getSchedule(s)== null) { //일정 없으면 
			if(ss.getMapper(ScheduleMapper.class).insertSchedule(s) == 1) {
				return 1;
			}
		} else {
			return 0;
		}
	
		
	} catch (Exception e) {
		e.printStackTrace();
	}	
		
		return 0;
	}

	
	// 홈 - 메인 이미지 업데이트
	public void updateMainImg(HttpServletRequest req, Diary d, String userId, MultipartFile file) {
		
		String path = req.getSession().getServletContext().getRealPath("resources/sm_img");
		MultipartRequest mr = null;
		
		System.out.println(path);
		
		try {
			String fileName = file.getOriginalFilename();
		
			String saveFileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
			
			d.setDiaryImg(saveFileName);
			d.setDiaryUserId(userId);
			
			if(!file.getOriginalFilename().isEmpty()) {
					file.transferTo(new File(path, saveFileName));
					ss.getMapper(DiaryMapper.class).uploadImg(d);
					System.out.println("등록 성공");
				}else {
					System.out.println("업로드 실패");
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	// 스케줄러 정보 얻기
	public Schedule getSchedule(Schedule s) {
		return ss.getMapper(ScheduleMapper.class).getSchedule(s);
	}
	
	
	// 스케줄러 전체 정보 얻기
	public String[] getAllEvent(HttpServletRequest req) {
		String year = req.getParameter("year");
		int month = Integer.parseInt(req.getParameter("month"));
		String userId = req.getParameter("userId");
		String month2 = String.format("%02d", month);
		String date = year + "/" + month2;
		
		Map<String, String> vals = new HashMap<String, String>();
		
		vals.put("val1", date);
		vals.put("val2", userId);
		return ss.getMapper(ScheduleMapper.class).getAllSchedule(vals);
	}


	// 스케줄러 내용 삭제
	public int deleteSchedule(HttpServletRequest req, Schedule s) {
		try {
			if (ss.getMapper(ScheduleMapper.class).deleteSchedule(s) == 1) {
				System.out.println("삭제 성공");
				return 1;
			} else {
				System.out.println("삭제 실패");
				return 0;
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("내용 삭제 실패");
		}	
			
			return 0;
	}

	





}
