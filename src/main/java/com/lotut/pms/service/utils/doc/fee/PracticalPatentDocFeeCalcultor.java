package com.lotut.pms.service.utils.doc.fee;

import com.lotut.pms.domain.PatentDoc;

public class PracticalPatentDocFeeCalcultor extends PatentDocFeeCalculator {
	private static int APPLY_FEE = 500;
	private static int SERVICE_FEE = 700;
	
	public PracticalPatentDocFeeCalcultor(PatentDoc doc) {
		this.doc = doc;
	}
	
	@Override
	protected int getApplyFee() {
		return APPLY_FEE;
	}
	
	@Override
	public int calcServiceFee() {
		return SERVICE_FEE;
	}
	
}