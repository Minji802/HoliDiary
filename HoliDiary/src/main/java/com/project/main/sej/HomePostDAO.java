package com.project.main.sej;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomePostDAO {
	
	private int allPostCount;
	
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private HomeSiteOption so;
	
	public int getAllPostCount() {
		return allPostCount;
	}
	
	public void setAllPostCount(int allPostcount) {
		this.allPostCount = allPostcount;
	}
	
	public void calcAllMsgCount() {
		HomePostSelector pSel = new HomePostSelector("", null, null);
		allPostCount = ss.getMapper(Sej_postMapper.class).getPostCount(pSel);
	}

	public void searchPost(int pageNo, HomePostSelector pSel, HttpServletRequest req) {
		int count = so.getPostCountPerpage();
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);
		int postCount = 0;
		String search = req.getParameter("search");
		
		pSel = new HomePostSelector(search, new BigDecimal(start), new BigDecimal(end));
		System.out.println(search);
		System.out.println(pSel.getSearch());
		
		req.setAttribute("search", search);
		
		
		List<PostContent> contents = ss.getMapper(Sej_postMapper.class).getPost(pSel);
		
		if (search.equals("")||contents.isEmpty()) {
			req.setAttribute("contentPage", "sej_search/home_search_null.jsp");
		} else {
			pSel.setStart(new BigDecimal(start));
			pSel.setEnd(new BigDecimal(end));
			postCount = ss.getMapper(Sej_postMapper.class).getPostCountBeta(pSel);
			req.setAttribute("contentPage", "sej_search/home_search.jsp");
		}
		
		/*PostContent pc = new PostContent();
		String postT = pc.getPosttxt();
		
		if (postT.length()>=24) {
			
		} */
		
		int pageCount = (int) Math.ceil(postCount / (double) count);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("contents", contents);
		req.setAttribute("curPage", pageNo);
		
	}

	/*public void textLengthSet(HttpServletRequest req) {
		
		
	}*/
	
	
	
	
	
	

	/*public void searchingPost(HomePostSelector pSel, HttpServletRequest req) {
		req.getSession().setAttribute("search", pSel);
	}*/

	/*public void getPost(int pageNo, HttpServletRequest req) {

		int count = so.getPostCountPerpage();
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);

		HomePostSelector search = (HomePostSelector) req.getSession().getAttribute("search");
		int postCount = 0;

		System.out.println(search);
		if (search == null) {
			search = new HomePostSelector("", new BigDecimal(start), new BigDecimal(end));
			postCount = allPostCount;
		} else {
			search.setStart(new BigDecimal(start));
			search.setEnd(new BigDecimal(end));
			postCount = ss.getMapper(Sej_postMapper.class).getPostCount(search);
		}

		List<PostContent> contents = ss.getMapper(Sej_postMapper.class).getPost(search);
		

		int pageCount = (int) Math.ceil(postCount / (double) count);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("contents", contents);
		req.setAttribute("curPage", pageNo);
		
	}*/
	
	

	
	
}
