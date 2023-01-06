<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="댕모임 일정" name="title" />
</jsp:include>


<html>
<head>

<style>
.layout {
	max-width: 1100px;
	margin: 30px auto;
	padding: 50px;
	display: flex;
	flex-wrap: wrap;
	flex-wrap: wrap gap: 1em;
}

.monthly-calendar{
	height : 1500px;
} 

.calendar{
	width: 100%;
	height : 500px;
    margin: 0 0 30 auto;
}

.calendar-info{
	width: 350px;
	height : 450px;
	background-color: #FAFAFA;
	text-align: center;
}


.more-info{
	width : 1100px;
	height : 400px;
	background-color: white;
	display: flex;
	flex-direction: row;
	gap: 1em;
	justify-content: center;
}

.upcoming{
 font-size: 24px;
 font-weight: bold;
 color: #454545;
}

.schedule-info{
    width: 95%;
    background-color: #E2EFFF;
    height: 820px;
    border-radius: 10px;
    margin: auto;
}

.dang-place-map{
    display: block;
    margin: auto;
    width: 85%;
    height: 250px;
    border-radius: 10px;
    background-color: white;
}

.dang-title{
    display: block;
    position: relative;
    text-align: center;
    color: #515151;
    font-size: 30px;
    font-weight: bold;
    padding: 30px 0px 20px;
}
.info-commons {
    margin: 15px auto;
    width: 85%;
    height: 40px;
    background-color: white;
    border-radius: 10px;
    display: flex;
    flex-direction: row;
}

.block {
    display: block;
    line-height: 40px;
    border: none;
    background-color: #76BEFF;
    text-align: center;
    border-radius: 10px;
    color: white;
    font-size: 18px;
    font-weight: 600;
    height: 40px;
    width: 120px;
}

.block-white{
    display: block;
    line-height: 40px;
    border: none;
    border-radius: 10px;
    color: #515151;
    font-size: 18px;
    font-weight: 600;
    height: 40px;
    width: 350px;
    margin-left: 20px;
}

.simple-schedule-box{
    width: 100%;
    height: 90px;
    border-radius: 15px 15px 15px 15px;
    border-style: solid;
    border-width: 2px 2px 2px 2px;
    border-color: #EFEFEF;
    margin: 15px 0 15px;
    
}

.simple-date-box{
    width: 100%;
    display: flex;
    padding: 10px;
}
.simple-friday{
    width: 70px;
    height: 70px;
    border-radius: 30%;
    border-style: solid;
    border-width: 6px 6px 6px 6px;
    border-color: #89E3E3;
}

.simple-monday{
    width: 70px;
    height: 70px;
    border-radius: 30%;
    border-style: solid;
    border-width: 6px 6px 6px 6px;
    border-color: #FFCF97;
}

.simple-sunday{
    width: 70px;
    height: 70px;
    border-radius: 30%;
    border-style: solid;
    border-width: 6px 6px 6px 6px;
    border-color: #D4BAFF;
}

.simple-thursday{
    width: 70px;
    height: 70px;
    border-radius: 30%;
    border-style: solid;
    border-width: 6px 6px 6px 6px;
    border-color: #FFA6E1;
}

.simple-day{
    height: 20px;
    font-size: 13px;
    font-weight: 400;
    text-align: center;
    color: #3D3D3D;
    position: relative;
    top: 5px;

}
.simple-number-day {
    height: 50px;
    font-size: 28px;
    font-weight: 500;
    text-align: center;
    color: #3D3D3D;
    margin-top: -5;
}

.simple-when, .simple-where{
    width: 200px;
    height: 35px;
    font-size: 16px;
    margin: 0px 15px;
    color: #3D3D3D;
    line-height: 35px;
 
}

.detail-modal{
    background-color: #F0F9FF;
}

.btn-in{
    display:block;
    border: none;
    background-color: #76BEFF;
    text-align: center;
    padding: 0.5em 0.7em 0.5em 0.7em;
    border-radius: 10px;
    color: white;
    font-size: 20px;
    font-weight: 600;
    height: 50px;
    width: 180px;
    text-align: center;
    margin: 35px auto;
}

.red-pin{
    height: 100px;
    width: 120px;
    position: absolute;
    left: 5px;
    top: 10px;
}
    </style>
<meta charset='utf-8' />

<script>
	$(function() {
		var calendarEl = $('#calendar1')[0];

		var calendar = new FullCalendar.Calendar(calendarEl, {
			rerenderDelay : 450,
			initialView : 'dayGridMonth', //캘린더 화면

			headerToolbar : {
				left : 'prev',
				center : 'title',
				right : 'next'
			},

			themeSystem : 'bootstrap5',
			selectable : true, // 날짜 선택
			locale : 'ko', // 한국어 설정
			// navLinks: true, // 날짜 선택하면 해당 날짜 화면
			editable : true, // 수정 가능 여부

			events : [

			]
		});
		calendar.render();

	});
</script>
</head>

<body>
	<div class="container-fluid  mt-3">

		<div class="col-10 offset-1">
			<div class="row">
				<!-- 프로필 박스 시작-->
				<div class="col-3">
					<jsp:include page="/WEB-INF/views/template/dang_side_profile.jsp"></jsp:include>
				</div>
				<!-- 프로필 박스 끝-->

				<!-- 캘린더 박스 시작-->
			<div class = "col-6" style="background: white">				
			    <div class="monthly-calendar">					
	             <div id='calendar1' class="calendar"></div>

                 <div class = "schedule-info shedule-shadow">  

                    <div class="dang-title"><img class="red-pin" src="${pageContext.request.contextPath}/images/red-pin.png">초코야 목욕가자~!!</div>

                    <div class = "info-commons dang-content">
                        <div class="block">모임 내용</div>
                        <div class="block-white">목욕댕모임</div>
                    </div>    

                    <div class = "info-commons dang-leader">
                        <div class="block">모임 리더</div>
                        <div class="block-white">초코는귀여워</div>
                    </div>

                    <div class = "info-commons dang-when">
                        <div class="block">모임 시간</div>
                        <div class="block-white">1월 13일 (금) 14:00</div>
                    </div>   
                    
                    <div class = "info-commons dang-where">
                        <div class="block">모임 장소</div> 
                        <div class="block-white">신촌 댕목욕집</div>
                    </div>
               
                        <div class = "dang-place-map"></div>

                                     
                    <div class = "info-commons dang-number">
                        <div class="block">참여 인원</div>
                        <div class="block-white">4명 / 8명</div>
                    </div>      
                    
                    <div class = "info-commons dang-who">
                        <div class="block">참여 멤버</div>
                        <div class="block-white"></div>
                    </div>   

                    <button class="btn btn-in">참여하기</button>

                </div>     
                 </div>
	         </div>		
				<!-- 캘린더 박스 끝-->


				<!-- 다가오는 일정 박스 시작-->
				<div class="col-3">
					<jsp:include page="/WEB-INF/views/template/dang_side_upcoming.jsp"></jsp:include>
				</div>
				<!-- 다가오는 일정 박스  끝-->
			</div>
		</div>

	</div>
</body>
</html>