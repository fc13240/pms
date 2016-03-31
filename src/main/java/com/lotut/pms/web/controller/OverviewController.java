package com.lotut.pms.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OverviewController {
	@RequestMapping(path="/overview", method=RequestMethod.GET)
	public String showOverview(Model model) {
		return "overview";
	}
}
