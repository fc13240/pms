package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.ExpressDao;
import com.lotut.pms.dao.mapper.ExpressMapper;
import com.lotut.pms.domain.Express;
import com.lotut.pms.domain.ExpressSearchCondition;
import com.lotut.pms.domain.Page;

public class ExpressMybatisDao extends SqlSessionDaoSupport implements ExpressDao{
	private ExpressMapper expressMapper;
	
	public ExpressMapper getExpressMapper() {
		return expressMapper;
	}

	public void setExpressMapper(ExpressMapper expressMapper) {
		this.expressMapper = expressMapper;
	}

	@Override
	public List<Express> getUserSenderExpressListByPage(Page page) {
		return expressMapper.getUserSenderExpressListByPage(page);
	}

	@Override
	public int getUserSenderExpressCount(int userId) {
		return expressMapper.getUserSenderExpressCount(userId);
	}

	@Override
	public List<Express> getUserReceiverExpressListByPage(Page page) {
		return expressMapper.getUserReceiverExpressListByPage(page);
	}

	@Override
	public int getUserReceiverExpressCount(int userId) {
		return expressMapper.getUserReceiverExpressCount(userId);
	}

	@Override
	public void changeExpressStatus(long expressId, int expressStatus) {
		expressMapper.changeExpressStatus(expressId, expressStatus);
	}

	@Override
	public List<Express> searchUserSenderExpressByPage(ExpressSearchCondition searchCondition) {
		return expressMapper.searchUserSenderExpressByPage(searchCondition);
	}

	@Override
	public int searchUserSenderExpressCount(ExpressSearchCondition searchCondition) {
		return expressMapper.searchUserSenderExpressCount(searchCondition);
	}

	@Override
	public List<Express> searchUserReceiverExpressByPage(ExpressSearchCondition searchCondition) {
		return expressMapper.searchUserReceiverExpressByPage(searchCondition);
	}

	@Override
	public int searchUserReceiverExpressCount(ExpressSearchCondition searchCondition) {
		return expressMapper.searchUserReceiverExpressCount(searchCondition);
	}

	



	
}
