package com.lotut.pms.domain;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class Patent {
	private long patentId;
	private String appNo;
	private String name;
	private PatentType patentType;
	private Date appDate;
	private String appPerson;
	private String inventPerson;
	private PatentStatus patentStatus;
	private String internalCode;
	private int ownerId;
	private List<User> shareUsers;
	
	public Patent() {
		
	}
	
	public Patent(String appNo, String name, String appPerson, Date appDate, int patentType, int patentStatus) {
		this.appNo = appNo;
		this.name =  name;
		this.appPerson = appPerson;
		this.appDate = appDate;
		this.patentType = new PatentType(patentType);
		this.patentStatus = new PatentStatus(patentStatus);
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
}
