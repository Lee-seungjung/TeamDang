package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangDetailDto;
import com.project.dang.dto.DangDto;
import com.project.dang.dto.DangListRequestDto;
import com.project.dang.dto.DangListResponseDto;
import com.project.dang.dto.DangUserJoinRequestDto;
import com.project.dang.dto.DangUserJoinResponseDto;
import com.project.dang.vo.DangEditInfoVO;
import com.project.dang.vo.DangOneInfoVO;
import com.project.dang.vo.DangTopVO;

public interface DangDao {
	
	/**
	 * 댕모임 번호 반환
	 * @return int (댕모임 번호)
	 */
	public int dangNo();

	/**
	 * 댕모임 개설
	 * @param dangDto
	 */
	public void createDang(DangDto dangDto);
	
	/**
	 * 댕모임 개설 (공개)
	 * @param dangDto
	 */
	public void createDangPublic(DangDto dangDto);
	
	/**
	 * 댕모임 개설 (비공개)
	 * @param dangDto
	 */
	public void createDangPrivate(DangDto dangDto);
	
	/**
	 * 댕모임 프로필 정보 등록
	 * @param dangNo : 댕모임 번호
	 * @param attachmentNo : 첨부파일 번호
	 */
	public void insertDangImg(int dangNo, int attachmentNo);
	
	/**
	 * 댕모임 수정에 필요한 정보 조회
	 * @param dangNo : 댕모임 번호
	 * @return DangInfoVO : 댕모임 번호, 댕모임명, 댕모임 정보, 총원, 현원, 비공개 여부, 비밀번호, 프로필 첨부파일 번호
	 */
	public DangEditInfoVO selectDangEditInfo(int dangNo);
	
	/**
	 * 댕모임 수정
	 * @param dangInfoVO : 댕모임 번호, 댕모임명, 댕모임 정보, 총원, 비공개 여부, 비밀번호
	 * @return boolean : 수정 여부
	 */
	public boolean editDangInfo(DangEditInfoVO dangEditInfoVO);
	
	/**
	 * 댕모임 프로필 첨부파일 번호 조회
	 * @param dangNo : 댕모임 번호
	 * @return int : 댕모임 프로필 첨부파일 번호
	 */
	public Integer selectDangImg(int dangNo);
	
	/**
	 * 지역별 댕모임 상위 5개 조회(좋아요순 + 인원수순)
	 * @param dangArea : 댕모임 지역
	 * @return List<DangInfoVO> : 댕모임 번호, 댕모임 이름, 댕모임 지역이 포함된 DangInfoVO 5개
	 */
	public List<DangTopVO> searchDangTop(String dangArea);
	
	/**
	 * 댕모임 상세 정보 반환
	 * @param dangNo : 댕모임 번호
	 * @return DangDetailDto : 댕모임 정보, 댕모임 해시태그
	 */
	public DangDetailDto selectDangDetail(int dangNo);
	
	/**
	 * 댕모임 단일 조회
	 * @param dangNo
	 * @return DangOneInfoVO : 첨부파일 번호 , 댕모임
	 */
	public DangOneInfoVO selectOne(int dangNo);
	
	/**
	 * 댕모임 전체/검색 조회
	 * @param dangListRequestDto : : 댕모임명, 지역, 정렬 기준(인원수, 좋아요, 개설일)
	 * @return List<DangListResponseDto> : 댕모임 정보, 댕모임 해시태그의 List
	 */
	public List<DangListResponseDto> selectDangList(DangListRequestDto dangListRequestDto);
	
	/**
	 * 댕모임 전체/검색 조회시 총 결과 갯수
	 * @param dangListRequestDto : 댕모임명, 지역
	 * @return int : 댕모임 전체/검색 조회 결과 총 갯수
	 */
	public int countDangTotal(DangListRequestDto dangListRequestDto);
	
	/**
	 * 댕모임 회원수 갱신
	 * @param dangNo : 댕모임 번호
	 * @param dangHead : 댕모임 회원수
	 * @return boolean : 댕모임 회원수 수정 여부
	 */
	public boolean updateDangHead(int dangNo, int dangHead);
	
	/**
	 * 댕모임 회원수 갱신(파라미터값 다르게)
	 * @param dangNo : 댕모임 번호
	 * @return boolean : 댕모임 회원수 수정 여부
	 */
	public boolean minusDangHead(int dangNo);
	
	/**
	 * 댕모임 좋아요 갯수 갱신
	 * @param dangLike : 갱신된 댕모임 좋아요 갯수
	 * @param dangNo : 갱신할 댕모임 번호
	 * @return boolean : 댕모임 좋아요 갯수 수정 여부
	 */
	public boolean updateDangLike(int dangLike, int dangNo);
	
	/**
	 * 특정 회원이 가입한 댕모임 리스트
	 * @param userNo : 회원 번호
	 * @return List<DangUserJoinDto> : 댕모임 번호, 이름, 상세정보, 활동지역, 비공개여부, 첨부파일 번호, 회원의 댕모임 가입일
	 */
	public List<DangUserJoinResponseDto> selectDangUserJoinList(DangUserJoinRequestDto dangUserJoinRequestDto);
	
	/**
	 * 특정 회원이 가입한 댕모임 갯수
	 * @param userNo : 회원 번호
	 * @return int : 가입한 댕모임 갯수
	 */
	public int countDangUserJoin(int userNo);
	
	/**
	 * 마이페이지 로그인 중인 회원이 개설한 댕모임 목록
	 * @param userNo : 회원 번호
	 * @return List<Integer> : 댕모임 번호 리스트
	 */
	public List<Integer> selectMydangOwnerList(int userNo);
	
	/**
	 * 댕모임 개설자 userNo 변경
	 * @param DangDto
	 * @return true, false
	 */
	public boolean userNoUpdate(DangDto dto);
}
