package com.lotut.pms.service.utils.doc.fee;

import com.lotut.pms.domain.PatentDoc;

public class InventPatentDocFeeCalcultor extends PatentDocFeeCalculator {
	private static int APPLY_FEE = 900;
	private static int SERVICE_FEE = 1500;
	private static int PRINT_FEE = 50;
	private static int CHECK_FEE = 2500;
	
	public InventPatentDocFeeCalcultor(PatentDoc doc) {
		this.doc = doc;
	}
	
	@Override
	protected int getApplyFee() {
		return APPLY_FEE;
	}
	
	@Override
	public int calcCheckFee() {
		return (int) (CHECK_FEE * getDiscountRate());
	}
	
	@Override
	public int calcServiceFee() {
		return SERVICE_FEE;
	}
	
	@Override
	public int calcPrintFee() {
		return PRINT_FEE;
	}
}