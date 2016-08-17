package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.dao.InventorDao;
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.service.InventorService;

public class InventorServiceImpl implements InventorService{
	private InventorDao inventorDao;
	
	public InventorServiceImpl(InventorDao inventorDao){
		this.inventorDao=inventorDao;
	}
	@Override
	public void addInventor(CommonInventor inventor) {
		// TODO Auto-generated method stub
		inventorDao.addInventor(inventor);
	}
	@Override
	public List<CommonInventor> getAllInventorsByUser(int id) {
		// TODO Auto-generated method stub
		return inventorDao.getAllInventorsByUser(id);
	}
	@Override
	public CommonInventor getInventorById(int id) {
		// TODO Auto-generated method stub
		return inventorDao.getInventorById(id);
	}
	@Override
	public void updateById(CommonInventor inventor) {
		// TODO Auto-generated method stub
		inventorDao.updateById(inventor);
	}
	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		inventorDao.deleteById(id);
		
	}
	@Override
	public List<CommonInventor> getInventor(String inventor,int userId) {
		return inventorDao.getInventorByName(inventor,userId);
	}
	
}
