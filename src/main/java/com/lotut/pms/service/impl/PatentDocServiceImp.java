package com.lotut.pms.service.impl;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.dao.PatentDocDao;
import com.lotut.pms.domain.Attachment;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.domain.PatentDocSearchCondition;
import com.lotut.pms.service.PatentDocService;

public class PatentDocServiceImp implements PatentDocService{
		private PatentDocDao patentDocDao;

		public PatentDocServiceImp(PatentDocDao patentDocDao) {
			this.patentDocDao = patentDocDao;
		}
		

		@Override
		@Transactional
		public void savePatentDoc(PatentDoc patentDoc) {
			patentDocDao.savePatentDoc(patentDoc);
			long patentDocId=patentDoc.getPatentDocId();
			List<Map<String, Integer>> userPatentList = new ArrayList<>();
			HashMap<String, Integer> userPatentMap = new HashMap<>();
			userPatentMap.put("userId", patentDoc.getUserId());
			userPatentMap.put("patentDocId", (int)patentDocId);
			userPatentList.add(userPatentMap);
			patentDocDao.insertUserPatentDoc(userPatentList);
			
		}


		@Override
		public List<PatentDoc> getUserPatentDoc(Page page ) {
			return patentDocDao.getUserPatentDoc(page);
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


		@Override
		public String getPatentDocUrlById(long patentDocId) {
			return patentDocDao.getPatentDocUrlById(patentDocId);
		}


		@Override
		@Transactional
		public void insertUserPatentDoc(List<Map<String, Integer>> userPatentDocRecords) {
			patentDocDao.insertUserPatentDoc(userPatentDocRecords);
			
		}


		@Override
		public List<PatentDoc> searchUserPatentDocsByPage(PatentDocSearchCondition searchCondition) {
			return patentDocDao.searchUserPatentDocsByPage(searchCondition);
		}


		@Override
		public int searchUserPatentDocsCount(PatentDocSearchCondition searchCondition) {
			return patentDocDao.searchUserPatentDocsCount(searchCondition);
		}


		@Override
		public int getUserPatentDocCount(int userId) {
			return patentDocDao.getUserPatentDocCount(userId);
		}


		@Override
		public List<PatentDoc> getUserPatentDocEditor(int userId) {
			return patentDocDao.getUserPatentDocEditor(userId);
		}




}
