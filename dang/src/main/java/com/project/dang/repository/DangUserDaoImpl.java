package com.project.dang.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangUserDto;
import com.project.dang.vo.DangUserVO;

@Repository
public class DangUserDaoImpl implements DangUserDao {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private PasswordEncoder pwEncoder;
	
	@Override
	public int userNo() {
		return sqlSession.selectOne("dangUser.userNo");
	}
	
	@Override
	public void join(DangUserDto dangUserDto) {
		// 비밀번호를 암호화하여 회원 정보에 재설정
		String pwOrigin = dangUserDto.getUserPw(); // 원본 비밀번호
		String pwEncryption = pwEncoder.encode(pwOrigin); // 암호화한 비밀번호
		dangUserDto.setUserPw(pwEncryption);
		sqlSession.insert("dangUser.join", dangUserDto);
	}

	@Override
	public DangUserVO checkId(String userId) {
		return sqlSession.selectOne("dangUser.loginInfo", userId);
	}

	@Override
	public boolean checkPw(String inputPw, String searchPw) {
		return pwEncoder.matches(inputPw, searchPw);
	}

	//프로필 파일 번호 찾기
	@Override
	public Integer findAttachmentNo(int userNo) {
		return sqlSession.selectOne("dangUser.findAttachmentNo",userNo);
	}
	
}
