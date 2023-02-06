package com.project.dang.dto;

import java.util.List;

import com.project.dang.vo.JoinScheduleListVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class HistoryListResponseDto {

	List<JoinScheduleListVO> scheduleHistory;
	
	private Integer blockStart;
	private Integer blockEnd;
	private Integer blockPrev;
	private Integer blockNext;
	private Integer blockFirst;
	private Integer blockLast;
}
