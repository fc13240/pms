package com.lotut.pms.service.utils.doc.fee;

import com.lotut.pms.domain.PatentDoc;

public class PatentDocFeeCalculatorFactory {
	public static PatentDocFeeCalculator getPatentDocFeeCalculator(PatentDoc doc) {
		if (doc.getPatentType() == 1) {
			return new InventPatentDocFeeCalcultor(doc);
		} else if (doc.getPatentType() == 2) {
			return new PracticalPatentDocFeeCalcultor(doc);
		}
		
		return new InterfacePatentDocFeeCalcultor(doc);
	}

}