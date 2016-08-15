package com.lotut.pms.domain;

public class CommonProposer {
	private int proposerId;
	private String proposerName;
	private int proposerType;
	private String proposerTypeName;
	private String proposerPeopleNubmer;
	private String postcodeAddress;
	private String recordStatus;
	private String otherInfo;
	private int userId;
	
	public int getUseId() {
		return userId;
	}
	public void setUseId(int useId) {
		this.userId = useId;
	}
	public String getProposerName() {
		return proposerName;
	}
	public void setProposerName(String proposerName) {
		this.proposerName = proposerName;
	}
	public String getProposerPeopleNubmer() {
		return proposerPeopleNubmer;
	}
	public void setProposerPeopleNubmer(String proposerPeopleNubmer) {
		this.proposerPeopleNubmer = proposerPeopleNubmer;
	}
	public String getPostcodeAddress() {
		return postcodeAddress;
	}
	public void setPostcodeAddress(String postcodeAddress) {
		this.postcodeAddress = postcodeAddress;
	}
	public String getRecordStatus() {
		return recordStatus;
	}
	public void setRecordStatus(String recordStatus) {
		this.recordStatus = recordStatus;
	}
	public String getOtherInfo() {
		return otherInfo;
	}
	public void setOtherInfo(String otherInfo) {
		this.otherInfo = otherInfo;
	}
	
	public int getProposerType() {
		return proposerType;
	}
	public void setProposerType(int proposerType) {
		this.proposerType = proposerType;
	}
	public String getProposerTypeName() {
		return proposerTypeName;
	}
	public void setProposerTypeName(String proposerTypeName) {
		this.proposerTypeName = proposerTypeName;
	}
	public int getProposerId() {
		return proposerId;
	}
	public void setProposerId(int proposerId) {
		this.proposerId = proposerId;
	}
	
}
