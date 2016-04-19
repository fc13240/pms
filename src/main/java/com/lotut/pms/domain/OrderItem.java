package com.lotut.pms.domain;

public class OrderItem {
	private int id;
	private long orderId;
	private long feeId;
	
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
	public long getFeeId() {
		return feeId;
	}
	public void setFeeId(long feeId) {
		this.feeId = feeId;
	}
}
