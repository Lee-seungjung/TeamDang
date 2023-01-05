<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

    <!-- Bootstrap CSS -->
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    
    <link rel="stylesheet" type="text/css" 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="댕모임 일정" name="title"/>
</jsp:include>
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

.calendar{
	width: 100%;
	height : 500px;
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

/* .add-schedule{
	width : 1000px;
	height : 400px;
	text-align: center;
	margin: 60px 10px;

} */

.add-btn{
 width: 140px;
 color: white;
 font-size: 18px;
 font-weight: bold;
 height: 50px;
 margin: 20px;
 background-color: 76BEFF;
}

.upcoming{
 font-size: 24px;
 font-weight: bold;
}

.place-info{
    height: 700px;
/*     background-color: blue; */
    flex-direction: row;
}

.place-map{
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

.block-white{
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

.simple-when, .simple-where{
    width: 200px;
    height: 35px;
    font-size: 18px;
    font-weight: 400;
    margin: 0px 15px;
    color: #3D3D3D;
    line-height: 35px;
 
}

.fa-calendar, .fa-location-dot{
    font-size: 20px;
    color: #3D3D3D

}


.schedule-box-assorted{
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
        var calendarEl = $('#calendar')[0];
        var staff; // 직원 객체를 저장할 변수
        var patient; // 환자 객체를 저장할 변수
        var patientNo; // 환자 번호를 저장할 변수
        var reservation; // 전체 예약 객체를 저장할 변수
        var reservationDate; // 하루 예약 객체를 저장할 변수
        var reservationNo; // 삭제를 위해 예약 번호 저장할 변수
        var date;
        $.ajax({ // 장소 출력
            url: "http://localhost:8888/rest/dang_place/list",
            method: "get",
            success: function (resp) {
                if (resp != null) {
                    staff = resp;
                    for (var i = 0; i < staff.length; i++) {
                        // console.log(staff[i].staffDepartmentNo);
                        // console.log(staff[i].staffId);
                        if (staff[i].staffDepartmentNo == 1) {
                            // 예약 날짜와 직원 번호로 예약자 3명 이상인지 확인
                            $(".doctor-reservation-select").append($("<option>").append(staff[i].staffMedicalDepartment + "-" + staff[i].staffName).addClass("reservation-option").val(staff[i].staffId));
                        }
                    }
                } else {
                    console.log("실패");
                }
            }
        });
        $.ajax({ // 환자 출력
            url: "http://localhost:8888/rest/patient",
            method: "get",
            success: function (resp) {
                if (resp != null) {
                    patient = resp;
                } else {
                    console.log("실패");
                }
            }
        });
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth', //캘린더 화면
            headerToolbar: {
                left: 'prev',
                center: 'title',
                right: 'next'
            },
            dateClick: function (info) { //날짜 클릭 시
                // console.log('Date: ' + info.dateStr);
                date = info.dateStr;
                $("#modal01").modal("show"); //모달 도출
                $(".modal-date").val(date); // 날짜 삽입
                $.ajax({ // 해당 날짜의 예약 목록 불러오기
                    url:"http://localhost:8888/rest/reservation/"+date,
                    method:"get",
                    success:function(resp){
                        if(resp != null){
                            reservationDate = resp;
                        }
                    }
                });
                $("#time-reservation").text(" ");
                $(".symptom-modal-textarea").val(""); // 텍스트창 초기화
                // console.log(staff);
                $(".doctor-reservation-select").val($(".select-option").val()); // 의사 선택 초기화
                $(".modal-patient").val(""); // 환자 텍스트창 초기화
                for (var i = 0; i < $("[name=time]").length; i++) { // 시간 선택 아이콘 초기화
                    $("[name=time]").prev().removeClass("radio-time-color");
                    // console.log($(this).prev());
                };
                $("[name=time]").each(function () {
                    $(this).parent().removeClass("disabled-button");
                });
                $("[name=time]").prop('checked', false); // 시간 선택 라디오 버튼 체크 해제
            },
            eventClick: function (event) { //이벤트 클릭 시
                $("#modal02").modal("show"); //모달 도출
                $.ajax({
                    url:"http://localhost:8888/rest/schedule/detail/"+event.event.id,
                    method:"get",
                    success:function(resp){
                        if(resp != null){
                            reservationNo = event.event.id;
                            $("#doctor-name-confirm").val(resp.reservationStaffId);
                            $("#reservation-date-confirm").val(resp.reservationDate);
                            $("#reservation-time-confirm").val(resp.reservationTime);
                            $("#reservation-patient-confirm").val(resp.reservationPatientNo);
                            $("#reservation-content-confirm").val(resp.reservationContent);
                        }
                        else{
                            console.log("실패");
                        }
                    }
                });
            },
            themeSystem: 'bootstrap5',
            selectable: true, // 날짜 선택
            locale: 'ko', // 한국어 설정
            // navLinks: true, // 날짜 선택하면 해당 날짜 화면
            editable: true, // 수정 가능 여부
            
            events: [
                // 하루에 예약이 3개 이상이면 예약 n건으로 출력
                $.ajax({
                    url: "http://localhost:8888/rest/reservation",
                    method: "get",
                    success: function (resp) {
                        if (resp != null) {
                            // console.log(resp);
                            reservation = resp;
                            for(var i = 0; i < reservation.length; i++){
                                calendar.addEvent({
                                    title: reservation[i]['reservationStaffId'],
                                    start: reservation[i]['reservationDate']+'T'+reservation[i]['reservationTime'],
                                    id : reservation[i]['reservationNo']
                                })
                            }
                        } else {
                            console.log("실패");
                        }
                    }
                })
            ]
        });
        calendar.render();
        $(".doctor-reservation-select").change(function () {
            // 여기에 해당 의사가 예약이 몇개인지 그리고 시간때를 불러온다
            // 3개 이하일 때 예약된 시간을 비활성화 시키고 출력
            // 현재 날짜와 직원아이디로 리스트 뽑아서 시간 비교
            // 시간과 라디오 버튼 벨류 값이랑 비교해서 같은 건 히든으로 숨기기
            // console.log($(".doctor-reservation-select").val());
            $("#time-reservation").text(" ");
            $("[name=time]").prop('checked', false); // 시간 선택 라디오 버튼 체크 해제
            $("[name=time]").each(function () {
                $(this).parent().removeClass("disabled-button");
            });
            $.ajax({
                url: "http://localhost:8888/rest/reservation/vo?reservationStaffId=" + $(".doctor-reservation-select").val() + "&reservationDate=" + date,
                method: "get",
                success: function (resp) {
                    if (resp != 0) {
                        if (resp.length < 3) {
                            for (var i = 0; i < resp.length; i++) {
                                // console.log(resp[i].reservationTime);
                                $("[name=time]").each(function () {
                                    // console.log($(this).val());
                                    if ($(this).val() == resp[i].reservationTime) {
                                        $(this).parent().addClass("disabled-button");
                                    }
                                });
                            }
                        } else if (resp.length >= 3) {
                            $("[name=time]").each(function () {
                                $(this).parent().addClass("disabled-button");
                                $("#time-reservation").text("예약이 다찼습니다.");
                            });
                        }
                    }
                }
            });
        });
        $(".modal-patient").blur(function () {
            var patientJudg;
            var patientOne;
            for(var i = 0; i < patient.length; i++){
                patientJudg = $(".modal-patient").val() == patient[i].patientName;
                if(patientJudg){
                    // console.log($(".modal-patient").val());
                    patientOne = patient[i];
                    break;
                }
            }
            // console.log(patientJudg);
            if (patientOne != null) {
                // console.log(patientOne.patientNo); //인풋 히든으로
                patientNo = patientOne.patientNo;
            }
        });
        $("[name=time]").change(function () {
            for (var i = 0; i < $("[name=time]").length; i++) {
                $("[name=time]").prev().removeClass("radio-time-color");
                // console.log($(this).prev());
            };
            $(this).prev().addClass("radio-time-color");
        });
        $(".btn-reservation-delete").click(function () {
            console.log(reservationNo);
            $.ajax({
                url: "http://localhost:8888/rest/reservation/" + reservationNo,
                method: "delete",
                success: function () {
                    console.log("삭제완료");
                    $('#modal01').modal('hide');
                    location.reload();
                }
            });
        });
        $(".btn-reservation").click(function () {
            var data = {
                reservationStaffId:$(".doctor-reservation-select").val(),
                reservationPatientNo : patientNo,
                reservationDate : $(".modal-date").val(),
                reservationContent:$(".symptom-modal-textarea").val(),
                reservationTime:$("[name=time]:checked").val()
            };
            // console.log($(".doctor-reservation-select").val());
            // console.log(patientNo);
            // console.log($(".modal-date").val());
            // console.log($(".symptom-modal-textarea").val());
            // console.log($("[name=time]:checked").val());
            $.ajax({
                url:"http://localhost:8888/rest/reservation",
                method:"post",
                contentType:"application/json",
                data:JSON.stringify(data),
                success:function(){
                    console.log("성공");
                    $('#modal01').modal('hide');
                    location.reload();
                }
            });
        });
    });

    </script>
