package com.lotut.pms.service.impl;

import com.lotut.pms.dao.ProposerDao;
import com.lotut.pms.service.ProposerService;

public class ProposerServiceImpl implements ProposerService {
	private ProposerDao proposerDao;
	
	
	
	public ProposerServiceImpl(ProposerDao proposerDao) {
		this.proposerDao = proposerDao;
	}


	public void addProposer() {
		proposerDao.addProposer();
		
	}
}
