package com.lotut.pms.domain;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Order {
	private long id;
	private OrderStatus orderStatus;
	@NotNull
	@Size(max=Integer.MAX_VALUE, min=0)
	private int postAddress;
	@NotNull
	@Size(max=Integer.MAX_VALUE, min=1)
	private int amount;
	private int user;
	private User processUser;
	private boolean received;
	private String expressCompany;
	private Date sendTime;
	private String courier;
	private String courierPhone;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public OrderStatus getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}
	public int getPostAddress() {
		return postAddress;
	}
	public void setPostAddress(int postAddress) {
		this.postAddress = postAddress;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getUser() {
		return user;
	}
	public void setUser(int user) {
		this.user = user;
	}
	public User getProcessUser() {
		return processUser;
	}
	public void setProcessUser(User processUser) {
		this.processUser = processUser;
	}
	public boolean isReceived() {
		return received;
	}
	public void setReceived(boolean received) {
		this.received = received;
	}
	public String getExpressCompany() {
		return expressCompany;
	}
	public void setExpressCompany(String expressCompany) {
		this.expressCompany = expressCompany;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public String getCourier() {
		return courier;
	}
	public void setCourier(String courier) {
		this.courier = courier;
	}
	public String getCourierPhone() {
		return courierPhone;
	}
	public void setCourierPhone(String courierPhone) {
		this.courierPhone = courierPhone;
	}
}
