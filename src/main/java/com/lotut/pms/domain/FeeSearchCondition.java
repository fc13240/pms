package com.lotut.pms.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class FeeSearchCondition {
	private int userId;
	private Integer patentType;
	private Integer paymentStatus;
	private Integer patentStatus;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date startDeadline;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date endDeadline;
	private String keyword;
	private Page page;
	private Integer deadlineStatus;
	private static DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	public Integer getPatentType() {
		return patentType;
	}

	public void setPatentType(Integer patentType) {
		this.patentType = patentType;
	}

	public Integer getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(Integer paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public Integer getPatentStatus() {
		return patentStatus;
	}

	public void setPatentStatus(Integer patentStatus) {
		this.patentStatus = patentStatus;
	}

	public Date getStartDeadline() {
		return startDeadline;
	}

	public void setStartDeadline(Date startDeadline) {
		this.startDeadline = startDeadline;
	}

	public Date getEndDeadline() {
		return endDeadline;
	}

	public void setEndDeadline(Date endDeadline) {
		this.endDeadline = endDeadline;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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
	
	public Integer getDeadlineStatus() {
		return deadlineStatus;
	}

	public void setDeadlineStatus(Integer deadlineStatus) {
		this.deadlineStatus = deadlineStatus;
	}

	@Override
	public String toString() {
		String patentTypeStr = patentType == null ? "" : patentType.toString();
		String paymentStatusStr = paymentStatus == null ? "" : paymentStatus.toString();
		String patentStatusStr = patentStatus == null ? "" : patentStatus.toString();
		String startDeadlineStr = startDeadline == null ? "" : formatter.format(startDeadline);
		String endDeadlineStr = endDeadline == null ? "" : formatter.format(endDeadline);
		String keywordStr = keyword == null ? "" : keyword;
		String deadlineStatusStr = deadlineStatus == null ? "" : deadlineStatus.toString();
		return 	"&patentType="+patentTypeStr+
				"&paymentStatus="+paymentStatusStr+"&patentStatus="+patentStatusStr+"&startDeadline="
				+startDeadlineStr+"&endDeadline="+endDeadlineStr+"&keyword="+keywordStr+"&deadlineStatus="+deadlineStatusStr;
	}
}
