package com.lotut.pms.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lotut.pms.service.ArticleService;

@Controller
@RequestMapping(path="/article")
public class ArticleController {
	private ArticleService articleService;
	
	@Autowired
	public ArticleController(ArticleService articleService){
		this.articleService=articleService;
	}
}
