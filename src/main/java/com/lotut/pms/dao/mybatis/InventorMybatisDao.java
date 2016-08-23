package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.InventorDao;
import com.lotut.pms.dao.mapper.InventorMapper;
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.UserInventor;

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
		
		return inventorMapper.getAllInventorsByUser( id);
	}

	@Override
	public CommonInventor getInventorById(int id) {
		
		return inventorMapper.getInventorById(id);
	}

	@Override
	public void updateById(CommonInventor inventor) {
		 inventorMapper.updateById(inventor);
	
		
	}

	@Override
	public void deleteById(int id) {
		
		inventorMapper.deleteById(id);
		
	}

	@Override
	public List<CommonInventor> getInventorByName(String inventor,int userId) {
		return inventorMapper.getInventorByName(inventor,userId);
	}

	@Override
	public List<CommonInventor> getUserInventors(int userId) {
		
		return inventorMapper.getUserInventors(userId);
	}

	@Override
	public List<CommonInventor> getInventorByName(String inventor) {
		
		return null;
	}

	@Override
	public void saveAttachmentFile(CommonInventor commonInventor) {
		
		inventorMapper.saveAttachmentFile(commonInventor);
	}

	@Override
	public String getInventorUrlById(int id) {
		
		return inventorMapper.getInventorUrlById(id);
	}

	@Override
	public void addUserInventor(UserInventor userInventor) {
		inventorMapper.addUserInventor(userInventor);
		
	}

	
	@Override
	public void deleteUserInventorById(UserInventor userInventor) {
		inventorMapper.addUserInventor(userInventor);
		
	}

	@Override
	public int getIdByInventor(CommonInventor commonInventor) {
		// TODO Auto-generated method stub
		return inventorMapper.getIdByInventor(commonInventor);
	}

}
