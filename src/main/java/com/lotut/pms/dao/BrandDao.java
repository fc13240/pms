package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.Page;

public interface BrandDao {
	
	List<Brand> getUserBrandsByPage(Page page);
}
