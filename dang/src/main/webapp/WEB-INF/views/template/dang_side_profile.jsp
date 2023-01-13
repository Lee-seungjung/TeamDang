<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	
	.fc-scrollgrid{
		border-radius:0.5rem;
	}
	.fc .fc-scrollgrid{
		border:1px solid #ddd;
	}
 	.fc .fc-scrollgrid-section > * {
	    border-width: 0;
  	}
  	.modal-body{
  		padding-top:0;
  		padding-bottom:0;
  	}
  	.modal-footer{
  		background-color: #fff;
  	}
  	
  	.addImg{
  		background-image: url("${pageContext.request.contextPath}/images/logo2.png");
  		background-position: center center;
  		background-size: 45px 45px;
  		background-repeat: no-repeat;
  	}
  	.fc .fc-daygrid-day.fc-day-today{
  		background-color:#fff;
  	}
  	.camera-icon{
  		width: 35px;
	    height: 35px;
	    position: relative;
	    top: 60px;
	    left: -45px;
  	}
  	.profile-css{
  		width:150px;
  		height:150px;
  		margin-left:20px;
  	}
  	.origin-css{
  		width:180px;
  		height:180px;
  	}
  	.invalid-feedback2 {
	  display: none;
	  width: 100%;
	  margin-top: 0.25rem;
	  font-size: 0.875em;
	  color: #d9534f;
	}
  	.invalid-feedback, .invalid-feedback2{
  		display:none;
  	}
  	.is-invalid ~ .invalid-feedback{
  		display:block;
  	}
  	.invalid ~ .invalid-feedback2{
  		display:block;
  	}
  	.length-font{
  		font-size:12px;
  	}
  	.board-write{
  		color:#495057;
  	}
  	.board-write:hover{
  		color:black;
  	}
  	.b-contentbox::-webkit-scrollbar {
	    width: 5px;
	 }
	  .b-contentbox::-webkit-scrollbar-thumb {
	  	height:30%;
	    background-color: #B0CBFF;
	    border-radius: 0.3rem;
	 }
	  .b-contentbox::-webkit-scrollbar-track {
	    background-color: #F1F4FF;
	    border-radius: 0.3rem;
	 }
	 .file-div{
	 	width:100px;
	 	height:100px;
	 }
