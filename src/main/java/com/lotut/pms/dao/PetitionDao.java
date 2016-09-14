package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.PatentDocAppPerson;
import com.lotut.pms.domain.PatentDocInventor;

public interface PetitionDao {
	
	List<CommonInventor> findInventorNameById(List<Long> inventorIds,int userId );
	
	List<CommonAppPerson> findAppPersonNameById(List<Integer> appPersonIds,int userId);

	void addCommonAppPerson(CommonAppPerson commonAppPerson);
	
	void addCommonInventor(CommonInventor commonInventor);
	
	List<ContactAddress> findContactNameById(List<Integer> contactIds,int userId);
	
	void addPatentDocAppPerson(List<CommonAppPerson> commonAppPersons,Long patentDocId,int userId);
	
	List<PatentDocAppPerson> findPatentDocAppPersonById(Long patentDocId);
	
	void addPatentDocInventor(Long patentDocId,List<CommonInventor> commonInventors,int userId);
	
	List<PatentDocInventor> findPatentDocInventorById(Long patentDocId);
	
	void deletePatentDocApperson(Long personId);
	
	void updatePatentDocApperson(PatentDocAppPerson patentDocAppPerson);
	
	void deletePatentDocInventor(Long inventorId);
	
	void updatePatentDocInventor(PatentDocInventor patentDocInventor);
	
	PatentDocAppPerson findAppPersonByAppId(Long personId);
	
	PatentDocInventor findInventorById(Long inventorId);
	
	void updatePatentDocAttachmentUrl(String attachmentUrl,Long patentDocId);
	
	String getPatentAttachmentFile(Long patentDocId);
	
	List<CommonAppPerson> getUserCommonAppPersons(int userId);
	
	List<CommonInventor> getUserCommonInventors(int userId);
	
	void updatePatentDocContact(Long patentDocId,int addressId);
	
	List<ContactAddress> findPatentDocContactById(Long patentDocId);
	
	List<CommonAppPerson> searchAppPerson(String keyword,int userId);
	
	List<CommonInventor> searchInventor(String keyword,int userId);
	
	Map<Integer,Integer > getPatentDocAppPersonCountById(Long patentDocId);
	
	int getCountByFeeReduceStatus(Long patentDocId,String feeReduceStatus);
}
