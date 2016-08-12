package com.lotut.pms.dao.mapper;

import java.util.List;

import com.lotut.pms.domain.CommonProposer;
import com.lotut.pms.domain.ProposerType;
import com.lotut.pms.domain.User;

public interface ProposerMapper {
	void addProposer(CommonProposer commonProposer);
	List<ProposerType>  getProposerTypes();
	List<CommonProposer> getAllProposerByUser(int useId) ;
}
