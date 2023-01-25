<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.modal-header{
		border-bottom: none;
		padding-bottom:0;
	}
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
  		border-top: none;
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
	 .progress-bar {
		background-color: #76BEFF;
	}
	
	  #mapwrap {
            position: relative;
            overflow: hidden;
        }
        .category,
        .category * {
            margin: 0;
            padding: 0;
            color: #000;
        }
        .category {
            position: absolute;
            overflow: hidden;
            top: 10px;
            left: 10px;
            width: 250px;
            height: 55px;
            z-index: 10;
            border: 1px solid black;
            border-radius: 10px;
            font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
            font-size: 12px;
            text-align: center;
            background-color: #fff;
        }
        .category .menu_selected {
            background: #f3d4d1;
            color: #fff;
            border-left: 1px solid #915B2F;
            border-right: 1px solid #915B2F;
            margin: 0 -1px;
        }
        .category li {
            list-style: none;
            float: left;
            width: 50px;
            height: 60px;
            padding-top: 5px;
            cursor: pointer;
        }
        .category .ico_comm {
            display: block;
            margin: 0 auto 2px;
            width: 26px;
            height: 26px;
            background:
                url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;
        }
        .category .ico_cafe {
            background-image: url("${pageContext.request.contextPath}/images/cafe-icon.png");
        }
        .category .ico_food {
            background-image: url("${pageContext.request.contextPath}/images/food-icon.png");
        }
        .category .ico_field {
            background-image: url("${pageContext.request.contextPath}/images/field-icon.png");
        }
        .category .ico_dogsalon {
            background-image: url("${pageContext.request.contextPath}/images/salon-icon.png");
        }
        .category .ico_park {
            background-image: url("${pageContext.request.contextPath}/images/park-icon.png");
        }
        .customoverlay {
            position: relative;
            bottom: 40px;
            border-radius: 6px;
            border: 1px solid #ccc;
            border-bottom: 2px solid #ddd;
            float: left;
        }
        .customoverlay:nth-of-type(n) {
            border: 0;
            box-shadow: 0px 1px 2px #888;
        }
        .customoverlay a {
            display: block;
            text-decoration: none;
            color: #000;
            text-align: center;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            overflow: hidden;
            background: #d95050;
            background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;
        }
        .customoverlay .title {
            display: block;
            text-align: center;
            background: #fff;
            margin-right: 35px;
            padding: 10px 15px;
            font-size: 14px;
            font-weight: bold;
        }
        .customoverlay:after {
            content: '';
            position: absolute;
            margin-left: -12px;
            left: 50%;
            bottom: -12px;
            width: 22px;
            height: 12px;
            background:
                url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
        }
        .border1 {
            border: 1px solid #F2F2F2;
        }
        .input1 {
            border: 2px solid #F781D8;
            height: 50px;
        }
        .box1 {
            border: 2px solid #F781D8;
            height: 50px;
            border-radius: 5px;
            background: white;
        }
        
      .form-content:focus {
	  background-color: #fff;
	  border-color: #a2c1f6;
	  outline: 0;
	  box-shadow: 0 0 0 0.25rem rgba(69, 130, 236, 0.25);
	}
	.schedule-where{
    border: 1px solid gray;
    margin: 0px 0px 10px;
    height: 42px;
	}
	
    .modal-place-body{
	border-radius: 0.3rem;
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    margin: 15px;
    height: 150px;
	}
    .body1{
        width: 33%;
        position: relative;
    }
    .body2{
        width: 67%;
        padding: 10px;
    }
    .span-placeoperation{
        font-size: 14px;
    }
    .span-placetel{
        color: #76BEFF;
        font-size: 15px;
    }
    .place-img{
        width:150px;
        height:150px;
        border-radius: 0.3em;
    }
    .span-placearea{
        border-radius: 0.4em;
        background-color: #FF8888;
        color: white;
        position: absolute;
        font-size: 13px;
        top: 3px;
        left: 4px;
    }
    .span-placesort{
        font-size: 14px;
        color: gray;
    }
    .span-placename{
        font-weight: bolder;
    }
    .span-placeaddress{
        font-size: 14px;
        word-spacing: 1px;
        letter-spacing: -1px;
    }
    .span-placeoff{
	    border-radius: 3px;
	    background-color: #F1F1F0;
	    color: #5A5A5A;
	    font-size: 13px;
    }
    
    .btn-select-place{
    background-color: #F94888;
    color: white;
    }
    .fa-square-phone{
    color: #C2C4C6;
    font-size: 18px;
    margin-right: 7px;
    }
    .span-placeurl{
    display: none;
    }
    .btn-placeurl{
    color: white;
    background-clolr: #76BEFF;
    }
    .invalid-money{
      font-size: 0.875em;
	  color: red;
    }
    .modal-header .btn-close{
    	margin:-0.5rem -0.5rem 4.5rem auto;
    }
    .nick-font{
    	font-size:20px;
    	font-weight:bolder;
    	letter-spacing:0.7px;
    }
    .modal-profile-btn{
    	font-size:16px;
    	text-align:center;
    	padding-top:3px;
    }
