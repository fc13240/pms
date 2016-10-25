package com.lotut.pms.web.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lotut.pms.domain.News;
import com.lotut.pms.domain.NewsImg;
import com.lotut.pms.domain.NewsSearchCondition;
import com.lotut.pms.domain.NewsType;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.NewsService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/news")
public class NewsController {
	private NewsService newsService;
	
	@Autowired
	public NewsController(NewsService newsService) {
		this.newsService = newsService;
	}
	
	
	@RequestMapping(path="/list", method=RequestMethod.GET)
	public String getUserNewsByPage(Model model,Page page,HttpSession session) {
		page.setPageSize(WebUtils.getPageSize(session));
		if(page.getCurrentPage()<1){
			page.setCurrentPage(1);
		}
		int userId=PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		List<News> news=newsService.getUserNewsByPage(page);
		int totalCount=(int)newsService.getUserNewsCount(userId);
		page.setTotalRecords(totalCount);
		List<NewsType> allNewsType=newsService.getAllNewsTypes();
		model.addAttribute("news", news);
		model.addAttribute("page", page);
		model.addAttribute("allNewsType", allNewsType);
		return "news_list";
	}
	
	
	@RequestMapping(path="/searchNews", method=RequestMethod.GET)
	public String searchUserNews(@ModelAttribute("searchCondition") NewsSearchCondition searchCondition, Model model,HttpSession session) {
		Page page=searchCondition.getPage();
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		page.setPageSize(WebUtils.getPageSize(session));
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		List<News> news=newsService.searchUserNewsByPage(searchCondition);
		int totalCount=newsService.searchUserNewsCount(searchCondition);
		page.setTotalRecords(totalCount);
		List<NewsType> allNewsType=newsService.getAllNewsTypes();
		model.addAttribute("news", news);
		model.addAttribute("page", page);
		model.addAttribute("allNewsType", allNewsType);
		return "news_list";
	}
	
	@RequestMapping(path="/getUserNewsById", method=RequestMethod.GET)
	public String getUserNewsById(@RequestParam("newsId") int newsId,Model model) {
		News news=newsService.getUserNewsById(newsId);
		model.addAttribute("news", news);
		return "news_preview";
	}
	

	@RequestMapping(path="/addNewsForm")
	public String addNewsForm(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		News news = new News();
		User user =new User();
		user.setUserId(userId);
		news.setUser(user);
		newsService.insertNews(news);
		List<NewsType> newsTypes = newsService.getAllNewsTypes();
		model.addAttribute("newsId", news.getId());
		model.addAttribute("newsTypes", newsTypes);
		return "news_add";
	}
	@RequestMapping(path="/deleteNews")
	public void deleteNews(int newsId) {
		newsService.deleteNewsById(newsId);
	}
	
	@RequestMapping(path="/saveNews")
	public String saveNews(News news) {
		newsService.updateNews(news);
		return "redirect:/news/list.html";
	}
	
	@RequestMapping(path="/uploadNewsThumbnail")
	public void uploadNewsThumbnail(MultipartFile file,int newsId,PrintWriter out) {
		NewsImg newsImg = new NewsImg();
		newsImg.setNewsId(newsId);
		newsService.insertNewsImage(newsImg, file);
		out.write("success");
	}
	
}
