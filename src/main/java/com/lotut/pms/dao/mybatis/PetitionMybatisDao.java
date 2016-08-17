package com.lotut.pms.dao.mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.PetitionDao;
import com.lotut.pms.dao.mapper.PetitionMapper;

public class PetitionMybatisDao extends SqlSessionDaoSupport implements PetitionDao{

	private PetitionMapper petitionMapper;
	@Override
	public void addAppPerson(long patentDocId, long appPersonId) {
		petitionMapper.addAppPerson(patentDocId, appPersonId);
	}
	public void setPetitionMapper(PetitionMapper petitionMapper) {
		this.petitionMapper = petitionMapper;
	}
	public PetitionMapper getPetitionMapper() {
		return petitionMapper;
	}
	@Override
	public int checkAppPerson(long patentDocId, long appPersonId) {
		return petitionMapper.checkAppPerson(patentDocId, appPersonId);
	}
	
	

	
}