</head>

<body>
<div class = "container-fluid">

	<div class = "col-10 offset-1">
		<div class = "row">
			<!-- 프로필 박스 시작-->
			<div class = "col-3">
				<jsp:include page="/WEB-INF/views/template/dang_side_profile.jsp"></jsp:include>
			</div>
			<!-- 프로필 박스 끝-->
			<div class = "col-6" style="background: white">				
			    <div class="monthly-calendar row">					
	             <div id='calendar' class="calendar"></div>

                 <div class = "place-info">    

                    <div class = "place-map">

                    </div>        

                    <div class = "dang-title">
                        <div class="block">모임제목</div>
                        <div class="block-white">목욕댕모임</div>
                    </div>    

                    <div class = "dang-time">
                        <div class="block">모임시간</div>
                        <div class="block-white">1월 13일 (금) 14:00 ~ 16:00</div>
                    </div>      
                                     
                    <div class = "dang-location">
                        <div class="block">모임장소</div>
                        <div class="block-white">신촌 댕목욕집</div>
                    </div>                       
                    

                 </div>

	         </div>		
	        </div>		


			<!-- 다가오는 일정 박스 시작-->
			<div class = "col-3">
				<jsp:include page="/WEB-INF/views/template/dang_side_upcoming.jsp"></jsp:include>
			</div>
			<!-- 다가오는 일정 박스  끝-->
		</div>
	</div>

</div>
</body>
</html>