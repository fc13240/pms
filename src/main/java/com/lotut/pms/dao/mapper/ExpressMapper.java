package com.lotut.pms.dao.mapper;

import java.util.List;
import com.lotut.pms.domain.ContactAddress;
import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Express;
import com.lotut.pms.domain.Page;

public interface ExpressMapper {
	List<Express> getUserSenderExpressListByPage (Page page);
	
	int getUserSenderExpressCount(int userId);
	
	List<Express> getUserReceiverExpressListByPage (Page page);
	
	int getUserReceiverExpressCount(int userId);

	void addExpress(Express express);
	
	ContactAddress getUserContactAddressById(int receiverId);

	void changeExpressStatus(@Param("expressId")long expressId,@Param("expressStatus")int expressStatus);
}
