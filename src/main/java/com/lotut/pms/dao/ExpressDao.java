package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.Express;
import com.lotut.pms.domain.Page;

public interface ExpressDao {
	List<Express> getUserSenderExpressListByPage (Page page);
	
	int getUserSenderExpressCount(int userId);
	
	List<Express> getUserReceiverExpressListByPage (Page page);
	
	int getUserReceiverExpressCount(int userId);
	
	void changeExpressStatus(long expressId,int expressStatus);
	
}	
