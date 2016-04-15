package com.lotut.pms.dao;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lotut.pms.dao.mapper.UserMapper;
import com.lotut.pms.domain.ContactAddress;

public class MyBatisTest {
	public static void main(String[] args) throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("config/spring-mybatis.xml", "config/spring-service.xml");

		UserMapper mapper = context.getBean("userMapper", UserMapper.class);
		List<ContactAddress> contactAddresses = mapper.getUserContactAddresses(2);
		
		for (ContactAddress address: contactAddresses) {
			System.out.println(address.getReceiver() + " " + address.getDetailAddress());
		}
		
	}
}
