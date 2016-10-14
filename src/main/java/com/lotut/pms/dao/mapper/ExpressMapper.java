package com.lotut.pms.dao.mapper;

import java.util.List;

import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Express;
import com.lotut.pms.domain.Page;

public interface ExpressMapper {
	List<Express> getUserSenderExpressListByPage (Page page);
	
	int getUserSenderExpressCount(int userId);
	
	List<Express> getUserReceiverExpressListByPage (Page page);
	
	int getUserReceiverExpressCount(int userId);
	
	void changeExpressStatus(long expressId,int status);
	
	void addExpress(Express express);
	
	ContactAddress getUserContactAddressById(int receiverId);
}
