package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.dao.PetitionDao;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.service.PetitionService;

public class PetitionServiceImpl implements PetitionService {
	private PetitionDao petitionDao;
	
	public PetitionServiceImpl(PetitionDao petitionDao) {
		this.petitionDao = petitionDao;
	}

	@Override
	public List<CommonInventor> findInventorNameById(List<Long> inventorIds, int userId) {
		return petitionDao.findInventorNameById(inventorIds, userId);
	}

	@Override
	public List<CommonAppPerson> findAppPersonNameById(List<Integer> appPersonIds, int userId) {
		return petitionDao.findAppPersonNameById(appPersonIds, userId);
	}

	@Override
	public void addCommonAppPerson(CommonAppPerson commonAppPerson) {
		petitionDao.addCommonAppPerson(commonAppPerson);	
	}

	@Override
	public void addCommonInventor(CommonInventor commonInventor) {
		petitionDao.addCommonInventor(commonInventor);
	}

	@Override
	public List<ContactAddress> findContactNameById(List<Integer> contactIds, int userId) {
		return petitionDao.findContactNameById(contactIds, userId);
	}

	@Override
	public void addPatentDocAppPerson(List<CommonAppPerson> commonAppPersons,Long patentDocId) {
		petitionDao.addPatentDocAppPerson(commonAppPersons,patentDocId);
	}
}
