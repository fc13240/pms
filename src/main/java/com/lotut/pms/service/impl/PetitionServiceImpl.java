package com.lotut.pms.service.impl;

import com.lotut.pms.dao.PetitionDao;
import com.lotut.pms.service.PetitionService;

public class PetitionServiceImpl implements PetitionService {
	private PetitionDao petitionDao;
	
	public PetitionServiceImpl(PetitionDao petitionDao) {
		this.petitionDao = petitionDao;
	}


	@Override
	public void addAppPerson(long patentDocId, long appPersonId) {
		petitionDao.addAppPerson(patentDocId, appPersonId);
	}


	@Override
	public int checkAppPerson(long patentDocId, long appPersonId) {
		return petitionDao.checkAppPerson(patentDocId, appPersonId);
	}

}