</style>
<script>
	$(function(){
		
		//모달 띄워지기 직전 캘린더 미리 생성
		$("#day-check-modal").on("shown.bs.modal", function () {
			createCalendar();
		});
		
		//오늘 출석여부 확인+판정객체
		var isAttendance = $("[name=isAttendance]").val();
		var AttendanceValid = false;
		if(isAttendance==""){
			$(".checkAttendance").text("출석 체크");
			$(".close-btn").hide();
			$(".attendance-btn").show();
		}else{
			$(".checkAttendance").text("출석 완료");
			$(".close-btn").show();
			$(".attendance-btn").hide();
			AttendanceValid = true;
		}
	
		//출석체크 모달
		$(".day-check").click(function(){
			
			var memberNo = $("[name=memberNo]").val();
			$(".fc-day-today").removeClass("addImg");	
			
			if(AttendanceValid==false){ //미출석
				console.log("미출석 상태!");
				
				$(".attendance-btn").click(function(){
					AttendanceValid = true;
					//1. 오늘날짜 배경에 로고 이미지 넣기
					$(".fc-day-today").addClass("addImg");
					
					//2. ajax 출석 테이블 insert
					attendanceData={
							memberNo:memberNo					
					}
					$.ajax({
						url:"${pageContext.request.contextPath}/rest_member/attendance_insert",
						method:"post",
						data:JSON.stringify(attendanceData),
						contentType: 'application/json',
	                    success:function(){
	                    	//버튼 막기
	                    	$(".close-btn").show();
	    					$(".attendance-btn").hide();
	    					
	                    	//3. 활동점수 +1 업데이트
	                    	data={
	                    			memberScore:1,
	                    			memberNo:memberNo
	                    	}
	                    	$.ajax({
	                    		url:"${pageContext.request.contextPath}/rest_member/score_plus",
	                    		method:"patch",
	                    		data:JSON.stringify(data),
	                    		contentType: 'application/json',
	                    		async:false,
	                    		success:function(resp){
	                    			//4. 활동점수 조회 후 실시간 출력
	                    			$.ajax({
			                    		url:"${pageContext.request.contextPath}/rest_member/score_find/"+memberNo,
			                    		method:"get",
			                    		data:memberNo,
			                    		success:function(resp){
			                    			$(".memberScore").text(resp);
			                    		}
	                    			});
	                    		}
	                    	});
	                    }
					});
					//5. 출석체크 박스 문구 출석완료로 변경
					$(".checkAttendance").text("출석 완료");
					
				});
			}else{
				console.log("출석 상태!");
				
				//모달 타이틀 문구 변경
				$(".modal-title1").text("출석 체크가 ");
				$(".modal-title2").text("완료");
				$(".modal-title3").text(" 되었습니다!");

			}
			
		});
		
		//프로필 수정
		//프로필 클릭하면 첨부파일 열림
		$(".profile-img").click(function(){
			$(".input-file").click();
		});
		
		//프로필 사진변경 이벤트
		$(".input-file").change(function(){
			var value = $(this).val();
			if(value.length>0){ //파일 있음
				var formData = new FormData();
				formData.append("attachment", this.files[0]);
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_attachment/upload",
					method:"post",
					data:formData,
					processData:false, 
                    contentType:false,
                    success:function(resp){
                    	console.log(resp);
                    	$(".change-img").attr("src",resp); //프로필 미리보기
                    	//원래 페이지 프로필 정보 변경
                    	var check = resp.lastIndexOf("/"); //경로에서 /위치 찾기
                    	var newAttachmentNo = resp.substr(check+1); //attachmentNo 꺼내기
                    	$("[name=attachmentNo]").val(newAttachmentNo); //name=attachmentNo input태그에 값 넣기
                    	
                    	//페이지 벗어나면 첨부파일 DB 삭제
                    	$(window).on("beforeunload", function(){
                    		deleteAttachmentNo();
						});

			        }
				});
			}
		});
		
		
		//모달 취소버튼 클릭 시 첨부파일 DB 삭제
		$(".cancel-btn").click(function(){
			deleteAttachmentNo();
		});
		
		
		//입력 항목 상태 판정
		check={
				memberNick : false, memberNickRegex : /^[a-zA-Z0-9가-힣]{1,10}$/,
				memberMessage : true, 
				allValid:function(){
					return this.memberNick && this.memberMessage;
				}
		};
		
		//닉네임 검사
		$("[name=memberNick]").blur(function(){ 
			var originMemberNick = $(".originNickName").text(); //기존 닉네임
            var memberNick = $(this).val(); //입력창 닉네임
            
            //1. input창이 변화가 있을경우와 없을경우 체크
            //2. 변화가 없을 경우 판정 true
            //3. 변화가 있을 경우 (1) 정규표현식 검사
            //4. 						 (2) 댕모임 내 닉네임 중복검사
            
            $(this).removeClass("is-valid is-invalid invalid");
            if(originMemberNick==memberNick){
            	check.memberNick=true;
            }else{
            	//정규표현식 확인
                var regex = check.memberNickRegex;
                if(regex.test(memberNick)) {
                    var dangNo = $("[name=dangNo]").val();
                    checkData={
                    		dangNo:dangNo,
                    		memberNick:memberNick
                    }
                    //2. 중복닉네임 확인(비동기) 
                   	$.ajax({
                   		url:"${pageContext.request.contextPath}/rest_member/checkNick/"+dangNo+"/"+memberNick,
    					method:"get",
    					data:checkData,
    		    		dataType:"json",
    		    		contentType:"application/json",
    					success:function(resp){
    						$(this).removeClass("is-valid is-invalid invalid");
    						if(resp){
    							$("[name=memberNick]").addClass("is-valid");
    							check.memberNick=true;
    						}else{
    							$("[name=memberNick]").addClass("invalid");
    							check.memberNick=false;
    						}
    					}
                   	});           
                }
                else {
                	check.memberNick = false;
                    $(this).addClass("is-invalid");
                }
            }
		 });  
		
		//상태메세지 글자 수 검사
		$("[name=memberMessage]").on("input",function(){
			var textLength = $(this).val().length;
			var value = $(this).val();
			//상태메시지 글자수 표시
			$(".length").text(textLength);
			$(this).removeClass("is-valid is-invalid");
			if(textLength==30){
				$(".length").css("color","red").text(30);
				$(this).addClass("is-valid");
				check.memberMessage=true;
			}else if(textLength>30){
				$(this).val(value.substring(0,30));	
				$(".length").css("color","red").text(30);
				$(this).addClass("is-invalid");
				check.memberMessage=false;
			}else if(textLength>0){
				$(".length").css("color","#495057");
				$(this).addClass("is-valid");
				check.memberMessage=true;
			}
		});
		
		//폼전송 이벤트
		$(".edit-form").submit(function(e){
			//기본이벤트 차단
			e.preventDefault();
			
			//이벤트 강제실행
			$("[name=memberNick]").blur();
			
			//비동기 데이터 준비
			var userNo = $("[name=userNo]").val();
			var attachmentNo=$("[name=attachmentNo]").val();
			var originAttachmentNo = $("[name=originAttachmentNo]").val();
			var memberNo = $("[name=memberNo]").val();
			var memberNick = $("[name=memberNick]").val();
			var memberMessage = $("[name=memberMessage]").val();
			
			//1. 새로운 파일의 유무로 구분
			//   - 있을경우에만 user-img 기존 데이터 삭제 후 insert
			//   - 기존파일 없을 경우 user-img insert만 처리
			//2. 댕회원 정보 변경
			//3. 새로고침없이 본화면 프로필사진, 닉네임, 상태메세지 변경
			if(check.allValid()){
				imgInsertData={	
					attachmentNo:attachmentNo,
					userNo:userNo
				}
				if(originAttachmentNo==""){
					$.ajax({ //1 기존파일 없을 경우에는 그냥 insert만 처리
						url:"${pageContext.request.contextPath}/rest_user/img_insert",
						method:"post",
						contentType:"application/json",
						data:JSON.stringify(imgInsertData),
						success:function(){

						}
					});
				}else{
					if(attachmentNo!=originAttachmentNo){  //1 새로운 파일 있을 경우 기존파일 삭제처리
						$.ajax({ //1
							url:"${pageContext.request.contextPath}/rest_user/img_insert",
							method:"post",
							contentType:"application/json",
							data:JSON.stringify(imgInsertData),
							success:function(){
								deleteOriginAttachmentNo();
							}
						});
					}
				}
				
				editData={
						memberNo:memberNo,
						memberNick:memberNick,
						memberMessage:memberMessage
				}
				$.ajax({ //2
					url:"http://localhost:8888/rest_member/profile_edit",
					method:"patch",
					contentType:"application/json",
					data:JSON.stringify(editData),
					success:function(resp){
						if(resp){ //3
							if(attachmentNo==""){
								$(".origin-img").attr("src","${pageContext.request.contextPath}/images/basic-profile.png");
							}else{
								$(".origin-img").attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+attachmentNo);
							}
							$(".originNickName").text(memberNick);
							$(".originMessage").text(memberMessage);
							$("[name=originAttachmentNo]").val(attachmentNo);
						}
					}
				});
			}
		});
		
		//풀캘린더 생성
		function createCalendar(){
			//비동기화 데이터 준비
			var memberNo = $("[name=memberNo]").val();
			listData={
                	memberNo:memberNo               
        	}
			//풀캘린더
			var calendarEl = $('#calendar')[0];
			var calendar = new FullCalendar.Calendar(calendarEl, {
		        aspectRatio: 1.3, //달력의 가로 세로 비율 설정
		        height: '400px', // calendar 높이 설정
		        expandRows: true, // 화면에 맞게 높이 재설정
		        // 해더에 표시할 툴바
		        headerToolbar: {
		          left: '',
		          center: 'title',
		          right: ''
		        },
		        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		        nowIndicator: true, // 현재 시간 마크
		        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
		        locale: 'ko', // 한국어 설정
		        events: [
		        	//이번달 출석일 확인
					$.ajax({
						url:"${pageContext.request.contextPath}/rest_member/attendance_list",
						method:"get",
						data:listData,
			    		dataType:"json",
			    		contentType:"application/json",
						success:function(resp){
							if(resp.length!=0){
								for(var i=0; i<resp.length; i++){
									calendar.addEvent({
										date:resp[i]['attendanceDate'],
										display: ['background'],
										color:['#fff'],
										imageurl:'/images/logo2.png'
									})
								}
							}
						}
					})
	           	],
	            //발바닥 찍기
	           	eventDidMount: function(info){
	           		if(info.event.extendedProps.imageurl){
	           			var findEl = info.el.parentElement.parentElement.offsetParent.parentElement;
	           			findEl.classList.add('addImg');
	           		}
	           	}
		      });
		      // 캘린더 랜더링
		      calendar.render();
		}
		
		//취소, 돌아가기 시 첨부파일 삭제
		function deleteAttachmentNo(){
			var newAttachmentNo = $("[name=attachmentNo]").val();
			var originAttachmentNo = $("[name=originAttachmentNo]").val();
			if(newAttachmentNo!=originAttachmentNo){ //새로 사진등록한 상태
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_attachment/delete/"+newAttachmentNo,
					method:"delete",
					data:newAttachmentNo,
					success:function(resp){
						$("[name=attachmentNo]").val(originAttachmentNo);
						
						if(originAttachmentNo==""){
							$(".change-img").attr("src","${pageContext.request.contextPath}/images/basic-profile.png");
						}else{
							$(".change-img").attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+originAttachmentNo);
						}
					}
				});
			}
		}
		
		//기존 첨부파일 삭제
		function deleteOriginAttachmentNo(){
			var originAttachmentNo = $("[name=originAttachmentNo]").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_attachment/delete/"+originAttachmentNo,
				method:"delete",
				data:originAttachmentNo,
				success:function(resp){
					
				}
			});
		}
		

		
	});
