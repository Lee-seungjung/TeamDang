package com.project.dang.restcontroller;

import java.io.File;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangDetailDto;
import com.project.dang.dto.DangDto;
import com.project.dang.dto.DangListRequestDto;
import com.project.dang.dto.DangListResponseDto;
import com.project.dang.repository.AttachmentDao;
import com.project.dang.repository.DangDao;
import com.project.dang.repository.DangInterestDao;
import com.project.dang.repository.DangMemberDao;
import com.project.dang.vo.DangTopVO;

@RestController
@RequestMapping("/rest_dang")
public class DangRestController {

	@Autowired
	private DangDao dangDao;
	
	@Autowired
	private DangInterestDao dangInterestDao;
	
	@Autowired
	private DangMemberDao dangMemberDao;
	
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
	
	// 상위 5개 댕모임 반환
	@GetMapping("/top")
	public List<DangTopVO> searchDangTop(@RequestParam String dangArea) {
		// 지역에서 좋아요 + 인원수 순으로 상위 5개 댕모임 반환
		return dangDao.searchDangTop(dangArea);
	}
	
	// 댕모임 상세정보 반환
	@GetMapping("/detail")
	public DangDetailDto selectDangDetail(@RequestParam int dangNo, HttpSession session) {
		// 댕모임 상세정보 조회
		DangDetailDto dangDetailInfo = dangDao.selectDangDetail(dangNo);
		// 로그인 중인 회원의 회원 등급
		String userGrade = (String)session.getAttribute("loginGrade");
		// 로그인 중인 회원번호 반환 (로그인 여부, 해당 댕모임의 회원 여부에 따라 모달에서 서로 다른 버튼을 표시하기 위함)
		Integer userNo = (Integer)session.getAttribute("loginNo");
		// 로그인 중이라면 (userNo가 null이 아니라면)
		if(userNo != null) {
			if(userGrade.equals("관리자")) { // 관리자라면
				dangDetailInfo.setIsMember(1); // 댕모임 가입 여부(isMember) 필드의 값을 1로 변경(모두 입장 버튼으로 바꾸기 위함)
			} else {
				// 회원이 가입한 댕모임 번호 조회
				List<Integer> searchDangListAlreadyJoin = dangMemberDao.searchDangAlreadyJoin(userNo);
				// 댕모임 전체/검색 조회 목록에 가입 여부 설정
				for(int i = 0 ; i < searchDangListAlreadyJoin.size() ; i ++) { // 댕모임 전체/검색 조회 목록에 대해
					// 로그인 중인 회원의 가입한 댕모임 번호 리스트에 상세정보 보기를 선택한 댕모임의 번호가 존재한다면 
					if(searchDangListAlreadyJoin.get(i).equals(dangNo)) {
						dangDetailInfo.setIsMember(1); // isMember 필드의 값을 1로 설정 (로그인 중이면서 가입한 상태, 입정 버튼이 표시되도록 하기 위함)
					}
				}
			}
			// 로그인 중이지만 해당 댕모임의 회원이 아닐 경우
			if(dangDetailInfo.getIsMember() == null) {
				dangDetailInfo.setIsMember(0); // isMember 필드의 값이 null이 아닌 0이 되도록 설정 (로그인 중이면서 미가입 상태, 가입 버튼이 표시되도록 하기 위함)
			}
		}
		// 댕모임 상세 정보 반환
		return dangDetailInfo;
	}
	
