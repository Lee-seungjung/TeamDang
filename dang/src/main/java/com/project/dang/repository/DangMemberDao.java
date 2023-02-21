package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangAttendanceDto;
import com.project.dang.dto.DangMemberDto;
import com.project.dang.dto.DangMemberJoinDto;
import com.project.dang.dto.MemberListDto;
import com.project.dang.dto.MemberListRequestDto;
import com.project.dang.dto.PuppyListDto;
import com.project.dang.dto.PuppyListRequestDto;
import com.project.dang.vo.MemberEditVO;
import com.project.dang.vo.MemberListVO;

public interface DangMemberDao {
	
	/**
	 * 댕모임 회원 번호 반환
	 * @return int (댕모임 회원 번호)
	 */
	public int memberNo();

	/**
	 * 댕모임 개설자로 가입
	 * @param dangMemberDto
	 */
	public void createDang(DangMemberDto dangMemberDto);
	
	/**
	 * 댕모임 내 닉네임 찾기
	 * @param dto
	 * @return memberNick
	 */
	String findNick(DangMemberDto dto);
	
	/**
	 * memberNo 조회
	 * @param userNo
	 * @param dangNo
	 * @return memberNo
	 */
	int findMemberNo(int userNo, int dangNo);
	
	/**
	 * 댕모임 회원 단일조회
	 * @param DangMemberDto
	 * @return DangMemberDto
	 */
	DangMemberDto selectOne(DangMemberDto dto);
	
	/**
	 * 댕모임 회원 단일조회
	 * @param DangMemberDto
	 * @return DangMemberDto
	 */
	DangMemberDto restSelectOne(int memberNo);
	
	/**
	 * 가입일 가장 오래된 회원 1명만 조회
	 * @param dangNo
	 * @return DangMemberDto
	 */
	DangMemberDto oldOneMember(int dangNo);
	
	/**
	 * 댕모임 회원 등급포인트 증가
	 * (코드 재사용 위해 변수값 dto로 넣음!)
	 * @param DangMemberDto
	 * @return true 또는 false
	 */
	boolean plusScore(DangMemberDto dto);
	
	/**
	 * 댕모임 회원 등급포인트 감소
	 * @param memberNo(int)
	 * @return true 또는 false
	 */
	boolean minusScore(int memberNo);
	
	/**
	 * 댕모임 회원 방장여부 변경
	 * @param memberNo
	 * @return true 또는 false
	 */
	boolean ownerUpdate(int memberNo);
	
	/**
	 * 댕회원 활동점수 충족 시 레벨 증가(한 달에 한 번)
	 * @param memberNo
	 * @return
	 */
	boolean upgrade();
	
	/**
	 * 댕모임 회원 포인트 조회
	 * @param memberNo
	 * @return 포인트 점수(int)
	 */
	int findScore(int memberNo);
	
	/**
	 * 오늘 출석 여부
	 * @param memberNo
	 * @return DangAttendanceDto 또는 null
	 */
	DangAttendanceDto isAttendance(int memberNo);
	
	/**
	 * 출석 테이블 insert
	 * @param DangAttendanceDto
	 */
	void attendanceInsert(DangAttendanceDto dto);
	
	/**
	 * 출석 목록 조회(한달 기준)
	 * @param memberNo
	 * @return List<DangAttendanceDto>
	 */
	List<DangAttendanceDto> attendanceList(int memberNo);
	
	/**
	 * 참여 모임 수
	 * @param memberNo
	 * @return 모임 수(int)
	 */
	int joinScheduleCount(int memberNo);
	
	/**
	 * 프로필 첨부파일 번호 조회
	 * @param userNo
	 * @return
	 */
	Integer findAttachmentNo(int userNo);
	
	/**
	 * 댕모임 내 닉네임 중복확인
	 * @return true, false
	 */
	DangMemberDto checkNick(int dangNo, String memberNick);
	
	/**
	 * 댕모임 프로필 수정
	 * @param MemberEditVO(파일번호, 닉네임, 상태메세지, 멤버번호)
	 * @return true, false
	 */
	boolean editProfile(MemberEditVO vo);
	
	/**
	 * 특정 회원이 가입한 댕모임 목록을 번호로 조회
	 * @param userNo : 회원 번호
	 * @return List<Integer> : 특정 회원이 가입한 댕모임의 댕모임 번호 List
	 */
	public List<Integer> searchDangAlreadyJoin(int userNo);
	
	/**
	 * 댕모임 가입
	 * @param dangMemberDto : 댕모임 회원 번호, 댕모임 번호, 회원 번호, 회원 닉네임, 상태 메시지
	 */
	public void joinDang(DangMemberJoinDto dangMemberJoinDto);
	
	/**
	 * 특정 댕모임의 회원수 조회
	 * @param dangNo : 댕모임 번호
	 * @return Integer : 회원수
	 */
	public Integer countMember(int dangNo);
	
	/**
	 * 특정 댕모임 회원 리스트 조회
	 * @param dangNo
	 * @return MemberListVO
	 */
	public List<MemberListVO> memberList(int dangNo);
	
	/**
	 * 특정 회원이 특정 댕모임의 회원인지 조회
	 * @param userNo : 회원 번호
	 * @param dangNo : 댕모임 번호
	 * @return boolean : 댕모임 회원인지 여부
	 */
	public boolean isDangMember(int userNo, int dangNo);
	
	/**
	 * 댕모임 회원 탈퇴
	 * @param dangNo
	 * @param memberNo
	 * @return boolean : 댕모임 탈퇴성공 여부
	 */
	public boolean deleteDangMember(int dangNo, int memberNo);
	
	/**
	 * 마이페이지 댕모임 회원 탈퇴
	 * @param dangNo : 댕모임 번호
	 * @param userNo : 회원 번호
	 * @return boolean : 댕모임 탈퇴 성공 여부
	 */
	public boolean closeDangMember(int dangNo, int userNo);
	
	/**
	 * (관리자) 회원목록 내  댕모임 가입자 수
	 * 	@param memberListRequestDto 
	 * @return dangJoinCount
	 */
	public int dangJoinCount (MemberListRequestDto memberListRequestDto);
	
	/**
	 * (관리자) 댕모임 멤버 목록 조회
	 * @return List<MemberListDto>
	 */
	public List<MemberListDto> memberList();
	
	/**
	 * (관리자) 댕댕이 목록 전체/ 검색 조회
	 * @param memberListRequestDto 
	 * @return List<MemberListDto>
	 */
	public List<MemberListDto> searchMemberListAdmin(MemberListRequestDto memberListRequestDto);
	
	
}
