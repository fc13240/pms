package com.lotut.pms.dao.mybatis;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.PatentDocDao;
import com.lotut.pms.dao.mapper.PatentDocMapper;
import com.lotut.pms.dao.mapper.PatentMapper;
import com.lotut.pms.domain.Attachment;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.domain.PatentDocSearchCondition;

public class PatentDocMybatisDao extends SqlSessionDaoSupport implements PatentDocDao{
	private PatentDocMapper patentDocMapper;
	private PatentDoc patentDoc;

	public void setPatentDocMapper(PatentDocMapper patentDocMapper) {
		this.patentDocMapper = patentDocMapper;
	}



	@Override
	public void savePatentDoc(PatentDoc patentDoc) {
		patentDocMapper.savePatentDoc(patentDoc);
		
	}



	@Override
	public List<PatentDoc> getUserPatentDoc(Page page) {
		return patentDocMapper.getUserPatentDoc(page);
	}



	@Override
	public PatentDoc getUserPatentDocById( long patentDocId) {
		return patentDocMapper.getUserPatentDocById( patentDocId);
	}



	@Override
	public void updatePatentDoc(PatentDoc patentDoc) {
		patentDocMapper.updatePatentDoc(patentDoc);
		
	}




	@Override
	public void deletePatentDoc(long patentDocId,int userId) {
	
		patentDocMapper.deletePatentDoc(patentDocId,userId);
	}



	@Override
	public void savePatentImgUrl(Attachment attachment) {
		patentDocMapper.savePatentImgUrl(attachment);
		
	}



	@Override
	public List<Attachment> getAttachmentById(long patentDocId) {
		return patentDocMapper.getAttachmentById(patentDocId);
	}



	@Override
	public void delectAttachmentById(long attachmentId) {
		patentDocMapper.delectAttachmentById(attachmentId);
		
	}



	@Override
	public void deleteNullPatentDoc() {
		patentDocMapper.deleteNullPatentDoc();
		
	}



	@Override
	public void savePatentAbstractImg(PatentDoc PatentDoc) {
		patentDocMapper.savePatentAbstractImg(PatentDoc);
		
	}



	@Override
	public Attachment getLabelByUrl(String url) {
		return patentDocMapper.getLabelByUrl(url);
	}



	@Override
	public void savePatentDocAttachmentFile(PatentDoc PatentDoc) {
		patentDocMapper.savePatentDocAttachmentFile(PatentDoc);
	}



	@Override
	public String getPatentDocAttachmentFile(long patentDocId) {
		return patentDocMapper.getPatentDocAttachmentFile(patentDocId);
	}



	@Override
	public void savePatentDocFile(PatentDoc patentDoc) {
		patentDocMapper.savePatentDocFile(patentDoc);
		
	}



	@Override
	public String getPatentDocUrlById(long patentDocId) {
		return patentDocMapper.getPatentDocUrlById(patentDocId);
	}



	@Override
	public void insertUserPatentDoc(List<Map<String, Integer>> userPatentDocRecords) {
		patentDocMapper.insertUserPatentDoc(userPatentDocRecords);
		
	}



	@Override
	public List<PatentDoc> searchUserPatentDocsByPage(PatentDocSearchCondition searchCondition) {
		return patentDocMapper.searchUserPatentDocsByPage(searchCondition);
	}



	@Override
	public int searchUserPatentDocsCount(PatentDocSearchCondition searchCondition) {
		return patentDocMapper.searchUserPatentDocsCount(searchCondition);
	}



	@Override
	public int getUserPatentDocCount(int userId) {
		return patentDocMapper.getUserPatentDocCount(userId);
	}



	@Override
	public List<PatentDoc> getUserPatentDocEditor(int userId) {
		return patentDocMapper.getUserPatentDocEditor(userId);
	}



	@Override
	public int getAttatchmentPicCount(long patentDocId) {
		return patentDocMapper.getAttatchmentPicCount(patentDocId);
	}
}
