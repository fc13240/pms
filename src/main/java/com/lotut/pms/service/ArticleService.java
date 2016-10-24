package com.lotut.pms.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lotut.pms.domain.Article;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.UserArticle;

public interface ArticleService {
	UserArticle getUserArticleByPage(Page page,HttpSession session);
}
