package com.lotut.pms.domain;


import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.bson.types.ObjectId;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class Patent {
	private long patentId;
	private ObjectId objectId;
	private String appNo;
	private String name;
	private String publishNo;
	private PatentType patentType;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date appDate;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date publishDate;
	private String appPerson;
	private String inventPerson;
	private PatentStatus patentStatus;
	private String patentStatusText;
	private String internalCode;
	private int ownerId;
	private String proxyOrg;
	private int transactionStatus;
	private List<User> shareUsers;
	private Timestamp createTime;
	private SalePatentGood salePatentGood;
	private int isWithinMonth;

	
	public SalePatentGood getSalePatentGood() {
		return salePatentGood;
	}

	public void setSalePatentGood(SalePatentGood salePatentGood) {
		this.salePatentGood = salePatentGood;
	}

	
	public int getIsWithinMonth() {
		return isWithinMonth;
	}

	public void setIsWithinMonth(int isWithinMonth) {
		this.isWithinMonth = isWithinMonth;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public int getTransactionStatus() {
		return transactionStatus;
	}

	public void setTransactionStatus(int transactionStatus) {
		this.transactionStatus = transactionStatus;
	}

	public String getPublishNo() {
		return publishNo;
	}

	public void setPublishNo(String publishNo) {
		this.publishNo = publishNo;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public String getProxyOrg() {
		return proxyOrg;
	}

	public void setProxyOrg(String proxyOrg) {
		this.proxyOrg = proxyOrg;
	}


	
	public Patent(long patentId) {
		this.patentId = patentId;
	}
	
	public Patent() {
		
	}
	
	public Patent(String appNo, String name, String appPerson, int patentType) {
		this.appNo = appNo;
		this.name =  name;
		this.appPerson = appPerson;		
		this.patentType = new PatentType(patentType);	   
	}
	
	public Patent(String appNo, String name, String appPerson, Date appDate, int patentType, int patentStatus,String patentStatusText) {
		this.appNo = appNo;
		this.name =  name;
		this.appPerson = appPerson;
		this.appDate = appDate;
		this.patentType = new PatentType(patentType);
	    this.patentStatus = new PatentStatus(patentStatus);
	    this.patentStatusText = patentStatusText;
	}
	
	public String getFirstAppPerson() {
		if (this.appPerson != null) {
			String[] appPersons = this.appPerson.split(";");
			return appPersons[0];
		}
		
		return "";
	}
	
	public String getShareUsersAsString() {
		if (this.shareUsers != null) {
			return String.join(";", this.shareUsers.stream().map(User::getUsername).collect(Collectors.toList()));
		}
		
		return "";
	}

	public List<User> getShareUsers() {
		return shareUsers;
	}

	public void setShareUsers(List<User> shareUsers) {
		this.shareUsers = shareUsers;
	}


	public long getPatentId() {
		return patentId;
	}

	public void setPatentId(long patentId) {
		this.patentId = patentId;
	}

	public String getAppNo() {
		if (appNo != null) {
			return appNo.trim();
		}
		
		return appNo;
	}

	public void setAppNo(String appNo) {
		this.appNo = appNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public PatentType getPatentType() {
		return patentType;
	}

	public void setPatentType(PatentType patentType) {
		this.patentType = patentType;
	}

	public Date getAppDate() {
		return appDate;
	}

	public void setAppDate(Date appDate) {
		this.appDate = appDate;
	}

	public String getAppPerson() {
		return appPerson;
	}

	public void setAppPerson(String appPerson) {
		this.appPerson = appPerson;
	}

	public String getInventPerson() {
		return inventPerson;
	}

	public void setInventPerson(String inventPerson) {
		this.inventPerson = inventPerson;
	}

	public PatentStatus getPatentStatus() {
		return patentStatus;
	}

	public void setPatentStatus(PatentStatus patentStatus) {
		this.patentStatus = patentStatus;
	}

	public String getInternalCode() {
		return internalCode;
	}

	public void setInternalCode(String internalCode) {
		this.internalCode = internalCode;
	}

	public int getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}
	
	@Override
	public boolean equals(Object other) {
		if (other == null) {
			return false;
		}
		
		if (other == this) {
			return true;
		}
		
		if (!(other instanceof Patent)) {
			return false;
		}
		
		Patent anotherPatent = (Patent) other;
		
		return this.patentId == anotherPatent.patentId;
	}
	
	@Override
	public int hashCode() {
		return (int) this.patentId;
	}

	public String getPatentStatusText() {
		if(patentStatusText==null && patentStatus != null){
			return patentStatus.getStatusDescription();
		}
		return patentStatusText;
	}

	public void setPatentStatusText(String patentStatusText) {
		this.patentStatusText = patentStatusText;
	}

	public ObjectId getObjectId() {
		return objectId;
	}

	public void setObjectId(ObjectId objectId) {
		this.objectId = objectId;
	}
	
	
	
}
