package com.lotut.pms.service.impl;


import java.util.List;

import com.lotut.pms.dao.PatentDocDao;
import com.lotut.pms.domain.Attachment;
import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.service.PatentDocService;

public class PatentDocServiceImp implements PatentDocService{
		private PatentDocDao patentDocDao;

		public PatentDocServiceImp(PatentDocDao patentDocDao) {
			this.patentDocDao = patentDocDao;
		}
		

		@Override
		public void savePatentDoc(PatentDoc patentDoc) {
			patentDocDao.savePatentDoc(patentDoc);
		}


		@Override
		public List<PatentDoc> getUserPatentDoc(int userId) {
			return patentDocDao.getUserPatentDoc(userId);
		}


		@Override
		public PatentDoc getUserPatentDocById(long patentDocsId) {
			return patentDocDao.getUserPatentDocById( patentDocsId);
		}


		@Override
		public void updatePatentDoc(PatentDoc patentDoc) {
			patentDocDao.updatePatentDoc(patentDoc);
			
		}

		@Override
		public void deletePatentDoc(long patentDocsId) {
		
			patentDocDao.deletePatentDoc(patentDocsId);
			
		}


		@Override
		public void savePatentImgUrl(Attachment attachment) {
			patentDocDao.savePatentImgUrl(attachment);
			
		}


		@Override
		public List<Attachment> getAttachmentById(long patentDocId) {
			return patentDocDao.getAttachmentById(patentDocId);
		}


		@Override
		public void delectAttachmentById(long attachmentId) {
			patentDocDao.delectAttachmentById(attachmentId);
			
		}

}
