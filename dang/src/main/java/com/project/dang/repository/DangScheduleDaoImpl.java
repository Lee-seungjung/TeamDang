package com.project.dang.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.vo.ScheduleOneVO;
import com.project.dang.vo.ScheduleVO;
import com.project.dang.vo.SimpleScheduleVO;

@Repository
public class DangScheduleDaoImpl implements DangScheduleDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SimpleScheduleVO> simpleList() {
		return sqlSession.selectList("schedule.simpleList");
	}

	@Override
	public List<ScheduleVO> list() {
		return sqlSession.selectList("schedule.list");		
	}

	@Override
	public List<ScheduleVO> detail(int scheduleNo) {
		return sqlSession.selectOne("schedule.detail", scheduleNo);
	}

	@Override
	public List<ScheduleOneVO> scheduleOne(int scheduleNo) {
		return sqlSession.selectOne("schedule.scheduleOne", scheduleNo);
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
