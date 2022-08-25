package com.project.main.sm;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.main.js.User;


@Service
public class DiaryDAO {
	
	@Autowired
	private SqlSession ss;

	// 다이어리 정보 불러오기
	public void getDiaryInfo(HttpServletRequest req, Diary d, String userId, User u, Category cate) {
		try {
			d.setDiaryUserId(userId);
			u.setUserID(userId);
			cate.setCategoryUserId(userId);
			
			Diary dd = (Diary) ss.getMapper(DiaryMapper.class).getDiaryInfo(d);
			User uu = (User) ss.getMapper(DiaryMapper.class).getUserInfo(u);
			
			System.out.println(dd.getCategories());
			dd.setCategoriesArray(makeCategory(dd.getCategories()));
			
			
			req.setAttribute("Diary", dd);
			req.setAttribute("User", uu);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 다이어리 카테고리 만들기
	public String[] makeCategory(String dd) {
		System.out.println(dd);
		String categories[] = dd.split("!");
		for (String string : categories) {
			System.out.println(string);
		}
		return categories;
	}
	
	
	
	// 다이어리 수정 (타이틀, 소개, 컬러)
	public void updateDiary(HttpServletRequest req, Diary d, String userId) {

		try {
			
			String diaryTitle = req.getParameter("diaryTitle");
			String diaryIntroduce = req.getParameter("diaryIntroduce");
			String themeColor = req.getParameter("themeColor");

			System.out.println(diaryTitle);
			System.out.println(diaryIntroduce);
			System.out.println(themeColor);
			
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

	public int insertSchedule(HttpServletRequest req, Schedule s) {
	try {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm");
		
		System.out.println(s.getScheduleDate());
		System.out.println(s.getScheduleUserId());
		System.out.println(s.getScheduleTitle());
//		sdf.format(req.getParameter("ScheduleDate1"));
		req.getParameter("ScheduleStartTime1");
		req.getParameter("ScheduleEndTime1");
//		System.out.println(req.getParameter("ScheduleDate1"));
		System.out.println(req.getParameter("ScheduleStartTime1"));
		System.out.println(req.getParameter("ScheduleEndTime1"));
		
//		s.setScheduleDate(scheduleDate);
		s.setScheduleStartTime(req.getParameter("ScheduleStartTime1"));
		s.setScheduleEndTime(req.getParameter("ScheduleEndTime1"));
		
		if (ss.getMapper(ScheduleMapper.class).insertSchedule(s) == 1) {
			return 1;
		} else {
			return 0;
		}
	
		/*ss.getMapper(ScheduleMapper.class).insertSchedule(s);*/
		
	} catch (Exception e) {
		e.printStackTrace();
	}	
		
		return 0;
	}






}
