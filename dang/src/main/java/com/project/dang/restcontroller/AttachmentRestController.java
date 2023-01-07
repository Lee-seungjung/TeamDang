package com.project.dang.restcontroller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.annotation.PostConstruct;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.project.dang.dto.AttachmentDto;
import com.project.dang.repository.AttachmentDao;

@RestController
@RequestMapping("/rest_attachment")
public class AttachmentRestController {
	@Autowired
	private AttachmentDao attachmentDao;
	
	// 기준 경로
	private File dir = new File(System.getProperty("user.home"),"/dang");//각자 집에서 C드라이브용
	//private File dir = new File("D:/upload/dang");//배포시 D드라이브용
	
	//이미지 저장소 폴더 생성
	@PostConstruct
	public void prepare() {
		dir.mkdirs(); //폴더 생성
	}
		
	//업로드
	@PostMapping("/upload")
	public String upload(@RequestParam(required = false) MultipartFile attachment) throws IllegalStateException, IOException {
		//DB저장
		int attachmentNo = attachmentDao.sequence();
		attachmentDao.insert(AttachmentDto.builder()
				.attachmentNo(attachmentNo)
				.attachmentName(attachment.getOriginalFilename())
				.attachmentType(attachment.getContentType())
				.attachmentSize(attachment.getSize())
				.build());
		
		//파일저장
		File target = new File(dir, String.valueOf(attachmentNo));
		attachment.transferTo(target);
		
		return ServletUriComponentsBuilder.fromCurrentContextPath()
				.path("/download/").path(String.valueOf(attachmentNo))
				.toUriString();
	}
	
	//다운로드 - 기존 방식과 동일
	@GetMapping("/download/{attachmentNo}")
	public ResponseEntity<ByteArrayResource> download(
			@PathVariable int attachmentNo) throws IOException{
		AttachmentDto dto = attachmentDao.selectOne(attachmentNo);
		if(dto==null) {
			throw new IllegalArgumentException();
			//잘못된 매개변수가 들어왔을때의 에러를 발생시킴
		}
		
		File target = new File(dir, String.valueOf(dto.getAttachmentNo()));
		if(!target.exists()) {//파일이 없을때
			throw new IllegalArgumentException();
		}
		
		byte[] date = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(date);
		
		return ResponseEntity.ok()
				.header(
						HttpHeaders.CONTENT_ENCODING, 
						StandardCharsets.UTF_8.name()
				)
				.header(
						HttpHeaders.CONTENT_TYPE, 
						dto.getAttachmentType()
				)
				.header(
						HttpHeaders.CONTENT_DISPOSITION, 
						ContentDisposition.attachment()
							.filename(
								dto.getAttachmentName(),
								StandardCharsets.UTF_8
							).build().toString()
				)
				.contentLength(dto.getAttachmentSize())
				.body(resource);
	}
	
	@DeleteMapping("/delete/{attachmentNo}")
	public boolean delete(@PathVariable int attachmentNo) {
		return attachmentDao.delete(attachmentNo);
	}
}
