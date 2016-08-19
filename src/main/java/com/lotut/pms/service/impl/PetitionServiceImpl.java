package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.dao.PetitionDao;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.service.PetitionService;

public class PetitionServiceImpl implements PetitionService {
	private PetitionDao petitionDao;
	
	public PetitionServiceImpl(PetitionDao petitionDao) {
		this.petitionDao = petitionDao;
	}

	@Override
	public List<CommonInventor> findInventorNameById(List<Long> inventorIds, int userId) {
		// TODO Auto-generated method stub
		return petitionDao.findInventorNameById(inventorIds, userId);
	}

	@Override
	public List<CommonAppPerson> findAppPersonNameById(List<Integer> appPersonIds, int userId) {
		// TODO Auto-generated method stub
		return petitionDao.findAppPersonNameById(appPersonIds, userId);
	}
}
