package com.project.dang.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangJoinDto;
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
	public List<ScheduleVO> list(Integer dangNo) {
		return sqlSession.selectList("schedule.list", dangNo);		
	}

	@Override
	public ScheduleVO detail(int scheduleNo, Integer dangNo) {
		Map<String, String> param = new HashMap<>();
		param.put("scheduleNo", String.valueOf(scheduleNo));
		param.put("dangNo", String.valueOf(dangNo));		
		return sqlSession.selectOne("schedule.detail",  param);
	}

	@Override
	public ScheduleOneVO scheduleOne(int scheduleNo, Integer dangNo) {
		Map<String, String> param = new HashMap<>();
		param.put("scheduleNo", String.valueOf(scheduleNo));
		param.put("dangNo", String.valueOf(dangNo));
		return sqlSession.selectOne("schedule.scheduleOne", param);
	}

	@Override
	public int countJoin(int scheduleNo) {
		return sqlSession.selectOne("schedule.countJoin", scheduleNo);	
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
}
