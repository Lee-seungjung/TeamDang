package com.project.dang.restcontroller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangReplyDto;
import com.project.dang.repository.DangReplyDao;
import com.project.dang.vo.ReplyHistoryVO;

@CrossOrigin
@RestController
@RequestMapping("/rest_reply")
public class DangReplyRestController {
	
	@Autowired
	DangReplyDao dangReplyDao;
	
	//댓글 시퀀스 조회
	@GetMapping("/sequence")
	public int sequence(){
		return dangReplyDao.sequence();
	}
	
	//댓글 등록
	@PostMapping("/insert")
	public void insert(@RequestBody DangReplyDto dto) {
		dangReplyDao.replyInsert(dto);
	}
	
	//게시글 댓글조회
	@GetMapping("/list/{boardNo}")
	public List<ReplyHistoryVO> list(@PathVariable int boardNo){
		return dangReplyDao.oneBoardList(boardNo);
	}
	
	//게시글 댓글조회(더보기)
	@GetMapping("/list/{boardNo}/{replyNo}")
	public List<ReplyHistoryVO> list(@PathVariable int boardNo,@PathVariable int replyNo){
		return dangReplyDao.moreReplyList(boardNo,replyNo);
	}
	
	//댓글 하나만 조회
	@GetMapping("/list_one/{replyNo}")
	public ReplyHistoryVO listone(@PathVariable int replyNo){
		return dangReplyDao.selectOne(replyNo);
	}
	
	//게시글에 달린 댓글 번호 조회
	@GetMapping("/replyno_list/{boardNo}")
	public List<Integer> replyNoList(@PathVariable int boardNo){
		return dangReplyDao.replyNoList(boardNo);
	}
	
	//댓글 수정
	@PatchMapping("/update/{replyContent}/{replyNo}")
	public boolean update(@PathVariable int replyNo,
			@PathVariable String replyContent) {
		return dangReplyDao.updateContent(replyContent, replyNo);
	}
	
	//댓글작성자 닉네임 변경
	@PatchMapping("/update_nick")
	public boolean updateNick(@RequestBody DangReplyDto dto) {
		return dangReplyDao.updateNick(dto);
	}
	
	//댓글 삭제
	@DeleteMapping("/delete/{replyNo}")
	public boolean delete(@PathVariable int replyNo) {
		return dangReplyDao.delete(replyNo);
	}

}
