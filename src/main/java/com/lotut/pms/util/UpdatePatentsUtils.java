package com.lotut.pms.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lotut.pms.dao.SharePatentDao;
import com.lotut.pms.domain.Patent;

public class UpdatePatentsUtils {
	public static void  updatepatents(List<Map<String, Integer>> userPatentList,List<Patent> patents,SharePatentDao sharePatentDao){
		for (Patent patent: patents) {
			boolean isNewPatent = patent.getPatentId() != 0;
			if (isNewPatent) {
				HashMap<String, Integer> userPatentMap = new HashMap<>();
				userPatentMap.put("user", patent.getOwnerId());
				userPatentMap.put("patent", (int) patent.getPatentId());
				userPatentList.add(userPatentMap);
			}
		}
		if (userPatentList.size() > 0) {
			sharePatentDao.insertUserPatents(userPatentList);
		}
	}
}
