package com.lotut.pms.domain;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class PatentDoc {
	private long patentDocId;
	private String appNo;
	private int userId;
	private int patentType;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date createTime;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Timestamp lastUpdateTime;
	private String name;
	private String manual;
	private String rightClaim;
	private String abstractDescription;
	private String abstractImg;
	private String patentDocAttachmentFile;
	private String patentDocUrl;
	private PatentDocStatus patentDocStatus;
	private String contactPerson;
	
	
	

	public PatentDocStatus getPatentDocStatus() {
		return patentDocStatus;
	}
	public void setPatentDocStatus(PatentDocStatus patentDocStatus) {
		this.patentDocStatus = patentDocStatus;
	}
	public String getPatentDocUrl() {
		return patentDocUrl;
	}
	public void setPatentDocUrl(String patentDocUrl) {
		this.patentDocUrl = patentDocUrl;
	}

	public String getManual() {
		return manual;
	}
	public void setManual(String manual) {
		this.manual = manual;

	}
	public String getPatentDocAttachmentFile() {
		return patentDocAttachmentFile;
	}
	public void setPatentDocAttachmentFile(String patentDocAttachmentFile) {
		this.patentDocAttachmentFile = patentDocAttachmentFile;
	}

	public String getAbstractImg() {
		return abstractImg;
	}
	public void setAbstractImg(String abstractImg) {
		this.abstractImg = abstractImg;
	}
	public long getPatentDocId() {
		return patentDocId;
	}
	public void setPatentDocId(long patentDocId) {
		this.patentDocId = patentDocId;
	}
	public String getAppNo() {
		return appNo;
	}
	public void setAppNo(String appNo) {
		this.appNo = appNo;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getPatentType() {
		return patentType;
	}
	public void setPatentType(int patentType) {
		this.patentType = patentType;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Timestamp getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(Timestamp lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getRightClaim() {
		return rightClaim;
	}
	public void setRightClaim(String rightClaim) {
		this.rightClaim = rightClaim;
	}
	public String getAbstractDescription() {
		return abstractDescription;
	}
	public void setAbstractDescription(String abstractDescription) {
		this.abstractDescription = abstractDescription;
	}
	public String getContactPerson() {
		return contactPerson;
	}
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	
	
}
