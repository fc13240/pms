package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.Page;

public interface BrandMapper {
	
	List<Brand> getUserBrandsByPage(Page page);
	
	void updateCheckStatus(@Param("status")int status,@Param("id")int id);
	
	void updateRecommend(@Param("status")int status,@Param("id")int id);
}
