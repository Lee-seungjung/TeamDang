<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
    margin: 0 0 30px auto;
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
    height: 780px;
    border-radius: 10px;
    margin: auto;
}
.dang-place-map{
    display: block;
    margin: auto;
    width: 85%;
    height: 200px;
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
    margin: 10px auto;
    width: 85%;
    height: 50px;
    background-color: white;
    border-radius: 10px;
    display: flex;
    flex-direction: row;
}
.block {
    display: block;
    line-height: 50px;
    border: none;
    background-color: #76BEFF;
    text-align: center;
    border-radius: 10px;
    color: white;
    font-size: 18px;
    font-weight: 600;
    height: 50px;
    width: 120px;
}
.block-white{
    display: block;
    line-height: 50px;
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
.btn-plus{
    display: block;
    line-height: 50px;
    border: none;
    background-color: #76BEFF;
    text-align: center;
    border-radius: 10px;
    color: white;
    font-size: 18px;
    font-weight: 600;
    height: 50px;
    width: 120px;
     margin: 25px auto;
}
.btn-minus{
    display: block;
    line-height: 50px;
    border: none;
    background-color: #F94888;
    text-align: center;
    border-radius: 10px;
    color: white;
    font-size: 18px;
    font-weight: 600;
    height: 50px;
    width: 120px;
	margin: 25px auto;
}
.red-pin{
    height: 100px;
    width: 120px;
    position: absolute;
    left: 5px;
    top: 10px;
}

.btn-back{
    border: lightgray;
    background-color: #DBDBDB;
}

.btn-common{
    display:block;
    text-align: center;
    padding: 0.5em 0.7em 0.5em 0.7em;
    border-radius: 10px;
    color: white;
    font-size: 20px;
    font-weight: 600;
    height: 50px;
    width: 180px;
    text-align: center;
    margin: 20px 10px;
}

.btn-box{
	display: flex;
	flex-direction: row;
	justify-content: center;
}

.member-profile-hover:hover{
border : 2px solid #76BEFF;

}

    </style>
<meta charset='utf-8' />

<script>
		
	
</script>
</head>

<body>
	<div class="container-fluid  mt-3">

		<div class="col-8 offset-2">
			<div class="row">
				<!-- 프로필 박스 시작-->
				 <div class="col-3">
					<jsp:include page="/WEB-INF/views/template/dang_side_profile.jsp"></jsp:include>
				</div> 
				<!-- 프로필 박스 끝-->

				<!-- 일정 상세박스 시작-->
			<div class = "col-6" style="background: white">				

                 <div id = "schedule-simple-modal" class = "schedule-info shadow1">  

                    <div class="dang-title"><img class="red-pin" src="${pageContext.request.contextPath}/images/red-pin.png">${scheduleDetail.scheduleTitle}</div>

                    <div class = "info-commons dang-content">
                        <div class="block">모임 내용</div>
                        <div class="block-white">${scheduleDetail.scheduleContent}</div>
                    </div>    

                    <div class = "info-commons dang-leader">
                        <div class="block">모임 리더</div>
                        <div class="block-white">${scheduleDetail.memberNick}</div>
                    </div>

                    <div class = "info-commons dang-when">
                        <div class="block">모임 시간</div>
                        <div class="block-white">
                        	<fmt:parseDate value="${scheduleDetail.scheduleStart}" var="dateValue" pattern="yyyy-MM-dd"/>
                        	<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>  ${scheduleDetail.scheduleHour}
                        </div>
                    </div>   
                    

                    
                    <div class = "info-commons dang-where">
                        <div class="block">모임 장소</div> 
                        <div class="block-white">${scheduleDetail.placeName}</div>
                    </div>
               
                        <div class = "dang-place-map"><div id="map" style="width:100%;height:100%;"></div></div>
                     
                    <div class = "info-commons dang-number">
                        <div class="block">참여 인원</div>
                        <div class="block-white">${countJoin}명 / ${scheduleDetail.scheduleHeadMax}명</div>
                    </div>      
                    
                    <div class = "info-commons dang-who">
                    
                        <div class="block">참여 멤버</div>                        
                        <div class="block-white">
                        <c:forEach var="JoinMemberVO" items="${joinMemberList}">
                         <img title="${JoinMemberVO.memberNick}" class="member-profile-hover img-circle" src="${pageContext.request.contextPath}/rest_attachment/download/${JoinMemberVO.attachmentNo}" width="45px" height="45px">
                        </c:forEach>
                        </div>
                    </div>   
					
					<div class="btn-box btn-join">
					
                     <button type="submit" class="btn-plus">참여하기</button>
                     <button type="submit" class="btn-minus">취소하기</button>
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

	<!-- 카카오 맵 API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b9a95746698992180eedc27d9eef265"></script>

				<script>
				
				$(function(){
					$(".btn-plus").hide();
					$(".btn-minus").hide();
					
					$.ajax({
                        url : "http://localhost:8888/rest/dangSchedule/schedule_memberCheck?scheduleNo="+${scheduleDetail.scheduleNo}+"&memberNo="+${scheduleDetail.memberNo},
                        method : "get",
                        async : false,
                        contentType : "application/json",
                        success : function(resp) {
                        	
                        	//console.log("성공"+resp.memberNo);
                        	//console.log("성공"+${scheduleDetail.scheduleNo});
                        	//console.log("성공"+${scheduleDetail.memberNo});
                        	 console.log("로그인 정보" + ${profile.memberNo});
                        	 var join= $(".btn	-join");
                        	 //join.empty();
        					 
	                        	for(var i=0;i<resp.length;i++){
	                        		
                     		if(resp[i].memberNo!=${profile.memberNo}){
                     		
                     			$(".btn-minus").hide();
                     			$(".btn-plus").show();
                        
                             
                     		}else{
                     			
                     			$(".btn-plus").hide();
                     			$(".btn-minus").show();
                     			
                             
                     		}
                     		
                     	}
                        
                        	
                        }
                        
                        
					});
					$(".btn-plus").click(function(){
                    	
                    	console.log("참여버튼누름");
    					$.ajax({
                            url : "http://localhost:8888/rest/dangSchedule/schedule_join?memberNo="+${profile.memberNo}+"&scheduleNo="+${scheduleDetail.scheduleNo},
                            method : "post",
                            async : false,
                            contentType : "application/json",
                            success : function(resp) {
                            	console.log("참여하기 성공");
                            	$(".btn-plus").hide();
                            	
                            	window.confirm("일정 참여가 완료되었습니다");
                            	

                     			location.href="http://localhost:8888/dang/"+${dangNo}+"/schedule_detail?scheduleNo="+${scheduleDetail.scheduleNo};
                     			$(".btn-minus").show();
                            }
    					});
                    });
                    
                    $(".btn-minus").click(function(){
                    
                    	console.log("취소버튼누름");
    					$.ajax({
                            url : "http://localhost:8888/rest/dangSchedule/schedule_cancel?memberNo="+${profile.memberNo}+"&scheduleNo="+${scheduleDetail.scheduleNo},
                            method : "delete",
                            async : false,
                            contentType : "application/json",
                            success : function(resp) {
                            	
                            	console.log("참여취소 성공");
                            	$(".btn-minus").hide();
                            	window.confirm("일정이 취소되었습니다");
                            	 
                            	$(".btn-plus").show();
                            	location.href="http://localhost:8888/dang/"+${dangNo}+"/schedule_detail?scheduleNo="+${scheduleDetail.scheduleNo};
                     
                            	
                            
                            }
    					});
                    	
                    });
					
				});
				
				
				
				var placeNo1 = ${scheduleDetail.placeNo};
				console.log(${countJoin});
				
                var placeX;
		        var placeY; 
				
				$.ajax({
                              url : "http://localhost:8888/rest_place/place_one/"+ placeNo1,
                              method : "get",
                              async : false,
                              contentType : "application/json",
                              success : function(resp) {
                                 console.log(resp)   
                                 
                                 placeX = resp.placeX 
                                 placeY = resp.placeY
                                 
                                 console.log(placeX);
                                 console.log(placeY);
                                 
                              }
                           })
                           

				           
				
					
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(placeX, placeY), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(placeX, placeY); 
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
				// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
				// marker.setMap(null);    
				</script>
</body>
</html>