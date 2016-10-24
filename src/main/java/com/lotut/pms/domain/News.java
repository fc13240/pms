package com.lotut.pms.domain;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class News {
	private int id;
	private NewsType newsType;
	private User user;
	private String keywords;
	private String author;
	private String title;
	private Timestamp create_time;
	@DateTimeFormat(iso=ISO.DATE_TIME,pattern="yyyy-MM-dd HH:mm:ss")
	private Date publish_time;
	@DateTimeFormat(iso=ISO.DATE_TIME,pattern="yyyy-MM-dd HH:mm:ss")
	private Date update_time;
	private String source;
	private String content;
	private String newsAbstract;
}
