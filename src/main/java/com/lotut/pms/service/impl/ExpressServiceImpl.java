package com.lotut.pms.service.impl;

import com.lotut.pms.dao.ExpressDao;
import com.lotut.pms.domain.Express;
import com.lotut.pms.service.ExpressService;

public class ExpressServiceImpl implements ExpressService{
	private ExpressDao expressDao;

	public ExpressServiceImpl(ExpressDao expressDao) {
		this.expressDao = expressDao;
	}

	@Override
	public void addExpress(Express express) {
		
	}

	@Override
	public void confirmSendOff(Express express) {
		
	}
}
