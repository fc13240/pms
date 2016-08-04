package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.Attachment;
import com.lotut.pms.domain.PatentDoc;

public interface PatentDocDao {
	void savePatentDoc(PatentDoc patentDoc);
	
	List<PatentDoc> getUserPatentDoc(int userId);
	
	PatentDoc getUserPatentDocById(long patentDocId);
	
	void updatePatentDoc(PatentDoc patentDoc);
	
	void deletePatentDoc(long patentDocId);
	
	void savePatentImgUrl(Attachment attachment);
	
	List<Attachment> getAttachmentById(long patentDocId);
	
	void delectAttachmentById(long attachmentId);
	
	void deleteNullPatentDoc();
}
