package com.lotut.pms.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class NoticeSearchCondition {
	private int userId;
	private Integer patentType;
	private Integer noticeProcessStatus;
	private Integer noticeType;
	private Integer paperApplyType;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date startAppDate;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date endAppDate;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date startDispatchDate;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date endDispatchDate;
	private String keywordType;
	private String keyword;

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

	public Integer getNoticeProcessStatus() {
		return noticeProcessStatus;
	}

	public void setNoticeProcessStatus(Integer noticeProcessStatus) {
		this.noticeProcessStatus = noticeProcessStatus;
	}

	public Integer getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(Integer noticeType) {
		this.noticeType = noticeType;
	}

	public Integer getPaperApplyType() {
		return paperApplyType;
	}

	public void setPaperApplyType(Integer paperApplyType) {
		this.paperApplyType = paperApplyType;
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

	public Date getStartDispatchDate() {
		return startDispatchDate;
	}

	public void setStartDispatchDate(Date startDispatchDate) {
		this.startDispatchDate = startDispatchDate;
	}

	public Date getEndDispatchDate() {
		return endDispatchDate;
	}

	public void setEndDispatchDate(Date endDispatchDate) {
		this.endDispatchDate = endDispatchDate;
	}

	public String getKeywordType() {
		return keywordType;
	}

	public void setKeywordType(String keywordType) {
		this.keywordType = keywordType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
