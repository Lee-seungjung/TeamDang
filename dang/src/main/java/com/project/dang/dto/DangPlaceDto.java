package com.project.dang.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DangPlaceDto {
	private int placeNo;
	private String placeArea;
	private String placeX;
	private String placeY;
	private String placeSort;
	private String placeName;
	private String placeInfo;
	private String placeAddress;
	private String placeOperation;
	private String placeOff;
	private String placeTel;
	private String placeUrl;
}
