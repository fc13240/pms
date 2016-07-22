package com.lotut.pms.domain;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class PatentDoc {
	private long patentDocsId;
	private String appNo;
	private int userId;
	private int patent_type;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date createTime;
	private Timestamp lastUpdateTime;
	private String name;
	private String techDomain;
	private String backgoundTech;
	private String contentProblem;
	private String contentRight;
	private String contentEffect;
	private String implementWay;
	private String rightClaim;
	private String abstractDescription;
	public long getPatentDocsId() {
		return patentDocsId;
	}
	public void setPatentDocsId(long patentDocsId) {
		this.patentDocsId = patentDocsId;
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
	public int getPatent_type() {
		return patent_type;
	}
	public void setPatent_type(int patent_type) {
		this.patent_type = patent_type;
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
	public String getContentProblem() {
		return contentProblem;
	}
	public void setContentProblem(String contentProblem) {
		this.contentProblem = contentProblem;
	}
	public String getContentRight() {
		return contentRight;
	}
	public void setContentRight(String contentRight) {
		this.contentRight = contentRight;
	}
	public String getContentEffect() {
		return contentEffect;
	}
	public void setContentEffect(String contentEffect) {
		this.contentEffect = contentEffect;
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