</style>
<script>
	$(function(){
		
		$(".invalid-money").hide();
		
 		//참여 회비는 1백만원미만으로 제한(6자)
 		$(document).on("input", ".money", function(){
 			
			var moneyLength = $(this).val().length;
			
			console.log(moneyLength);
			
			if(moneyLength >= 7) {
				$(".invalid-money").show();
			}
		});
        
		$(".btn-placeurl").click(function(){
			$(".span-placeurl").text();			
			var placeUrl = $(".span-placeurl").text();			
			window.location.href=placeUrl;			
		});
		
		
		//모달 띄워지기 직전 캘린더 미리 생성
		$("#day-check-modal").on("shown.bs.modal", function () {
			createCalendar();
		});
		
		//오늘 출석여부 확인+판정객체
		var isAttendance = $("[name=isAttendance]").val();
		var AttendanceValid = false;
		if(isAttendance==""){
			$(".checkAttendance").text("출석 체크");
			$(".close-btn").hide("fast");
			$(".attendance-btn").show(1000);
		}else{
			$(".checkAttendance").text("출석 완료");
			$(".close-btn").show(1000);
			$(".attendance-btn").hide("fast");
			AttendanceValid = true;
		}
	
		//출석체크 모달
		$(document).on("click",".day-check",function(){
			var memberNo = $("[name=memberNo]").val();
			$(".fc-day-today").removeClass("addImg");
			//출석체크 확인
			$.ajax({
              		url:"${pageContext.request.contextPath}/rest_member/is_attendance?memberNo="+memberNo,
   					method:"get",
   					success:function(resp){
   						if(resp.length!=0){ //출석기록 있음
   							console.log("출석기록 있음!");
   							AttendanceValid = false;
   							
   							//모달 타이틀 문구 변경
   							$(".modal-title1").text("출석 체크가 ");
   							$(".modal-title2").text("완료");
   							$(".modal-title3").text(" 되었습니다!");
   							
   							return;
   						}else{ //출석기록 없음
   							console.log("출석기록 없음!");
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
   									async:false,
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
   				                    			//4. 활동점수 실시간 출력
   				                    			var sideScoreTag = $(".profile-box").children().find(".memberScore")
   				                    			var sideScoreValue = parseInt(sideScoreTag.text());
   				                    			sideScoreTag.text(sideScoreValue+1);
   				                    		}
   				                    	});
   				                  		 //5. 출석체크 박스 문구 출석완료로 변경
   			   							$(".checkAttendance").text("출석 완료");
   				                    }
   				            	});
   							});
   						}
   					}
			});
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
					url:"${pageContext.request.contextPath}/rest_member/profile_edit",
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
		
		$(".write-btn").click(function(e){
			console.log(${profile.memberNo});
			var memberNo = ${profile.memberNo};
			 var scheduleTitle = $("[name=scheduleTitle]").val();
			var scheduleContent =$("[name=scheduleContent]").val();
			var scheduleStart = $("[name=scheduleStart]").val();
			var scheduleHour = $("[name=scheduleHour]").val();
			var placeNo = $(".schedule-where").attr('data-placeno');
			var scheduleHeadmax = $("[name=scheduleHeadmax]").val();
			var scheduleMoney = $("[name=scheduleMoney]").val();

			saveData(scheduleTitle, memberNo, scheduleContent, scheduleStart, scheduleHour, placeNo, scheduleHeadmax, scheduleMoney); 
			
			});
		
		//등록 함수
		function saveData(scheduleTitle, memberNo, scheduleContent, scheduleStart, 
				scheduleHour, placeNo, scheduleHeadmax, scheduleMoney){
			var data = {
					scheduleTitle: scheduleTitle,
					memberNo: memberNo,
					scheduleContent: scheduleContent,
					scheduleStart: scheduleStart,
					scheduleHour: scheduleHour,
					placeNo: placeNo,
					scheduleHeadmax: scheduleHeadmax,
					scheduleMoney: scheduleMoney
			};
			
			$.ajax({
				url:"http://localhost:8888/rest/dangSchedule/schedule_insert",
				method:"post",
				contentType:"application/json",
				data:JSON.stringify(data),
				success:function(resp){
					console.log(resp);	
					//location.href='http://localhost:8888/dang/1/schedule_detail?scheduleNo=83';
					
					//var placeNo = $(".schedule-where").attr('data-placeno');
				}
			});
		}
		
		//프로필 상세 정보
		$(".profile-info").click(function(){
			$("#profile-info-modal").modal("show");
		});

		
		
	});
</script>

