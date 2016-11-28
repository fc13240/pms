package com.lotut.pms.domain;

import java.util.Date;

public class WeChatOrder {
	private int id;
	private String wechatOrderId;
	private String wechatName;
	private int totalFee;
	private Date payTime;
	private Brand brand;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWechatOrderId() {
		return wechatOrderId;
	}
	public void setWechatOrderId(String wechatOrderId) {
		this.wechatOrderId = wechatOrderId;
	}
	public String getWechatName() {
		return wechatName;
	}
	public void setWechatName(String wechatName) {
		this.wechatName = wechatName;
	}
	
	public int getTotalFee() {
		return totalFee;
	}
	public void setTotalFee(int totalFee) {
		this.totalFee = totalFee;
	}
	public Date getPayTime() {
		return payTime;
	}
	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	
	

}
