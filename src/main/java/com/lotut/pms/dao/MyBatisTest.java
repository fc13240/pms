package com.lotut.pms.dao;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lotut.pms.dao.mapper.FeeMapper;
import com.lotut.pms.service.FeeService;

public class MyBatisTest {
	public static void main(String[] args) throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("config/spring-mybatis.xml", "config/spring-service.xml");
		FeeService feeService = context.getBean("feeService", FeeService.class);


		FeeMapper mapper = context.getBean("feeMapper", FeeMapper.class);
		List<Long> feeIds = Arrays.asList(25L, 29L);
		int monitorStatus = 2;
		
		mapper.updateMonitStatus(feeIds, monitorStatus);
		
	}
}
