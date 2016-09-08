package com.lotut.pms.domain;

public class PatentDocSearchCondition {
	private int userId;
	private String keyword;
	private Integer patentDocStatus;
	private Integer patentType;
	private Page page;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getKeyword() {
		if (keyword != null) {
			return keyword.trim();
		}
		return keyword;
	}
	public Integer getPatentType() {
		return patentType;
	}
	public void setPatentType(Integer patentType) {
		this.patentType = patentType;
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
	
	
	public Integer getPatentDocStatus() {
		return patentDocStatus;
	}
	public void setPatentDocStatus(Integer patentDocStatus) {
		this.patentDocStatus = patentDocStatus;
	}
	
	
	@Override
	public String toString() {
		String keywordStr = keyword == null ? "" : keyword;
		String patentDocStatusStr = patentDocStatus == null ? "" : patentDocStatus.toString();
		String patentTypeStr = patentType == null ? "" : patentType.toString();
		return "keyword=" + keywordStr+ "&patentDocStatus=" + patentDocStatusStr + "&patentType=" + patentTypeStr;
	}
}
