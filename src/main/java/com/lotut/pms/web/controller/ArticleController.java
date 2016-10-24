package com.lotut.pms.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lotut.pms.domain.Article;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.UserArticle;
import com.lotut.pms.service.ArticleService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/article")
public class ArticleController {
	private ArticleService articleService;
	
	@Autowired
	public ArticleController(ArticleService articleService){
		this.articleService=articleService;
	}
	
	@RequestMapping(path="/getUserArticles")
	public String getUserArticles(Page page, HttpSession session,Model model){
		UserArticle userArticle=articleService.getUserArticleByPage(page, session);
		model.addAttribute("articles", userArticle.getArticles());
		model.addAttribute("page", userArticle.getPage());
		return "news_list";
		
	}
	
}
