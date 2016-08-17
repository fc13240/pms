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
		public PatentDoc getUserPatentDocById(long patentDocId) {
			return patentDocDao.getUserPatentDocById( patentDocId);
		}


		@Override
		public void updatePatentDoc(PatentDoc patentDoc) {
			patentDocDao.updatePatentDoc(patentDoc);
			
		}

		@Override
		public void deletePatentDoc(long patentDocId) {
		
			patentDocDao.deletePatentDoc(patentDocId);
			
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


		@Override
		public void deleteNullPatentDoc() {
			patentDocDao.deleteNullPatentDoc();
			
		}


		@Override
		public void savePatentAbstractImg(PatentDoc PatentDoc) {
			patentDocDao.savePatentAbstractImg(PatentDoc);
			
		}


		@Override
		public Attachment getLabelByUrl(String url) {
			return patentDocDao.getLabelByUrl(url);
		}


		@Override
		public void savePatentDocAttachmentFile(PatentDoc PatentDoc) {
			patentDocDao.savePatentDocAttachmentFile(PatentDoc);
		}


		@Override
		public String getPatentDocAttachmentFile(long patentDocId) {
			return patentDocDao.getPatentDocAttachmentFile(patentDocId);
		}


		@Override
		public void savePatentDocFile(PatentDoc patentDoc) {
			patentDocDao.savePatentDocFile(patentDoc);
			
		}

}
