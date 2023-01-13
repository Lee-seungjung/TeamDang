package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangHashtagDto;
import com.project.dang.vo.DangHashtagVO;

public interface DangHashtagDao {
	
	/**
	 * 해시태그 번호 반환
	 * @return int : 다음 해시태그 번호
	 */
	public int hashtagNo();

	/**
	 * 해시태그 등록
	 * @param dangHashtagDto : 댕모임 번호, 해시태그 내용
	 */
	public void insertHashtag(DangHashtagDto dangHashtagDto);
	
	/**
	 * 해시태그 단일 조회
	 * @param hashtagNo : 해시태그 번호
	 * @return
	 */
	public DangHashtagVO selectHashtag(int hashtagNo);
	
	/**
	 * 댕모임 번호로 등록된 해시태그 전체 조회
	 * @param dangNo : 댕모임 번호
	 * @return List<DangHashtagVO> : 해시태그 번호, 해시태그 내용
	 */
	public List<DangHashtagVO> selectAllHashtag(int dangNo);
	
	/**
	 * 해시태그 수정
	 * @param dangHashtagVO : 해시태그 번호, 해시태그 내용
	 * @return boolean : 수정 성공 여부
	 */
	public boolean updateHashtag(DangHashtagVO dangHashtagVO);
	
	/**
	 * 해시태그 삭제
	 * @param hashtagNo : 해시태그 번호
	 * @return boolean : 삭제 성공 여부
	 */
	public boolean deleteHashtag(int hashtagNo);
}
