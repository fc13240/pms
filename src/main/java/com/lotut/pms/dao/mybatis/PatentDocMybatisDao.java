package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.PatentDocDao;
import com.lotut.pms.dao.mapper.PatentDocMapper;
import com.lotut.pms.dao.mapper.PatentMapper;
import com.lotut.pms.domain.PatentDoc;

public class PatentDocMybatisDao extends SqlSessionDaoSupport implements PatentDocDao{
	private PatentDocMapper patentDocMapper;

	public void setPatentDocMapper(PatentDocMapper patentDocMapper) {
		this.patentDocMapper = patentDocMapper;
	}



	@Override
	public void savePatentDoc(PatentDoc patentDoc) {
		patentDocMapper.savePatentDoc(patentDoc);
		
	}



	@Override
	public List<PatentDoc> getUserPatentDoc(int userId) {
		return patentDocMapper.getUserPatentDoc(userId);
	}



	@Override
	public PatentDoc getUserPatentDocById(int userId, long patentDocsId) {
		return patentDocMapper.getUserPatentDocById(userId, patentDocsId);
	}
}
