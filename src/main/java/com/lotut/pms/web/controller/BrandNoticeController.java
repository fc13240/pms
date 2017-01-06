package com.lotut.pms.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lotut.pms.service.BrandNoticeService;

@Controller
@RequestMapping(path="/brandNotice")
public class BrandNoticeController {
	private BrandNoticeService brandNoticeService;
	
	@Autowired
	public BrandNoticeController(BrandNoticeService brandNoticeService) {
		this.brandNoticeService = brandNoticeService;
	}
	
}
