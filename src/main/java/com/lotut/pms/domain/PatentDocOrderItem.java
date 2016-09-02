package com.lotut.pms.domain;

public class PatentDocOrderItem {
	private int id;
	private long orderId;
	private long patenDocId;
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
	public long getPatenDocId() {
		return patenDocId;
	}
	public void setPatenDocId(long patenDocId) {
		this.patenDocId = patenDocId;
	}
	
	
}
