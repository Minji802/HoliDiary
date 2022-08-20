package com.project.main.sej;

import java.util.List;

public interface Sej_postMapper {

	int getPostCount(HomePostSelector pSel);

	List<PostContent> getPost(HomePostSelector pSel);

	int getPostCountBeta(HomePostSelector pSel);

	public List<PostContent> getHolinow();

	public List<PostContent> getBestHoli();

}
