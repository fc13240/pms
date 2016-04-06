package com.lotut.pms.domain;

public class Page {
	private int userId;
	private int totalRecords;//总条数
	private int currentPage;//当前页
	private int pageSize = 10;//页面条数
	
	
	
	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

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
		if (pageSize <= 0) {
			throw new IllegalArgumentException("pageSize must be >= 0");
		}
		
		this.pageSize = pageSize;
	}
	
	public int getStartIndex() {
		return pageSize * (currentPage - 1);
	}
	
	public int getTotalPages() {
		return (int) Math.ceil(totalRecords / (double)pageSize);
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
}
