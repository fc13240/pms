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
	private Date dispatchDate;
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
	
	public Date getDispatchDate() {
		return dispatchDate;
	}
	public void setDispatchDate(Date dispatchDate) {
		this.dispatchDate = dispatchDate;
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
		String dispatchDateStr=dispatchDate==null?"":dispatchDate.toString();
		String noticeTypeStr = noticeType == null ? "" : noticeType.toString();
		String keywordStr = keyword == null ? "" : keyword.trim();
		
		return "brandCategory=" + brandCategoryStr + "&brandLegalStatus=" + brandLegalStatusStr +"&noticeType=" + noticeTypeStr + "&dispatchDate="
				+ dispatchDateStr + "&keyword=" + keywordStr;
	}
	
	
	
}
