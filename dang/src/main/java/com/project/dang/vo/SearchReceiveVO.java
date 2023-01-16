package com.project.dang.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@JsonIgnoreProperties
@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class SearchReceiveVO {
	private String type; //작성자 또는 내용
	private String keyword; //검색어
	private int dangNo; //방번호
	private String category; //카테고리
}
