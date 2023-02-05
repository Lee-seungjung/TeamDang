package com.project.dang.restcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	// 상위 5개 댕모임 반환
	@GetMapping("/top")
	public List<DangTopVO> searchDangTop(@RequestParam String dangArea) {
		// 지역에서 좋아요 + 인원수 순으로 상위 5개 댕모임 반환
		return dangDao.searchDangTop(dangArea);
	}
	
	// 댕모임 상세정보 반환
	@GetMapping("/detail")
	public DangDetailDto selectDangDetail(@RequestParam int dangNo, HttpSession session) {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		DangDetailDto dangDetailInfo = dangDao.selectDangDetail(dangNo);
		if(userNo != null) {
			// 회원이 가입한 댕모임 번호 조회
			List<Integer> searchDangListAlreadyJoin = dangMemberDao.searchDangAlreadyJoin(userNo);
			// 댕모임 전체/검색 조회 목록에 가입 여부 설정
			for(int i = 0 ; i < searchDangListAlreadyJoin.size() ; i ++) { // 댕모임 전체/검색 조회 목록에 대해
				if(searchDangListAlreadyJoin.get(i).equals(dangNo)) {
					dangDetailInfo.setIsMember(1);
				}
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
		if(userNo != null) {
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
		return dangList;
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
	
}
