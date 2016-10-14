package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.ExpressDao;
import com.lotut.pms.dao.mapper.ExpressMapper;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Express;
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
	public void changeExpressStatus(long expressId, int status) {
		expressMapper.changeExpressStatus(expressId, status);
	}

	@Override
	public void addExpress(Express express){
		expressMapper.addExpress(express);
	}
	@Override
	public 	ContactAddress getUserContactAddressById(int receiverId){
		return expressMapper.getUserContactAddressById(receiverId);
	}
}
