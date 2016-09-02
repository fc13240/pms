package com.lotut.pms.domain;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

public class PatentDocOrder {
	private long id;
	private int orderStatus;
	private int amount;
	private User owner;
	private Date createTime;
	private Date payTime;
	private PaymentMethod paymentMethod;
	private List<PatentDoc> patentDocList;
	
	
	
	public List<PatentDoc> getPatentDocList() {
		return patentDocList;
	}
	public void setPatentDocList(List<PatentDoc> patentDocList) {
		this.patentDocList = patentDocList;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}

	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public User getOwner() {
		return owner;
	}
	public void setOwner(User owner) {
		this.owner = owner;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getPayTime() {
		return payTime;
	}
	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}
	public PaymentMethod getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(PaymentMethod paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	
	
}
