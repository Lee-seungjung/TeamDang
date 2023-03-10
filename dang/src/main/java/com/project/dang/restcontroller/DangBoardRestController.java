package com.project.dang.restcontroller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.BoardImgDto;
import com.project.dang.dto.DangBoardDto;
import com.project.dang.dto.DangBoardLikeDto;
import com.project.dang.repository.DangBoardDao;
import com.project.dang.vo.BoardEditVO;
import com.project.dang.vo.BoardHistoryVO;
import com.project.dang.vo.DangAlbumVO;

@CrossOrigin
@RestController
@RequestMapping("/rest_board")
public class DangBoardRestController {
	
	@Autowired
	private DangBoardDao dangBoardDao;
	
	//시퀀스 조회
	@GetMapping("/find_no")
	public int sequence(){
		return dangBoardDao.sequence();
	}
	
	//등록
	@PostMapping("/insert")
	public void insert(@RequestBody DangBoardDto dto) {
		dangBoardDao.write(dto);
	}
	
	//board_img 등록
	@PostMapping("/img_insert")
	public void imgInsert(@RequestBody BoardImgDto dto) {
		dangBoardDao.imgInsert(dto);
	}
	
	//dang_board_like 등록
	@PostMapping("/like_insert")
	public void likeInsert(@RequestBody DangBoardLikeDto dto) {
		dangBoardDao.likeInsert(dto);
	}
	
	//이미지 조회
	@GetMapping("/find_img/{boardNo}")
	public List<BoardImgDto> findImg(@PathVariable int boardNo){
		return dangBoardDao.findImg(boardNo);
	}
	
	//전체 조회(5개)
	@GetMapping("/list_all/{dangNo}")
	public List<BoardHistoryVO> listAll(@PathVariable int dangNo){
		return dangBoardDao.selectAll(dangNo);
	}
	
	//복합검색 조회(5개)
	@GetMapping("/input_search")
	public List<BoardHistoryVO> inputSearch(@RequestParam String type, @RequestParam String keyword,
			@RequestParam int dangNo, @RequestParam String category){
		return dangBoardDao.inputSearch(type, keyword, dangNo, category);
	}
	
	//비동기 더보기 조회(5개)
	@GetMapping("/more_view")
	public List<BoardHistoryVO> moreView(
			@RequestParam String type, @RequestParam String keyword,
			@RequestParam int dangNo, @RequestParam String category,@RequestParam int boardNo){
		return dangBoardDao.moreView(type, keyword, dangNo, category, boardNo);
	}
	
	//오늘 작성한 게시글 수 조회
	@GetMapping("/day_write")
	public int dayWriteCnt(@RequestParam int memberNo, @RequestParam String boardWriteDate){
		return dangBoardDao.dayWriteCount(memberNo, boardWriteDate);
	}
	
	//댕모임 내 게시글 첨부파일 조회
	@GetMapping("/img_list")
	public List<DangAlbumVO> moreAlbumList(@RequestParam int dangNo,@RequestParam int attachmentNo){
		return dangBoardDao.moreAlbumList(dangNo,attachmentNo);
	}
	
	//좋아요 조회
	@GetMapping("/find_like/{memberNo}")
	public List<DangBoardLikeDto> findLike(@PathVariable int memberNo){
		return dangBoardDao.findlike(memberNo);
	}
	
	//게시글 수정
	@PatchMapping("/edit_board")
	public boolean editBoard(@RequestBody BoardEditVO vo) {
		return dangBoardDao.editBoard(vo);
	}
	
	//좋아요 수 수정
	@PatchMapping("/update_like/{boardNo}/{type}")
	public boolean updateLike(@PathVariable int boardNo, @PathVariable int type) {
		//type이 1이면 증가 2면 감소
		if(type==1) {
			return dangBoardDao.plusLike(boardNo);
		}else {
			return dangBoardDao.minusLike(boardNo);
		}
	}
	
	//기존 게시글 닉네임 수정
	@PatchMapping("/update_nick")
	public boolean updateNick(@RequestBody DangBoardDto dto) {
		return dangBoardDao.updateNick(dto);
	}
	
	//게시글 삭제
	@DeleteMapping("/delete/{boardNo}")
	public boolean delete(@PathVariable int boardNo) {
		return dangBoardDao.delete(boardNo);
	}
	
	//좋아요 테이블 삭제
	@DeleteMapping("/delete_like")
	public boolean deleteLike(@RequestBody DangBoardLikeDto dto) {
		return dangBoardDao.deleteLike(dto);
	}
	
	
	
	

}
