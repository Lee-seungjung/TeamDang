<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
   <jsp:param value="댕모임 일정" name="title" />
</jsp:include>

<style>

* {
   
}

.layout {
   max-width: 1100px;
   margin: 30px auto;
   padding: 50px;
   display: flex;
   flex-wrap: wrap;
   flex-wrap: wrap gap: 1em;
}

.calendar {
   width: 100%;
   height: 500px;
   margin: 0 0 30px auto;
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
.upcoming {
   font-size: 24px;
   font-weight: bold;
   color: #454545;
}
.schedule-info {
   width: 95%;
   background-color: #E2EFFF;
   height: 820px;
   border-radius: 10px;
   margin: auto;
}
.dang-place-map {
   display: block;
   margin: auto;
   width: 85%;
   height: 250px;
   border-radius: 10px;
   background-color: white;
}
.dang-title {
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
.block-white {
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
.simple-when, .simple-where {
   width: 200px;
   height: 35px;
   font-size: 16px;
   margin: 0px 15px;
   color: #3D3D3D;
   line-height: 35px;
}
.detail-modal {
   background-color: #F0F9FF;
}
.btn-in {
   border: none;
   background-color: #76BEFF;
}
.red-pin {
   height: 100px;
   width: 120px;
   position: absolute;
   left: 5px;
   top: 10px;
}
.btn-back {
   border: lightgray;
   background-color: #DBDBDB;
}
.btn-common {
   display: block;
   text-align: center;
   padding: 0.5em 0.7em 0.5em 0.7em;
   border-radius: 10px;
   color: white;
   font-size: 20px;
   font-weight: 600;
   height: 50px;
   width: 180px;
   text-align: center;
   margin: 10px 20px;
}
.btn-box {
   display: flex;
   flex-direction: row;
   justify-content: center;
}
.btn-yellow {
   background-color: #FFEF9E;
   color: #3C5083
}


</style>

<script>
   
      document.addEventListener('DOMContentLoaded', function() {
          var calendarEl = document.getElementById('dangCalendar');   
          var dangNo = $(".input-dang-calendar-dang-no").val();
          console.log(dangNo);  
          var dangCalendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            
            headerToolbar : {
               left : 'prev',
               center : 'title',
               right : 'next'
            },
            themeSystem : 'bootstrap5',
            selectable : true, // 날짜 선택
            locale : 'ko', // 한국어 설정
            //navLinks: true, // 날짜 선택하면 해당 날짜 화면
            editable : false, // 수정 가능 여부
            nowIndicator: true, //현재 시간 마크
            minDate: moment().add(1, 'd').format("YYYY-MM-DD"), //과거 날짜는 예약 못하게
            
            events: [
                     $.ajax({
                        url:"http://localhost:8888/rest/dangSchedule/schedule?dangNo=" + dangNo,
                        method:"get",
                        success: function(resp) {
                                                                     
                        console.log(resp);
                           if(resp.length!=0){
                              for(var i=0;i<resp.length;i++){
                                 dangCalendar.addEvent({
                                    title: resp[i]['scheduleTitle'],
                                    start: resp[i]['scheduleStart'],
                                    allDay: true,
                                    id: resp[i]['scheduleNo']                             
                                 })
                              }
                           }
                        }
                     })
                  ],
                  
                  eventClick: function(arg) {
                     //console.log(arg.event);
                     var scheduleNo = arg.event.id;
                     var date = arg.event.start;
	                 var dangDate = moment(date).format('YYYY-MM-DD');
	                 $(".dangDate").text(dangDate);                  
                     
                     $.ajax({
                        url: 'http://localhost:8888/rest/dangSchedule/schedule_modal?scheduleNo=' +scheduleNo+ "&dangNo=" +dangNo,               
                        method: "get",
                        processDate: false,
                        contentType: false,
                        success:function(resp){
                           console.log(resp!=null);
                        var tbody = $(".ajax-content");
                        $(".ajax-content").empty();
                        if(resp!=null){
                              var tr =$("<tr>").attr("class","table-dafault align-middle");
                              var td1= $("<td>").text(resp.scheduleTitle);
                              var td2= $("<td>").text(resp.scheduleStart).text(resp.scheduleHour);
                              var td3= $("<td>").text(resp.placeName);
                              var td4= $("<td>");
                              var a = $("<a>").attr("href",
                                    'http://localhost:8888/dang/' +dangNo+ '/schedule_detail?scheduleNo='+scheduleNo,            
                                   ).attr("class","btn btn-yellow").text('상세');
                              
                                td4.append(a);
                                tr.append(td1).append(td2).append(td3).append(td4);
                                tbody.append(tr);               
                        }                 
                     } //resp문끝                        
                     });            
                  }         
          });
          dangCalendar.render();
        });

</script>

<script type="text/javascript">

   $(function(){
	   var dangNo = $(".input-dang-calendar-dang-no").val();
       console.log("dangNo : " + dangNo);      

      // 특정 날자의 일정 조회
      $(document).on("click", ".fc-daygrid-day", function(){
         if($(this).parents(".fc-media-screen").attr("id") == "dangCalendar") {
             //일정 제목 
            var daySchedule = $(this).find(".fc-sticky").text();
            
            //선택날짜 값 
            var dateSchedule = $(this).find(".fc-daygrid-day-frame").parent().attr("data-date");
            $(".dangDate").text(dateSchedule);  
            console.log("날짜 : " + dateSchedule);
             
            if(daySchedule == "") { //일정이 없는 경우
            	console.log("일정 없음");
            	
                var tbody = $(".ajax-content");
                $(".ajax-content").empty();
                
                var tr =  $("<tr>").attr("class","table-default align-middle");
                var td = $("<td>").attr("colspan","6").text('일정이 없습니다');
                tr.append(td);
                tbody.append(tr);       
            }
            else{ //일정이 있는 경우
            	console.log("일정 있음");
            	console.log("daySchedule : " + daySchedule);

                $.ajax({
                    url: 'http://localhost:8888/rest/dangSchedule/schedule_date?scheduleStart=' +dateSchedule+ "&dangNo=" +dangNo,               
                    method: "get",
                    processDate: false,
                    contentType: false,
                    success:function(resp){
                       console.log(resp!=null);
                       var scheduleNo = resp.scheduleNo
                       console.log("scheduleNo : " + scheduleNo);
                       var tbody = $(".ajax-content");
                       $(".ajax-content").empty();
                    if(resp!=null){
                          var tr =$("<tr>").attr("class","table-dafault align-middle");
                          var td1= $("<td>").text(resp.scheduleTitle);
                          var td2= $("<td>").text(resp.scheduleStart).text(resp.scheduleHour);
                          var td3= $("<td>").text(resp.placeName);
                          var td4= $("<td>");
                          var a = $("<a>").attr("href",
                                'http://localhost:8888/dang/' +dangNo+ '/schedule_detail?scheduleNo='+scheduleNo,            
                               ).attr("class","btn btn-yellow").text('상세');
                          
                            td4.append(a);
                            tr.append(td1).append(td2).append(td3).append(td4);
                            tbody.append(tr);               
                    }                    
                 } //resp문끝                        
                 });    

            }       
         }
      })
   });

</script>

<div class="container-fluid mt-3 mb-5">

   <div class="col-8 offset-2">
      <div class="row">
         <!-- 프로필 박스 시작-->
         <div class="col-3">
            <jsp:include page="/WEB-INF/views/template/dang_side_profile.jsp"></jsp:include>
         </div>
         <!-- 프로필 박스 끝-->

         <!-- 캘린더 박스 시작-->
         <div class="col-6" style="background: white">
            <div class="monthly-calendar">
               <div id='dangCalendar' class="calendar"></div>

               <div class="text-center">
                  <div class="text-center">
                     <span class="select-font">선택 날짜 : </span> <span
                        class=" dangDate select-font blue"></span>
                  </div>
                  <table class="table text-center">
                     <thead>
                        <tr class="align-middle schedule-table">
                           <th width="30%">모임 제목</th>
                           <th width="30%">모임 날짜</th>
                           <th width="20%">모임 장소</th>
                           <th >상세</th>
                        </tr>
                     </thead>
                     <tbody class="ajax-content">
                        <!-- 비동기화 목록 출력 -->
                     </tbody>
                  </table>
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

<input type = "hidden" class = "input-dang-calendar-dang-no" name = "dangNo" value= "${dangNo}">
<input type = "hidden" class = "input-schedule-no" name = "scheduleNo" value = "${scheduleDetail.scheduleNo}">