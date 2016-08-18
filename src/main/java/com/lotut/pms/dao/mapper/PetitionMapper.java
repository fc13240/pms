package com.lotut.pms.dao.mapper;

import org.apache.ibatis.annotations.Param;

public interface PetitionMapper {
	void addAppPerson(@Param("patentDocId") long patentDocId,@Param("appPersonId") long appPersonId);
	
	int  checkAppPerson(@Param("patentDocId") long patentDocId,@Param("appPersonId") long appPersonId);
}
