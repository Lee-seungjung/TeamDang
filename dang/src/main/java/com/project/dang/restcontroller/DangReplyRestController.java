package com.project.dang.restcontroller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.repository.DangReplyDao;
import com.project.dang.vo.ReplyHistoryVO;

@CrossOrigin
@RestController
@RequestMapping("/rest_reply")
public class DangReplyRestController {
	
	@Autowired
	DangReplyDao dangReplyDao;
	
	//게시글 댓글조회
	@GetMapping("/list/{boardNo}")
	public List<ReplyHistoryVO> list(@PathVariable int boardNo){
		return dangReplyDao.oneBoardList(boardNo);
	}

	 }