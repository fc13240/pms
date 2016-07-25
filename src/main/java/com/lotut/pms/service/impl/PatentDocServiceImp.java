package com.lotut.pms.service.impl;


import com.lotut.pms.dao.PatentDocDao;
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
}
