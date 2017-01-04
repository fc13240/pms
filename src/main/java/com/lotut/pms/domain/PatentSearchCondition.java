package com.lotut.pms.domain;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class PatentSearchCondition {
	private int userId;
	private Integer patentType;
	private Integer patentStatus;
	private Integer transactionStatus;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date startAppDate;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date endAppDate;
	private String keywordType;
	private String keyword;
	private String appPerson;
	private Page page;
	private String startMonthDay;
	private String endMonthDay;
	private static DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	
	
	
	
	public String getStartMonthDay() {
		return startMonthDay;
	}

	public void setStartMonthDay(String startMonthDay) {
		this.startMonthDay = startMonthDay;
	}

	public String getEndMonthDay() {
		return endMonthDay;
	}

	public void setEndMonthDay(String endMonthDay) {
		this.endMonthDay = endMonthDay;
	}

	public String getAppPerson() {
		return appPerson;
	}

	public void setAppPerson(String appPerson) {
		this.appPerson = appPerson;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Integer getPatentType() {
		return patentType;
	}

	public void setPatentType(Integer patentType) {
		this.patentType = patentType;
	}

	public Integer getPatentStatus() {
		return patentStatus;
	}

	public void setPatentStatus(Integer patentStatus) {
		this.patentStatus = patentStatus;
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
		if (keyword != null) {
			return keyword.trim();
		}
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

	
	public Integer getTransactionStatus() {
		return transactionStatus;
	}

	public void setTransactionStatus(Integer transactionStatus) {
		this.transactionStatus = transactionStatus;
	}

	@Override
	public String toString() {
		String startAppDateStr = startAppDate == null ? "" : formatter.format(startAppDate);
		String endAppDateStr = endAppDate == null ? "" : formatter.format(endAppDate);
		String patentTypeStr = patentType == null ? "" : patentType.toString();
		String patentStatusStr = patentStatus == null ? "" : patentStatus.toString();
		String transactionStatusStr = transactionStatus == null ? "" : transactionStatus.toString();
		String keywordStr = keyword == null ? "" : keyword;
		
		return "patentType=" + patentTypeStr + "&patentStatus=" + patentStatusStr +"&transactionStatus=" + transactionStatusStr + "&startAppDate="
				+ startAppDateStr + "&endAppDate=" + endAppDateStr + "&keyword=" + keywordStr + "&appPerson=" + appPerson;
	}
}