<%-- 댕모임 사이드바 프로필 --%>
<div class = "col">
	<div class="p-3 profile-box border rounded-3 mb-3 shadow">
		<div class="profile-wrap text-center">
		
			<div class="row justify-content-center mb-3 mt-1" >
				<div class="col-10">
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
				<div class="col-10 middle-items justify-content-center">
					<img src="${pageContext.request.contextPath}/images/bone.png" class="page-profile pe-1" width="30" height="30">
					<span class="font-gray nick-font ps-1 originNickName">${profile.memberNick}</span>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-10 ps-1">
					<span class="originMessage" style="font-size:13px;">${profile.memberMessage}</span>
				</div>
			</div>

			<div class="row mt-3">
				<div class="col-10 offset-1">
					<div class="text-start mb-1 blue" style="font-size:15px; font-weight:bolder;">
						<span class="memberScore">${profile.memberScore}</span>점
					</div>
					<div class="progress">
						<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${profile.memberScore}%;" aria-valuemin="0" aria-valuemax="500"></div>
					</div>
					<div class="text-start mt-1 mb-1 font-gray" style="font-size:13px;">
						<span>${profile.memberGrade}</span>
					</div>
					
					<div class="profile-edit" data-bs-toggle="modal" data-bs-target="#profileEditModal" data-bs-whatever="@mdo">
						<i class="fa-solid fa-pencil cursor-pointer" style="font-size:23px;"></i>
						<p class="cursor-pointer">프로필 편집</p>
					</div>
					
					<!-- 프로필 편집 모달 시작-->					
					<div class="modal fade" id="profileEditModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<form class="edit-form">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">프로필 수정</h5>
								</div>
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
							</div>
							</form>
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
							<i class="fa-regular fa-heart fa-2x" style="color:#FEA59C;"></i>
							<p class="font-gray" style="font-size:15px;">참여모임</p>
							<p class="font-gray" style="font-size:20px; font-weight:bolder;">${joinDangCount}</p>
						</div>
						<div class="col-3">
							<i class="fa-regular fa-pen-to-square fa-2x" style="color:#FFE699;"></i>
							<p class="font-gray" style="font-size:15px;">작성글</p>
							<p class="font-gray" style="font-size:20px; font-weight:bolder;">${boardWriteCount}</p>
						</div>
						<div class="col-3">
							<i class="fa-regular fa-comment-dots fa-2x" style="color:#C5E0B4;"></i>
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
	
	<!-- 프로필 상세 모달 -->
	<div class="modal fade" id="profile-info-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="width:400px; height:auto;">
				<div class="modal-header" style="background-color:#E7F3FF; height:130px; position:relative;">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div style="position:absolute;">
					<div>
						<img src="${pageContext.request.contextPath}/images/basic-profile.png" 
								class="img-circle" style="width:130px; height:130px; margin-left:100%; margin-top:50%;">
					</div>
				</div>
				<div class="modal-body" >
					<div class="row">
						<div class="col-8 offset-2 text-center" style="margin-top:90px;">
							<p class="font-gray nick-font">닉네임</p>
							<p class="mt-1" style="font-size:14px;">상태메세지에요 이건 상태메시지에요</p>
						</div>
						<div class="col 6 offset 3 text-center m-3 mb-5">
							<button type="button" class="btn btn-primary modal-profile-btn">등급</button>
							<button type="button" class="btn btn-primary ms-1 me-1 modal-profile-btn">활동점수</button>
							<button type="button" class="btn btn-outline-pink modal-profile-btn">
								<img src="${pageContext.request.contextPath}/images/siren.png" style="width:20px; height:20px;">
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 댕모임 일정 등록 -->
	 <div class="p-3 border rounded-3 text-center day-check shadow gray mt-3">
		<span data-bs-toggle="modal" data-bs-target="#staticBackdrop" class="addSchedule cursor-pointer">댕모임 등록</span>
	</div>

    <!-- 댕모임 일정 등록 모달 -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">댕모임 등록</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form class="form-tag board-form">
                    <div class="modal-body">

                        <div class="mb-3 text-start">
                            <label for="message-text" class="col-form-label ms-2 me-1">댕모임 제목</label>
                              <i class="fa-solid fa-asterisk text-danger"></i>
                              <span class="length-font">(</span>
                            <span class="title-length length-font">0</span> 
                            <span class="length-font">/ 20 )</span>
                            <input type="text" class="schedule-name form-control" name="scheduleTitle" maxlength="20">
                        </div>



                        <div class="mb-3 text-start">
                            <label for="message-text" class="col-form-label ms-2 me-1">댕모임 내용</label>
                            <i class="fa-solid fa-asterisk text-danger"></i>
                            <span class="length-font">(</span>
                            <span class="content-length length-font">0</span>
                            <span class="length-font">/ 100 )</span>
                            <textarea  class="write-content form-control b-contentbox" name="scheduleContent" maxlength="100" rows="2"
                                style="resize:none;"></textarea>
                        </div>

                        <div class="mb-3 text-start">
                            <label for="message-text" class="col-form-label ms-2 me-1">댕모임 시간</label>
                            <i class="fa-solid fa-asterisk text-danger"></i>
                                <p><input type="date" value="2023-02-02" class="inbl w-50 b-contentbox form-control" name="scheduleStart"><input type="time" value="13:00" min="00:00"
                                        max="24:00"  class="inbl w-50 b-contentbox form-control" name="scheduleHour"></p>
                        </div>

                        <div class="mb-3 text-start">
                        <div>
                            <label for="message-text" class="col-form-label ms-2 me-1">댕모임 장소 찾기</label>
                            <i class="fa-solid fa-asterisk text-danger"></i>
                            </div>
                            <div class="schedule-where form-control" ></div>                       
                            <div class="dang-schedule-map">
                                <div id="mapwrap">
                                    <!-- 지도가 표시될 div -->
                                    <div id="map1" style="width: 100%; height: 350px;"></div>
                                    <!-- 지도 위에 표시될 마커 카테고리 -->
                                    <div class="category">
                                        <ul>
                                            <li id="cafeMenu" onclick="changeMarker('cafe')"><span
                                                    class="ico_comm ico_cafe"></span> 카페</li>
                                            <li id="foodMenu" onclick="changeMarker('food')"><span
                                                    class="ico_comm ico_food"></span> 음식점</li>
                                            <li id="fieldMenu" onclick="changeMarker('field')"><span
                                                    class="ico_comm ico_field"></span> 운동장</li>
                                            <li id="dogsalonMenu" onclick="changeMarker('dogsalon')"><span
                                                    class="ico_comm ico_dogsalon"></span> 미용
                                            </li>
                                            <li id="parkMenu" onclick="changeMarker('park')"><span
                                                    class="ico_comm ico_park"></span> 공원</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="mb-3 text-start">
                            <label for="write-category" class="col-form-label ms-2 me-1">최대 참여인원 </label><i class="fa-solid fa-asterisk text-danger"></i>
                                                            <select style="color: #757575;" name="scheduleHeadmax" class="rounded pb-1 ps-1  inbl w-50 b-contentbox form-content">
                                    <option value="" >인원수</option>
                                    <option class="people-5">5</option>
                                    <option class="people-10">10</option>
                                    <option class="people-15">15</option>
                                    <option class="people-20">20</option>
                                </select>
                        </div>


                        <div class="mb-3 text-start">
                            <label for="message-text" class="col-form-label ms-2 me-1" >참여 회비</label>
                            <input class="money form-control" name="scheduleMoney" maxLength="7" />
                            <span class="invalid-money">참여회비는 1백만원 미만으로 설정 가능합니다.</span>                            
                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary write-cancel" data-bs-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary write-btn">등록</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
        <!-- 댕모임 일정 등록 모달 끝 -->

	    <!-- 댕모임 일정 장소 모달 시작-->
    <div class="modal fade" id="edit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-place-body">
                    <div class="body-flex body1">
                        <span class="span-placearea px-2"></span>
                    <img src=""  class="place-img">
                </div>
                <div class="body-flex body2">
                    <span class="span-placename"></span>
                     <span  class="span-placesort"></span><br>
                    <span class="span-placeaddress"></span><br>
                    <span class="span-placeoff px-2"></span>
                    <span class="span-placeoperation"></span><br>
                    <i class="fa-solid fa-square-phone"> </i><span class="span-placetel"></span><br>
                    <span  class="span-placeurl"></span>
                    </div>
                </div>
                <div class="modal-footer pt-0">
                    <button type="button" class="btn btn-primary btn-placeurl" >홈페이지</button>                
                    <button type="button" class="btn btn-secondary " onclick="detailMove()">상세보기</button>
                    <button type="button" class="btn btn-select-place">등록하기</button>
                </div>
            </div>
        </div>
    </div>
      <!-- 댕모임 일정 장소 모달 끝-->

	<!-- 댕모임 정보 수정 -->
	<c:if test = "${profile.memberOwner == 'Y'}">
	<div class="p-3 border rounded-3 text-center day-check shadow mt-3 gray">
		<i class="fa-solid fa-gear"></i>
		<a class="cursor-pointer" href = "/dang/${dangNo}/edit">댕모임 수정</a>
	</div>
	</c:if>
	
	<%--필요한 데이터 준비 --%>
	<input type="hidden" name="isAttendance" value="${attendance}">
	<input type="hidden" name="memberNo" value="${profile.memberNo}">
	<input type="hidden" name="dangNo" value="${profile.dangNo}">
	<input type="hidden" name="userNo" value="${profile.userNo}">
	
	<input type="hidden" class="cl" data-no="23">
	<input type="hidden" class="cl" data-no="27">
	
