package com.lotut.pms.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class TransactionPatentSearchCondition {
	private int userId;
	private Integer status;
	private Integer transactionType;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date startAddDate;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date endAddDate;
	private String keyword;
	private Page page;
	private static DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	private Integer patentType;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getTransactionType() {
		return transactionType;
	}
	public void setTransactionType(Integer transactionType) {
		this.transactionType = transactionType;
	}
	public Date getStartAddDate() {
		return startAddDate;
	}
	public void setStartAddDate(Date startAddDate) {
		this.startAddDate = startAddDate;
	}
	public Date getEndAddDate() {
		return endAddDate;
	}
	public void setEndAddDate(Date endAddDate) {
		this.endAddDate = endAddDate;
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
	
	public Integer getPatentType() {
		return patentType;
	}
	public void setPatentType(Integer patentType) {
		this.patentType = patentType;
	}
	
	@Override
	public String toString() {
		String startAddDateStr = startAddDate == null ? "" : formatter.format(startAddDate);
		String endAddDateStr = endAddDate == null ? "" : formatter.format(endAddDate);
		String statusStr = status == null ? "" : status.toString();
		String transactionTypeStr = transactionType == null ? "" : transactionType.toString();
		String keywordStr = keyword == null ? "" : keyword;
		
		return "status=" + statusStr + "&transactionType=" + transactionTypeStr + "&startAddDate="
				+ startAddDateStr + "&endAddDate=" + endAddDateStr + "&keyword=" + keywordStr;
	}
}
