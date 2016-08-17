package com.lotut.pms.dao;

public interface PetitionDao {
	void addAppPerson(long patentDocId,long appPersonId);
	
	int  checkAppPerson(long patentDocId,long appPersonId);
}
