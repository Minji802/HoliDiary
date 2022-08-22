package com.project.main.mj_write;

import java.util.List;
import java.util.Map;

public interface LikeMapper {

	public int updateLikeCancel(DiaryPost p);

	public void insertLike(Like l);

	public void deleteLike(Like l);

	public int likeCount(Like l);

	public void updateLikeCount(Like l);

	public void updateLikeCountCancel(Like l);

	public int updateLike(DiaryPost p);

	public List<Like> showAllLikeUsers(Like l);



}
