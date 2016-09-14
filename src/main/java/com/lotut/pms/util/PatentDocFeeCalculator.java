package com.lotut.pms.util;

import com.lotut.pms.domain.PatentDoc;

public abstract class PatentDocFeeCalculator {
	protected static double MULTIPLE_APP_PERSON_DISCOUNT_RATE = 0.3;
	protected static double SINGLE_APP_PERSON_DISCOUNT_RATE = 0.15;
	protected static double NO_DISCOUNT_RATE = 1.0;
	
	protected PatentDoc doc;
	
	public int clac() {
		return calcApplyFee() + calcPrintFee() + calcCheckFee() + calcServiceFee();
	}
	
	protected int calcApplyFee() {
		return (int) (getApplyFee() * getDiscountRate());
	}
	
	protected abstract int getApplyFee();
	
	protected int calcPrintFee() {
		return 0;
	}
	
	protected int calcCheckFee() {
		return 0;
	}
	
	protected abstract int calcServiceFee();
	
	private boolean isMultipleAppPerson() {
		return true;
	}
	
	private boolean shouldReduceFee() {
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

class InventPatentDocFeeCalcultor extends PatentDocFeeCalculator {
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
	protected int calcCheckFee() {
		return (int) (CHECK_FEE * getDiscountRate());
	}
	
	@Override
	protected int calcServiceFee() {
		return SERVICE_FEE;
	}
	
	@Override
	protected int calcPrintFee() {
		return PRINT_FEE;
	}
}

class PracticalPatentDocFeeCalcultor extends PatentDocFeeCalculator {
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
	protected int calcServiceFee() {
		return SERVICE_FEE;
	}
	
}

class InterfacePatentDocFeeCalcultor extends PatentDocFeeCalculator {
	private static int APPLY_FEE = 500;
	private static int SERVICE_FEE = 300;
	
	public InterfacePatentDocFeeCalcultor(PatentDoc doc) {
		this.doc = doc;
	}
	
	@Override
	protected int getApplyFee() {
		return APPLY_FEE;
	}

	@Override
	protected int calcServiceFee() {
		return SERVICE_FEE;
	}
	
}

class PatentDocFeeCalculatorFactory {
	public PatentDocFeeCalculator getPatentDocFeeCalculator(PatentDoc doc) {
		if (doc.getPatentType() == 1) {
			return new InventPatentDocFeeCalcultor(doc);
		} else if (doc.getPatentType() == 2) {
			return new PracticalPatentDocFeeCalcultor(doc);
		}
		
		return new InterfacePatentDocFeeCalcultor(doc);
	}
}