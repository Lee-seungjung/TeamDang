package com.project.dang.vo.channel;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@JsonIgnoreProperties
//이걸 추가해야 데이터가 없어도 변환해준다(json 속성을 무시)
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MessageVO {
	private String userNo;
	private String chatContent;
	private Date chatDate;

}
