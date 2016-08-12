package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.CommonProposer;
import com.lotut.pms.domain.ProposerType;

public interface ProposerDao {
	void addProposer(CommonProposer commonProposer);
	List<ProposerType>  getProposerTypes();
	List<CommonProposer> getAllProposerByUser(int userId) ;
}
