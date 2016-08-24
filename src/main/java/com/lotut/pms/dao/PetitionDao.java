package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.PatentDocAppPerson;

public interface PetitionDao {
	
	List<CommonInventor> findInventorNameById(List<Long> inventorIds,int userId );
	
	List<CommonAppPerson> findAppPersonNameById(List<Integer> appPersonIds,int userId);

	void addCommonAppPerson(CommonAppPerson commonAppPerson);
	
	void addCommonInventor(CommonInventor commonInventor);
	
	List<ContactAddress> findContactNameById(List<Integer> contactIds,int userId);
	
	void addPatentDocAppPerson(List<CommonAppPerson> commonAppPersons,Long patentDocId,int userId);
	
	List<PatentDocAppPerson> findPatentDocAppPersonById(Long patentDocId);
}
