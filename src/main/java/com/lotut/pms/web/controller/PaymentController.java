package com.lotut.pms.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path="/payment")
public class PaymentController {
	@RequestMapping(path="/alipay")
	public String showAlipayIndexPage() {
		return "alipay_index";
	}
}
