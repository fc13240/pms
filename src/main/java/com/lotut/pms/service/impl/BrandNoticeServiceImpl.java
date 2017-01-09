package com.lotut.pms.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.dao.BrandNoticeDao;
import com.lotut.pms.domain.BrandNotice;
import com.lotut.pms.domain.Page;
import com.lotut.pms.service.BrandNoticeService;

public class BrandNoticeServiceImpl implements BrandNoticeService {
	private BrandNoticeDao brandNoticeDao;

	public BrandNoticeServiceImpl(BrandNoticeDao brandNoticeDao) {
		this.brandNoticeDao = brandNoticeDao;
	}

	@Override
	public int getUserBrandNoticeCount(int userId) {
		return brandNoticeDao.getUserBrandNoticeCount(userId);
	}

	@Override
	public List<BrandNotice> getUserBrandNoticeList(Page page) {
		return brandNoticeDao.getUserBrandNoticeList(page);
	}

	@Override
	@Transactional
	public int batchChangeBrandNoticeViewStatus(List<Long> noticeIdList,int userId) {
		List<Map<String, Long>> list =new ArrayList<>();
		for(Long noticeId:noticeIdList){
			Map<String,Long> map=new HashMap<String,Long>();
			map.put("noticeId", noticeId);
			map.put("userId", new Long(userId));
			list.add(map);
		}
		brandNoticeDao.batchChangeBrandNoticeViewStatus(list);
		return 1;
	}
}
