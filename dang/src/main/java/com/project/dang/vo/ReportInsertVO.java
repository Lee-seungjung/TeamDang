package com.project.dang.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ReportInsertVO {
	private int userNo;
	private int dangNo;
	private String memberNick;
	private String reportContent;
	
	private List<Integer> attachmentNo;
}
