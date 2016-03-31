package com.lotut.pms.domain;

public class FeePaymentStatus {
	private int paymentStatusId;
	private String payementStatusDescription;

	public int getPaymentStatusId() {
		return paymentStatusId;
	}

	public void setPaymentStatusId(int paymentStatusId) {
		this.paymentStatusId = paymentStatusId;
	}

	public String getPayementStatusDescription() {
		return payementStatusDescription;
	}

	public void setPayementStatusDescription(String payementStatusDescription) {
		this.payementStatusDescription = payementStatusDescription;
	}

}
