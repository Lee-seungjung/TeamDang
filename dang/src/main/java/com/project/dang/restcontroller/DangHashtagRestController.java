package com.project.dang.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangHashtagDto;
import com.project.dang.repository.DangHashtagDao;
import com.project.dang.vo.DangHashtagVO;

@RestController
@RequestMapping("/rest_hashtag")
public class DangHashtagRestController {
	
	@Autowired
	private DangHashtagDao dangHashtagDao;

	// 해시태그 등록
	@PostMapping("/insert")
	public DangHashtagVO insertHashtag(@ModelAttribute DangHashtagDto dangHashtagDto) {
		// 해시태그 번호 등록
		int hashtagNo = dangHashtagDao.hashtagNo();
		dangHashtagDto.setHashtagNo(hashtagNo);
		dangHashtagDao.insertHashtag(dangHashtagDto);
		// 등록한 해시태그 반환
		DangHashtagVO dangHashtagVO = dangHashtagDao.selectHashtag(hashtagNo);
		return dangHashtagVO;
	}
}
