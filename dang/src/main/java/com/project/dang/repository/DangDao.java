package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangDetailDto;
import com.project.dang.dto.DangDto;
import com.project.dang.dto.DangListRequestDto;
import com.project.dang.dto.DangListResponseDto;
import com.project.dang.vo.DangEditInfoVO;
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
	 * 댕모임 전체/검색 조회
	 * @param dangListRequestDto : : 댕모임명, 지역, 정렬 기준(인원수, 좋아요, 개설일)
	 * @return List<DangListResponseDto> : 댕모임 정보, 댕모임 해시태그의 List
	 */
	public List<DangListResponseDto> selectDangList(DangListRequestDto dangListRequestDto);
	
	/**
	 * 댕모임 좋아요 갯수 갱신
	 * @param dangLike : 갱신된 댕모임 좋아요 갯수
	 * @param dangNo : 갱신할 댕모임 번호
	 * @return boolean : 댕모임 좋아요 갯수 수정 여부
	 */
	public boolean updateDangLike(int dangLike, int dangNo);
}
