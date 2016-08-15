package com.lotut.pms.domain;

public class CommonInventor {
	private int InventorId;
	private String InventorName;
	private String InventorNumber;
	private String InventorNationality;
	private	int InventorMobile;
	private String  InventorEmail;
	private String  InventorComment;
	private int userId;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getInventorId() {
		return InventorId;
	}
	public void setInventorId(int inventorId) {
		InventorId = inventorId;
	}
	public String getInventorName() {
		return InventorName;
	}
	public void setInventorName(String inventorName) {
		InventorName = inventorName;
	}
	public String getInventorNationality() {
		return InventorNationality;
	}
	public void setInventorNationality(String inventorNationality) {
		InventorNationality = inventorNationality;
	}
	public int getInventorMobile() {
		return InventorMobile;
	}
	public void setInventorMobile(int inventorMobile) {
		InventorMobile = inventorMobile;
	}
	public String getInventorEmail() {
		return InventorEmail;
	}
	public void setInventorEmail(String inventorEmail) {
		InventorEmail = inventorEmail;
	}
	public String getInventorComment() {
		return InventorComment;
	}
	public void setInventorComment(String inventorComment) {
		InventorComment = inventorComment;
	}
	public String getInventorNumber() {
		return InventorNumber;
	}
	public void setInventorNumber(String inventorNumber) {
		InventorNumber = inventorNumber;
	}
	

}
