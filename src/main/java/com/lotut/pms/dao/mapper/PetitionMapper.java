package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.PatentDocAppPerson;

public interface PetitionMapper {
	
	List<CommonAppPerson> findAppPersonNameById(@Param("appPersonIds") List<Integer> appPersonIds,@Param("userId") int userId);
	
	List<CommonInventor> findInventorNameById(@Param("inventorIds") List<Long> inventorIds, @Param("userId") int userId );
	
	void addCommonAppPerson(CommonAppPerson commonAppPerson);
	
	void addCommonInventor(CommonInventor commonInventor);
	
	List<ContactAddress> findContactNameById(@Param("contactIds") List<Integer> contactIds,@Param("userId") int userId);
	
	void addPatentDocAppPerson(@Param("commonAppPersons") List<CommonAppPerson> commonAppPersons,@Param("patentDocId") Long patentDocId,@Param("userId") int userId);
	
	List<PatentDocAppPerson> findPatentDocAppPersonById(@Param("patentDocId") Long patentDocId);
}
