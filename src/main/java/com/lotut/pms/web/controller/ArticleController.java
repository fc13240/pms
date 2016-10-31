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
import org.springframework.web.multipart.MultipartFile;

import com.lotut.pms.domain.Article;
import com.lotut.pms.domain.ArticleImg;
import com.lotut.pms.domain.ArticleSearchCondition;
import com.lotut.pms.domain.ArticleType;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;
import com.lotut.pms.domain.UserArticle;
import com.lotut.pms.service.ArticleService;
import com.lotut.pms.util.PrincipalUtils;

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
		UserArticle userArticle=new UserArticle();
		articleService.deleteNullData();
		if(PrincipalUtils.isAdmin()||PrincipalUtils.isOrderProcessor()){
			 userArticle=articleService.getCheckedArticleList(page, session);
			 model.addAttribute("articles", userArticle.getArticles());
			 model.addAttribute("page", userArticle.getPage());
			 model.addAttribute("articleTypes", userArticle.getArticleTypes());
			 return "article_check_list";
		}else{
			 userArticle=articleService.getUserArticleByPage(page, session);
			 model.addAttribute("articles", userArticle.getArticles());
			 model.addAttribute("page", userArticle.getPage());
			 model.addAttribute("articleTypes", userArticle.getArticleTypes());
			 return "article_list";
		}
		
		
	}

	@RequestMapping(path="/searchUserArticles", method=RequestMethod.GET)
	public String searchUserArticle(@ModelAttribute("searchCondition") ArticleSearchCondition searchCondition, Model model,HttpSession session) {
		UserArticle userArticle=articleService.searchUserArticleByPage(searchCondition, session);
		model.addAttribute("articles", userArticle.getArticles());
		model.addAttribute("page", userArticle.getPage());
		model.addAttribute("articleTypes", userArticle.getArticleTypes());
		return "article_list";
	}
	
	@RequestMapping(path="/searchAllArticles", method=RequestMethod.GET)
	public String searchAllArticle(@ModelAttribute("searchCondition") ArticleSearchCondition searchCondition, Model model,HttpSession session) {
		UserArticle userArticle=articleService.searchAllArticleByPage(searchCondition, session);
		model.addAttribute("articles", userArticle.getArticles());
		model.addAttribute("page", userArticle.getPage());
		model.addAttribute("articleTypes", userArticle.getArticleTypes());
		return "article_check_list";
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
	
	@RequestMapping(path="/addArticleType", method=RequestMethod.GET)
	public String addArticleType(String keyword,Model model) {
		if(keyword != null && !"".equals(keyword.trim())) {
			articleService.addArticleType(keyword.trim());
		}
		return "redirect:/article/getArticleTypeList.html";
	}
	
	@RequestMapping(path="/deleteArticleType", method=RequestMethod.GET)
	public void deleteArticleType(int typeId) {
		articleService.deleteArticleType(typeId);
	}
	
	@RequestMapping(path="/updateArticleType", method=RequestMethod.GET)
	public String updateArticleType(int typeId,String typeName) {
		articleService.updateArticleType(typeId,typeName);
		return "article_type_list";
	}
	
	@RequestMapping(path="/deleteArticle")
	public String deleteArticle(int articleId){
		articleService.deleteArticle(articleId);		
		return "redirect:/article/list.html";
		
	}
	@RequestMapping(path="/addArticleForm")
	public String addArticleForm(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		Article article = new Article();
		User user =new User();
		user.setUserId(userId);
		article.setUser(user);
		articleService.insertArticle(article);
		List<ArticleType> articleTypes=articleService.getAllArticleTypes();
		model.addAttribute("articleId", article.getId());
		model.addAttribute("articleTypes", articleTypes);
		return "article_add";
	}	
	
	@RequestMapping(path="/saveArticle")
	public String saveArticle(Article article) {
		articleService.updateArticle(article);
		return "redirect:/article/list.html";
	}
	
	@RequestMapping(path="/uploadArticleThumbnail")
	public void uploadArticleThumbnail(MultipartFile file,int articleId,PrintWriter out) {
		ArticleImg articleImg = new ArticleImg();
		articleImg.setArticleId(articleId);
		articleService.insertArticleImage(articleImg, file);
		out.write("success");
	}
	
	
	@RequestMapping(path="/updateArticleForm")
	public String updateArticleForm(int articleId,Model model) {
		Article article= articleService.getUserArticleById(articleId);
		List<ArticleType> articleTypes=articleService.getAllArticleTypes();
		model.addAttribute("articleTypes", articleTypes);
		model.addAttribute("article",article);
		return "article_update";
	}
	
	@RequestMapping(path="/updateArticle")
	public String updateArticle(Article article) {
		articleService.updateArticle(article);
		return "redirect:/article/list.html";
	}
	
	
	
	
}
