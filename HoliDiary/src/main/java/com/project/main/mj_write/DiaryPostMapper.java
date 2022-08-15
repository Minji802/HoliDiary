package com.project.main.mj_write;

import java.util.List;

public interface DiaryPostMapper {

	public List<DiaryPost> showAllPostList(DiaryPost p);

	public DiaryPost detailPost(DiaryPost p);

	public int regPost(DiaryPost p);

}
