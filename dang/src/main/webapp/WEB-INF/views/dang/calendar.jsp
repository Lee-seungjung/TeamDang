<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="댕모임 일정" name="title" />
</jsp:include>
	

<html>
<head>

    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

	


<style>
.layout {
	max-width: 1100px;
	margin: 30px auto;
	padding: 50px;
	display: flex;
	flex-wrap: wrap;
	flex-wrap: wrap gap: 1em;
	/*	background-color: lightgray;*/
}

/* .calendar-box{
	width : 100%px;
	height : 450px;
	background-color: white;
	display: flex;
	flex-direction: row;
	gap: 1em;
	justify-content: center;
} */
.calendar {
	width: 100%;
	height: 500px;
}

.calendar-info {
	width: 350px;
	height: 450px;
	background-color: #FAFAFA;
	text-align: center;
}

.more-info {
	width: 1100px;
	height: 400px;
	background-color: white;
	display: flex;
	flex-direction: row;
	gap: 1em;
	justify-content: center;
}

/* .add-schedule{
	width : 1000px;
	height : 400px;
	text-align: center;
	margin: 60px 10px;

} */
.add-btn {
	width: 140px;
	color: white;
	font-size: 18px;
	font-weight: bold;
	height: 50px;
	margin: 20px;
	background-color: 76BEFF;
}

.upcoming {
	font-size: 24px;
	font-weight: bold;
}

.place-info {
	height: 700px;
	/*     background-color: blue; */
	flex-direction: row;
}

.place-map {
	width: 90%;
	height: 400px;
	margin: 30px 30px;
	background-color: lightblue;
}

.dang-title, .dang-time, .dang-location {
	height: 50px;
	background-color: white;
	margin: 30px;
}

.block {
	display: inline-block;
	border: none;
	background-color: #76BEFF;
	text-align: center;
	padding: 0.5em 0.8em 0.5em 0.8em;
	border-radius: 7px;
	font-weight: 600;
	color: white;
	font-size: 20px;
	margin: 0 3px;
}

.block-white {
	display: inline-block;
	border: none;
	background-color: #white;
	text-align: center;
	padding: 0.5em 0.8em 0.5em 0.8em;
	border-radius: 7px;
	font-weight: 600;
	color: #515151;
	font-size: 20px;
	margin: 0 3px;
}

.simple-schedule-box {
	width: 100%;
	height: 90px;
	border-radius: 15px 15px 15px 15px;
	border-style: solid;
	border-width: 2px 2px 2px 2px;
	border-color: #EFEFEF;
	margin: 15px 0 15px;
}

.simple-date-box {
	width: 100%;
	display: flex;
	padding: 10px;
}

.simple-friday {
	width: 70px;
	height: 70px;
	border-radius: 30%;
	border-style: solid;
	border-width: 6px 6px 6px 6px;
	border-color: #89E3E3;
}

.simple-monday {
	width: 70px;
	height: 70px;
	border-radius: 30%;
	border-style: solid;
	border-width: 6px 6px 6px 6px;
	border-color: #FFCF97;
}

.simple-sunday {
	width: 70px;
	height: 70px;
	border-radius: 30%;
	border-style: solid;
	border-width: 6px 6px 6px 6px;
	border-color: #D4BAFF;
}

.simple-thursday {
	width: 70px;
	height: 70px;
	border-radius: 30%;
	border-style: solid;
	border-width: 6px 6px 6px 6px;
	border-color: #FFA6E1;
}

.simple-day {
	height: 20px;
	font-size: 13px;
	font-weight: 700;
	text-align: center;
	color: #3D3D3D;
	position: relative;
	top: 5px;
}

.simple-number-day {
	height: 50px;
	font-size: 28px;
	font-weight: 800;
	text-align: center;
	color: #3D3D3D;
	margin-top: -5;
}

.simple-when, .simple-where {
	width: 200px;
	height: 35px;
	font-size: 18px;
	font-weight: 400;
	margin: 0px 15px;
	color: #3D3D3D;
	line-height: 35px;
}

.fa-calendar, .fa-location-dot {
	font-size: 20px;
	color: #3D3D3D
}

.schedule-box-assorted {
	height: 600px;
	border-radius: 5%;
	border-style: solid;
	border-width: 2px 2px 2px 2px;
	border-color: #E8E8E8;
}
</style>
<meta charset='utf-8' />

    <script>
        $(function () {
            var calendarEl = $('#calendar1')[0];

            var calendar = new FullCalendar.Calendar(calendarEl, {
            	rerenderDelay: 450,
                initialView: 'dayGridMonth', //캘린더 화면
                
                headerToolbar: {
                    left: 'prev',
                    center: 'title',
                    right: 'next'
                },


                themeSystem: 'bootstrap5',
                selectable: true, // 날짜 선택
                locale: 'ko', // 한국어 설정
                // navLinks: true, // 날짜 선택하면 해당 날짜 화면
                editable: true, // 수정 가능 여부
                
                
                
                events: [
                    

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
			<div class = "col-3">
				 <jsp:include page="/WEB-INF/views/template/dang_side_profile.jsp"></jsp:include>
			</div>
			<!-- 프로필 박스 끝-->


				<div class="col-6" style="background: white">
				
					<div class="monthly-calendar row">
					
						<div id='calendar1' class="calendar"></div>

						<div class="place-info">
							<div class="place-map"></div>

							<div class="dang-title">
								<div class="block">모임제목</div>
								<div class="block-white">목욕댕모임</div>
							</div>

							<div class="dang-time">
								<div class="block">모임시간</div>
								<div class="block-white">1월 13일 (금) 14:00 ~ 16:00</div>
							</div>

							<div class="dang-location">
								<div class="block">모임장소</div>
								<div class="block-white">신촌 댕목욕집</div>
							</div>


						</div>

					</div>
					
				</div>


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