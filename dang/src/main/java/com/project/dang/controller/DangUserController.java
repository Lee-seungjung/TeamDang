package com.project.dang.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.regex.Pattern;

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
import com.project.dang.dto.DangPuppyListDto;
import com.project.dang.dto.DangUserDto;
import com.project.dang.dto.DangUserJoinRequestDto;
import com.project.dang.dto.DangUserJoinResponseDto;
import com.project.dang.dto.HistoryListRequestDto;
import com.project.dang.dto.UserImgDto;
import com.project.dang.repository.AttachmentDao;
import com.project.dang.repository.DangDao;
import com.project.dang.repository.DangInterestDao;
import com.project.dang.repository.DangMemberDao;
import com.project.dang.repository.DangPuppyDao;
import com.project.dang.repository.DangScheduleDao;
import com.project.dang.repository.DangUserDao;
import com.project.dang.vo.DangUserChangePwVO;
import com.project.dang.vo.DangUserFindVO;
import com.project.dang.vo.DangUserMypageVO;
import com.project.dang.vo.DangUserVO;
import com.project.dang.vo.JoinScheduleListVO;

@Controller
@RequestMapping("/user")
public class DangUserController {
	
	@Autowired
	private DangUserDao dangUserDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private DangPuppyDao dangPuppyDao;
	
	@Autowired
	private DangInterestDao dangInterestDao;
	
	@Autowired
	private DangDao dangDao;
	
