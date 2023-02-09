package com.project.dang.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.vo.DangGroupRegionVO;
import com.project.dang.vo.DashBoardReportVO;

@Repository
public class AdminDaoImpl implements AdminDao{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public boolean isAdmin(int userNo) {
		String userGrade = sqlSession.selectOne("admin.isAdmin", userNo);
		boolean isAdmin = userGrade.equals("관리자");
		return isAdmin;
	}

	@Override
	public int recentLogin() {
		return sqlSession.selectOne("admin.recentLogin");
	}

	@Override
	public int recentJoin() {
		return sqlSession.selectOne("admin.recentJoin");
	}

	@Override
	public int recentDang() {
		return sqlSession.selectOne("admin.recentDang");
	}

	@Override
	public int recentSchdule() {
		return sqlSession.selectOne("admin.recentSchdule");
	}

	@Override
	public List<DangGroupRegionVO> dangGroupRegion() {
		return sqlSession.selectList("admin.dangGroupRegion");
	}

	@Override
	public int recentReport() {
		return sqlSession.selectOne("admin.recentReport");
	}

	@Override
	public List<DashBoardReportVO> dashBoardReport() {
		return sqlSession.selectList("admin.dashBoardReport");
	}
}
