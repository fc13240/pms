package com.lotut.pms.domain;

import java.sql.Timestamp;

public class PatentDocumentTemplate {
	private int template_id;
	private String content;
	private String templateTitle;
	private PatentType patentType;
	private PatentDocSectionType patentDocSectionType;
	private Timestamp createTime;
	private Timestamp lastUpdateTime;
	private int creatorId;
	
	public int getTemplate_id() {
		return template_id;
	}
	public void setTemplate_id(int template_id) {
		this.template_id = template_id;
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
	
	
}
