package com.project.dang.restcontroller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangInterestDto;
import com.project.dang.dto.UserImgDto;
import com.project.dang.repository.DangInterestDao;
import com.project.dang.repository.DangUserDao;
import com.project.dang.service.DangCertEmailService;
import com.project.dang.vo.DangUserVO;

@RestController
@RequestMapping("/rest_user")
public class DangUserRestController {
	
	@Autowired
	private DangUserDao dangUserDao;
	
	@Autowired
	private DangCertEmailService dangCertEmailService;
	
	@Autowired
	private DangInterestDao dangInterestDao;

	// 아이디 중복 검사
	@GetMapping("/check_id")
	public boolean checkId(@RequestParam String userId) {
		// 입력한 아이디로 회원 정보 단일 조회
		DangUserVO searchUserVO = dangUserDao.checkId(userId);
		// 만약 조회 정보가 존재한다면 (이미 존재하는 아이디라면)
		if(searchUserVO != null) return false; // false를 반환
		// 그 외의 경우에는
		else return true; // true를 반환 (중복되지 않는 아이디)
	}
	
	// 이메일 중복 검사
	@GetMapping("/check_email")
	public boolean checkEmail(@RequestParam String userEmail) {
		// 이미 가입한 이메일인지 여부 반환
		return dangUserDao.checkEmail(userEmail);
	}
	
	// 이메일 전송
	@GetMapping("/send_email")
	public String sendEmail(@RequestParam String userEmail) throws FileNotFoundException, MessagingException, IOException {
		// 이메일 전송 후 인증정보 DB 등록 및 인증번호 반환
		return dangCertEmailService.sendEmail(userEmail);
	}
	
	//프로필 이미지 등록
	@PostMapping("/img_insert")
	public void imgInsert(@RequestBody UserImgDto dto) {
		dangUserDao.userImgInsert(dto);
	}
	
	//프로필 이미지 삭제
	@DeleteMapping("/img_delete/{attachmentNo}")
	public boolean imgDelete(@PathVariable int attachmentNo) {
		//파일 있는지 확인 후 없을 경우 false, 있을 경우 삭제 후 true 반환
		Integer imgCheck = dangUserDao.findAttachmentNo(attachmentNo);
		if(imgCheck==null) {
			return false;
		}
		return dangUserDao.userImgeDelete(attachmentNo);
	}
	
	// 관심지역 변경(삭제 후 등록)
	@PostMapping("/change_interest")
	public void changeInterest(@RequestParam(value = "dangInterestArray[]") List<String> dangInterestArray, HttpSession session) {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		// 이전 관심지역 목록 전체 삭제
		dangInterestDao.deleteInterest(userNo);
		// 입력받은 관심지역 등록
		for(int i = 0 ; i < dangInterestArray.size() ; i ++) {
			dangInterestDao.insertInterest(DangInterestDto.builder().userNo(userNo).interestArea(dangInterestArray.get(i)).build());
		}
	}
}
