package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.CommonProposer;
import com.lotut.pms.domain.ProposerType;

public interface ProposerService {
	void addProposer(CommonProposer commonProposer);
	List<ProposerType>  getProposerTypes();
	List<CommonProposer> getAllProposerByUser(int userId);
}
