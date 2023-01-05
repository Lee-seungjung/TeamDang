<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
.day-commons{
	width: 70px;
	height: 70px;
	border-radius: 30%;
	border-style: solid;
	border-width: 6px 6px 6px 6px;
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
	
</script>
</head>

<body>
	<%-- 댕모임 다가오는 일정 박스 --%>
	<!-- 다가오는 일정 박스 시작-->
	<div class="col">
		<div class="p-3 schedule-box-assorted  shadow">

			<div class="schedule-wrap">
				<div class="row justify-content-center mb-3">
					<span class="text-center upcoming"> 다가오는 댕모임<i class="fa-solid fa-paw"></i></span>
				</div>

			<c:forEach var="DangScheduleVO" items="${simpleSchedule}">
				<div class="simple-schedule-box">
					<div class="simple-date-box">
						
						<div class="day-commons" style="
						<c:if test = "${DangScheduleVO.day == '월요일'}">border-color:#FF8399;</c:if>
						<c:if test = "${DangScheduleVO.day == '화요일'}">border-color:#FFC28B;</c:if>
						<c:if test = "${DangScheduleVO.day == '수요일'}">border-color:#FFA6E1;</c:if>
						<c:if test = "${DangScheduleVO.day == '목요일'}">border-color:#89E3B8;</c:if>
						<c:if test = "${DangScheduleVO.day == '금요일'}">border-color:#89E3E3;</c:if>
						<c:if test = "${DangScheduleVO.day == '토요일'}">border-color:#94D2FF;</c:if>
						<c:if test = "${DangScheduleVO.day == '일요일'}">border-color:#BE9FFF;</c:if>
						">			
							<div class="simple-day">${DangScheduleVO.day}</div>
							<div class="simple-number-day">${DangScheduleVO.dayNo}</div>
						</div>
						<div class="when-where-box">
							<div class="simple-when">
								<i class="fa-regular fa-calendar"></i> ${DangScheduleVO.scheduleStart}
							</div>
							<div class="simple-where">
								<i class="fa-solid fa-location-dot"></i> ${DangScheduleVO.placeName}
							</div>
						</div>
					</div>
				</div>
				</c:forEach>


			</div>
		</div>
	</div>
	<!-- 다가오는 일정 박스  끝-->

</body>
</html>