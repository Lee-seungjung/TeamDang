package com.project.dang.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangPlaceDto;
import com.project.dang.dto.PlaceImg;
import com.project.dang.repository.DangPlaceDao;

@CrossOrigin
@RestController
@RequestMapping("/rest_place")
public class DangPlaceRestController {

	//의존성 주입
	@Autowired
	private DangPlaceDao dangPlaceDao;
	
	//장소 등록
	@PostMapping("/place_insert")
	public void placeInsert(@RequestBody DangPlaceDto dangPlaceDto) {
		int placeNo = dangPlaceDao.sequence();
		
		dangPlaceDto.setPlaceNo(placeNo);
		
		int attachmentNo = dangPlaceDto.getAttachmentNo();
		PlaceImg placeImg = PlaceImg.builder().attachmentNo(attachmentNo).placeNo(placeNo).build();
		
		//dangPlaceDto.setPlaceInfo(dangPlaceDto.getPlaceInfo().replaceAll("\r\n", "<br>"));

		
		dangPlaceDao.placeInsert(dangPlaceDto);
		
		dangPlaceDao.placeImgInsert(placeImg);
	}
	
	@GetMapping("/place_list")
	public List<DangPlaceDto> placeList(@RequestParam Double lat1,@RequestParam Double lng1,@RequestParam Double lat2,@RequestParam Double lng2) {
		System.out.println("lat1 : "+ lat1);
		System.out.println("lng1 : "+lng1);
		System.out.println("lat2 : "+lat2);
		System.out.println("lng2 : "+lng2);
		return dangPlaceDao.placeList(lat1,lng1,lat2,lng2);
	}
	
	@GetMapping("/place_one/{placeNo}")
	public DangPlaceDto placeOne(@PathVariable int placeNo) {
		return dangPlaceDao.placeOne(placeNo);
	}
	
	@GetMapping("/place_search")
	public List<DangPlaceDto> placeSearch(@RequestParam String placeName){
		return dangPlaceDao.search(placeName);
	}
	
	
}