</script>

<%-- 댕모임 사이드바 프로필 --%>
<div class = "col">
	<div class="p-3 profile-box border rounded-3 mb-3 shadow">
		<div class="profile-wrap text-center">
			<div class="row justify-content-center mb-3 mt-1" >
				<div class="col-8 ">
				
					<c:choose>
						<c:when test="${attachmentNo==null}">
							<img src="${pageContext.request.contextPath}/images/basic-profile.png" class="img-fluid img-circle origin-img origin-css">
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/rest_attachment/download/${attachmentNo}" class="img-fluid img-circle origin-img origin-css">
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div class="row d-flex justify-content-center">
				<div class="col-4 pe-1">
					<img src="${pageContext.request.contextPath}/images/bone.png" class="page-profile float-end" width="30" height="30">
				</div>
				<div class="col-6 ps-1" style="display:flex; align-items:center">
					<span class="font-gray originNickName" style="font-size:20px; font-weight:bolder;">${profile.memberNick}</span>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-10 ps-1">
					<span class="originMessage" style="font-size:13px;">${profile.memberMessage}</span>
				</div>
			</div>

			<div class="row mt-3">
				<div class="col-10 offset-1">
					<div class="text-start mb-1" style="font-size:15px; color:#6C7AEF; font-weight:bolder;">
						<span class="memberScore">${profile.memberScore}</span>점
					</div>
					<div class="progress">
						<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${profile.memberScore}%;" aria-valuemin="0" aria-valuemax="500"></div>
					</div>
					<div class="text-start mt-1 font-gray" style="font-size:13px;">
						<span>${profile.memberGrade}</span>
					</div>
					
					<div class="profile-edit" data-bs-toggle="modal" data-bs-target="#profileEditModal" data-bs-whatever="@mdo">
						<i class="fa-solid fa-pencil cursor-pointer" style="font-size:23px;"></i>
						<p class="cursor-pointer">프로필 편집</p>
					</div>
					
					<!-- 프로필 편집 모달 시작-->					
					<div class="modal fade" id="profileEditModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">프로필 수정</h5>
								</div>
								<form class="edit-form">
								<div class="modal-body">
									<div class="mb-3">
										<c:choose>
											<c:when test="${attachmentNo==null}">
												<img src="${pageContext.request.contextPath}/images/basic-profile.png" class="img-circle profile-img profile-css change-img">
											</c:when>
											<c:otherwise>
												<img src="${pageContext.request.contextPath}/rest_attachment/download/${attachmentNo}" class="img-circle profile-img profile-css change-img">
											</c:otherwise>
										</c:choose>
										<img src="${pageContext.request.contextPath}/images/edit-camera.png" class="camera-icon profile-img">
                							<input type="file" style="display:none;" class="input-file form-control" accept=".jpg, .png, .gif">
                							<input type="hidden" name="attachmentNo" value="${attachmentNo}">
                							<input type="hidden" name="originAttachmentNo" value="${attachmentNo}">
									</div>
									<div class="mb-3 text-start">
										<label for="recipient-name" class="col-form-label ms-2 me-1">닉네임</label><i class="fa-solid fa-asterisk text-danger"></i>
										<input type="text" value="${profile.memberNick}" name="memberNick" class="form-control" id="recipient-name" autocomplete="off">
										<span class="invalid-feedback">1~10자 내로 입력해주세요!</span>
										<span class="invalid-feedback2">이미 사용중인 닉네임입니다!</span>
									</div>
									<div class="mb-3 text-start">
										<label for="message-text" class="col-form-label ms-2 me-1">상태메세지</label>
										<span class="length-font">( </span>
										<span class="length length-font">0</span>
										<span class="length-font">/ 30 )</span>
										<input type="text" value="${profile.memberMessage}" name="memberMessage" class="form-control" id="message-text" autocomplete="off">
										<span class="invalid-feedback">30자 내로 입력해주세요!</span>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary cancel-btn" data-bs-dismiss="modal">취소</button>
									<button type="submit" class="btn btn-primary confirm-btn" data-bs-dismiss="modal">확인</button>
								</div>
								</form>
							</div>
						</div>
					</div>
					<!-- 프로필 편집 모달 끝-->
					
				</div>
			</div>
			
			<div class="row mt-2 mb-1">
				<div class="col">
					<hr>
					
					<div class="row justify-content-center">
						<div class="col-3">
							<i class="fa-regular fa-heart fa-2x"></i>
							<p class="font-gray" style="font-size:15px;">참여모임</p>
							<p class="font-gray" style="font-size:20px; font-weight:bolder;">${joinDangCount}</p>
						</div>
						<div class="col-3">
							<i class="fa-regular fa-pen-to-square fa-2x"></i>
							<p class="font-gray" style="font-size:15px;">작성글</p>
							<p class="font-gray" style="font-size:20px; font-weight:bolder;">${boardWriteCount}</p>
						</div>
						<div class="col-3">
							<i class="fa-regular fa-comment-dots fa-2x"></i>
							<p class="font-gray" style="font-size:15px;">댓글</p>
							<p class="font-gray" style="font-size:20px; font-weight:bolder;">${replyWriteCount}</p>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<!-- 출석 체크 -->
	<div class="p-3 border rounded-3 text-center day-check shadow gray">
		<span data-bs-toggle="modal" data-bs-target="#day-check-modal" class="checkAttendance cursor-pointer">출석 체크</span>
	</div>

	<!-- 출석체크 Modal -->
	<div class="modal fade" id="day-check-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="margin:0 auto;">
					<img src="${pageContext.request.contextPath}/images/logo.png" width="70" height="35">
					<p style="color:#303030; font-size:15px;" class="ms-1 me-1 modal-title1"> 댕모임의 </p>
					<h5 class="modal-title modal-title2" id="exampleModalLabel" style="display:block; font-size:25px; color:#6C7AEF; font-weight:bolder"> 등급 포인트가 +1 </h5>
					<p style="color:#303030; font-size:15px;" class="ms-1 modal-title3"> 올라갑니다!</p>
				</div>
				<div class="modal-body">
				 	<div id="calendar"></div>
				</div>
				<div class="modal-footer mb-2" style="margin:0 auto;">
					<button type="button" class="btn btn-secondary attendance-btn">출석하기</button>
					<button type="button" class="btn btn-secondary close-btn" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 게시판 글작성 -->
	<div class="p-3 border rounded-3 text-center shadow mt-3 gray">
		<a class="board-write cursor-pointer"  data-bs-toggle="modal" data-bs-target="#boardModal" data-bs-whatever="@mdo"
			href="${pageContext.request.contextPath}/dang/{dangNo}/board_write">게시글 작성</a>
	</div>

	<!-- 댕모임 정보 수정 -->
	<c:if test = "${profile.memberOwner == 'Y'}">
	<div class="p-3 border rounded-3 text-center day-check shadow mt-3 gray">
		<i class="fa-solid fa-gear"></i>
		<a class="cursor-pointer" href = "/dang/${dangNo}/edit">댕모임 수정</a>
	</div>
	</c:if>

	<!-- 게시판 글작성 모달 시작-->					
	<div class="modal fade" id="boardModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">게시글 작성</h5>
				</div>
				<form class="form-tag board-form">
				<div class="modal-body">
					
					<div class="mb-3 text-start">
						<label for="write-category" class="col-form-label ms-2 me-1">카테고리</label><i class="fa-solid fa-asterisk text-danger"></i>
						<div>
							<select class="form-select form-select-sm inbl w-auto" aria-label=".form-select-sm example" name="boardCategory" id="write-category">
							  <option value="">선택</option>
							  <option value="자유글">자유글</option>
							  <option value="가입인사">가입인사</option>
							  <option value="정모후기">정모후기</option>
							  <c:if test="${profile.memberOwner=='Y'}">
							  	<option value="공지사항">공지사항</option>
							  </c:if>
							</select>
						</div>
					</div>
					
					<div class="mb-3 text-start">
						<label for="message-text" class="col-form-label ms-2 me-1">내용</label>
						<span class="length-font">( </span>
						<span class="b-length length-font">0</span>
						<span class="length-font">/ 1000 )</span>
						<textarea name="boardContent" class="form-control b-contentbox" rows="7" style="resize:none;"></textarea>
					</div>
					
					<div class="mb-3 text-start mt-2">
						<div>
							<input class="form-control select-file" type="file" accept=".jpg, .png, .gif" multiple>
					    </div>
					    <div class="mt-2 file-wrap">
							<!-- 비동기화 출력 -->
					    </div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary write-cancel" data-bs-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary write-edit-btn">작성</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 게시판 글작성 모달 끝-->


	<%--필요한 데이터 준비 --%>
	<input type="hidden" name="isAttendance" value="${attendance}">
	<input type="hidden" name="memberNo" value="${profile.memberNo}">
	<input type="hidden" name="dangNo" value="${profile.dangNo}">
	<input type="hidden" name="userNo" value="${profile.userNo}">
	
	<input type="hidden" class="cl" data-no="23">
	<input type="hidden" class="cl" data-no="27">
	
