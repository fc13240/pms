package com.lotut.pms.domain;

import java.util.Date;

public class Order {
	private int id;
	private OrderStatus orderStatus;
	private int postAddress;
	private int amount;
	private int user;
	private int processUser;
	private boolean received;
	private String expressCompany;
	private Date sendTime;
	private String courier;
	private String courierPhone;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public int getProcessUser() {
		return processUser;
	}
	public void setProcessUser(int processUser) {
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
