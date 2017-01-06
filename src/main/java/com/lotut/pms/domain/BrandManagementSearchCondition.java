package com.lotut.pms.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class BrandManagementSearchCondition {
	private Integer brandCategory;
	private Integer brandLegalStatus;
	private Integer transactionStatus;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date appDate;
	private String keyword;
	private Page page;
	private static DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	
	public Integer getBrandCategory() {
		return brandCategory;
	}
	public void setBrandCategory(Integer brandCategory) {
		this.brandCategory = brandCategory;
	}
	public Integer getBrandLegalStatus() {
		return brandLegalStatus;
	}
	public void setBrandLegalStatus(Integer brandLegalStatus) {
		this.brandLegalStatus = brandLegalStatus;
	}
	public int getTransactionStatus() {
		return transactionStatus;
	}
	public void setTransactionStatus(int transactionStatus) {
		this.transactionStatus = transactionStatus;
	}
	public Date getAppDate() {
		return appDate;
	}
	public void setAppDate(Date appDate) {
		this.appDate = appDate;
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
		String brandCategoryStr= brandCategory ==null? "":brandCategory.toString();
		String brandLegalStatusStr =brandLegalStatus == null ? "" :brandLegalStatus.toString();
		String transactionStatusStr = transactionStatus == null ? "" : transactionStatus.toString();
		String appDateStr = appDate == null ? "" : formatter.format(appDate);
		String keywordStr = keyword == null ? "" : keyword;
		
		return "brandCategory=" + brandCategoryStr + "&brandLegalStatus=" + brandLegalStatusStr +"&transactionStatus=" + transactionStatusStr + "&appDate="
				+ appDateStr + "&keyword=" + keywordStr;
	}
	
	
	
}
