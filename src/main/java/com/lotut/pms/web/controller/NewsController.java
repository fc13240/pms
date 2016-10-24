package com.lotut.pms.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.lotut.pms.domain.Page;
import com.lotut.pms.service.NewsService;

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
		return "news_list";
	}
	
}
