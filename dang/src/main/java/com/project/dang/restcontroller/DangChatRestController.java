package com.project.dang.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangChatDto;
import com.project.dang.repository.DangChatDao;
import com.project.dang.repository.DangReportDao;
import com.project.dang.vo.ChatHistoryVO;

@CrossOrigin
@RestController
@RequestMapping("/rest_chat")
public class DangChatRestController {

	//의존성 주입
	@Autowired
	private DangChatDao dangChatDao;
	@Autowired
	private DangReportDao dangReportDao;

	//채팅 내역 조회(20개씩)
	@GetMapping("/scroll_list/{roomNo}/{chatNo}")
	public List<ChatHistoryVO> findScore(@PathVariable int roomNo,
			@PathVariable int chatNo) {
		return dangChatDao.scrollList(roomNo, chatNo);
	}
	
	//기존 채팅내역 닉네임 수정
	@PatchMapping("/update_nick")
	public boolean updateNick(@RequestBody DangChatDto dto) {
		return dangChatDao.updateNick(dto);
	}
	
	//경고 확인 컬럼 변경
	@PatchMapping("/alert_update/{reportNo}")
	public boolean alertUpdate(@PathVariable int reportNo) {
		return dangReportDao.alertUpdate(reportNo);
	}
	
	@DeleteMapping("/delete_member_history")
	public boolean deleteMember(@RequestParam int userNo, @RequestParam int roomNo) {
		return dangChatDao.deleteChatList(roomNo,userNo);
	}
	
	
}
