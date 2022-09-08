package com.project.main.mj_write;

import java.util.List;

import com.project.main.sm.Diary;

public interface DiaryPostMapper {
	
	public int countPostList(DiaryPost p);
	
	public int countPostList2(DiaryPost p);

	public List<DiaryPost> showAllPostList(DiaryPost p);

	public DiaryPost detailPost(DiaryPost p);

	public int regPost(DiaryPost p);
	
    public int deleteDiaryPost(DiaryPost p);

	public int updateDiaryPost(DiaryPost p);

	public List<DiaryPost> showAllCommentList(Comment c);

	public int countPostView(DiaryPost p);

	public List<DiaryPost> showCategoryPostList(DiaryPost p);

	public String getPostNum(DiaryPost p);

	


	




}
