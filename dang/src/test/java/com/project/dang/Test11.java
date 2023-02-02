package com.project.dang;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.project.dang.repository.DangScheduleDao;

@SpringBootTest
public class Test11 {

	
	@Autowired
	private DangScheduleDao dao ;
  
	@Test
	public void insert() {
		
	}
}
