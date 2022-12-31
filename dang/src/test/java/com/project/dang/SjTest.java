package com.project.dang;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.project.dang.entity.RoomDto;
import com.project.dang.repository.DangChatDao;

@SpringBootTest
public class SjTest {

	@Autowired
	private DangChatDao roomDao;
	
//	@Test
//	public void insert() {
//		RoomDto dto = RoomDto.builder()
//				.roomNo(1)
//				.dangNo(1)
//				.build();
//		roomDao.insert(dto);
//	}
}
