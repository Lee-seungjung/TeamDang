package com.project.dang.restcontroller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangInterestDto;
import com.project.dang.dto.HistoryListRequestDto;
import com.project.dang.dto.HistoryListResponseDto;
import com.project.dang.dto.UserImgDto;
import com.project.dang.repository.DangDao;
import com.project.dang.repository.DangInterestDao;
import com.project.dang.repository.DangReportDao;
import com.project.dang.repository.DangScheduleDao;
import com.project.dang.repository.DangUserDao;
import com.project.dang.service.DangCertEmailService;
import com.project.dang.vo.DangUserVO;
import com.project.dang.vo.JoinScheduleListVO;

@RestController
@RequestMapping("/rest_user")
public class DangUserRestController {
	
	@Autowired
	private DangUserDao dangUserDao;
	
	@Autowired
	private DangCertEmailService dangCertEmailService;
	
	@Autowired
	private DangInterestDao dangInterestDao;
	
	@Autowired
	private DangReportDao dangReportDao;
	
	@Autowired
	private DangDao dangDao;
	
	@Autowired
	private DangScheduleDao dangScheduleDao;

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
	public void imgInsert(@RequestBody UserImgDto dto, HttpSession session) {
		// HttpSession에서 기존의 회원 프로필 번호 삭제
		session.removeAttribute("loginProfileImg");
		// 새로운 회원 프로필 번호를 HttpSession에 저장
		session.setAttribute("loginProfileImg", dto.getAttachmentNo());
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
	public void changeInterest(@RequestParam(value = "dangInterestArray[]", required=false) List<String> dangInterestArray, HttpSession session) {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		// 입력받은 관심지역 배열의 원소 유무에 따라 다른 처리
		if(dangInterestArray == null) { // 입력받은 관심지역 배열의 원소가 하나도 없을 경우
			// 이전 관심지역 목록 전체 삭제
			dangInterestDao.deleteInterest(userNo);
		} else { // 그렇지 않을 경우
			// 이전 관심지역 목록 전체 삭제
			dangInterestDao.deleteInterest(userNo);
			// 입력받은 관심지역 등록
			for(int i = 0 ; i < dangInterestArray.size() ; i ++) {
				dangInterestDao.insertInterest(DangInterestDto.builder().userNo(userNo).interestArea(dangInterestArray.get(i)).build());
			}
		}
	}
	
	// 댕모임 입장 전 신고 조회
	@GetMapping("/check_report")
	public boolean isBanned(@RequestParam int dangNo, @RequestParam int userNo) {
		// 신고를 2번 이상 당했으면 true를 반환
		int countReportApproved = dangReportDao.countReportApproved(dangNo, userNo);
		if(countReportApproved >= 2) {
			return true;
		} else {
			return false;
		}
	}
	
	// 댕모임 해체
	@DeleteMapping("/close_dang")
	public boolean closeDang(@RequestParam int dangNo) {
		return dangDao.closeDang(dangNo);
	}
	
	//마이페이지 참여일정 전체/검색 조회
	@PostMapping("/schedule_history")
	public HistoryListResponseDto scheduleHistory(@ModelAttribute HistoryListRequestDto historyListRequestDto,
			HttpSession httpSession) {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)httpSession.getAttribute("loginNo");
		
		System.out.println(historyListRequestDto.getType());
		System.out.println(historyListRequestDto.getKeyword());
		System.out.println(historyListRequestDto.getP());

		// 총 참여일정 수 조회
		int historyTotal = dangUserDao.historyCount(historyListRequestDto);
		// dto에 총 갯수 설정
		historyListRequestDto.setTotal(historyTotal);
		historyListRequestDto.setUserNo(userNo);
		//마이페이지 참여일정 조회
		List<JoinScheduleListVO> scheduleHistory = dangScheduleDao.joinScheduleList(historyListRequestDto);
		// 반환용 객체 생성
		HistoryListResponseDto historyListResponseDto = new HistoryListResponseDto();
		historyListResponseDto.setScheduleHistory(scheduleHistory);
		historyListResponseDto.setBlockStart(historyListRequestDto.blockStart());
		historyListResponseDto.setBlockEnd(historyListRequestDto.blockEnd());
		historyListResponseDto.setBlockPrev(historyListRequestDto.blockPrev());
		historyListResponseDto.setBlockNext(historyListRequestDto.blockNext());
		historyListResponseDto.setBlockFirst(historyListRequestDto.blockFirst());
		historyListResponseDto.setBlockLast(historyListRequestDto.blockLast());
		System.out.println(historyListRequestDto.toString());
		return historyListResponseDto;
	}
}
