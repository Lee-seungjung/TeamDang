package com.project.dang.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangDetailAdminInfoDto;
import com.project.dang.dto.DangDetailCreatorAdminDto;
import com.project.dang.dto.DangDetailDto;
import com.project.dang.dto.DangDto;
import com.project.dang.dto.DangListAdminDto;
import com.project.dang.dto.DangListAdminRestRequestDto;
import com.project.dang.dto.DangListRequestDto;
import com.project.dang.dto.DangListResponseDto;
import com.project.dang.dto.DangUserJoinRequestDto;
import com.project.dang.dto.DangUserJoinResponseDto;
import com.project.dang.vo.DangEditInfoVO;
import com.project.dang.vo.DangOneInfoVO;
import com.project.dang.vo.DangTopVO;

@Repository
public class DangDaoImpl implements DangDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 댕모임 번호 반환
	@Override
	public int dangNo() {
		return sqlSession.selectOne("dang.dangNo");
	}
	
	// 댕모임 개설
	@Override
	public void createDang(DangDto dangDto) {
		// 공개 / 비공개 여부에 따라 다른 처리를 하도록 설정
		if(dangDto.getDangPrivate() == null) {
			createDangPublic(dangDto);
		} else {
			createDangPrivate(dangDto);
		}
	}

	// 댕모임 개설 (공개)
	@Override
	public void createDangPublic(DangDto dangDto) {
		sqlSession.insert("dang.createPublic", dangDto);
	}

	// 댕모임 개설 (비공개)
	@Override
	public void createDangPrivate(DangDto dangDto) {
		sqlSession.insert("dang.createPrivate", dangDto);
	}

	// 댕모임 프로필 정보 등록
	@Override
	public void insertDangImg(int dangNo, int attachmentNo) {
		Map<String, String> param = new HashMap<>();
		param.put("dangNo", String.valueOf(dangNo));
		param.put("attachmentNo", String.valueOf(attachmentNo));
		sqlSession.insert("dang.insertDangImg", param);
	}

	// 댕모임 수정에 필요한 정보 조회
	@Override
	public DangEditInfoVO selectDangEditInfo(int dangNo) {
		return sqlSession.selectOne("dang.selectDangEditInfo", dangNo);
	}

	// 댕모임 수정
	@Override
	public boolean editDangInfo(DangEditInfoVO dangEditInfoVO) {
		int result;
		if(dangEditInfoVO.getDangPrivate().equals("Y")) {
			result = sqlSession.update("dang.editDangInfoPrivate", dangEditInfoVO);
		} else {
			result = sqlSession.update("dang.editDangInfoPublic", dangEditInfoVO);
		}
		return result > 0;
	}

	// 댕모임 프로필 첨부파일 번호 조회
	@Override
	public Integer selectDangImg(int dangNo) {
		return sqlSession.selectOne("dang.selectDangImg", dangNo);
	}
	
	//댕모임 방장(개설자) userNo 조회
	public int findUserNo(int dangNo) {
		return sqlSession.selectOne("dang.findUserNo", dangNo);
	}

	// 지역별 댕모임 상위 5개 조회(좋아요순 + 인원수순)
	@Override
	public List<DangTopVO> searchDangTop(String dangArea) {
		return sqlSession.selectList("dang.searchDangTop", dangArea);
	}

	// 댕모임 상세 정보 반환
	@Override
	public DangDetailDto selectDangDetail(int dangNo) {
		return sqlSession.selectOne("dang.selectDangDetail", dangNo);
	}
	
	//댕모임 단일 조회
	@Override
	public DangOneInfoVO selectOne(int dangNo) {
		return sqlSession.selectOne("dang.selectOneDangInfo", dangNo);
	}

	// 댕모임 전체/검색 조회
	@Override
	public List<DangListResponseDto> selectDangList(DangListRequestDto dangListRequestDto) {
		dangListRequestDto.setRownumStart(dangListRequestDto.rownumStart());
		dangListRequestDto.setRownumEnd(dangListRequestDto.rownumEnd());
		dangListRequestDto.setBlockLast(dangListRequestDto.blockLast());
		return sqlSession.selectList("dang.selectDangList", dangListRequestDto);
	}
	
	// 댕모임 전체/검색 조회시 총 결과 갯수
	@Override
	public int countDangTotal(DangListRequestDto dangListRequestDto) {
		return sqlSession.selectOne("dang.countDangTotal", dangListRequestDto);
	}

	// 댕모임 회원수 갱신
	@Override
	public boolean updateDangHead(int dangNo, int dangHead) {
		Map<String, String> param = new HashMap<>();
		param.put("dangNo", String.valueOf(dangNo));
		param.put("dangHead", String.valueOf(dangHead));
		int result = sqlSession.update("dang.updateDangHead", param);
		return result > 0;
	}
	
	// 댕모임 회원수 갱신
	@Override
	public boolean minusDangHead(int dangNo) {
		return sqlSession.update("dang.minusDangHead", dangNo)>0;
	}
	
	// 댕모임 좋아요 갯수 갱신
	@Override
	public boolean updateDangLike(int dangLike, int dangNo) {
		Map<String, String> param = new HashMap<>();
		param.put("dangLike", String.valueOf(dangLike));
		param.put("dangNo", String.valueOf(dangNo));
		Integer result = sqlSession.update("dang.updateDangLike", param);
		return result > 0;
	}

	// 특정 회원이 가입한 댕모임 리스트
	@Override
	public List<DangUserJoinResponseDto> selectDangUserJoinList(DangUserJoinRequestDto dangUserJoinRequestDto) {
		Map<String, String> param = new HashMap<>();
		param.put("userNo", String.valueOf(dangUserJoinRequestDto.getUserNo()));
		param.put("rownumStart", String.valueOf(dangUserJoinRequestDto.rownumStart()));
		param.put("rownumEnd", String.valueOf(dangUserJoinRequestDto.rownumEnd()));
		return sqlSession.selectList("dang.selectMydang", param);
	}
	
	// 특정 회원이 가입한 댕모임 갯수
	@Override
	public int countDangUserJoin(int userNo) {
		return sqlSession.selectOne("dang.countMydang", userNo);
	}

	// 마이페이지 로그인 중인 회원이 개설한 댕모임 목록
	@Override
	public List<Integer> selectMydangOwnerList(int userNo) {
		return sqlSession.selectList("dang.selectMydangOwner", userNo);
	}
	
	//댕모임 개설자 userNo, dangHead-1 변경
	@Override
	public boolean userNoHeadUpdate(DangDto dto) {
		return sqlSession.update("dang.userNoHeadUpdate", dto)>0;
	}

	// 관리자 페이지 댕모임 목록 전체/검색 조회
	@Override
	public List<DangListAdminDto> searchDangListAdmin(DangListAdminRestRequestDto dangListAdminRestRequestDto) {
		dangListAdminRestRequestDto.setRownumStart(dangListAdminRestRequestDto.rownumStart());
		dangListAdminRestRequestDto.setRownumEnd(dangListAdminRestRequestDto.rownumEnd());
		return sqlSession.selectList("dang.searchDangListAdmin", dangListAdminRestRequestDto);
	}

	// 관리자 페이지 조건에 맞는 댕모임 총 수
	@Override
	public int countDangListAdmin(DangListAdminRestRequestDto dangListAdminRestRequestDto) {
		return sqlSession.selectOne("dang.countDangListAdmin", dangListAdminRestRequestDto);
	}

	// 관리자 페이지 댕모임 상세
	@Override
	public DangDetailAdminInfoDto searchDangDetailAdmin(int dangNo, int userNo) {
		Map<String, String> param = new HashMap<>();
		param.put("dangNo", String.valueOf(dangNo));
		param.put("userNo", String.valueOf(userNo));
		return sqlSession.selectOne("dang.searchDangDetailAdmin", param);
	}

	// 관리자 페이지 댕모임 개설자 상세
	@Override
	public DangDetailCreatorAdminDto searchDangCreatorDetailAdmin(int dangNo, int userNo) {
		Map<String, String> param = new HashMap<>();
		param.put("dangNo", String.valueOf(dangNo));
		param.put("userNo", String.valueOf(userNo));
		return sqlSession.selectOne("dang.searchDangCreatorDetailAdmin", param);
	}
}
	