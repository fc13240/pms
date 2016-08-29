package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.PetitionDao;
import com.lotut.pms.dao.mapper.PetitionMapper;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.PatentDocAppPerson;
import com.lotut.pms.domain.PatentDocInventor;

public class PetitionMybatisDao extends SqlSessionDaoSupport implements PetitionDao{

	private PetitionMapper petitionMapper;

	public PetitionMapper getPetitionMapper() {
		return petitionMapper;
	}

	public void setPetitionMapper(PetitionMapper petitionMapper) {
		this.petitionMapper = petitionMapper;
	}

	@Override
	public List<CommonInventor> findInventorNameById(List<Long> inventorIds, int userId) {
		return petitionMapper.findInventorNameById(inventorIds, userId);
	}

	@Override
	public List<CommonAppPerson> findAppPersonNameById(List<Integer> appPersonIds, int userId) {
		return petitionMapper.findAppPersonNameById(appPersonIds, userId);
	}

	@Override
	public void addCommonAppPerson(CommonAppPerson commonAppPerson) {
		petitionMapper.addCommonAppPerson(commonAppPerson);
	}

	@Override
	public void addCommonInventor(CommonInventor commonInventor) {
		petitionMapper.addCommonInventor(commonInventor);
	}

	@Override
	public List<ContactAddress> findContactNameById(List<Integer> contactIds, int userId) {
		return petitionMapper.findContactNameById(contactIds, userId);
	}

	@Override
	public void addPatentDocAppPerson(List<CommonAppPerson> commonAppPersons,Long patentDocId,int userId) {
		petitionMapper.addPatentDocAppPerson(commonAppPersons,patentDocId,userId);
	}

	@Override
	public List<PatentDocAppPerson> findPatentDocAppPersonById(Long patentDocId) {
		return petitionMapper.findPatentDocAppPersonById(patentDocId);
	}

	@Override
	public void addPatentDocInventor(Long patentDocId, List<CommonInventor> commonInventors, int userId) {
		petitionMapper.addPatentDocInventor(patentDocId, commonInventors, userId);
	}

	@Override
	public List<PatentDocInventor> findPatentDocInventorById(Long patentDocId) {
		return petitionMapper.findPatentDocInventorById(patentDocId);
	}

	@Override
	public void deletePatentDocApperson(Long personId) {
		petitionMapper.deletePatentDocApperson(personId);
	}

	@Override
	public void updatePatentDocApperson(PatentDocAppPerson patentDocAppPerson) {
		petitionMapper.updatePatentDocApperson(patentDocAppPerson);
	}

	@Override
	public void deletePatentDocInventor(Long inventorId) {
		petitionMapper.deletePatentDocInventor(inventorId);
	}

	@Override
	public void updatePatentDocInventor(PatentDocInventor patentDocInventor) {
		petitionMapper.updatePatentDocInventor(patentDocInventor);
	}

	@Override
	public PatentDocAppPerson findAppPersonByAppId(Long personId) {
		return petitionMapper.findAppPersonByAppId(personId);
	}

	@Override
	public PatentDocInventor findInventorById(Long inventorId) {
		return petitionMapper.findInventorById(inventorId);
	}
	
	

}
