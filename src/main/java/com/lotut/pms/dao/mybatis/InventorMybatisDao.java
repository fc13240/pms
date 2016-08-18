package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.InventorDao;
import com.lotut.pms.dao.mapper.InventorMapper;
import com.lotut.pms.domain.CommonInventor;

public class InventorMybatisDao extends SqlSessionDaoSupport implements InventorDao {
	private InventorMapper inventorMapper;
	
	public	void  setInventorMapper(InventorMapper inventorMapper){
		this.inventorMapper=inventorMapper;
	}

	@Override
	public void addInventor(CommonInventor inventor) {
		inventorMapper. addInventor(inventor);
		
	}

	@Override
	public List<CommonInventor> getAllInventorsByUser(int id) {
		// TODO Auto-generated method stub
		return inventorMapper.getAllInventorsByUser( id);
	}

	@Override
	public CommonInventor getInventorById(int id) {
		// TODO Auto-generated method stub
		return inventorMapper.getInventorById(id);
	}

	@Override
	public void updateById(CommonInventor inventor) {
		 inventorMapper.updateById(inventor);
	
		
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		inventorMapper.deleteById(id);
		
	}

	@Override
	public List<CommonInventor> getInventorByName(String inventor) {
		return inventorMapper.getInventorByName(inventor);
	}

	@Override
	public List<CommonInventor> getUserInventors(int userId) {
		// TODO Auto-generated method stub
		return inventorMapper.getUserInventors(userId);
	}
	
}
