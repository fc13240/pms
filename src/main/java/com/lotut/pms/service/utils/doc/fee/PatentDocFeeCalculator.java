package com.lotut.pms.service.utils.doc.fee;

import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.PatentDoc;

public abstract class PatentDocFeeCalculator {
	protected static double MULTIPLE_APP_PERSON_DISCOUNT_RATE = 0.3;
	protected static double SINGLE_APP_PERSON_DISCOUNT_RATE = 0.15;
	protected static double NO_DISCOUNT_RATE = 1.0;
	
	protected PatentDoc doc;
	
	public int clac() {
		return calcApplyFee() + calcPrintFee() + calcCheckFee() + calcServiceFee();
	}
	
	public int calcApplyFee() {
		return (int) (getApplyFee() * getDiscountRate());
	}
	
	protected abstract int getApplyFee();
	
	public int calcPrintFee() {
		return 0;
	}
	
	public int calcCheckFee() {
		return 0;
	}
	
	public abstract int calcServiceFee();
	
	private boolean isMultipleAppPerson( ) {
		return doc.getCommonAppPersons().size()>1;
	}
	
	private boolean shouldReduceFee() {
		for(CommonAppPerson commonAppPerson:doc.getCommonAppPersons()){
			String feeReduceTransactionStatus=commonAppPerson.getFeeReduceTransactionStatus();
			if(!feeReduceTransactionStatus.equals("备案成功")){
				return false;
			}
		}
		return true;
	}
	
	protected double getDiscountRate() {
		if (shouldReduceFee() && isMultipleAppPerson()) {
			return MULTIPLE_APP_PERSON_DISCOUNT_RATE;
		} else if (shouldReduceFee()) {
			return SINGLE_APP_PERSON_DISCOUNT_RATE;
		}
		
		return NO_DISCOUNT_RATE;
	}
	
}