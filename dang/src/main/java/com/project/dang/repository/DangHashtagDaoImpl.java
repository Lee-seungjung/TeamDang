package com.project.dang.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangHashtagDto;
import com.project.dang.vo.DangHashtagVO;

@Repository
public class DangHashtagDaoImpl implements DangHashtagDao {
	
	@Autowired
	private SqlSession sqlSession;

	// 해시태그 번호 반환
	@Override
	public int hashtagNo() {
		return sqlSession.selectOne("dangHashtag.hashtagNo");
	}
	
	// 해시태그 등록
	@Override
	public void insertHashtag(DangHashtagDto dangHashtagDto) {
		sqlSession.insert("dangHashTag.insert", dangHashtagDto);
	}
	
	// 해시태그 단일 조회
	@Override
	public DangHashtagVO selectHashtag(int hashtagNo) {
		return sqlSession.selectOne("dangHashTag.select", hashtagNo);
	}

	// 댕모임 번호로 등록된 해시태그 전체 조회
	@Override
	public List<DangHashtagVO> selectAllHashtag(int dangNo) {
		return sqlSession.selectList("dangHashTag.selectList", dangNo);
	}

	// 해시태그 수정
	@Override
	public boolean updateHashtag(DangHashtagVO dangHashtagVO) {
		Map<String, String> param = new HashMap<>();
		param.put("hashtagNo", String.valueOf(dangHashtagVO.getHashtagNo()));
		param.put("hashtagContent", dangHashtagVO.getHashtagContent());
		int result = sqlSession.update("dangHashTag.update", param);
		return result > 0;
	}

	// 해시태그 삭제
	@Override
	public boolean deleteHashtag(int hashtagNo) {
		int result = sqlSession.delete("dangHashTag.delete", hashtagNo);
		return result > 0;
	}
}
