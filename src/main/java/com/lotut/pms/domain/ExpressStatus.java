package com.lotut.pms.domain;

public class ExpressStatus {
	private int expressStatusId;
	private String expressStatusDesc;
	
	public ExpressStatus() {
		
	}

	public ExpressStatus(int expressStatusId) {
		this.expressStatusId = expressStatusId;
	}

	public int getExpressStatusId() {
		return expressStatusId;
	}

	public void setExpressStatusId(int expressStatusId) {
		this.expressStatusId = expressStatusId;
	}

	public String getExpressStatusDesc() {
		return expressStatusDesc;
	}

	public void setExpressStatusDesc(String expressStatusDesc) {
		this.expressStatusDesc = expressStatusDesc;
	}
	
	
	
	
	
}
