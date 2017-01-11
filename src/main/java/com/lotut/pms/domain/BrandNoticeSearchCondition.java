package com.lotut.pms.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class BrandNoticeSearchCondition {
	private int userId;
	private Integer brandCategory;
	private Integer brandLegalStatus;
	private Integer noticeType;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date appDate;
	private String keyword;
	private Page page;
	
	
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
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
	
	public Integer getNoticeType() {
		return noticeType;
	}
	public void setNoticeType(Integer noticeType) {
		this.noticeType = noticeType;
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
		String appDateStr=appDate==null?"":appDate.toString();
		String noticeTypeStr = noticeType == null ? "" : noticeType.toString();
		String keywordStr = keyword == null ? "" : keyword.trim();
		
		return "brandCategory=" + brandCategoryStr + "&brandLegalStatus=" + brandLegalStatusStr +"&noticeType=" + noticeTypeStr + "&appDate="
				+ appDateStr + "&keyword=" + keywordStr;
	}
	
	
	
}
