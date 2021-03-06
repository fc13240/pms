package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Express;
import com.lotut.pms.domain.ExpressSearchCondition;
import com.lotut.pms.domain.Page;

public interface ExpressMapper {
	List<Express> getUserSenderExpressListByPage (Page page);
	
	int getUserSenderExpressCount(int userId);
	
	List<Express> getUserReceiverExpressListByPage (Page page);
	
	int getUserReceiverExpressCount(int userId);

	void addExpress(Express express);
	
	ContactAddress getUserContactAddressById(int receiverId);

	void changeExpressStatus(@Param("expressId")long expressId,@Param("expressStatus")int expressStatus);
	
	List<Express> searchUserSenderExpressByPage(ExpressSearchCondition searchCondition);
	
	int searchUserSenderExpressCount(ExpressSearchCondition searchCondition);
	
	List<Express> searchUserReceiverExpressByPage(ExpressSearchCondition searchCondition);
	
	int searchUserReceiverExpressCount(ExpressSearchCondition searchCondition);
	
	void updateExpress(Express express);
	
	Express getExpressById(@Param("expressId")long expressId);
}