	// 댕모임 목록 반환 - 댕모임 찾기 페이지
	@GetMapping("/list")
	public List<DangListResponseDto> selectDangList(HttpSession session, @ModelAttribute DangListRequestDto dangListRequestDto) {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		// 로그인 중인 회원이 관심지역에 대해 조회를 한 경우
		if(userNo != null && dangListRequestDto.getSearchArea() != null) {
			// 관심지역 전체에 대한 조회일 경우
			if(dangListRequestDto.getSearchArea().get(0).equals("all")) {
				// 입력받은 DangListRequestDto의 관심지역 필드를 해당 회원의 관심지역으로 설정
				dangListRequestDto.setSearchArea(dangInterestDao.selectInterest(userNo));
			}
		}
		// 댕모임 전체/검색 조회 총 갯수 반환
		int countDangTotal = dangDao.countDangTotal(dangListRequestDto);
		// 반환한 총 갯수를 입력받은 DangListRequestDto에 설정
		dangListRequestDto.setTotal(countDangTotal);
		// 댕모임 전체/검색 조회
		List<DangListResponseDto> dangList = dangDao.selectDangList(dangListRequestDto);
		// 로그인 중인 회원의 회원 등급
		String userGrade = (String)session.getAttribute("loginGrade");
		// 로그인 상태 여부
		if(userNo != null) {
			if(userGrade.equals("관리자")) { // 관리자라면
				// 댕모임 전체/검색 조회 목록에 가입 여부 설정
				for(int i = 0 ; i < dangList.size() ; i ++) { // 모든 댕모임에 대해
					dangList.get(i).getDangInfo().setIsMember(1); // 댕모임 가입 여부(isMember) 필드의 값을 1로 변경(모두 입장 버튼으로 바꾸기 위함)
				}
			} else { // 일반 회원이라면
				// 회원이 가입한 댕모임 번호 조회
				List<Integer> searchDangListAlreadyJoin = dangMemberDao.searchDangAlreadyJoin(userNo);
				// 댕모임 전체/검색 조회 목록에 가입 여부 설정
				for(int i = 0 ; i < dangList.size() ; i ++) { // 댕모임 전체/검색 조회 목록에 대해
					for(int j = 0 ; j < searchDangListAlreadyJoin.size() ; j ++) { // 회원이 가입한 댕모임 번호 목록 길이만큼 반복
						if(dangList.get(i).getDangInfo().getDangNo().equals(searchDangListAlreadyJoin.get(j))) { // 댕모임 전체/검색 조회 목록의 i번째 댕모임 번호가 회원이 가입한 댕모임 번호 목록의 j번째와 같을 때
							dangList.get(i).getDangInfo().setIsMember(1); // 해당 댕모임 정보의 댕모임 가입 여부(isMember) 필드의 값을 1로 변경
						}
					}
				}
			}
		} else {
			// 댕모임 전체/검색 조회 목록에 가입 여부 설정
			for(int i = 0 ; i < dangList.size() ; i ++) { // 댕모임 전체/검색 조회 목록에 대해
				dangList.get(i).getDangInfo().setIsMember(null); // 해당 댕모임 정보의 댕모임 가입 여부(isMember) 필드의 값을 null로 변경
			}
		}
		return dangList;
	}
	
	// 댕모임 해체
	@DeleteMapping("/close_dang")
	public boolean closeDang(@RequestParam int dangNo) {
		// 기존 첨부파일 조회
		Integer attachmentNoExisting = dangDao.selectDangImg(dangNo);
		if(attachmentNoExisting != null) { // 기존 첨부파일이 존재한다면
			// 첨부파일 테이블에서 정보 삭제 (on delete cascade 조건에 의해 연결 테이블은 자동 삭제)
			attachmentDao.delete(attachmentNoExisting);
			// 기존 첨부파일 이름 반환
			String fileName = String.valueOf(attachmentNoExisting);
			// 삭제할 첨부파일 경로 설정
			File targetExisting = new File(directory, fileName);
			// 기존 첨부파일 삭제
			targetExisting.delete();
		}
		return dangDao.closeDang(dangNo);
	}
	
	//댕모임 userNo, dangHead-1 변경
	@PatchMapping("/uno_head_update")
	public boolean userNoHeadUpdate(@RequestBody DangDto dto) {
		return dangDao.userNoHeadUpdate(dto);
	}
	
	//댕모임 개설자 번호 반환
	@GetMapping("/find_user_no")
	public int findUserNo(@RequestParam int dangNo) {
		return dangDao.findUserNo(dangNo);
	}
	
	// 한 달동안 개설한 댕모임 갯수 반환
	@GetMapping("/count_dang_create")
	public int countDangCreate(@RequestParam int userNo) {
		return dangDao.countDangCreate(userNo);
	}
}
