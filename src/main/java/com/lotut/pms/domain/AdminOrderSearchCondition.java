package com.lotut.pms.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class AdminOrderSearchCondition {
	
	private Integer userId;
	private Integer orderStatus;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date startAppDate;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date endAppDate;
	private String keywordType;
	private String keyword;
	private Page page;
	private static DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Date getStartAppDate() {
		return startAppDate;
	}
	public void setStartAppDate(Date startAppDate) {
		this.startAppDate = startAppDate;
	}
	public Date getEndAppDate() {
		return endAppDate;
	}
	public void setEndAppDate(Date endAppDate) {
		this.endAppDate = endAppDate;
	}
	public String getKeywordType() {
		return keywordType;
	}
	public void setKeywordType(String keywordType) {
		this.keywordType = keywordType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public String toString() {
		String startAppDateStr = startAppDate == null ? "" : formatter.format(startAppDate);
		String endAppDateStr = endAppDate == null ? "" : formatter.format(endAppDate);
		String orderStatusStr = orderStatus == null ? "" : orderStatus.toString();
		String keywordStr = keyword == null ? "" : keyword;
		String userIdStr = userId == null ? "" : userId.toString();
		return "orderStatus=" + orderStatusStr + "&startAppDate="+ startAppDateStr + 
				"&endAppDate=" + endAppDateStr + "&keyword=" + keywordStr+"&userId=" + userIdStr;
	}
	
}