</div>

<script>
	$(function(){
		$(".board-write").click(function(){
			$(".file-wrap").empty();
			
			$(".modal-title").text("게시글 등록");
			$("[name=boardCategory]").val("").prop("selected", true);
			$("[name=boardContent]").val("");
			$(".select-file").val("");
			$("write-edit-btn").text("작성");
			
			$(".form-tag").removeClass("board-form board-edit-form");
			$(".form-tag").addClass("board-form");
			
			
		});
		
		//입력 항목 상태 판정
		bCheck={
				boardContent : false, 
				boardCategory : false,
				allValid:function(){
					return this.boardContent && this.boardCategory;
				}
		};
		
		//카테고리 선택 검사
		$("[name=boardCategory]").on("change",function(){
			var value = $(this).val();
			console.log(value);
			if(value==""){
				bCheck.boardCategory=false;
			}else{
				bCheck.boardCategory=true;
			}
		});
		
		//입력창 글자수 확인(최대 1000자)
		$("[name=boardContent]").on("input",function(){
			var length = $(this).val().length; //글자수
			var value = $(this).val(); //입력내용
			//글자수 표시
			$(".b-length").text(length);
			console.log(value);
			$(this).removeClass("is-invalid");
			if(length==0){
				$(".b-length").css("color","#495057");
				bCheck.boardContent=true;
			}else if(length>1000){
				$(this).val(value.substring(0,1000));	
				$(".b-length").css("color","red").text(1000);
				bCheck.boardContent=false;
				$(this).addClass("is-invalid");
			}else if(length>0){
				$(".b-length").css("color","#495057");
				bCheck.boardContent=true;
			}
		});
		
		//파일 선택
		$(".select-file").change(function(e){
			var value = $(this).val(); //파일위치+파일명
			console.log(value);
			console.log(this.files); //파일 배열
			if(this.files.length>0){ //파일 있음
				var formData = new FormData();
			
				for(var i=0; i<this.files.length; i++){
					formData.append("attachment", this.files[i]);
				}
				
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_attachment/upload2",
					method:"post",
					data:formData,
					processData:false, 
                    contentType:false,
                    async:false,
                    success:function(resp){
                    	console.log("등록성공!");
                    	console.log(resp);
                    	
                    	var fileDiv = $(".file-wrap");
                    	for(var i=0; i<resp.url.length; i++){
                    		console.log(resp.url[i]);
                    		var check = resp.url[i].lastIndexOf("/"); //경로에서 /위치 찾기
                        	var attachmentNo = resp.url[i].substr(check+1); //attachmentNo 꺼내기
                        	
                    		var div = $("<div>").attr("class","form-control col-1 inbl w-auto file-div me-1");
                    		var img = $("<img>").attr("src",resp.url[i]).attr("class","img-fluid files file1")
                    						.attr("style","width:70px; height:70px;").attr("data-no",attachmentNo);
                    		var x = $("<p>").text("x").attr("class","text-center").attr("style","margin-top:-5px;");
    						div.append(img).append(x);
							fileDiv.append(div);
                    	}

			        }
				});
			}
		});
		
		//모달 취소버튼 누를 경우 첨부파일 삭제
		$(".write-cancel").click(function(){
			boardDeleteAttachmentNo();
		});

		//폼 전송 이벤트
		$(".board-form").submit(function(e){
			e.preventDefault();
			//이벤트 강제실행
			$("[name=boardCategory]").change();

			var judge = $("[name=boardContent]").val();
			if(judge.length==0) return; //입력값 없으면
			
			if(bCheck.allValid()){
				//boardNo 시퀀스 미리 받기
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_board/find_no",
					method:"get",
					async:false,
					success:function(resp){
						console.log(resp);
						
						//비동기화 데이터 준비
						var boardNo = resp;
						var memberNo = $("[name=memberNo]").val();
						var dangNo = $("[name=dangNo]").val();
						var memberNick = $("[name=memberNick]").val();
						var boardContent = $("[name=boardContent]").val();
						var boardCategory = $("[name=boardCategory]").val();
						
						boardData = {
							boardNo:boardNo,
							memberNo:memberNo,
							dangNo:dangNo,
							memberNick:memberNick,
							boardContent:boardContent,
							boardCategory:boardCategory
						}
						
						//게시글 DB등록
						$.ajax({
							url:"${pageContext.request.contextPath}/rest_board/insert",
							method:"post",
							async:false,
							data:JSON.stringify(boardData),
							contentType:"application/json",
							success:function(resp){
								//게시글 이미지 DB 등록
								var findtag = $(".files");
					        	var attachmentNo;
					        	if(findtag.length!=0){
					        		for(var i=0; i<findtag.length; i++){
						        		attachmentNo = findtag.eq(i).attr("data-no");
						        		
						        		data = {
						        				boardNo:boardNo,
						        				attachmentNo:attachmentNo
						        		}
						        		
						        		$.ajax({
						    				url:"${pageContext.request.contextPath}/rest_board/img_insert/",
						    				method:"post",
						    				data:JSON.stringify(data),
						    				async:false,
											contentType:"application/json",
						    				success:function(resp){
						    					console.log("저장성공!");
						    				}
						    			});
						        	}
					        	}
								$("#boardModal").modal('hide');
							}
						});
			        	location.reload();
					}
				});
			}
		});
		
		//취소, 돌아가기 시 첨부파일 삭제
		function boardDeleteAttachmentNo(){
			var findtag = $(".files");
        	var attachmentNo;
        	for(var i=0; i<findtag.length; i++){
        		attachmentNo = findtag.eq(i).attr("data-no");
        		
        		$.ajax({
    				url:"${pageContext.request.contextPath}/rest_attachment/delete/"+attachmentNo,
    				method:"delete",
    				data:attachmentNo,
    				async:false,
    				success:function(resp){
    				}
    			});
        	}
		}
		
	});
	
</script>
