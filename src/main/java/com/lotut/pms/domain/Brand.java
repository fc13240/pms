package com.lotut.pms.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class Brand {
	private int id;
	private String address;
	private User user;
	private int checkStatus;
	private int sellStatus;
	private int isRecommend;
	private BrandCategory brandCategory;
	private String brandNo;
	private String name;
	private String combinationType;
	private String similarNo;
	private String scope;
	private int transactionMode;
	private int price;
	private String appPerson;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date app_date;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date publish_date;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date start_date;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date end_date;
}

