package com.lotut.pms.domain;

public class InventorSearchCondition {
	private int userId;
	private String keyword;
	private Page page;
	private String idNumber;
	private String name;
	
	
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
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
		String keywordStr = keyword == null ? "" : keyword;
		String nameStr = name == null ? "" : name;
		String idNumberStr = idNumber == null ? "" : idNumber;
		return "&keyword=" + keywordStr+"&name="+nameStr+"&idNumber="+idNumberStr;
	}
}
