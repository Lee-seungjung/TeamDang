package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangDetailDto;
import com.project.dang.dto.DangDto;
import com.project.dang.vo.DangEditVO;
import com.project.dang.vo.DangTopVO;

public interface DangDao {
	
	/**
	 * 댕모임 회원인지 여부 반환
	 * @param dangNo : 댕모임 번호
	 * @param userNo : 회원 번호
	 * @return
	 */
	public boolean isDangMember(int dangNo, int userNo);
	
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
	public DangEditVO selectDangEditInfo(int dangNo);
	
	/**
	 * 댕모임 수정
	 * @param dangInfoVO : 댕모임 번호, 댕모임명, 댕모임 정보, 총원, 비공개 여부, 비밀번호
	 * @return boolean : 수정 여부
	 */
	public boolean editDangInfo(DangEditVO dangInfoVO);
	
	/**
	 * 댕모임 프로필 첨부파일 번호 조회
	 * @param dangNo : 댕모임 번호
	 * @return int : 댕모임 프로필 첨부파일 번호
	 */
	public int selectDangImg(int dangNo);
	
	/**
	 * 지역별 댕모임 상위 5개 조회(좋아요순 + 인원수순)
	 * @param dangArea : 댕모임 지역
	 * @return List<DangInfoVO> : 댕모임 번호, 댕모임 이름, 댕모임 지역이 포함된 DangInfoVO 5개
	 */
	public List<DangTopVO> searchDangTop(String dangArea);
	
	/**
	 * 댕모임 상세 정보 반환
	 * @param dangNo : 댕모임 번호
	 * @return DangDetailVO : 댕모임 정보, 댕모임 해시태그 정보
	 */
	public DangDetailDto selectDangDetail(int dangNo);
}
