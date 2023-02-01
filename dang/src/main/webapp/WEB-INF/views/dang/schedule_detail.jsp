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
    background-color: #E0E0E0;
    text-align: center;
    border-radius: 10px;
    color: white;
    font-size: 18px;
    font-weight: 600;
    height: 50px;
    width: 120px;
	margin: 25px auto;
}
.btn-edit{
    display: block;
    line-height: 50px;
    border: none;
    background-color: #E0E0E0;
    text-align: center;
    border-radius: 10px;
    color: white;
    font-size: 18px;
    font-weight: 600;
    height: 50px;
    width: 120px;
	margin: 25px auto;
}
.btn-delete, .btn-end{
    display: block;
    line-height: 50px;
    border: none;
    background-color: #E0E0E0;
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
                        <div class="block-white detail-content">${scheduleDetail.scheduleContent}</div>
                    </div>    

                    <div class = "info-commons dang-leader">
                        <div class="block">모임 리더</div>
                        <div class="block-white">${scheduleDetail.memberNick}</div>
                    </div>

                    <div class = "info-commons dang-when">
                        <div class="block">모임 시간</div>
                        <div class="block-white schedule-time">                        
                        	<fmt:parseDate value="${scheduleDetail.scheduleStart}" var="dateValue" pattern="yyyy-MM-dd"/>
                        	<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/> 
                       		<span class="span-dang-hour"> ${scheduleDetail.scheduleHour}</span>
                        </div>
                    </div>   
                    
                    <div class = "info-commons dang-where">
                        <div class="block">모임 장소</div> 
                        <div class="detail-place block-white ">${scheduleDetail.placeName}</div>
                    </div>
               
                        <div class = "dang-place-map"><div id="map" style="width:100%;height:100%;"></div></div>
                     
                    <div class = "info-commons dang-number">
                        <div class="block detail-maxhead">참여 인원</div>
                        <div class="detail-head block-white ">${countJoin}명 / ${scheduleDetail.scheduleHeadMax}명</div>
                    </div>      
                    
                    <div class = "info-commons dang-who">
                    
                        <div class="block">참여 멤버</div>                        
                        <div class="block-white">
                        <c:forEach var="JoinMemberVO" items="${joinMemberList}">
                         <img title="${JoinMemberVO.memberNick}" class="member-profile-hover img-circle" src="${pageContext.request.contextPath}/rest_attachment/download/${JoinMemberVO.attachmentNo}" width="45px" height="45px">
                        </c:forEach>
                        </div>
                    </div>   
                    
                    <div class = "info-commons dang-money">
                        <div class="block">참여 회비</div>
                        <div class="detail-money block-white ">${scheduleDetail.scheduleMoney}원</div>
                    </div>    
					
					<div class="btn-box btn-join">				
                     <button type="submit" class="btn-plus">참여</button>
                     <button type="submit" class="btn-minus">참여취소</button>
                     <button type="submit" class="btn-edit editSchedule cursor-pointer" data-bs-toggle="modal" data-bs-target="#scheduleEditModal">수정</button>
                     <button type="submit" class="btn-delete">삭제</button>
                     <button type="submit" class="btn-end">참여마감</button>
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
		
		
		    <!-- 댕모임 일정 수정 모달 -->
    <div class="modal fade" id="scheduleEditModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">댕모임 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
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

                                <p><input type="date" value="${sysdate}" class="when-date inbl w-50 b-contentbox form-control" name="scheduleStart"><input type="time" class="when-time inbl w-50 b-contentbox form-control" value="10:00" min="00:00"
                                        max="24:00"  name="scheduleHour"></p>

                        </div>

                        <div class="mb-3 text-start">
                        <div>
                            <label for="message-text" class="col-form-label ms-2 me-1">댕모임 장소 찾기</label>
                            <i class="fa-solid fa-asterisk text-danger"></i>
                            </div>
                            <div class="where form-control" ></div>                       
                            <div class="dang-schedule-map">
                                <div id="mapwrap">
                                    <!-- 지도가 표시될 div -->
                                    <div id="map2" style="width: 100%; height: 350px;"></div>
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
                                                            <select style="color: #757575;" name="scheduleHeadmax" class="persons rounded pb-1 ps-1  inbl w-50 b-contentbox form-content">
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
                        <button type="button" class="btn btn-primary edit-btn">수정</button>
                    </div>

            </div>
        </div>
    </div>
        <!-- 댕모임 일정 수정 모달 끝 -->
        
         <!-- 댕모임 일정 장소 수정 모달 시작-->
    <div class="modal fade" id="editPlaceModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                    <button type="button" class="btn btn-edit-place">수정하기</button>
                </div>
            </div>
        </div>
    </div>
      <!-- 댕모임 일정 장소 모달 끝-->

	</div>

	<!-- 카카오 맵 API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b9a95746698992180eedc27d9eef265"></script>

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
	       
	 		//장소 등록버튼 클릭시 모달 장소에 장소명 삽입
			$(".btn-placeurl").click(function(){
				$(".span-placeurl").text();			
				var placeUrl = $(".span-placeurl").text();			
				window.location.href=placeUrl;			
			});
	 		
			
			$(".btn-plus").hide(); //참여
			$(".btn-minus").hide(); //참여취소
			$(".btn-edit").hide(); //일정수정
			$(".btn-delete").hide(); //일정삭제
			$(".btn-end").hide(); //일정 인원수 마감
			
			//개설자라면(로그인 멤버번호가 개설자 멤버번호와 일치하면)
			if(${profile.memberNo} == ${scheduleDetail.memberNo}){		
				//수정, 삭제버튼 보여주기
				$(".btn-edit").show();
				$(".btn-delete").show();											
			}
			//개설자가 아니라면(로그인 멤버번호가 개설자 멤버번호와 불일치하면)
			else{
				//해당 스케줄 번호의 일정 참여한 멤버번호 가 맞는지 확인위해 ajax 호출
				$.ajax({
                       url : "http://localhost:8888/rest/dangSchedule/schedule_memberCheck?scheduleNo="+${scheduleDetail.scheduleNo}+"&memberNo="+${profile.memberNo},
                       method : "get",
                       async : false,
                       contentType : "application/json",
                       success : function(resp) {
                       	//console.log(resp.length);
                       	//${countJoin}명(참여인원) / ${scheduleDetail.scheduleHeadMax}명(최대참여인원)
                       	//일정상세에서 참여인원인 마감되었는지?
                       	if(${countJoin} >= ${scheduleDetail.scheduleHeadMax}){
                       		//참여된 멤버가 아니라면
                       		if(resp.length == 0){
                       			$(".btn-end").show();	                        			
                       		} 
                       		//참여된 멤버라면
                       		else{
                       			$(".btn-minus").show();                        			
                       		}
                       	}
                       	//일정상세에서 참여인원이 남아있는지?
                       	else{
                       		console.log("마감안했음");
                       		//참여된 멤버가 아니라면
                       		if(resp.length == 0){
                       			console.log("마감안했는데 참여안했음");
                       			$(".btn-plus").show();	 
                       		}
                       		//참여된 멤버라면
                       		else{
                       			console.log("마감안했는데 참여했음");
                       			$(".btn-minus").show();
                       		}
                       	}
                       }
                                            
				});
				
			}
		
			//댕모임 일정 등록한 멤버가 아닌 다른 멤버들의 일정상세화면(참여하기,참여취소)
			
			//상세일정에서 참여하기 클릭
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
                   			console.log("참여취소 보여야함");
                          }
  					});
                  });
                  //상세일정에서 참여취소 클릭
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
                          	console.log("참여버튼 보여야함");
                          	 
                          	$(".btn-plus").show();
                          	location.href="http://localhost:8888/dang/"+${dangNo}+"/schedule_detail?scheduleNo="+${scheduleDetail.scheduleNo};
                                    
                          }
  					});                   	
                  }); 					
		});
		//상세일정에서 수정버튼 클릭
		//수정 클릭하면 모달 열림
		$(".btn-edit").click(function(e){
			console.log("수정버튼누름");
			
			 $("#editPlaceModal").modal("hide");//모달 숨기기
			 
				console.log(${profile.memberNo});

				});
			 

                    
				 placeNoInfo = $(this).data("placeno");
			 
                  //비동기통신 시작
                   $.ajax({
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
                       
   		            //일정수정 모달에서 수정 버튼 클릭
   		            $(".edit-btn").click(function(e){
   		               console.log(${profile.memberNo});
   		               
   		               console.log("내용수정하고 수정버튼 클릭");
   		               
	    	
	    					var scheduleTitle = $("[name=scheduleTitle]").val();
	    					var scheduleContent =$("[name=scheduleContent]").val();
	    					var scheduleStart = $("[name=scheduleStart]").val();
	    					var scheduleHour = $("[name=scheduleHour]").val();
	    					var placeNo = $(".where").attr('data-placeno');
	    					var scheduleHeadmax = $("[name=scheduleHeadmax]").val();
	    					var scheduleMoney = $("[name=scheduleMoney]").val();
	    					saveData(scheduleTitle, scheduleContent, scheduleStart, scheduleHour, placeNo, scheduleHeadmax, scheduleMoney); 
	    					
	    			        	$(window).on("beforeunload", function(){
	    			        		removescheduleTitle();
	    						});
   		               

   				//일정등록 모달에서 취소 버튼 클릭시 일정등록 모달 닫기 및 내용초기화
   						$(document).on("click",".edit-cancel",function(){
   							console.log("(수정)취소버튼클릭");
   							$(".schedule-name").val(""); //일정 제목
   							$(".write-content").val(""); //일정 내용
   							$(".when-date ").val(""); //일정 날짜
   							$(".when-time").val(""); //일정 시간		
   							$(".where").val(""); //장소
   							$("#persons").prop("selected", true);//최대 참여인원							
   							$(".money").val(""); //회비 

   				});

		
				//일정 수정 함수
				function saveData(scheduleTitle, scheduleContent, scheduleStart, 
						scheduleHour, placeNo, scheduleHeadmax, scheduleMoney){
					var data = {
							scheduleTitle: scheduleTitle,
							scheduleContent: scheduleContent,
							scheduleStart: scheduleStart,
							scheduleHour: scheduleHour,
							placeNo: placeNo,
							scheduleHeadmax: scheduleHeadmax,
							scheduleMoney: scheduleMoney
					};

					var result = confirm("일정을 수정하시겠습니까?");
					
					if(result ==true){
						$.ajax({
							url:"http://localhost:8888/rest/dangSchedule/schedule_edit",
							method:"put",
							contentType:"application/json",
							data:JSON.stringify(data),
							success:function(resp){
								console.log("일정 수정 성공");	
								
								location.href='http://localhost:8888/dang/'+${dangNo}+'/schedule_detail?scheduleNo='+resp;
								
								//var placeNo = $(".schedule-where").attr('data-placeno');
							}
						});
						alert("일정 수정이 완료되었습니다.")
					}
					else {
						alert("일정 수정이 취소되었습니다.")
						//적혀진 값들 지우기
						
					}
				}
		
   		            });
			
		//상세일정에서 삭제버튼 클릭
		$(".btn-delete").click(function(){
	
			console.log("삭제버튼누름");
			
			var result = confirm("일정을 삭제하시겠습니까?")
			if(result==true){
			$.ajax({
				url : "http://localhost:8888/rest/dangSchedule/schedule_delete?scheduleNo="+${scheduleDetail.scheduleNo}+"&memberNo="+${scheduleDetail.memberNo},
				method: "delete",
				async: false,
				contentTyep : "application/json",
				success: function(resp) {
					
					console.log("일정 삭제 성공");
					window.confirm("일정이 삭제되었습니다");
					
					location.href="http://localhost:8888/dang/"+${dangNo}+"/calendar"
				}

			});	
			
			}
			else{
				alert("일정  삭제가 취소되었습니다.");
			}
			
		});	
		
		// 맵가져오기
        var placeNoInfo; //장소번호를 가져오는 변수
        var placeContents = []; // 장소번호를 가져와 내용을 담는 변수
        var placeOriginNo; // 클릭한 마커의 데이터장소번호를 뽑아내는 변수
     
		$(".btn-edit-place").click(function(){			
			var placeWhere = $(".span-placename").text();	
			//장소번호로 장소데이터 불러오기(테스트)
			$(".where").attr("data-placeno", placeNoInfo);
			
			$(".where").text(placeWhere);
			
			$("#editPlaceModal").modal("hide");
			
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
        $(document).on("click",".editPlace",function (e) {
                    $("#editPlaceModal").modal("show");//모달 실행
                    placeNoInfo = $(this).data("placeno");
                    //비동기통신 시작
                    $.ajax({
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
        var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div  
            mapOption2 = {
                center: new kakao.maps.LatLng(37.498004414546934,
                    127.02770621963765), // 지도의 중심좌표 
                
                // 지도의 확대 레벨 
            };
        var map2 = new kakao.maps.Map(mapContainer2, mapOption2); // 지도를 생성합니다
        setTimeout(function() {
            map2.relayout();
            map2.setCenter(new kakao.maps.LatLng(37.498004414546934,  127.02770621963765));
            // map.setLevel(2); 필요하면 레벨조정
        },100);
        setTimeout(function(){ map2.relayout(); }, 0); 
      
       $('#scheduleEditModal').on('shown.bs.modal', function (e) {
        map2.relayout();
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
                    	parkPositions.push(new kakao.maps.LatLng(
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
                                        + '  <a class="editPlace" data-placeno=' + contentCafe[i].placeNo + ' target="_blank">'
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
                                    map: map2,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(map2);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        console.log(placeOriginNo);
        // 카페 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setCafeMarkers(map2) {
            for (var i = 0; i < cafeMarkers.length; i++) {
                cafeMarkers[i].setMap(map2);
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
                                        + '  <a class="editPlace" data-placeno=' + contentFood[i].placeNo + ' target="_blank">'
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
                                    map: map2,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(map2);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        // 음식점 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setFoodMarkers(map2) {
            for (var i = 0; i < foodMarkers.length; i++) {
                foodMarkers[i].setMap(map2);
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
                                        + '  <a class="editPlace" data-placeno=' + contentField[i].placeNo + ' target="_blank">'
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
                                    map: map2,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(map2);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        // 운동장 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setFieldMarkers(map2) {
            for (var i = 0; i < fieldMarkers.length; i++) {
                fieldMarkers[i].setMap(map2);
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
                                        + '  <a class="editPlace" data-placeno=' + contentDogsalon[i].placeNo + ' target="_blank">'
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
                                    map: map2,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(map2);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        // 미용 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setDogsalonMarkers(map2) {
            for (var i = 0; i < dogsalonMarkers.length; i++) {
                dogsalonMarkers[i].setMap(map2);
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
                                        + '  <a class="editPlace" data-placeno=' + contentPark[i].placeNo + ' target="_blank">'
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
                                    map: map2,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(map2);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        // 공원 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setParkMarkers(map) {
            for (var i = 0; i < parkMarkers.length; i++) {
                parkMarkers[i].setMap(map2);
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
                setCafeMarkers(map2);
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
                setFoodMarkers(map2);
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
                setFieldMarkers(map2);
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
                setDogsalonMarkers(map2);
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
                setParkMarkers(map2);
            }
        }
		
		//스케줄 상세관련 카카오맵 출력
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
		        level: 4 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		var imageSrc = '${pageContext.request.contextPath}/images/markerLogo.png', // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(30, 30), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(15, 30)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new kakao.maps.LatLng(placeX, placeY); // 마커가 표시될 위치입니다
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		  position: markerPosition,
		  image: markerImage // 마커이미지 설정 
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);  
		
		
		
		
		

	</script>
</body>
</html>