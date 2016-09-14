package com.lotut.pms.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.dao.AppPersonDao;
import com.lotut.pms.dao.InventorDao;
import com.lotut.pms.dao.PetitionDao;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.PatentDocAppPerson;
import com.lotut.pms.domain.PatentDocInventor;
import com.lotut.pms.domain.UserAppPerson;
import com.lotut.pms.domain.UserInventor;
import com.lotut.pms.service.PetitionService;
import com.lotut.pms.util.PrincipalUtils;

public class PetitionServiceImpl implements PetitionService {
	private PetitionDao petitionDao;
	private AppPersonDao appPersonDao;
	private InventorDao inventorDao;
	
	public PetitionServiceImpl(PetitionDao petitionDao,AppPersonDao appPersonDao,InventorDao inventorDao) {
		this.petitionDao = petitionDao;
		this.appPersonDao = appPersonDao;
		this.inventorDao = inventorDao;
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
	@Transactional
	public void addCommonAppPerson(CommonAppPerson commonAppPerson,Long patentDocId) {
		int userId = PrincipalUtils.getCurrentUserId();
		commonAppPerson.setUserId(userId);
		petitionDao.addCommonAppPerson(commonAppPerson);
		UserAppPerson userAppPerson=new UserAppPerson();
		userAppPerson.setUserId(userId);
		userAppPerson.setAppPersonId(commonAppPerson.getAppPersonId());
		appPersonDao.addUserAppPerson(userAppPerson);
		List<CommonAppPerson> commonAppPersons = new ArrayList<>();
		commonAppPersons.add(commonAppPerson);
		petitionDao.addPatentDocAppPerson(commonAppPersons, patentDocId,userId);
		
		
		
		//petitionDao.addCommonAppPerson(commonAppPerson);	
	}

	@Override
	@Transactional
	public void addCommonInventor(CommonInventor commonInventor,Long patentDocId) {
		int userId = PrincipalUtils.getCurrentUserId();
		commonInventor.setUserId(userId);
		petitionDao.addCommonInventor(commonInventor);
		UserInventor userInventor=new UserInventor();
		userInventor.setUserId(userId);
		userInventor.setInventorId(commonInventor.getInventorId());
		inventorDao.addUserInventor(userInventor);
		List<CommonInventor> commonInventors =new ArrayList<>();
		commonInventors.add(commonInventor);
		petitionDao.addPatentDocInventor(patentDocId, commonInventors, userId);
		
		
		//petitionDao.addCommonInventor(commonInventor);
	}

	@Override
	public List<ContactAddress> findContactNameById(List<Integer> contactIds, int userId) {
		return petitionDao.findContactNameById(contactIds, userId);
	}

	@Override
	@Transactional
	public void addPatentDocAppPerson(List<CommonAppPerson> commonAppPersons,Long patentDocId,int userId) {
		petitionDao.addPatentDocAppPerson(commonAppPersons,patentDocId,userId);
	}

	@Override
	public List<PatentDocAppPerson> findPatentDocAppPersonById(Long patentDocId) {
		return petitionDao.findPatentDocAppPersonById(patentDocId);
	}

	@Override
	@Transactional
	public void addPatentDocInventor(Long patentDocId, List<CommonInventor> commonInventors, int userId) {
		petitionDao.addPatentDocInventor(patentDocId, commonInventors, userId);
	}

	@Override
	public List<PatentDocInventor> findPatentDocInventorById(Long patentDocId) {
		return petitionDao.findPatentDocInventorById(patentDocId);
	}

	@Override
	@Transactional
	public void deletePatentDocApperson(Long personId) {
		petitionDao.deletePatentDocApperson(personId);
	}

	@Override
	@Transactional
	public void updatePatentDocApperson(PatentDocAppPerson patentDocAppPerson) {
		petitionDao.updatePatentDocApperson(patentDocAppPerson);
	}

	@Override
	@Transactional
	public void deletePatentDocInventor(Long inventorId) {
		petitionDao.deletePatentDocInventor(inventorId);
	}

	@Override
	@Transactional
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

	@Override
	@Transactional
	public void updatePatentDocAttachmentUrl(String attachmentUrl, Long patentDocId) {
		petitionDao.updatePatentDocAttachmentUrl(attachmentUrl, patentDocId);
	}

	@Override
	public String getPatentAttachmentFile(Long patentDocId) {
		return petitionDao.getPatentAttachmentFile(patentDocId);
	}

	@Override
	public List<CommonAppPerson> getUserCommonAppPersons(int userId) {
		return petitionDao.getUserCommonAppPersons(userId);
	}

	@Override
	public List<CommonInventor> getUserCommonInventors(int userId) {
		return petitionDao.getUserCommonInventors(userId);
	}

	@Override
	public void updatePatentDocContact(Long patentDocId, int addressId) {
		petitionDao.updatePatentDocContact(patentDocId, addressId);
	}

	@Override
	public List<ContactAddress> findPatentDocContactById(Long patentDocId) {
		return petitionDao.findPatentDocContactById(patentDocId);
	}

	@Override
	public List<CommonAppPerson> searchAppPerson(String keyword, int userId) {
		return petitionDao.searchAppPerson(keyword, userId);
	}

	@Override
	public List<CommonInventor> searchInventor(String keyword, int userId) {
		return petitionDao.searchInventor(keyword, userId);
	}

	@Override
	public Map<Integer, Integer> getPatentDocAppPersonCountById(Long patentDocId) {
		Map<Integer, Integer> map=petitionDao.getPatentDocAppPersonCountById(patentDocId);
		
		return null;
	}

	@Override
	public int getCountByFeeReduceStatus(Long patentDocId, String feeReduceStatus) {
		return 0;
	}
}
