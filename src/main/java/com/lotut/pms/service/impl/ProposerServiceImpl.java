package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.dao.ProposerDao;
import com.lotut.pms.domain.CommonProposer;
import com.lotut.pms.domain.ProposerType;
import com.lotut.pms.service.ProposerService;

public class ProposerServiceImpl implements ProposerService {
	private ProposerDao proposerDao;
	
	
	
	public ProposerServiceImpl(ProposerDao proposerDao) {
		this.proposerDao = proposerDao;
	}


	public void addProposer(CommonProposer commonProposer) {
		proposerDao.addProposer(commonProposer);
		
	}


	@Override
	public List<ProposerType> getProposerTypes() {
		return proposerDao.getProposerTypes();
	}


	@Override
	public List<CommonProposer> getAllProposerByUser(int userId) {
		// TODO Auto-generated method stub
		return proposerDao.getAllProposerByUser(userId) ;
	}
}
