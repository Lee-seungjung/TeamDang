package com.project.dang.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangUserDto;
import com.project.dang.dto.UserImgDto;
import com.project.dang.vo.DangUserMypageVO;
import com.project.dang.vo.DangUserVO;

@Repository
public class DangUserDaoImpl implements DangUserDao {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private PasswordEncoder pwEncoder;
	
	// 회원 번호 반환
	@Override
	public int userNo() {
		return sqlSession.selectOne("dangUser.userNo");
	}
	
	// 회원 가입
	@Override
	public void join(DangUserDto dangUserDto) {
		// 비밀번호를 암호화하여 회원 정보에 재설정
		String pwOrigin = dangUserDto.getUserPw(); // 원본 비밀번호
		String pwEncryption = pwEncoder.encode(pwOrigin); // 암호화한 비밀번호
		dangUserDto.setUserPw(pwEncryption);
		sqlSession.insert("dangUser.join", dangUserDto);
	}

	// ID 검사
	@Override
	public DangUserVO checkId(String userId) {
		return sqlSession.selectOne("dangUser.loginInfo", userId);
	}

	// PW 검사
	@Override
	public boolean checkPw(String inputPw, String searchPw) {
		return pwEncoder.matches(inputPw, searchPw);
	}
	
	// 최종 로그인 일자 갱신
	@Override
	public boolean updateLogindate(int userNo) {
		int result = sqlSession.update("dangUser.updateLogindate", userNo);
		return result > 0;
	}

	// Email 검사
	@Override
	public boolean checkEmail(String userEmail) {
		boolean alreadyJoin = sqlSession.selectOne("dangUser.checkEmail", userEmail) != null;
		return alreadyJoin; // 이미 가입한 이메일이면 true를 반환
	}
	
	//프로필 파일 번호 찾기
	@Override
	public Integer findAttachmentNo(int userNo) {
		return sqlSession.selectOne("dangUser.findAttachmentNo",userNo);
	}
  
	//프로필 이미지 등록
	@Override
	public void userImgInsert(UserImgDto dto) {
		sqlSession.insert("dangUser.imgInsert",dto);
	}

	//프로필 이미지 삭제
	@Override
	public boolean userImgeDelete(int attachmentNo) {
		return sqlSession.delete("dangUser.imgDelete",attachmentNo)>0;
	}

	// 마이페이지에 표시할 회원 정보 조회
	@Override
	public DangUserMypageVO selectUserInfo(int userNo) {
		return sqlSession.selectOne("dangUser.selectMypageInfo", userNo);
	}

	// 회원번호로 비밀번호 조회
	@Override
	public String selectUserPw(int userNo) {
		return sqlSession.selectOne("dangUser.selectPassword", userNo);
	}

	// 회원정보 수정
	@Override
	public boolean editUserInfo(DangUserMypageVO dangUserMypageVO) {
		Map<String, String> param = new HashMap<>();
		param.put("userNo", String.valueOf(dangUserMypageVO.getUserNo()));
		param.put("userNick", dangUserMypageVO.getUserNick());
		param.put("userEmail", dangUserMypageVO.getUserEmail());
		param.put("userTel", dangUserMypageVO.getUserTel());
		int result = sqlSession.update("dangUser.editUserInfo", param);
		return result > 0;
	}

	// 회원 비밀번호 수정
	@Override
	public boolean changeUserPw(int userNo, String userPw) {
		// 비밀번호 암호화
		String userPwEncryption = pwEncoder.encode(userPw);
		Map<String, String> param = new HashMap<>();
		param.put("userNo", String.valueOf(userNo));
		param.put("userPw", userPwEncryption);
		int result = sqlSession.update("dangUser.changeUserPw", param);
		return result > 0;
	}
}
