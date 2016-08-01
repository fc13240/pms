package com.lotut.pms.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class Attachment {
	private long attachmentId;
	private int userId;
	private long signId;
	private String  patentUrl1;
	private String  patentUrl2;
	private String  patentUrl3;
	private String  patentUrl4;
	private String  patentUrl5;
	private String state;
	private String label;
	
	
	public long getAttachmentId() {
		return attachmentId;
	}
	public void setAttachmentId(long attachmentId) {
		this.attachmentId = attachmentId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public long getSignId() {
		return signId;
	}
	public void setSignId(long signId) {
		this.signId = signId;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getPatentUrl1() {
		return patentUrl1;
	}
	public void setPatentUrl1(String patentUrl1) {
		this.patentUrl1 = patentUrl1;
	}
	public String getPatentUrl2() {
		return patentUrl2;
	}
	public void setPatentUrl2(String patentUrl2) {
		this.patentUrl2 = patentUrl2;
	}
	public String getPatentUrl3() {
		return patentUrl3;
	}
	public void setPatentUrl3(String patentUrl3) {
		this.patentUrl3 = patentUrl3;
	}
	public String getPatentUrl4() {
		return patentUrl4;
	}
	public void setPatentUrl4(String patentUrl4) {
		this.patentUrl4 = patentUrl4;
	}
	public String getPatentUrl5() {
		return patentUrl5;
	}
	public void setPatentUrl5(String patentUrl5) {
		this.patentUrl5 = patentUrl5;
	}
	
	
	
	
}
