package com.project.dang.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangScheduleDto;
import com.project.dang.vo.SimpleScheduleVO;

@Repository
public class DangScheduleDaoImpl implements DangScheduleDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SimpleScheduleVO> simpleList() {
		return sqlSession.selectList("dang.calendar");
	}

//	@Override
//	public void insert(DangScheduleDto dangScheduleDto) {
//		sqlSession.insert("dangSchedule.insert", dangScheduleDto);
//		
//	}
//	
//	@Override
//	public int scheduleSequence() {
//		return sqlSession.selectOne("dangSchedule.scheduleSequence");
//	}
//
//	@Override
//	public boolean update(DangScheduleDto dangScheduleDto) {
//		int count = sqlSession.delete("dangSchedule.update", dangScheduleDto);
//		return count > 0;
//	}
//	
//	@Override
//	public boolean delete(int scheduleNo) {
//		int count = sqlSession.delete("dangSchedule.delete", scheduleNo);
//		return count > 0;
//	}
//
//	@Override
//	public DangScheduleDto selectOne(int scheduleNo) {
//		return sqlSession.selectOne("dangSchedule.detail", scheduleNo);
//	}



}
