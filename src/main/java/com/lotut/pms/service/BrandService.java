package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.Page;

public interface BrandService {
	
	List<Brand> getUserBrandsByPage(Page page);
}
