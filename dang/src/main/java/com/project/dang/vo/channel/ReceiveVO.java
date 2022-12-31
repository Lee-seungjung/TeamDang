package com.project.dang.vo.channel;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//사용자가 그룹채팅에서 보내는 메세지를 수신하는 VO

//변수 3개가 다 오지 않아도, 데이터가 없어도 가능한 것만 변환시켜줌(json 속성을 무시)
@JsonIgnoreProperties
@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ReceiveVO {
	private int type; //단지 입장하는건지 메세지를 보내는건지?
	private int room; //방번호
	private String chatContent;
}
