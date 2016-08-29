package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.dao.PetitionDao;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.PatentDocAppPerson;
import com.lotut.pms.domain.PatentDocInventor;
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
	public void addPatentDocAppPerson(List<CommonAppPerson> commonAppPersons,Long patentDocId,int userId) {
		petitionDao.addPatentDocAppPerson(commonAppPersons,patentDocId,userId);
	}

	@Override
	public List<PatentDocAppPerson> findPatentDocAppPersonById(Long patentDocId) {
		return petitionDao.findPatentDocAppPersonById(patentDocId);
	}

	@Override
	public void addPatentDocInventor(Long patentDocId, List<CommonInventor> commonInventors, int userId) {
		petitionDao.addPatentDocInventor(patentDocId, commonInventors, userId);
	}

	@Override
	public List<PatentDocInventor> findPatentDocInventorById(Long patentDocId) {
		return petitionDao.findPatentDocInventorById(patentDocId);
	}

	@Override
	public void deletePatentDocApperson(Long personId) {
		petitionDao.deletePatentDocApperson(personId);
	}

	@Override
	public void updatePatentDocApperson(PatentDocAppPerson patentDocAppPerson) {
		petitionDao.updatePatentDocApperson(patentDocAppPerson);
	}

	@Override
	public void deletePatentDocInventor(Long inventorId) {
		petitionDao.deletePatentDocInventor(inventorId);
	}

	@Override
	public void updatePatentDocInventor(PatentDocInventor patentDocInventor) {
		petitionDao.updatePatentDocInventor(patentDocInventor);
	}

	@Override
	public PatentDocAppPerson findAppPersonByAppId(Long personId) {
		return petitionDao.findAppPersonByAppId(personId);
	}

	@Override
	public PatentDocInventor findInventorById(Long inventorId) {
		return petitionDao.findInventorById(inventorId);
	}
}
