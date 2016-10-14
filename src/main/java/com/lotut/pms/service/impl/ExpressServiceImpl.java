package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.dao.ExpressDao;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Express;
import com.lotut.pms.domain.ExpressSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.service.ExpressService;

public class ExpressServiceImpl implements ExpressService{
	private ExpressDao expressDao;

	public ExpressServiceImpl(ExpressDao expressDao) {
		this.expressDao = expressDao;
	}

	@Override
	public void addExpress(Express express) {
		expressDao.addExpress(express);
	}

	@Override
	public void confirmSendOff(Express express) {
		
	}

	@Override
	public List<Express> getUserSenderExpressListByPage(Page page) {
		return expressDao.getUserSenderExpressListByPage(page);
	}

	@Override
	public int getUserSenderExpressCount(int userId) {
		return expressDao.getUserSenderExpressCount(userId);
	}

	@Override
	public List<Express> getUserReceiverExpressListByPage(Page page) {
		return expressDao.getUserReceiverExpressListByPage(page);
	}

	@Override
	public int getUserReceiverExpressCount(int userId) {
		return expressDao.getUserReceiverExpressCount(userId);
	}

	@Override
	public void changeExpressStatus(long expressId, int expressStatus) {
		expressDao.changeExpressStatus(expressId, expressStatus);
	}

	@Override
	public List<Express> searchUserSenderExpressByPage(ExpressSearchCondition searchCondition) {
		return expressDao.searchUserSenderExpressByPage(searchCondition);
	}

	@Override
	public int searchUserSenderExpressCount(ExpressSearchCondition searchCondition) {
		return expressDao.searchUserSenderExpressCount(searchCondition);
	}

	@Override
	public List<Express> searchUserReceiverExpressByPage(ExpressSearchCondition searchCondition) {
		return expressDao.searchUserReceiverExpressByPage(searchCondition);
	}

	@Override
	public int searchUserReceiverExpressCount(ExpressSearchCondition searchCondition) {
		return expressDao.searchUserReceiverExpressCount(searchCondition);
	}




	
	@Override
	public 	ContactAddress getUserContactAddressById(int receiverId){
		return expressDao.getUserContactAddressById(receiverId);
	}
}
