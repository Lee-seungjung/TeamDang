package com.project.dang.restcontroller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.project.dang.dto.AttachmentDto;
import com.project.dang.dto.DangPuppyDto;
import com.project.dang.dto.DangPuppyInfoDto;
import com.project.dang.dto.DangPuppyListDto;
import com.project.dang.repository.AttachmentDao;
import com.project.dang.repository.DangPuppyDao;

@RestController
@RequestMapping("/rest_puppy")
public class DangPuppyRestController {

	@Autowired
	private DangPuppyDao dangPuppyDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	// 기준 경로 설정
	private File directory = new File(System.getProperty("user.home"),"/dang"); // C드라이브 경로
	//private File directory = new File("D:/upload/dang"); // D드라이브 경로
	
	// 디렉토리 생성
	@PostConstruct
	public void prepare() {
		directory.mkdirs();
	}
	
	@PostMapping("/insert")
	public DangPuppyListDto insertPuppy(HttpSession session, 
			@ModelAttribute DangPuppyDto dangPuppyDto, 
			@RequestParam(required = false) List<String> puppyCharacter, 
			MultipartFile puppyImg) throws IllegalStateException, IOException {
		// 반환용 객체 생성
		DangPuppyListDto dangPuppyListDto = new DangPuppyListDto();
		// 다음 댕댕이 번호 설정
		int puppyNo = dangPuppyDao.puppyNo();
		dangPuppyDto.setPuppyNo(puppyNo);
		// 회원 번호 설정
		int userNo = (Integer)session.getAttribute("loginNo");
		dangPuppyDto.setUserNo(userNo);
		// 댕댕이 등록
		dangPuppyDao.insertPuppy(dangPuppyDto);
		// 반환할 댕댕이 정보 설정
		DangPuppyInfoDto dangPuppyInfoDto = DangPuppyInfoDto
												.builder()
													.puppyNo(puppyNo)
													.puppyName(dangPuppyDto.getPuppyName())
													.puppyAge(dangPuppyDto.getPuppyAge())
													.puppyGender(dangPuppyDto.getPuppyGender())
												.build();
		// 댕댕이 사즌 등록
		if(puppyImg != null) {
			// 새로 첨부파일을 등록하기 위해 번호 반환
			int attachmentNo = attachmentDao.sequence();
			// 첨부파일 정보 DB 등록
			attachmentDao.insert(AttachmentDto.builder()
					.attachmentNo(attachmentNo)
					.attachmentName(puppyImg.getName())
					.attachmentType(puppyImg.getContentType())
					.attachmentSize(puppyImg.getSize())
					.build());
			// 연결 테이블 DB 등록
			dangPuppyDao.insertPuppyImg(puppyNo, attachmentNo);
			// 첨부파일 저장 경로 생성
			File target = new File(directory, String.valueOf(attachmentNo));
			// 파일 저장
			puppyImg.transferTo(target);
			// 반환용 객체에 첨부파일 번호 설정
			dangPuppyInfoDto.setAttachmentNo(attachmentNo);
		}
		// 반환용 객체에 댕댕이 정보 설정
		dangPuppyListDto.setDangPuppyInfoDto(dangPuppyInfoDto);
		// 댕댕이 특이사항 등록
		if(puppyCharacter != null) {
			for(int i = 0 ; i < puppyCharacter.size() ; i ++) {
				dangPuppyDao.insertPuppyCharacter(puppyNo, puppyCharacter.get(i));
			}
			// 반환할 댕댕이 특성 설정
			dangPuppyListDto.setDangPuppyCharacter(puppyCharacter);
		}
		// 반환
		return dangPuppyListDto;
	}
	
	@PutMapping("/edit")
	public Integer editPuppy(HttpSession session, 
			@ModelAttribute DangPuppyInfoDto dangPuppyInfoDto,
			@RequestParam(required = false) List<String> puppyCharacter, 
			MultipartFile puppyImg) throws IllegalStateException, IOException {
		// 댕댕이 정보 수정
		dangPuppyDao.updatePuppy(dangPuppyInfoDto);
		// 댕댕이 특이사항
		// 댕댕이 특이사항 수정을 위한 삭제
		dangPuppyDao.deletePuppyCharacter(dangPuppyInfoDto.getPuppyNo());
		// 변경할 특이사항이 있다면
		if(puppyCharacter != null) {			
			// 댕댕이 특이사항 수정(재등록)
			for(int i = 0 ; i < puppyCharacter.size() ; i ++) {				
				dangPuppyDao.insertPuppyCharacter(dangPuppyInfoDto.getPuppyNo(), puppyCharacter.get(i));
			}
		}
		// 첨부파일 수정
		if(puppyImg != null) { // 첨부파일을 수정한다면
			// 기존 첨부파일 조회
			Integer attachmentNoExisting = dangPuppyDao.findPuppyImgNo(dangPuppyInfoDto.getPuppyNo());
			System.out.println(attachmentNoExisting);
			// 기존 첨부파일이 있다면
			if(attachmentNoExisting != null) {
				// 첨부파일 테이블에서 정보 삭제 (on delete cascade 조건에 의해 연결 테이블은 자동 삭제)
				attachmentDao.delete(attachmentNoExisting);
				// 기존 첨부파일 이름 반환
				String fileName = String.valueOf(attachmentNoExisting);
				// 삭제할 첨부파일 경로 설정
				File targetExisting = new File(directory, fileName);
				// 기존 첨부파일 삭제
				targetExisting.delete();
			}
			// 새로 첨부파일을 등록하기 위해 번호 반환
			int attachmentNo = attachmentDao.sequence();
			// 첨부파일 정보 DB 등록
			attachmentDao.insert(AttachmentDto.builder()
					.attachmentNo(attachmentNo)
					.attachmentName(puppyImg.getName())
					.attachmentType(puppyImg.getContentType())
					.attachmentSize(puppyImg.getSize())
					.build());
			// 연결 테이블 DB 등록
			dangPuppyDao.insertPuppyImg(dangPuppyInfoDto.getPuppyNo(), attachmentNo);
			// 첨부파일 저장 경로 생성
			File target = new File(directory, String.valueOf(attachmentNo));
			// 파일 저장
			puppyImg.transferTo(target);
			// 바뀐 첨부파일 번호 반환
			return attachmentNo;
		} else { // 첨부파일 변화가 없다면
			// null 반환
			return null;
		}
	}
	
	@DeleteMapping("/delete")
	public int deletePuppy(@RequestParam int puppyNo) {
		// 기존 첨부파일 조회
		Integer attachmentNoExisting = dangPuppyDao.findPuppyImgNo(puppyNo);
		// 기존 첨부파일이 있다면
		if(attachmentNoExisting != null) {
			// 첨부파일 테이블에서 정보 삭제 (on delete cascade 조건에 의해 연결 테이블은 자동 삭제)
			attachmentDao.delete(attachmentNoExisting);
			// 기존 첨부파일 이름 반환
			String fileName = String.valueOf(attachmentNoExisting);
			// 삭제할 첨부파일 경로 설정
			File targetExisting = new File(directory, fileName);
			// 기존 첨부파일 삭제
			targetExisting.delete();
		}
		// 댕댕이 삭제
		dangPuppyDao.deletePuppy(puppyNo);
		return puppyNo;
	}
}
