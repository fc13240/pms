package com.lotut.pms.domain;

public class TemplatePage {
	final int INITIAL_CURRENT_PAG = 3;
	private int currentPage = 1;
	private int pageSize = INITIAL_CURRENT_PAG;
	private int sectionId;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getStartIndex() {
		return (currentPage-1)*pageSize;
	}
	public int getSectionId() {
		return sectionId;
	}
	public void setSectionId(int sectionId) {
		this.sectionId = sectionId;
	}
	public static void main(String[] args) {
		TemplatePage templatePage =new TemplatePage();
		System.out.println(templatePage.getCurrentPage());
	}
}
