package com.project.dang.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.dang.dto.AttachmentDto;
import com.project.dang.dto.DangUserDto;
import com.project.dang.dto.UserImgDto;
import com.project.dang.repository.AttachmentDao;
import com.project.dang.repository.DangUserDao;
import com.project.dang.vo.DangUserMypageVO;
import com.project.dang.vo.DangUserVO;

@Controller
@RequestMapping("/user")
public class DangUserController {
	
	@Autowired
	private DangUserDao dangUserDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	// 기준 경로 설정
	private File directory = new File(System.getProperty("user.home"),"/dang"); // C드라이브 경로
	//private File directory = new File("D:/upload/dang"); // D드라이브 경로
	
	// 디렉토리 생성
	@PostConstruct
	public void prepare() {
		directory.mkdirs();
	}
	
	// 회원 가입
	@GetMapping("/join")
	public String join() {
		return "dang_user/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute DangUserDto dangUserDto) {
		// 회원번호를 반환하여 회원 정보로 설정
		int userNo = dangUserDao.userNo();
		dangUserDto.setUserNo(userNo);
		// 회원 가입
		dangUserDao.join(dangUserDto);
		// 로그인 Mapping으로 redirect
		return "redirect:login";
	}
	
	// 회원가입 완료
	@GetMapping("/join_success")
	public String joinSuccess() {
		return "dang_user/join_success";
	}
	
	// 로그인
	@GetMapping("/login")
	public String login() {
		return "dang_user/login";
	}
	
	@PostMapping("/login") 
	public String login(DangUserVO inputUserVO, HttpSession session) {
		// 입력받은 회원 아이디로 회원 정보 단일 조회 (ID 검사)
		DangUserVO searchUserVO = dangUserDao.checkId(inputUserVO.getUserId());
		if(searchUserVO == null) { // 조회 결과가 없다면
			return "redirect:login?error";
		}
		// 비밀번호 일치 여부 판정 (PW 검사)
		boolean pwCheck = dangUserDao.checkPw(inputUserVO.getUserPw(), searchUserVO.getUserPw());
		if(pwCheck) { // 비밀번호가 일치한다면
			session.setAttribute("loginNo", searchUserVO.getUserNo()); // 회원 번호 저장
			session.setAttribute("loginGrade", searchUserVO.getUserGrade()); // 회원 등급 저장
			dangUserDao.updateLogindate(searchUserVO.getUserNo());
			return "redirect:/";
		} else { // 비밀번호가 일치하지 않는다면
			return "redirect:login?error"; 
		}
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginNo");
		session.removeAttribute("loginGrade");
		return "redirect:/";
	}
	
	// 마이페이지
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		// 반환한 회원 번호로 회원 정보 조회하여 model에 추가
		model.addAttribute("userInfo", dangUserDao.selectUserInfo(userNo));
		return "dang_user/mypage";
	}
	
	// 회원정보 변경 전 비밀번호 체크
	@GetMapping("/edit_pwck")
	public String editPwck() {
		return "dang_user/edit_pwck";
	}
	
	@PostMapping("/edit_pwck")
	public String editPwck(HttpSession session, @ModelAttribute DangUserVO inputUserVO, RedirectAttributes attr) {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		// 회원번호로 해당 회원의 비밀번호 조회
		String userPw = dangUserDao.selectUserPw(userNo);
		// 비밀번호 일치 판정
		boolean judge = dangUserDao.checkPw(inputUserVO.getUserPw(), userPw);
		if(judge) { // 일치한다면
			attr.addAttribute("userNo", userNo);
			return "redirect:edit_info";
		} else {
			return "redirect:edit_pwck?error";
		}
	}
	
	@GetMapping("/edit_info")
	public String editInfo(@RequestParam int userNo, Model model) {
		// 입력받은 회원번호로 회원정보를 조회하여 model에 추가
		model.addAttribute("userInfo", dangUserDao.selectUserInfo(userNo));
		return "dang_user/edit_user_info";
	}
	
	@PostMapping("/edit_info")
	public String editInfo(@ModelAttribute DangUserMypageVO inputUserMypageVO, MultipartFile userProfile) throws IllegalStateException, IOException {
		// 개인정보 수정
		dangUserDao.editUserInfo(inputUserMypageVO);
		// 첨부파일 수정
		if(userProfile.getSize() != 0) { // 수정하려는 첨부파일이 존재한다면
			// 기존 첨부파일 번호 반환
			Integer attachmentNoExisting = dangUserDao.findAttachmentNo(inputUserMypageVO.getUserNo());
			if(attachmentNoExisting != null) { // 기존 첨부파일이 존재하는 경우
				// 첨부파일 테이블에서 정보 삭제 (on delete cascade 조건에 의해 연결 테이블은 자동 삭제)
				attachmentDao.delete(attachmentNoExisting);
				// 기존 첨부파일 이름 반환
				String fileName = String.valueOf(attachmentNoExisting);
				// 삭제할 첨부파일 경로 설정
				File targetExisting = new File(directory, fileName);
				// 기존 첨부파일 삭제
				targetExisting.delete();
			}
			// 새로 첨부파일을 등록하기 위해 번호 반환
			int attachmentNo = attachmentDao.sequence();
			// 첨부파일 정보 DB 등록
			attachmentDao.insert(AttachmentDto.builder()
					.attachmentNo(attachmentNo)
					.attachmentName(userProfile.getName())
					.attachmentType(userProfile.getContentType())
					.attachmentSize(userProfile.getSize())
					.build());
			// 연결 테이블 DB 등록
			dangUserDao.userImgInsert(UserImgDto.builder()
					.userNo(inputUserMypageVO.getUserNo())
					.attachmentNo(attachmentNo)
					.build());
			// 첨부파일 저장 경로 생성
			File target = new File(directory, String.valueOf(attachmentNo));
			// 파일 저장
			userProfile.transferTo(target);
		}
		return "redirect:mypage";
	}
	
	// 비밀번호 변경
	@GetMapping("/change_pw")
	public String changePw() {
		return "dang_user/change_pw";
	}
}
