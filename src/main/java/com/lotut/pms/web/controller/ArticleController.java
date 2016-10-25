package com.lotut.pms.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lotut.pms.domain.Article;
import com.lotut.pms.domain.ArticleSearchCondition;
import com.lotut.pms.domain.ArticleType;
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

	@RequestMapping(path="/searchArticles", method=RequestMethod.GET)
	public String searchUserNews(@ModelAttribute("searchCondition") ArticleSearchCondition searchCondition, Model model,HttpSession session) {
		UserArticle userArticle=articleService.searchUserArticleByPage(searchCondition, session);
		model.addAttribute("articles", userArticle.getArticles());
		model.addAttribute("page", userArticle.getPage());
		model.addAttribute("articleTypes", userArticle.getArticleTypes());
		return "article_list";
	}
	
	@RequestMapping(path="/getArticleTypeList", method=RequestMethod.GET)
	public String getArticleTypeList(Model model) {
		List<ArticleType> allArticleTypes=articleService.getAllArticleTypes();
		model.addAttribute("allArticleTypes", allArticleTypes);
		return "article_type_list";
	}
	
	@RequestMapping(path="/audit", method=RequestMethod.GET)
	public String audit(Article article){
		articleService.auditArticle(article);
		return "redirect:/article/list.html";
		
	}
	
	@RequestMapping(path="/preview", method=RequestMethod.GET)
	public String preview(int id,Model model){
		Article article=articleService.getUserArticleById(id);
		model.addAttribute("article",article);
		return "article_preview";
		
	}
}
