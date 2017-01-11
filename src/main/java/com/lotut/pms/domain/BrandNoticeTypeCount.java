package com.lotut.pms.domain;

public class BrandNoticeTypeCount {
	private int noticeTypeId;
	private String noticeTypeDescription;
	private Integer noticeCount;
	
	
	
	public BrandNoticeTypeCount() {
	}
	
	
	public BrandNoticeTypeCount(int noticeTypeId, String noticeTypeDescription, Integer noticeCount) {
		this.noticeTypeId = noticeTypeId;
		this.noticeTypeDescription = noticeTypeDescription;
		this.noticeCount = noticeCount;
	}


	public int getNoticeTypeId() {
		return noticeTypeId;
	}

	public void setNoticeTypeId(int noticeTypeId) {
		this.noticeTypeId = noticeTypeId;
	}

	public String getNoticeTypeDescription() {
		return noticeTypeDescription;
	}

	public void setNoticeTypeDescription(String noticeTypeDescription) {
		this.noticeTypeDescription = noticeTypeDescription;
	}

	public Integer getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(Integer noticeCount) {
		this.noticeCount = noticeCount;
	}

	
}
