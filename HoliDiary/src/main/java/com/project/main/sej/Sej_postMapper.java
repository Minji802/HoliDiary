package com.project.main.sej;

import java.util.List;

public interface Sej_postMapper {

	int getPostCount(HomePostSelector pSel);

	List<PostContent> getPost(HomePostSelector pSel);

	List<PostContent> getHoliByCountry(HomePostSelector pSel);
	
	int getPostCountBeta(HomePostSelector pSel);

	int getPostCountFor_HoliByCountry(HomePostSelector pSel);
	
	public List<PostContent> getHolinow();

	public List<PostContent> getBestHoli();

	public List<PostContent> getBestHoliRanking();

}
