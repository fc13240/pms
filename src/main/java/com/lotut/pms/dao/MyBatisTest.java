package com.lotut.pms.dao;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lotut.pms.dao.mapper.PatentMapper;
import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.service.FeeService;

public class MyBatisTest {
	public static void main(String[] args) throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("config/spring-mybatis.xml", "config/spring-service.xml");
		FeeService feeService = context.getBean("feeService", FeeService.class);


	 feeService.batchGrabFees(Arrays.asList(4868709L,4868709L,4868655L,4868656L,4868654L,4864976L,4865987L,4868996L,4864977L,4866720L,4866719L));
		

//		PatentMapper mapper = context.getBean("patentMapper", PatentMapper.class);
//		List<Patent> patents = mapper.getPatentsByIds(Arrays.asList(4868709,4868709,4868655,4868656,4868654,4864976,4865987,4868996,4864977,4866720,4866719));
//		
//		for (Patent patent: patents) {
//			System.out.println(patent);
//		}
		
	}
}
