package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.PetitionDao;
import com.lotut.pms.dao.mapper.PetitionMapper;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.CommonInventor;

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
	
	

}
