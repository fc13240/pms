package com.lotut.pms.dao.mapper;

import java.util.List;

import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.Page;

public interface BrandMapper {
	
	List<Brand> getUserBrandsByPage(Page page);
}
