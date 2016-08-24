package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.dao.InventorDao;
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.UserInventor;
import com.lotut.pms.service.InventorService;

public class InventorServiceImpl implements InventorService{
	private InventorDao inventorDao;
	
	public InventorServiceImpl(InventorDao inventorDao){
		this.inventorDao=inventorDao;
	}
	@Override
	public void addInventor(CommonInventor inventor) {
		
		inventorDao.addInventor(inventor);
	}
	@Override
	public List<CommonInventor> getAllInventorsByUser(int id) {
		
		return inventorDao.getAllInventorsByUser(id);
	}
	@Override
	public CommonInventor getInventorById(int id) {
		
		return inventorDao.getInventorById(id);
	}
	@Override
	public void updateById(CommonInventor inventor) {
		
		inventorDao.updateById(inventor);
	}
	@Override
	public void deleteById(int id) {
		
		inventorDao.deleteById(id);
		
	}
	@Override
	public List<CommonInventor> getInventor(String inventor,int userId) {
		return inventorDao.getInventorByName(inventor,userId);
	}
	@Override
	public List<CommonInventor> getUserInventors(int userId) {
		
		return inventorDao.getUserInventors(userId);
	}
	@Override
	public List<CommonInventor> getInventor(String inventor) {
		
		return null;
	}
	@Override
	public void saveAttachmentFile(CommonInventor CommonInventor) {
		
		inventorDao.saveAttachmentFile(CommonInventor);
	}
	@Override
	public String getInventorUrlById(int id) {
		
		return inventorDao.getInventorUrlById(id);
	}
	@Override
	public void addUserInventor(UserInventor userInventor) {
		inventorDao.addUserInventor(userInventor);
		
	}

	@Override
	public void deleteUserInventorById(UserInventor userInventor) {
		inventorDao.deleteUserInventorById(userInventor);
		
	}
	
	@Override
	public Integer getIdByInventor(CommonInventor commonInventor) {
		return inventorDao.getIdByInventor(commonInventor);
	}
	
}
