package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.Attachment;
import com.lotut.pms.domain.PatentDoc;

public interface PatentDocService {
	void savePatentDoc(PatentDoc patentDoc);
	
	List<PatentDoc> getUserPatentDoc(int userId);
	
	PatentDoc getUserPatentDocById(long patentDocId);
	
	void updatePatentDoc(PatentDoc patentDoc);

	void deletePatentDoc(long patentDocId);

	void savePatentImgUrl(Attachment attachment);
	
	List<Attachment> getAttachmentById(long patentDocId);
	
	void delectAttachmentById(long attachmentId);
	
	void deleteNullPatentDoc();
	
	void savePatentAbstractImg(PatentDoc PatentDoc);
	
	Attachment getLabelByUrl(String url);
}
