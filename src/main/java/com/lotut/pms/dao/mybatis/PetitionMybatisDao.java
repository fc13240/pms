package com.lotut.pms.dao.mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.PetitionDao;
import com.lotut.pms.dao.mapper.PetitionMapper;

public class PetitionMybatisDao extends SqlSessionDaoSupport implements PetitionDao{

	private PetitionMapper petitionMapper;

	public PetitionMapper getPetitionMapper() {
		return petitionMapper;
	}

	public void setPetitionMapper(PetitionMapper petitionMapper) {
		this.petitionMapper = petitionMapper;
	}
	
	

}
