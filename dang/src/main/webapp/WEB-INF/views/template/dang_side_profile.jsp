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
  	}
  	.modal-footer{
  		background-color: #fff;
  	}
  	
  	.addImg{
  		background-image: url("${pageContext.request.contextPath}/images/logo2.png");
  		background-position: center center;
  		background-size: 55px 55px;
  		background-repeat: no-repeat;
  	}
  	.fc .fc-daygrid-day.fc-day-today{
  		background-color:#fff;
  	}
  	
</style>
<script>
	$(function(){
		
		//오늘 출석여부 확인
		var isAttendance = $("[name=isAttendance]").val();
		if(isAttendance==""){
			$(".checkAttendance").text("출석 체크");
			$(".close-btn").hide();
			$(".attendance-btn").show();
		}else{
			$(".checkAttendance").text("출석 완료");
			$(".close-btn").show();
			$(".attendance-btn").hide();
		}
		
		//출석체크 모달
		$(".day-check").click(function(){
			//모달 띄워지기 직전 캘린더 생성 준비 후 모달 보여주기
			$("#day-check-modal").on("shown.bs.modal", function () {
				createCalendar();
			}).modal('show');
			
		});
		
		//출석 체크 버튼 이벤트
		$(".checkAttendance").click(function(){
			var isAttendance = $("[name=isAttendance]").val();
			var memberNo = $("[name=memberNo]").val();

			if(isAttendance==""){ //미출석
				$(".fc-day-today").removeClass("addImg");	
				$(".attendance-btn").click(function(){
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
	                    		success:function(resp){
	                    			
	                    		}
	                    	});
	                    }
					});
					//4. 출석체크 박스 문구 출석완료로 변경
					$(".checkAttendance").text("출석 완료");
				});
			}else{ //출석완료
				//이번달 출석일 확인 후 발바닥 목록 출력
				listData={
		                memberNo:memberNo               
		          }
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_member/attendance_list",
					method:"get",
					data:listData,
		    		dataType:"json",
		    		contentType:"application/json",
					success:function(resp){
						console.log(resp);
					}
				});
			
			}
		
		});
		
		
		function createCalendar(){
			//풀캘린더
			var calendarEl = $('#calendar')[0];
			var calendar = new FullCalendar.Calendar(calendarEl, {
		        aspectRatio: 1.3, //달력의 가로 세로 비율 설정
		        height: '500px', // calendar 높이 설정
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

	           	]
		      });
		      // 캘린더 랜더링
		      calendar.render();
		}
		
	});
</script>

<%-- 댕모임 사이드바 프로필 --%>
<div class = "col">
	<div class="p-3 profile-box border rounded-3 mb-3 shadow">
		<div class="profile-wrap text-center">
			<div class="row justify-content-center mb-3" >
				<div class="col-7">
					<img src="${pageContext.request.contextPath}/images/icon-man.png" class="img-fluid">
				</div>
			</div>
			<div class="row d-flex justify-content-center">
				<div class="col-3 pe-1">
					<img src="${pageContext.request.contextPath}/images/bone.png" class="img-fluid">
				</div>
				<div class="col-7 ps-1" style="display:flex; align-items:center">
					<span class="font-gray" style="font-size:20px; font-weight:bolder;">${profile.memberNick}</span>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-10 ps-1">
					<span>${profile.memberMessage}</span>
				</div>
			</div>
			
			<div class="row mt-3">
				<div class="col-10 offset-1">
					<div class="text-start mb-1" style="font-size:15px; color:#6C7AEF; font-weight:bolder;">
						<span>${profile.memberScore}</span>점
					</div>
					<div class="progress">
						<div class="progress-bar" role="progressbar" style="width: ${profile.memberScore}%;" aria-valuemin="0" aria-valuemax="500"></div>
					</div>
					<div class="text-start mt-1 font-gray" style="font-size:13px;">
						<span>${profile.memberGrade}</span>
					</div>
					
					<div class="profile-edit">
						<i class="fa-solid fa-pencil" style="font-size:23px;"></i>
						<p>프로필 편집</p>
					</div>
				</div>
			</div>
			
			<div class="row mt-2 mb-1">
				<div class="col">
					<hr>
					
					<div class="row justify-content-center">
						<div class="col-4">
							<i class="fa-regular fa-heart fa-2x"></i>
							<p class="font-gray" style="font-size:15px;">참여모임</p>
							<p class="font-gray" style="font-size:20px; font-weight:bolder;">2</p>
						</div>
						<div class="col-4">
							<i class="fa-regular fa-pen-to-square fa-2x"></i>
							<p class="font-gray" style="font-size:15px;">작성글</p>
							<p class="font-gray" style="font-size:20px; font-weight:bolder;">4</p>
						</div>
						<div class="col-4">
							<i class="fa-regular fa-comment-dots fa-2x"></i>
							<p class="font-gray" style="font-size:15px;">댓글</p>
							<p class="font-gray" style="font-size:20px; font-weight:bolder;">28</p>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<!-- 출석 체크 -->
	<div class="p-3 border rounded-3 text-center day-check">
		<span data-bs-toggle="modal" data-bs-target="#day-check-modal" class="checkAttendance">출석 체크</span>
	</div>
	
	<!-- 출석체크 Modal -->
	<div class="modal fade" id="day-check-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="margin:0 auto;">
					<c:choose>
						<c:when test="${attendance!=null}">
							<p style="color:#303030; font-size:15px;" class="me-1"> 출석 체크가 </p>
							<h5 class="modal-title" id="exampleModalLabel" style="display:block; font-size:25px; color:#6C7AEF; font-weight:bolder"> 완료 </h5>
							<p style="color:#303030; font-size:15px;" class="ms-1"> 되었습니다!</p>
						</c:when>
						<c:otherwise>
							<p style="color:#303030; font-size:15px;" class="me-1"> 댕모임의 </p>
							<h5 class="modal-title" id="exampleModalLabel" style="display:block; font-size:25px; color:#6C7AEF; font-weight:bolder"> 등급 포인트가 +1 </h5>
							<p style="color:#303030; font-size:15px;" class="ms-1"> 올라갑니다!</p>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="modal-body">
				 	<div id="calendar"></div>
				</div>
				<div class="modal-footer mb-3" style="margin:0 auto;">
					<button type="button" class="btn btn-secondary attendance-btn">출석하기</button>
					<button type="button" class="btn btn-secondary close-btn" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	test : ${attendance}
	test2:${profile}
	<%--필요한 데이터 준비 --%>
	<input type="hidden" name="isAttendance" value="${attendance}">
	<input type="hidden" name="memberNo" value="${profile.memberNo}">
	
</div>
