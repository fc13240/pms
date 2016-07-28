package com.lotut.pms.domain;

import java.sql.Timestamp;

public class PatentDocumentTemplate {
	private int templateId;
	private String content;
	private String contentProblem;
	private String contentRight;
	private String contentEffect;
	private String templateTitle;
	private PatentType patentType;
	private PatentDocSectionType patentDocSectionType;
	private Timestamp createTime;
	private Timestamp lastUpdateTime;
	private int creatorId;
	
	public int getTemplateId() {
		return templateId;
	}
	public void setTemplateId(int templateId) {
		this.templateId = templateId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTemplateTitle() {
		return templateTitle;
	}
	public void setTemplateTitle(String templateTitle) {
		this.templateTitle = templateTitle;
	}
	public PatentType getPatentType() {
		return patentType;
	}
	public void setPatentType(PatentType patentType) {
		this.patentType = patentType;
	}
	public PatentDocSectionType getPatentDocSectionType() {
		return patentDocSectionType;
	}
	public void setPatentDocSectionType(PatentDocSectionType patentDocSectionType) {
		this.patentDocSectionType = patentDocSectionType;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public Timestamp getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(Timestamp lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	public int getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
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
	
	
	@Override
	public String toString() {
		return "{templateId"+":" + templateId + ", content"+":" + content + ", contentProblem="
				+ contentProblem + ", contentRight=" + contentRight + ", contentEffect=" + contentEffect
				+ ", templateTitle=" + templateTitle + ", patentType=" + patentType + ", patentDocSectionType="
				+ patentDocSectionType + ", createTime=" + createTime + ", lastUpdateTime=" + lastUpdateTime
				+ ", creatorId=" + creatorId + "}";
	}
	
	
	
}
