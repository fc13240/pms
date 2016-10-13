package com.lotut.pms.service;

import com.lotut.pms.domain.Express;

public interface ExpressService {
	void addExpress(Express express);
	
	void confirmSendOff(Express express);

}
