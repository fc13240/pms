package com.lotut.pms.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.GoodsDetail;
import com.lotut.pms.domain.GoodsFirstColumn;
import com.lotut.pms.domain.GoodsSecondColumn;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.domain.PatentSearchCondition;
import com.lotut.pms.domain.PatentStatus;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.domain.TransactionPatentSearchCondition;

public interface PatentService {
	public long getPatentsCount(int userId);
	
	List<Patent> getUserPatents(Page page);
	
	List<Patent> getUserPatentsByType(int userId, int patentType);
	
	List<Patent> getUserPatentsByStatus(int userId, int patentStatus);
	
	Patent getPatentDetail(long patentId);
	
	List<Patent> searchUserPatents(PatentSearchCondition searchCondition);
	
	public long searchUserPatentsCount(PatentSearchCondition searchCondition);
	
	List<Patent> searchUserPatentsWithPage(PatentSearchCondition searchCondition);
	
	List<PatentType> getAllPatentTypes();
	
	List<PatentStatus> getAllPatentStatus();
	
	void changeInternalCode(int patentId, String internalCode);
	

	boolean uploadPatents(InputStream is,int userId) throws IOException;

	public List<GoodsFirstColumn> getFirstColumn();

	public List<GoodsSecondColumn> getSecondColumn(int firstColumnId);

	public void saveGoods(GoodsDetail goodsDetail);
	
	 void addPatent(Patent patent);
	 
	 Map<String, Map<String, String>> getUserPatentCountByType( int userId);
	 
	 Map<String, Map<String, String>> searchUserPatentsByPatentStatus(int userId);
	 
	 List<Patent> getUserPatentsWithFee(int userId);
	 
	 Patent getPatentsByAppNo(Integer userId,String appNo);
	 
	 long getPatentIdByAppNo(Integer userId,String appNo);
	 
	 void autoUpdatePatents(InputStream is,int userId) throws IOException;
	 
	 String generatePatentExportExcel(List<Long> patentIds,String excelName) throws IOException;
	 
	 public boolean  addOrUpdatePatents(List<Patent> patents,int userId);
	 
	 List<GoodsDetail> getUserTransactionPatents(Page page);
	 
	 int getUserTransactionPatentsCount(int userId);

	 List<GoodsDetail> searchTransactionPatentsByPage(TransactionPatentSearchCondition searchCondition);
		
	int searchTransactionPatentsCount(TransactionPatentSearchCondition searchCondition);


	public void downTransactionPatent(int patentId);

	public void upTransactionPatent(int patentId);

	public void deleteTransactionPatent(int patentId);

}
