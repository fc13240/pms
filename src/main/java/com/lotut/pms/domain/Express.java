package com.lotut.pms.domain;

import java.util.Date;

public class Express {
	private long expressId;
	private User sender;
	private User receiver;
	private String expressRemark;
	private int province;
	private long city;
	private long district;
	private String detailAddress;
	private String expressCompany;
	private String expressNo;
	private Date createTime;
	private Date sendTime;
	private Date signTime;
	private ExpressStatus expressStatus;
	
	
	public long getExpressId() {
		return expressId;
	}
	public void setExpressId(long expressId) {
		this.expressId = expressId;
	}
	public User getSender() {
		return sender;
	}
	public void setSender(User sender) {
		this.sender = sender;
	}
	public User getReceiver() {
		return receiver;
	}
	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}
	public String getExpressRemark() {
		return expressRemark;
	}
	public void setExpressRemark(String expressRemark) {
		this.expressRemark = expressRemark;
	}
	public int getProvince() {
		return province;
	}
	public void setProvince(int province) {
		this.province = province;
	}
	public long getCity() {
		return city;
	}
	public void setCity(long city) {
		this.city = city;
	}
	public long getDistrict() {
		return district;
	}
	public void setDistrict(long district) {
		this.district = district;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getExpressCompany() {
		return expressCompany;
	}
	public void setExpressCompany(String expressCompany) {
		this.expressCompany = expressCompany;
	}
	public String getExpressNo() {
		return expressNo;
	}
	public void setExpressNo(String expressNo) {
		this.expressNo = expressNo;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public Date getSignTime() {
		return signTime;
	}
	public void setSignTime(Date signTime) {
		this.signTime = signTime;
	}
	public ExpressStatus getExpressStatus() {
		return expressStatus;
	}
	public void setExpressStatus(ExpressStatus expressStatus) {
		this.expressStatus = expressStatus;
	}
	
	
	
	
	
}