	@Autowired
	private DangScheduleDao dangScheduleDao;
	
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
		return "redirect:join_success";
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
			session.setAttribute("loginNick", searchUserVO.getUserNick()); // 회원 닉네임 저장
			session.setAttribute("loginProfileImg", searchUserVO.getAttachmentNo()); // 회원 프로필 이미지 번호 저장
			dangUserDao.updateLogindate(searchUserVO.getUserNo());
			return "redirect:/";
		} else { // 비밀번호가 일치하지 않는다면
			return "redirect:login?error"; 
		}
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginNo"); // 회원 번호 삭제
		session.removeAttribute("loginGrade"); // 회원 등급 삭제
		session.removeAttribute("loginNick"); // 회원 닉네임 삭제
		session.removeAttribute("loginProfileImg"); // 회원 프로필 이미지 번호 삭제
		return "redirect:/";
	}
	
	// 마이페이지
	@GetMapping("/mypage")
	public String mypage(HttpSession session, Model model, DangUserDto dangUserDto) {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		// 로그인 중인 회원의 댕댕이 목록 반환
		List<DangPuppyListDto> dangPuppyList = dangPuppyDao.selectPuppyList(userNo);
		// 반환한 회원 번호로 회원 정보 조회하여 model에 추가
		model.addAttribute("userInfo", dangUserDao.selectUserInfo(userNo));
		// 조회한 댕댕이 정보를 Model에 추가
		model.addAttribute("dangPuppyList", dangPuppyList);
		//마이페이지 등록한 관심지역 반환
		List<String> interestArea = dangUserDao.mypageInterestArea(userNo);
		//마이페이지 등록한 댕댕이 수 반환
		int mypageDangNum = dangUserDao.mypageDangNum(userNo);
		//마이페이지 등록한 댕모임 수 반환
		int mypagePartyNum = dangUserDao.mypagePartyNum(userNo);
		//마이페이지 등록한 로그인 일자 반환
		Date mypageLogin = dangUserDao.mypageLogin(userNo);
		//조회한 관심지역 리스트  Model에 추가
		model.addAttribute("interestArea" ,interestArea);
		System.out.println("관심지역 : " + interestArea);
		//조회한 댕댕이 수 Model에 추가
		model.addAttribute("mypageDangNum", mypageDangNum);
		//조회한 활동 댕모임 수 Model에 추가
		model.addAttribute("mypagePartyNum", mypagePartyNum);
		//조회한 최근 로그인 일자 Model에 추가	
		model.addAttribute("mypageLogin", mypageLogin);
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
	public String editInfo(@ModelAttribute DangUserMypageVO inputUserMypageVO, MultipartFile userProfile, HttpSession session) throws IllegalStateException, IOException {
		// 개인정보 수정
		dangUserDao.editUserInfo(inputUserMypageVO);
		// HttpSession에서 기존의 회원 닉네임 삭제
		session.removeAttribute("loginNick");
		// 새로운 회원 닉네임을 HttpSession에 저장
		session.setAttribute("loginNick", inputUserMypageVO.getUserNick());
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
			// HttpSession에서 기존의 회원 프로필 번호 삭제
			session.removeAttribute("loginProfileImg");
			// 새로운 회원 프로필 번호를 HttpSession에 저장
			session.setAttribute("loginProfileImg", attachmentNo);
		}
		return "redirect:edit_info_success";
	}
	
	// 회원정보 변경 완료
	@GetMapping("/edit_info_success")
	public String editInfoSuccess() {
		return "dang_user/edit_user_info_success";
	}
	
	// 비밀번호 변경
	@GetMapping("/change_pw")
	public String changePw() {
		return "dang_user/change_pw";
	}
	
	@PostMapping("/change_pw")
	public String changePw(HttpSession session, @ModelAttribute DangUserChangePwVO dangUserChangePwVO) {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		// 회원 번호로 해당 회원의 비밀번호 조회
		String searchUserPw = dangUserDao.selectUserPw(userNo);
		// 조회한 비밀번호와 입력받은 비밀번호가 일치하는지 여부
		boolean step1 = dangUserDao.checkPw(dangUserChangePwVO.getUserPwNow(), searchUserPw);
		if(!step1) {
			return "redirect:change_pw?error_step1";
		}
		// 새로운 비밀번호와 비밀번호 확인이 일치하는지 여부
		boolean step2 = dangUserChangePwVO.getUserPw().equals(dangUserChangePwVO.getUserPwck());
		if(!step2) {
			return "redirect:change_pw?error_step2";
		}
		// 비밀번호 변경
		dangUserDao.changeUserPw(userNo, dangUserChangePwVO.getUserPw());
		// 비밀번호 변경 성공 Mapping으로 redirect
		return "redirect:change_pw_success";
	}
	
	@GetMapping("/change_pw_success")
	public String changePwSuccess() {
		return "dang_user/change_pw_success";
	}
	
	// 회원 탈퇴 전 비밀번호 검사
	@GetMapping("/close_pwck")
	public String closeUserPwck() {
		return "dang_user/close_pwck";
	}
	
	@PostMapping("/close_pwck")
	public String closeUserPwck(HttpSession session, @ModelAttribute DangUserVO inputUserVO) {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		// 회원번호로 해당 회원의 비밀번호 조회
		String userPw = dangUserDao.selectUserPw(userNo);
		// 비밀번호 일치 판정
		boolean judge = dangUserDao.checkPw(inputUserVO.getUserPw(), userPw);
		if(judge) { // 일치한다면
			return "redirect:close_user";
		} else {
			return "redirect:close_pwck?error";
		}
	}
	
	// 회원탈퇴
	@GetMapping("/close_user")
	public String closeUser() {
		return "dang_user/close_user";
	}
	
	// 회원탈퇴
	@GetMapping("/close_user_ck")
	public String closeUser(@RequestParam String closeCheck, HttpSession session) {
		if(closeCheck.equals("즉시 탈퇴")) {			
			// 로그인 중인 회원번호 반환
			Integer userNo = (Integer)session.getAttribute("loginNo");
			// 회원 정보 삭제
			dangUserDao.closeUser(userNo);
			// 세션에서 정보 삭제
			session.removeAttribute("loginNo");
			session.removeAttribute("loginGrade");
			// 회원탈퇴 완료 Mapping으로 redirect
			return "redirect:close_user_result";
		} else {
			return "redirect:close_user?error";
		}
	}
	
	// 회원탈퇴 완료
	@GetMapping("/close_user_result")
	public String closeUserResult() {
		return "dang_user/close_user_result";
	}
	
	// 아이디 찾기
	@GetMapping("/find_id")
	public String findId() {
		return "dang_user/find_id";
	}
	
	@PostMapping("/find_id")
	public String findId(@ModelAttribute DangUserFindVO dangUserFindVO, Model model) {
		// 입력받은 이메일로 회원 아이디 조회
		String findUserId = dangUserDao.findUserId(dangUserFindVO.getUserEmail());
		// 조회 결과가 null이 아니라면
		if(findUserId != null) {
			// 조회 정보를 Model에 추가
			model.addAttribute("findUserId", findUserId);
			return "redirect:find_id_result";
		} else {
			return "redirect:find_id?fail";
		}
	}
	
	@GetMapping("/find_id_result")
	public String findIdResult() {
		return "dang_user/find_id_result";
	}
	
	// 비밀번호 찾기
	@GetMapping("/find_pw")
	public String findPw() {
		return "dang_user/find_pw";
	}
	
	@PostMapping("/find_pw")
	public String findPw(@ModelAttribute DangUserFindVO dangUserFindVO, RedirectAttributes attr) {
		// 입력받은 아이디와 이메일로 회원 번호 조회
		Integer findUserNo = dangUserDao.findUserPw(dangUserFindVO.getUserId(), dangUserFindVO.getUserEmail());
		if(findUserNo != null) {
			// 비밀번호 재설정으로 redirect
			attr.addAttribute("userNo", findUserNo);
			return "redirect:find_pw_change";
		} else {
			return "redirect:find_pw?fail";
		}
	}
	
	// 비밀번호 재설정
	@GetMapping("/find_pw_change")
	public String findPwResult(@RequestParam int userNo, Model model) {
		model.addAttribute("userNo", userNo);
		return "dang_user/find_pw_change";
	}
	
	@PostMapping("/find_pw_change")
	public String findPwResult(@RequestParam int userNo, @ModelAttribute DangUserChangePwVO dangUserChangePwVO) {
		// 새 비밀번호와 비밀번호 확인 일치 여부
		boolean step1 = dangUserChangePwVO.getUserPw().equals(dangUserChangePwVO.getUserPwck());
		if(!step1) {
			return "redirect:find_pw_change?userNo=" + userNo + "&fail_step1";
		}
		// 비밀번호 정규 표현식
		String rexexp = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$]{8,16}$";
		// 정규표현식 만족 여부
		boolean step2 = Pattern.matches(rexexp, dangUserChangePwVO.getUserPw());
		if(!step2) {
			return "redirect:find_pw_change?userNo=" + userNo + "&fail_step2";
		}
		// 비밀번호 변경
		dangUserDao.changeUserPw(userNo, dangUserChangePwVO.getUserPw());
		return "redirect:find_pw_success";
	}
	
	@GetMapping("/find_pw_success")
	public String findPwSuccess() {
		return "dang_user/find_pw_success";
	}
	
	// 마이페이지 댕댕이 정보 변경
	@GetMapping("/edit_puppy_info")
	public String editPuppyInfo(HttpSession session, Model model) {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		// 로그인 중인 회원의 댕댕이 목록 반환
		List<DangPuppyListDto> dangPuppyList = dangPuppyDao.selectPuppyList(userNo);
		// 조회한 댕댕이 정보를 Model에 추가
		model.addAttribute("dangPuppyList", dangPuppyList);
		return "dang_user/edit_puppy_info";
	}
	
	// 마이페이지 관심지역 설정
	@GetMapping("/change_interest_area")
	public String changeInterestArea(HttpSession session, Model model) {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		// 이전에 저장한 관심지역 조회
		List<String> interestAreaList = dangInterestDao.selectInterest(userNo);
		model.addAttribute("interestAreaList", interestAreaList);
		return "dang_user/change_interest_area";
	}
	
	// 마이페이지 내가 가입한 댕모임
	@GetMapping("/list_mydang")
	public String listMydang(HttpSession session, Model model, @ModelAttribute DangUserJoinRequestDto dangUserJoinRequestDto) {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		// 내가 가입한 댕모임 갯수 반환
		int dangJoinCount = dangDao.countDangUserJoin(userNo);
		// 입력받은 DTO에 회원 번호, 댕모임 총 갯수 설정
		dangUserJoinRequestDto.setUserNo(userNo);
		dangUserJoinRequestDto.setTotal(dangJoinCount);
		// 회원이 가입한 댕모임 목록 반환
		List<DangUserJoinResponseDto> dangUserJoinList = dangDao.selectDangUserJoinList(dangUserJoinRequestDto);
		// 특정 회원이 개설한 댕모임 리스트
		List<Integer> dangUserCreateList = dangDao.selectMydangOwnerList(userNo);
		// 댕모임 전체/검색 조회 목록에 가입 여부 설정
		for(int i = 0 ; i < dangUserJoinList.size() ; i ++) { // 댕모임 전체/검색 조회 목록에 대해
			for(int j = 0 ; j < dangUserCreateList.size() ; j ++) { // 회원이 가입한 댕모임 번호 목록 길이만큼 반복
				if(dangUserJoinList.get(i).getDangNo().equals(dangUserCreateList.get(j))) { // 댕모임 전체/검색 조회 목록의 i번째 댕모임 번호가 회원이 가입한 댕모임 번호 목록의 j번째와 같을 때
					dangUserJoinList.get(i).setIsOwner(1);// 해당 댕모임 정보의 댕모임 가입 여부(isMember) 필드의 값을 1로 변경
				}
			}
		}
		model.addAttribute("dangUserJoinList", dangUserJoinList);
		return "dang_user/list_mydang";
	}
	
	//마이페이지 참여일정 조회
	@GetMapping("/schedule_history")
	public String scheduleHistory(HttpSession httpSession,Model model,
			HistoryListRequestDto historyListRequestDto) {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)httpSession.getAttribute("loginNo");
		historyListRequestDto.setUserNo(userNo);
		
		// 총 참여일정 수 조회
		int historyTotal = dangUserDao.historyCount(historyListRequestDto);

		//  입력받은 DTO에 회원 번호, 일정 총 갯수 설정
		historyListRequestDto.setTotal(historyTotal);
		//마이페이지 참여일정 목록 전체/검색 조회
		List<JoinScheduleListVO> scheduleHistory = dangScheduleDao.joinScheduleList(historyListRequestDto);
		model.addAttribute("scheduleHistory", scheduleHistory);

		System.out.println(scheduleHistory.toString());
		
		return "dang_user/schedule_history";	
	}
		
	
}
