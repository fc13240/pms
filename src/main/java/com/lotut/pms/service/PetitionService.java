package com.lotut.pms.service;

public interface PetitionService {
	void addAppPerson(long patentDocId,long appPersonId);
	
	int  checkAppPerson(long patentDocId,long appPersonId);
}
