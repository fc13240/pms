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
	private String techDomain;
	private String backgoundTech;
	private String content;
	private String implementWay;
	private String rightClaim;
	private String abstractDescription;
	private String abstractImg;
	private String patentDocAttachmentFile;
	private String patentDocUrl;
	
	
	
	public String getPatentDocUrl() {
		return patentDocUrl;
	}
	public void setPatentDocUrl(String patentDocUrl) {
		this.patentDocUrl = patentDocUrl;
	}
	public String getPatentDocAttachmentFile() {
		return patentDocAttachmentFile;
	}
	public void setPatentDocAttachmentFile(String patentDocAttachmentFile) {
		this.patentDocAttachmentFile = patentDocAttachmentFile;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getTechDomain() {
		return techDomain;
	}
	public void setTechDomain(String techDomain) {
		this.techDomain = techDomain;
	}
	public String getBackgoundTech() {
		return backgoundTech;
	}
	public void setBackgoundTech(String backgoundTech) {
		this.backgoundTech = backgoundTech;
	}
	
	public String getImplementWay() {
		return implementWay;
	}
	public void setImplementWay(String implementWay) {
		this.implementWay = implementWay;
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

	
	
}
