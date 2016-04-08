package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.domain.PatentSearchCondition;
import com.lotut.pms.domain.PatentStatus;
import com.lotut.pms.domain.PatentType;

public interface PatentMapper {
	int getUserPatentCount(@Param("userId")int userId);
	
	List<Patent> getUserPatents(Page page);
	
	List<Patent> getUserPatentsByType(@Param("userId") int userId, @Param("patentType") int patentType);
	
	List<Patent> getUserPatentsByStatus(@Param("userId") int userId, @Param("patentStatus") int patentStatus);
	
	Patent getPatentById(long patentId);
	
	List<Patent> getPatentsByIds(@Param("patentIds")List<Long> patentIds);
	
	Patent getPatentByAppNoAndOwner(@Param("appNo")String appNo, @Param("ownerId")int ownerId);
	
	List<Integer> getUserPatentIdsByPage(Page page);
	
	List<Patent> searchUserPatents(@Param("searchCondtion")PatentSearchCondition searchCondtion);
	
	
	int searchUserPatentsCount(PatentSearchCondition searchCondition);
	List<Patent> searchUserPatentsByPage(PatentSearchCondition searchCondtion);
	
	List<PatentType> getAllPatentTypes();
	
	List<PatentStatus> getAllPatentStatus();
	
	void updateInternalCode(@Param("patentId") int patentId, @Param("internalCode") String internalCode);
	
	void insertOrUpdatePatent(Patent patent);
	
	void insertPatent(Patent patent);
	
	void updatePatent(Patent patent);
}
