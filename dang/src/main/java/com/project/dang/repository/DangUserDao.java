package com.project.dang.repository;

import java.sql.Date;
import java.util.List;

import com.project.dang.dto.DangInterestDto;
import com.project.dang.dto.DangUserDetailDto;
import com.project.dang.dto.DangUserDto;
import com.project.dang.dto.DangUserListDto;
import com.project.dang.dto.HistoryListRequestDto;
import com.project.dang.dto.UserImgDto;
import com.project.dang.dto.UserListRequestDto;
import com.project.dang.vo.DangUserMypageVO;
import com.project.dang.vo.DangUserVO;

public interface DangUserDao {

	/**
	 * 회원 번호 반환
	 * @return userNo
	 */
	public int userNo();
	
	/**
	 * 회원 가입
	 * @param dangUserDto
	 */
	public void join(DangUserDto dangUserDto);
	
	/**
	 * ID 검사 : 입력한 아이디와 일치하는 회원 정보 조회
	 * @param userId : 입력 아이디
	 * @return DangUserVO : 회원 번호, 회원 아이디, 회원 비밀번호, 회원 등급
	 */
	public DangUserVO checkId(String userId);
	
	/**
	 * PW 검사 : 입력한 비밀번호가 특정 아이디의 비밀번호와 일치하는지 여부 반환
	 * @param inputPw : 입력 비밀번호
	 * @param searchPw : 암호화된 비밀번호
	 * @return boolean : 비밀번호 일치 여부
	 */
	public boolean checkPw(String inputPw, String searchPw);	
	
	/**
	 * 최종 로그인 일자 갱신
	 * @param userNo : 회원번호
	 * @return boolean : 갱신 여부
	 */
	public boolean updateLogindate(int userNo);
	
	/**
	 * Email 검사 : 입력한 이메일과 일치하는 회원 정보가 존재하는지 여부 반환
	 * @param userEmail : 입력 이메일
	 * @return boolean : 해당 이메일로 가입한 회원 존재 여부 (true이면 이미 가입한 이메일)
	 */
	public boolean checkEmail(String userEmail);
	
	/**
	 * 프로필 파일 번호 찾기
	 * @param userNo : 회원번호
	 * @return attachmentNo : 파일번호
	 */
	public Integer findAttachmentNo(int userNo);
	
	/**
	 * 프로필 이미지 등록
	 * @param UserImgDto
	 */
	void userImgInsert(UserImgDto dto);
	
	/**
	 * 프로필 이미지 삭제
	 * @param attachmentNo
	 * @return true, false
	 */
	boolean userImgeDelete(int attachmentNo);
	
	/**
	 * 마이페이지에 표시할 회원 정보 조회
	 * @param userNo : 회원번호
	 * @return DangUserMypageVO : 회원번호, 아이디, 이메일, 닉네임, 전화번호, 가입일, 최종로그인일, 첨부파일번호
	 */
	public DangUserMypageVO selectUserInfo(int userNo);
	
	/**
	 * 회원번호로 비밀번호 조회
	 * @param userNo : 회원 번호
	 * @return String : 암호화된 비밀번호
	 */
	public String selectUserPw(int userNo);
	
	/**
	 * 회원정보 수정
	 * @param dangUserMypageVO : 회원번호, 닉네임, 이메일, 전화번호
	 * @return boolean : 회원정보 수정 여부
	 */
	public boolean editUserInfo(DangUserMypageVO dangUserMypageVO);
	
	/**
	 * 회원 비밀번호 수정
	 * @param userNo : 회원번호
	 * @param userPw : 변경할 비밀번호
	 * @return boolean : 비밀번호 수정 여부
	 */
	public boolean changeUserPw(int userNo, String userPw);
	
	/**
	 * 회원탈퇴
	 * @param userNo : 회원번호
	 * @return boolean : 회원탈퇴 성공 여부
	 */
	public boolean closeUser(int userNo);
	
	/**
	 * 입력한 이메일로 회원 아이디 찾기
	 * @param userEmail : 입력 이메일
	 * @return String : 회원 아이디
	 */
	public String findUserId(String userEmail);
	
	/**
	 * 입력한 아이디, 이메일로 회원 번호 찾기
	 * @param userId : 입력 아이디
	 * @param userEmail : 입력 이메일
	 * @return int : 회원 번호
	 */
	public Integer findUserPw(String userId, String userEmail);
	
	/**
	 * (관리자) 회원목록 조회
	 * @param userNo:회원 번호
	 * @return List<DangUserListDto>
	 */
	public List<DangUserListDto> UserList();
	
	/**
	 * (관리자) 회원목록 상세
	 * @param userNo:회원 번호
	 * @return List<DangUserListDto>
	 */
	public DangUserDetailDto userDetail (int userNo);
	
	/**
	 * (관리자) 회원목록 내 총 회원 수
	 * @return userCount
	 */
	public int userCount (UserListRequestDto userListRequestDto);
	
	/**
	 * (관리자) 회원목록 전체/ 검색 조회
	 * @param userListRequestDto : 
	 * @return List<DangUserListDto>
	 */
	public List<DangUserListDto> searchUserListAdmin(UserListRequestDto userListRequestDto);
	
	/**
	 * (마이페이지 메인) 활동지역 리스트 조회
	 * @param userListRequestDto : 
	 * @return List<DangUserListDto>
	 */
	public List<DangInterestDto> mypageInterestArea(int userNo);
		
	/**
	 * (마이페이지 메인) 등록 댕댕이수 조회
	 * @param int userNo :
	 */
	public int mypageDangNum(int userNo);
	
	/**
	 * (마이페이지 메인) 활동 댕모임 수 조회
	 * @param int userNo, int dangNo :
	 */
	public int mypagePartyNum(int userNo);
	
	/**
	 * (마이페이지 메인) 최근 로그인 조회
	 * @param int userNo :
	 */
	public Date mypageLogin(int userNo);
	
	/**
	 *  마이페이지 내 총 참여일정 수 조회
	 * @return hisotyCount
	 * 	@param historyListRequestDto 
	 */
	public int historyCount (HistoryListRequestDto historyListRequestDto);
	
}


