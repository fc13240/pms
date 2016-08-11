package com.lotut.pms.dao.mybatis;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.ProposerDao;
import com.lotut.pms.dao.mapper.ProposerMapper;

public class ProposerMybatisDao extends SqlSessionDaoSupport implements ProposerDao{
	private ProposerMapper proposerMapper;
	
	public void setProposerMapper(ProposerMapper ProposerMapper){
		this.proposerMapper=ProposerMapper;
	}
	@Override
	public void addProposer() {
		proposerMapper.addProposer();
		
	}

}
