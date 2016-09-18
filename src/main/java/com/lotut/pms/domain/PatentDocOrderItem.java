package com.lotut.pms.domain;

public class PatentDocOrderItem {
	private int id;
	private long orderId;
	private long patentDocId;
	private int applyFee;
	private int printFee;
	private int checkFee;
	private int serviceFee;
	
	public int getApplyFee() {
		return applyFee;
	}
	public void setApplyFee(int applyFee) {
		this.applyFee = applyFee;
	}
	public int getPrintFee() {
		return printFee;
	}
	public void setPrintFee(int printFee) {
		this.printFee = printFee;
	}
	public int getCheckFee() {
		return checkFee;
	}
	public void setCheckFee(int checkFee) {
		this.checkFee = checkFee;
	}
	public int getServiceFee() {
		return serviceFee;
	}
	public void setServiceFee(int serviceFee) {
		this.serviceFee = serviceFee;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	public long getPatentDocId() {
		return patentDocId;
	}
	public void setPatentDocId(long patentDocId) {
		this.patentDocId = patentDocId;
	}
	
	
}
