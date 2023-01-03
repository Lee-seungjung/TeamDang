package com.project.dang.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.project.dang.dto.DangScheduleDto;

public class DangScheduleDaoImpl implements DangScheduleDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<DangScheduleDto> scheduleList(int scheduleNo) {
		return sqlSession.selectList("dangSchedule.list", scheduleNo);
	}

	@Override
	public void insert(DangScheduleDto dangScheduleDto) {
		sqlSession.insert("dangSchedule.insert", dangScheduleDto);
		
	}
	
	@Override
	public int scheduleSequence() {
		return sqlSession.selectOne("dangSchedule.scheduleSequence");
	}

	@Override
	public boolean update(DangScheduleDto dangScheduleDto) {
		int count = sqlSession.delete("dangSchedule.update", dangScheduleDto);
		return count > 0;
	}
	
	@Override
	public boolean delete(int scheduleNo) {
		int count = sqlSession.delete("dangSchedule.delete", scheduleNo);
		return count > 0;
	}

	@Override
	public DangScheduleDto selectOne(int scheduleNo) {
		return sqlSession.selectOne("dangSchedule.detail", scheduleNo);
	}



}
