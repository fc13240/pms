package com.lotut.pms.service.impl;

import com.lotut.pms.dao.PetitionDao;
import com.lotut.pms.service.PetitionService;

public class PetitionServiceImpl implements PetitionService {
	private PetitionDao petitionDao;
	
	public PetitionServiceImpl(PetitionDao petitionDao) {
		this.petitionDao = petitionDao;
	}
}
