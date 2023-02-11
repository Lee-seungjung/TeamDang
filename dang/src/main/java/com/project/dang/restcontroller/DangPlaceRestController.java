package com.project.dang.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	
	//장소 전체 조회
	@GetMapping("/place_list")
	public List<DangPlaceDto> placeList() {
		return dangPlaceDao.placeList();
	}
	
	//카카오맵 해당 영역안 좌표값(파라미터) 후 조회
	@GetMapping("/place_list_area")
	public List<DangPlaceDto> placeListArea(@RequestParam Double lat1,@RequestParam Double lng1,@RequestParam Double lat2,@RequestParam Double lng2) {
		return dangPlaceDao.placeListArea(lat1,lng1,lat2,lng2);
	}

	//장소 하나 조회
	@GetMapping("/place_one/{placeNo}")
	public DangPlaceDto placeOne(@PathVariable int placeNo) {
		return dangPlaceDao.placeOne(placeNo);
	}
	
	// 검색조회
	@GetMapping("/place_search")
	public List<DangPlaceDto> placeSearch(@RequestParam String placeName){
		return dangPlaceDao.search(placeName);
	}
	
	//삭제
	@DeleteMapping("/detail/{placeNo}")
	public boolean placeDelete(@PathVariable int placeNo) {
		return dangPlaceDao.placeDelete(placeNo);
	}
	
	//수정
	@PutMapping("/update")
	public boolean placeUpdate(@RequestBody DangPlaceDto dangPlaceDto) {
		int placeNo = dangPlaceDto.getPlaceNo();
		dangPlaceDao.deletePlaceImg(placeNo);
		int attachmentNo = dangPlaceDto.getAttachmentNo();
		PlaceImg placeImg = PlaceImg.builder().attachmentNo(attachmentNo).placeNo(placeNo).build();
		dangPlaceDao.placeImgInsert(placeImg);
		return dangPlaceDao.placeEdit(dangPlaceDto);
	}
	
	
}