</div>

  <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b9a95746698992180eedc27d9eef265"></script>
    <script>
        var placeNoInfo; //장소번호를 가져오는 변수
        var placeContents = []; // 장소번호를 가져와 내용을 담는 변수
        var placeOriginNo; // 클릭한 마커의 데이터장소번호를 뽑아내는 변수
		
        
        
		$(".btn-select-place").click(function(){			
			var placeWhere = $(".span-placename").text();	
			//장소번호로 장소데이터 불러오기(테스트)
			$(".schedule-where").attr("data-placeno", placeNoInfo);
			
			$(".schedule-where").text(placeWhere);
			
			$("#edit").modal("hide");
			
		});
        
        $(document).on("input", ".schedule-name", function(){
        	
        	console.log("확인");
        	
        	var nameLength = $(this).val().length;
        	console.log(nameLength);
        	$(".title-length").text(nameLength);
        	
         	if(nameLength >= 20) {
         		$(".title-length").css("color","red");
        		
        	} 
         	else{
         		$(".title-length").css("color","black");
         	}
        });
          
        $(document).on("input", ".write-content", function(){
        	     	
        	var contentLength = $(this).val().length;
        	console.log(contentLength);
        	$(".content-length").text(contentLength);
        	
         	if(contentLength >= 100) {
         		$(".content-length").css("color","red");
        
        	} 
         	else{
         		$(".content-length").css("color","black");
         	}
        });
        
        function detailMove() {
            location.href = "http://localhost:8888/place/detail/" + placeNoInfo;
        }
        $(document).on("click",".edit",function (e) {
                    $("#edit").modal("show");//모달 실행
                    placeNoInfo = $(this).data("placeno");
                    //비동기통신 시작
                    $
                        .ajax({
                            url: "http://localhost:8888/rest_place/place_one/"
                                + placeNoInfo,
                            method: "get",
                            async: false,
                            contentType: "application/json",
                            success: function (resp) {
                                //console.log(resp)
                                $(".span-placeaddress").text(
                                    resp.placeAddress);
                                $(".span-placearea").text(
                                    resp.placeArea);
                                $(".span-placeinfo").html(
                                    resp.placeInfo);
                                $(".span-placename").text(
                                    resp.placeName);
                                $(".span-placeoff").text(
                                    resp.placeOff);
                                $(".span-placeoperation").text(
                                    resp.placeOperation);
                                $(".span-placesort").text(
                                    resp.placeSort);
                                $(".span-placetel").text(
                                    resp.placeTel);
                                $(".span-placeurl").text(
                                    resp.placeUrl);
                                $(".place-img")
                                    .attr(
                                        "src",
                                        "http://localhost:8888/rest_attachment/download/"
                                        + resp.attachmentNo);
                                abc = resp.placeNo;
                            }
                        })
                });
        var mapContainer1 = document.getElementById('map1'), // 지도를 표시할 div  
            mapOption1 = {
                center: new kakao.maps.LatLng(37.498004414546934,
                    127.02770621963765), // 지도의 중심좌표 
                
                // 지도의 확대 레벨 
            };
        var map1 = new kakao.maps.Map(mapContainer1, mapOption1); // 지도를 생성합니다
        setTimeout(function() {
            map1.relayout();
            map1.setCenter(new kakao.maps.LatLng(37.498004414546934,  127.02770621963765));
            // map.setLevel(2); 필요하면 레벨조정
        },100);
        setTimeout(function(){ map1.relayout(); }, 0); 
      
       $('#staticBackdrop').on('shown.bs.modal', function (e) {
        map1.relayout();
    })
        var clickedOverlay = null;//클릭이벤트 오버레이 전역변수 초기값
        // 카페 마커가 표시될 좌표 배열입니다
        var cafePositions = [
        ];
        // 음식점 마커가 표시될 좌표 배열입니다
        var foodPositions = [
        ];
        //  운동장 마커가 표시될 좌표 배열입니다
        var fieldPositions = [
        ];
        //  미용 마커가 표시될 좌표 배열입니다
        var dogsalonPositions = [
        ];
        //  공원 마커가 표시될 좌표 배열입니다
        var parkPositions = [
        ];
        // 카페에 정보를 담을 배열
        var contentCafe = [];
        // 음식점에 정보를 담을 배열
        var contentFood = [];
        // 운동장에 정보를 담을 배열
        var contentField = [];
        // 미용에 정보를 담을 배열
        var contentDogsalon = [];
        // 공원에 정보를 담을 배열
        var contentPark = [];
        $.ajax({
            url: "http://localhost:8888/rest_place/place_list",
            method: "get",
            async: false,
            contentType: "application/json",
            success: function (resp) {
                for (var i = 0; i < resp.length; i++) {
                    if (resp[i].placeSort === "카페") {//DB에서 불러온 값이 카페이면 카페정보배열에 밀어넣기
                        cafePositions.push(new kakao.maps.LatLng(
                            resp[i].placeX, resp[i].placeY))
                        contentCafe.push(resp[i]);
                    } else if (resp[i].placeSort === "음식점") {
                        foodPositions.push(new kakao.maps.LatLng(
                            resp[i].placeX, resp[i].placeY))
                        contentFood.push(resp[i]);
                    } else if (resp[i].placeSort === "운동장") {
                        fieldPositions.push(new kakao.maps.LatLng(
                            resp[i].placeX, resp[i].placeY))
                        contentField.push(resp[i]);
                    } else if (resp[i].placeSort === "미용") {
                        dogsalonPositions.push(new kakao.maps.LatLng(
                            resp[i].placeX, resp[i].placeY))
                        contentDogsalon.push(resp[i]);
                    } else if (resp[i].placeSort === "공원") {
                        dogsalonPositions.push(new kakao.maps.LatLng(
                            resp[i].placeX, resp[i].placeY))
                        contentPark.push(resp[i]);
                    }
                }
            }
        })
        var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png'; // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
        var cafemarkerImageSrc = "${pageContext.request.contextPath}/images/cafe-icon.png"; // 카페의 마커이미지의 주소입니다.
        var foodmarkerImageSrc = "${pageContext.request.contextPath}/images/food-icon.png"; // 카페의 마커이미지의 주소입니다.
        var fieldmarkerImageSrc = "${pageContext.request.contextPath}/images/field-icon.png"; // 카페의 마커이미지의 주소입니다.
        var dogsalonmarkerImageSrc = "${pageContext.request.contextPath}/images/salon-icon.png"; // 카페의 마커이미지의 주소입니다.
        var parkmarkerImageSrc = "${pageContext.request.contextPath}/images/park-icon.png"; // 카페의 마커이미지의 주소입니다.
        cafeMarkers = [], // 카페 마커 객체를 가지고 있을 배열입니다
            foodMarkers = [], // 음식점 마커 객체를 가지고 있을 배열입니다
            fieldMarkers = []; // 운동장 마커 객체를 가지고 있을 배열입니다
        dogsalonMarkers = []; // 미용 마커 객체를 가지고 있을 배열입니다
        parkMarkers = []; // 공원 마커 객체를 가지고 있을 배열입니다
        createCafeMarkers(); // 카페 마커를 생성하고 카페 마커 배열에 추가합니다
        createFoodMarkers(); // 음식점 마커를 생성하고 음식점 마커 배열에 추가합니다
        createFieldMarkers(); // 운동장 마커를 생성하고 운동장 마커 배열에 추가합니다
        createDogsalonMarkers(); // 미용 마커를 생성하고 운동장 마커 배열에 추가합니다
        createParkMarkers(); // 공원 마커를 생성하고 운동장 마커 배열에 추가합니다
        changeMarker('cafe'); // 지도에 카페 마커가 보이도록 설정합니다    
        // 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
        function createMarkerImage(src, size, options) {
            var markerImage = new kakao.maps.MarkerImage(src, size, options);
            return markerImage;
        }
        // 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
        function createMarker(position, image) {
            var marker = new kakao.maps.Marker({
                position: position,
                image: image
            });
            return marker;
        }
        // 카페 마커를 생성하고 카페 마커 배열에 추가하는 함수입니다
        function createCafeMarkers() {
            for (var i = 0; i < cafePositions.length; i++) {
                var imageSize = new kakao.maps.Size(40, 26), imageOptions = {
                    spriteOrigin: new kakao.maps.Point(0, 0),
                    spriteSize: new kakao.maps.Size(20, 20)
                };
                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(cafemarkerImageSrc,
                    imageSize, imageOptions), marker = createMarker(
                        cafePositions[i], markerImage);
                // 생성된 마커를 카페 마커 배열에 추가합니다
                //makeOverListener(map, marker, infowindow)
                cafeMarkers.push(marker);
                kakao.maps.event
                    .addListener(
                        marker,
                        'click',
                        function () {
                            for (var i = 0; i < cafePositions.length; i++) {
                                var a1 = this.getPosition().Ma
                                var a2 = contentCafe[i].placeX
                                if (a2.toFixed(7) === a1.toFixed(7)) {
                                    placeOriginNo = contentCafe[i].placeNo;
                                    content = '<div class="customoverlay">'
                                        + '  <a class="edit" data-placeno=' + contentCafe[i].placeNo + ' target="_blank">'
                                        + '    <span class="title " data-placeno=' + contentCafe[i].placeNo + ' >'
                                        + contentCafe[i].placeName
                                        + '</span>'
                                        + '  </a>'
                                        + '</div>';
                                }
                            }
                            var position = this.getPosition();
                            // 커스텀 오버레이를 생성합니다
                            var customOverlay = new kakao.maps.CustomOverlay(
                                {
                                    map: map1,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(map1);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        console.log(placeOriginNo);
        // 카페 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setCafeMarkers(map1) {
            for (var i = 0; i < cafeMarkers.length; i++) {
                cafeMarkers[i].setMap(map1);
            }
        }
        // 음식점 마커를 생성하고 음식점 마커 배열에 추가하는 함수입니다
        function createFoodMarkers() {
            for (var i = 0; i < foodPositions.length; i++) {
                var imageSize = new kakao.maps.Size(40, 26), imageOptions = {
                    spriteOrigin: new kakao.maps.Point(0, 0),
                    spriteSize: new kakao.maps.Size(20, 20)
                };
                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(foodmarkerImageSrc, imageSize,
                    imageOptions), marker = createMarker(foodPositions[i],
                        markerImage);
                // 생성된 마커를 음식점 마커 배열에 추가합니다
                foodMarkers.push(marker);
                kakao.maps.event
                    .addListener(
                        marker,
                        'click',
                        function () {
                            for (var i = 0; i < foodPositions.length; i++) {
                                var a1 = this.getPosition().Ma
                                var a2 = contentFood[i].placeX
                                if (a2.toFixed(7) === a1.toFixed(7)) {
                                    placeOriginNo = contentCafe[i].placeNo;
                                    content = '<div class="customoverlay">'
                                        + '  <a class="edit" data-placeno=' + contentFood[i].placeNo + ' target="_blank">'
                                        + '    <span class="title " data-placeno=' + contentFood[i].placeNo + ' >'
                                        + contentFood[i].placeName
                                        + '</span>'
                                        + '  </a>'
                                        + '</div>';
                                }
                            }
                            var position = this.getPosition();
                            // 커스텀 오버레이를 생성합니다
                            var customOverlay = new kakao.maps.CustomOverlay(
                                {
                                    map: map1,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(map1);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        // 음식점 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setFoodMarkers(map1) {
            for (var i = 0; i < foodMarkers.length; i++) {
                foodMarkers[i].setMap(map1);
            }
        }
        // 운동장 마커를 생성하고 운동장 마커 배열에 추가하는 함수입니다
        function createFieldMarkers() {
            for (var i = 0; i < fieldPositions.length; i++) {
                var imageSize = new kakao.maps.Size(40, 26), imageOptions = {
                    spriteOrigin: new kakao.maps.Point(0, 0),
                    spriteSize: new kakao.maps.Size(20, 20)
                };
                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(fieldmarkerImageSrc, imageSize,
                    imageOptions), marker = createMarker(fieldPositions[i],
                        markerImage);
                // 생성된 마커를 운동장 마커 배열에 추가합니다
                fieldMarkers.push(marker);
                kakao.maps.event
                    .addListener(
                        marker,
                        'click',
                        function () {
                            for (var i = 0; i < fieldPositions.length; i++) {
                                var a1 = this.getPosition().Ma
                                var a2 = contentField[i].placeX
                                if (a2.toFixed(7) === a1.toFixed(7)) {
                                    placeOriginNo = contentCafe[i].placeNo;
                                    content = '<div class="customoverlay">'
                                        + '  <a class="edit" data-placeno=' + contentField[i].placeNo + ' target="_blank">'
                                        + '    <span class="title " data-placeno=' + contentField[i].placeNo + ' >'
                                        + contentField[i].placeName
                                        + '</span>'
                                        + '  </a>'
                                        + '</div>';
                                }
                            }
                            var position = this.getPosition();
                            // 커스텀 오버레이를 생성합니다
                            var customOverlay = new kakao.maps.CustomOverlay(
                                {
                                    map: map1,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(map1);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        // 운동장 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setFieldMarkers(map1) {
            for (var i = 0; i < fieldMarkers.length; i++) {
                fieldMarkers[i].setMap(map1);
            }
        }
        // 미용 마커를 생성하고 미용 마커 배열에 추가하는 함수입니다
        function createDogsalonMarkers() {
            for (var i = 0; i < dogsalonPositions.length; i++) {
                var imageSize = new kakao.maps.Size(40, 26), imageOptions = {
                    spriteOrigin: new kakao.maps.Point(0, 0),
                    spriteSize: new kakao.maps.Size(20, 20)
                };
                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(dogsalonmarkerImageSrc, imageSize,
                    imageOptions), marker = createMarker(
                        dogsalonPositions[i], markerImage);
                // 생성된 마커를 미용 마커 배열에 추가합니다
                dogsalonMarkers.push(marker);
                kakao.maps.event
                    .addListener(
                        marker,
                        'click',
                        function () {
                            for (var i = 0; i < dogsalonPositions.length; i++) {
                                var a1 = this.getPosition().Ma
                                var a2 = contentDogsalon[i].placeX
                                if (a2.toFixed(7) === a1.toFixed(7)) {
                                    placeOriginNo = contentCafe[i].placeNo;
                                    content = '<div class="customoverlay">'
                                        + '  <a class="edit" data-placeno=' + contentDogsalon[i].placeNo + ' target="_blank">'
                                        + '    <span class="title " data-placeno=' + contentDogsalon[i].placeNo + ' >'
                                        + contentDogsalon[i].placeName
                                        + '</span>'
                                        + '  </a>'
                                        + '</div>';
                                }
                            }
                            var position = this.getPosition();
                            // 커스텀 오버레이를 생성합니다
                            var customOverlay = new kakao.maps.CustomOverlay(
                                {
                                    map: map1,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(map1);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        // 미용 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setDogsalonMarkers(map1) {
            for (var i = 0; i < dogsalonMarkers.length; i++) {
                dogsalonMarkers[i].setMap(map1);
            }
        }
        // 공원 마커를 생성하고 공원 마커 배열에 추가하는 함수입니다
        function createParkMarkers() {
            for (var i = 0; i < parkPositions.length; i++) {
                var imageSize = new kakao.maps.Size(40, 26), imageOptions = {
                    spriteOrigin: new kakao.maps.Point(0, 0),
                    spriteSize: new kakao.maps.Size(20, 20)
                };
                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(parkmarkerImageSrc, imageSize,
                    imageOptions), marker = createMarker(parkPositions[i],
                        markerImage);
                // 생성된 마커를 공원 마커 배열에 추가합니다
                parkMarkers.push(marker);
                kakao.maps.event
                    .addListener(
                        marker,
                        'click',
                        function () {
                            for (var i = 0; i < parkPositions.length; i++) {
                                var a1 = this.getPosition().Ma
                                var a2 = contentPark[i].placeX
                                if (a2.toFixed(7) === a1.toFixed(7)) {
                                    placeOriginNo = contentCafe[i].placeNo;
                                    content = '<div class="customoverlay">'
                                        + '  <a class="edit" data-placeno=' + contentPark[i].placeNo + ' target="_blank">'
                                        + '    <span class="title " data-placeno=' + contentPark[i].placeNo + ' >'
                                        + contentPark[i].placeName
                                        + '</span>'
                                        + '  </a>'
                                        + '</div>';
                                }
                            }
                            var position = this.getPosition();
                            // 커스텀 오버레이를 생성합니다
                            var customOverlay = new kakao.maps.CustomOverlay(
                                {
                                    map: map1,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(map1);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        // 공원 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setParkMarkers(map) {
            for (var i = 0; i < parkMarkers.length; i++) {
                parkMarkers[i].setMap(map1);
            }
        }
        // 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
        function changeMarker(type) {
            var cafeMenu = document.getElementById('cafeMenu');
            var foodMenu = document.getElementById('foodMenu');
            var fieldMenu = document.getElementById('fieldMenu');
            var dogsalonMenu = document.getElementById('dogsalonMenu');
            var parkMenu = document.getElementById('parkMenu');
            // 카페 카테고리가 클릭됐을 때
            if (type === 'cafe') {
                // 카페 카테고리를 선택된 스타일로 변경하고
                cafeMenu.className = 'menu_selected';
                // 음식점과 운동장과 미용 카테고리는 선택되지 않은 스타일로 바꿉니다
                foodMenu.className = '';
                fieldMenu.className = '';
                dogsalonMenu.className = '';
                parkMenu.className = '';
                // 카페 마커들만 지도에 표시하도록 설정합니다
                setCafeMarkers(map1);
                setFoodMarkers(null);
                setFieldMarkers(null);
                setDogsalonMarkers(null);
                setParkMarkers(null);
            } else if (type === 'food') { // 음식점 카테고리가 클릭됐을 때
                // 음식점 카테고리를 선택된 스타일로 변경하고
                cafeMenu.className = '';
                foodMenu.className = 'menu_selected';
                fieldMenu.className = '';
                dogsalonMenu.className = '';
                parkMenu.className = '';
                // 음식점 마커들만 지도에 표시하도록 설정합니다
                setCafeMarkers(null);
                setFoodMarkers(map1);
                setFieldMarkers(null);
                setDogsalonMarkers(null);
                setParkMarkers(null);
            } else if (type === 'field') { // 운동장 카테고리가 클릭됐을 때
                // 운동장 카테고리를 선택된 스타일로 변경하고
                cafeMenu.className = '';
                foodMenu.className = '';
                fieldMenu.className = 'menu_selected';
                dogsalonMenu.className = '';
                parkMenu.className = '';
                // 운동장 마커들만 지도에 표시하도록 설정합니다
                setCafeMarkers(null);
                setFoodMarkers(null);
                setFieldMarkers(map1);
                setDogsalonMarkers(null);
                setParkMarkers(null);
            } else if (type === 'dogsalon') {
                // 미용 카테고리를 선택된 스타일로 변경하고
                cafeMenu.className = '';
                foodMenu.className = '';
                fieldMenu.className = '';
                dogsalonMenu.className = 'menu_selected';
                parkMenu.className = '';
                // 미용 마커들만 지도에 표시하도록 설정합니다
                setCafeMarkers(null);
                setFoodMarkers(null);
                setFieldMarkers(null);
                setDogsalonMarkers(map1);
                setParkMarkers(null);
            } else if (type === 'park') {
                // 공원 카테고리를 선택된 스타일로 변경하고
                cafeMenu.className = '';
                foodMenu.className = '';
                fieldMenu.className = '';
                dogsalonMenu.className = '';
                parkMenu.className = 'menu_selected';
                // 공원 마커들만 지도에 표시하도록 설정합니다
                setCafeMarkers(null);
                setFoodMarkers(null);
                setFieldMarkers(null);
                setDogsalonMarkers(null);
                setParkMarkers(map1);
            }
        }
        
  
    </script>