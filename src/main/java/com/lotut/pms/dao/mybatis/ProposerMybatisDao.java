package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.ProposerDao;
import com.lotut.pms.dao.mapper.ProposerMapper;
import com.lotut.pms.domain.CommonProposer;
import com.lotut.pms.domain.ProposerType;

public class ProposerMybatisDao extends SqlSessionDaoSupport implements ProposerDao{
	private ProposerMapper proposerMapper;
	
	public void setProposerMapper(ProposerMapper ProposerMapper){
		this.proposerMapper=ProposerMapper;
	}
	public void addProposer(CommonProposer commonProposer) {
		proposerMapper.addProposer(commonProposer);
		
	}
	@Override
	public List<ProposerType> getProposerTypes() {
		// TODO Auto-generated method stub
		return proposerMapper.getProposerTypes();
	}
	@Override
	public List<CommonProposer> getAllProposerByUser(int userId) {
		// TODO Auto-generated method stub
		return proposerMapper.getAllProposerByUser(userId) ;
	}
	public CommonProposer getOneProposerByid(int id) {
		// TODO Auto-generated method stub
		return proposerMapper.getOneProposerByid(id);
	}
	public void updateProposer(CommonProposer proposer) {
		proposerMapper.updateProposer(proposer);
		
	}
	public void deleteProposerById(int id) {
		// TODO Auto-generated method stub
		proposerMapper.deleteProposerById(id);
	}

}
