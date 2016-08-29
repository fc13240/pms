package com.lotut.pms.domain;

public class PatentDocAppPerson {
	private long personId;
	private long patentDocId;
	private String name;
	private String idNumber;
	private String postcodeAddress;
	private String otherInformation;
	private String transactionIdentity;
	private String feeReduceTransactionStatus;
	private String transactionYear;
	private int userId;
	
	public String getOtherInformation() {
		return otherInformation;
	}
	public void setOtherInformation(String otherInformation) {
		this.otherInformation = otherInformation;
	}
	public String getTransactionIdentity() {
		return transactionIdentity;
	}
	public void setTransactionIdentity(String transactionIdentity) {
		this.transactionIdentity = transactionIdentity;
	}
	public String getFeeReduceTransactionStatus() {
		return feeReduceTransactionStatus;
	}
	public void setFeeReduceTransactionStatus(String feeReduceTransactionStatus) {
		this.feeReduceTransactionStatus = feeReduceTransactionStatus;
	}
	public String getTransactionYear() {
		return transactionYear;
	}
	public void setTransactionYear(String transactionYear) {
		this.transactionYear = transactionYear;
	}
	public long getPersonId() {
		return personId;
	}
	public void setPersonId(long personId) {
		this.personId = personId;
	}
	public long getPatentDocId() {
		return patentDocId;
	}
	public void setPatent_doc_id(long patentDocId) {
		this.patentDocId = patentDocId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getPostcodeAddress() {
		return postcodeAddress;
	}
	public void setPostcodeAddress(String postcodeAddress) {
		this.postcodeAddress = postcodeAddress;
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUser_id(int userId) {
		this.userId = userId;
	}
}
