package com.lotut.pms.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.UserArticle;
import com.lotut.pms.service.ArticleService;

@Controller
@RequestMapping(path="/article")
public class ArticleController {
	private ArticleService articleService;
	
	@Autowired
	public ArticleController(ArticleService articleService){
		this.articleService=articleService;
	}
	
	@RequestMapping(path="/list")
	public String getUserArticles(Page page, HttpSession session,Model model){
		UserArticle userArticle=articleService.getUserArticleByPage(page, session);
		model.addAttribute("articles", userArticle.getArticles());
		model.addAttribute("page", userArticle.getPage());
		return "article_list";
		
	}
	
	/*@RequestMapping(path="/searchArticles", method=RequestMethod.GET)
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
	}*/
}
