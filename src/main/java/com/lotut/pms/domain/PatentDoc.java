package com.lotut.pms.domain;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.stream.Collectors;

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
	private PatentDocProxyStatus patentDocProxyStatus;
	private int contactId;
	private String otherInformation;
	private String attachmentUrl;
	private long price;
	private int feeStatus;
	private List<User> shareUsers;
	private String internalCode;
	public PatentDocProxyStatus getPatentDocProxyStatus() {
		return patentDocProxyStatus;
	}
	public void setPatentDocProxyStatus(PatentDocProxyStatus patentDocProxyStatus) {
		this.patentDocProxyStatus = patentDocProxyStatus;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public int getFeeStatus() {
		return feeStatus;
	}
	public void setFeeStatus(int feeStatus) {
		this.feeStatus = feeStatus;
	}
	public String getOtherInformation() {
		return otherInformation;
	}
	public void setOtherInformation(String otherInformation) {
		this.otherInformation = otherInformation;
	}
	public String getAttachmentUrl() {
		return attachmentUrl;
	}
	public void setAttachmentUrl(String attachmentUrl) {
		this.attachmentUrl = attachmentUrl;
	}
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
	public int getContactId() {
		return contactId;
	}
	public void setContactId(int contactId) {
		this.contactId = contactId;
	}

	public String getShareUsersAsString() {
		if (this.shareUsers != null) {
			return String.join(";", this.shareUsers.stream().map(User::getUsername).collect(Collectors.toList()));
		}
		
		return "";
	}

	public String getInternalCode() {
		return internalCode;
	}
	public void setInternalCode(String internalCode) {
		this.internalCode = internalCode;
	}
	public List<User> getShareUsers() {
		return shareUsers;
	}

	public void setShareUsers(List<User> shareUsers) {
		this.shareUsers = shareUsers;
	}
	
	
}
