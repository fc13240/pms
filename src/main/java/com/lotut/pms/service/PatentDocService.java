package com.lotut.pms.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Attachment;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.domain.PatentDocSearchCondition;
import com.lotut.pms.domain.PatentSearchCondition;

public interface PatentDocService {
	void savePatentDoc(PatentDoc patentDoc);
	
	List<PatentDoc> getUserPatentDocEditor(int userId);
	
	int getUserPatentDocCount(int userId);
	
	List<PatentDoc> getUserPatentDoc(Page page);
	
	PatentDoc getUserPatentDocById(long patentDocId);
	
	void updatePatentDoc(PatentDoc patentDoc);

	void deletePatentDoc(long patentDocId,int userId);

	void savePatentImgUrl(Attachment attachment);
	
	List<Attachment> getAttachmentById(long patentDocId);
	
	void delectAttachmentById(long attachmentId);
	
	void deleteNullPatentDoc();
	
	void savePatentAbstractImg(PatentDoc PatentDoc);
	
	Attachment getLabelByUrl(String url);
	
	void savePatentDocAttachmentFile(PatentDoc PatentDoc);
	
	String getPatentDocAttachmentFile(long patentDocId);

	void savePatentDocFile(PatentDoc patentDoc);

	String getPatentDocUrlById(long patentDocId);
	
	void insertUserPatentDoc(List<Map<String, Integer>> userPatentDocRecords);
	
	List<PatentDoc> searchUserPatentDocsByPage(PatentDocSearchCondition searchCondition);
	
	int searchUserPatentDocsCount(PatentDocSearchCondition searchCondition);
	
	int getAttatchmentPicCount(long patentDocId );
	
	int getMaxAttachmentPicNum(long patentDocId );
	
	void updateAttachmentImgName(Attachment attachment);

}
