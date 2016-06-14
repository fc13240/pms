package com.lotut.pms.domain.search;

import java.util.Date;

import org.bson.types.ObjectId;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class Patent {
	private ObjectId id;
	private String appNo;
	private String publishNo;
	private String patentName;
	private String patentType;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date publishDate;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Date appDate;
	private String appPerson;
	private String inventPerson;
	private String address;
	private String patentAbstract;
	private String proxyOrg;
	private String proxyPerson;
	private String ipc;
	private String priority;
	private String appType;
	private String status;

	public ObjectId getId() {
		return id;
	}

	public void setId(ObjectId id) {
		this.id = id;
	}

	public String getAppNo() {
		return appNo;
	}

	public void setAppNo(String appNo) {
		this.appNo = appNo;
	}

	public String getPublishNo() {
		return publishNo;
	}

	public void setPublishNo(String publishNo) {
		this.publishNo = publishNo;
	}

	public String getPatentName() {
		return patentName;
	}

	public void setPatentName(String patentName) {
		this.patentName = patentName;
	}

	public String getPatentType() {
		return patentType;
	}

	public void setPatentType(String patentType) {
		this.patentType = patentType;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public Date getAppDate() {
		return appDate;
	}

	public void setAppDate(Date appDate) {
		this.appDate = appDate;
	}

	public String getAppPerson() {
		return appPerson;
	}

	public void setAppPerson(String appPerson) {
		this.appPerson = appPerson;
	}

	public String getInventPerson() {
		return inventPerson;
	}

	public void setInventPerson(String inventPerson) {
		this.inventPerson = inventPerson;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPatentAbstract() {
		return patentAbstract;
	}

	public void setPatentAbstract(String patentAbstract) {
		this.patentAbstract = patentAbstract;
	}

	public String getProxyOrg() {
		return proxyOrg;
	}

	public void setProxyOrg(String proxyOrg) {
		this.proxyOrg = proxyOrg;
	}

	public String getProxyPerson() {
		return proxyPerson;
	}

	public void setProxyPerson(String proxyPerson) {
		this.proxyPerson = proxyPerson;
	}

	public String getIpc() {
		return ipc;
	}

	public void setIpc(String ipc) {
		this.ipc = ipc;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getAppType() {
		return appType;
	}

	public void setAppType(String appType) {
		this.appType = appType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Patent [id=" + id + ", appNo=" + appNo + ", publishNo=" + publishNo + ", patentName=" + patentName
				+ ", patentType=" + patentType + ", publishDate=" + publishDate + ", appDate=" + appDate
				+ ", appPerson=" + appPerson + ", inventPerson=" + inventPerson + ", address=" + address
				+ ", patentAbstract=" + patentAbstract + ", proxyOrg=" + proxyOrg + ", proxyPerson=" + proxyPerson
				+ ", ipc=" + ipc + ", priority=" + priority + ", appType=" + appType + ", status=" + status + "]";
	}
	
	
}
