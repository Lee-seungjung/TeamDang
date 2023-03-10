<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval var="kakoMapKey" expression="@environment.getProperty('custom.kakaomap.key')" />
<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="댕모임 일정" name="title" />
</jsp:include>
<style>
	#mapwrap {
		position: relative;
		overflow: hidden;
	}
		
	.categoryUpdate, .categoryUpdate * {
		margin: 0;
		padding: 0;
		color: #000;
	} 
		
	.categoryUpdate {
		position: absolute;
		overflow: hidden;
		top: 10px;
		left: 10px;
		width: 300px;
		height: 60px;
		z-index: 10;
		border-radius: 10px;
		font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
		font-size: 12px;
		text-align: center;
		background-color: #fff;
	}
		
	.categoryUpdate .menu_selected {
		background: #76BEFF;
		color: #fff;
		margin: 0 -1px;
	}
		
	.categoryUpdate li {
		list-style: none;
		float: left;
		width: 60px;
		height: 60px;
		padding-top: 5px;
		cursor: pointer;
	}
		
	.categoryUpdate .ico_comm {
		display: block;
		margin: 0 auto 2px;
		width: 26px;
		height: 26px;
		background:
			url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png')
			no-repeat;
	}
		
	.categoryUpdate .ico_cafe {
		background-image: url("${pageContext.request.contextPath}/images/cafe-icon.png");
	}
	
	.categoryUpdate .ico_food {
		background-image: url("${pageContext.request.contextPath}/images/food-icon.png");
	}
	
	.categoryUpdate .ico_field {
		background-image: url("${pageContext.request.contextPath}/images/field-icon.png");
	}
	
	.categoryUpdate .ico_dogsalon {
		background-image: url("${pageContext.request.contextPath}/images/salon-icon.png");
	}
	
	.categoryUpdate .ico_park {
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
		background: #d95050
			url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
			no-repeat right 14px center;
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
	
	.layout {
		max-width: 1100px;
		margin: 30px auto;
		padding: 50px;
		display: flex;
		flex-wrap: wrap;
		flex-wrap: wrap gap: 1em;
	}
	
	.monthly-calendar {
		height : 1500px;
	} 
	
	.calendar {
		width: 100%;
		height : 500px;
	    margin: 0 0 30px auto;
	}
	
	.calendar-info {
		width: 350px;
		height : 450px;
		background-color: #FAFAFA;
		text-align: center;
	}
	
	.more-info {
		width : 1100px;
		height : 400px;
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
	    height: 780px;
	    border-radius: 10px;
	    margin: auto;
	}
	
	.dang-place-map {
	    display: block;
	    margin: auto;
	    width: 85%;
	    height: 200px;
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
	    margin: 10px auto;
	    width: 85%;
	    height: 40px;
	    background-color: white;
	    border-radius: 10px;
	    display: flex;
	    flex-direction: row;
	}

	.info-content {
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
	
	.block-content {
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
	
	.block-white-content {
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
	    overflow: scroll;
	    overflow-x:hidden; 
	    overflow-y:auto;
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
	
	.btn-plus {
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
	
	.btn-minus {
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
	
	.btn-edit {
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
	
	.btn-delete, 
	.btn-finish {
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
	.btn-box {
		display: flex;
		flex-direction: row;
		justify-content: center;
	}
	.member-profile-hover:hover {
		border : 2px solid #76BEFF;
	}
	
	.strong-modal-schedule-edit {
		font-size : 24px;
	}
	
	.schedule-name {
		font-size : 24px;
	}
</style>
<div class="container-fluid mt-3 mb-5">
	<div class="col-8 offset-2">
		<div class="row">
			
			<div class="col-3"> <!-- 프로필 박스 시작-->
				<jsp:include page="/WEB-INF/views/template/dang_side_profile.jsp"></jsp:include>
			</div>  <!-- 프로필 박스 끝-->
	
			<div class = "col-6" style="background: white">	<!-- 일정 상세박스 시작-->	
				<div id = "schedule-simple-modal" class = "schedule-info">  
					<input type = "hidden" class = "input-schedule-no" name = "scheduleNo" value = "${scheduleDetail.scheduleNo}">
					<input type = "hidden" class = "input-dang-no" name = "dangNo" value = "${dangNo}">
					<input type = "hidden" class = "input-member-no" name = "loginNo" value = "${profile.memberNo}">
					<input type = "hidden" class = "input-leader-no" name = "leaderNo" value = "${scheduleDetail.memberNo}">
					<input type = "hidden" class = "input-admin-no" name = "adminNo" value = "${adminInfo.userNo}">					
					<div class="dang-title"><img class="red-pin" src="${pageContext.request.contextPath}/images/red-pin.png">
						<strong class = "schedule-name">${scheduleDetail.scheduleTitle}</strong>
					</div>
			
					<div class = "info-content dang-content">
						<div class="block-content">모임 내용</div>
						<div class="block-white-content detail-content schedule-content">${scheduleDetail.scheduleContent}</div>
					</div>    
			
					<div class = "info-commons dang-leader">
						<div class="block">모임 리더</div>
						<div class="block-white">${scheduleDetail.memberNick}</div>
					</div>
			
			        <div class = "info-commons dang-when">
			            <div class="block">모임 시간</div>
			            <div class="block-white schedule-time"> 
			            	<span class="schedule-start schedule-day">${scheduleDetail.scheduleStart}</span>                       
			           		<span class="span-dang-hour schedule-hour">${scheduleDetail.scheduleHour}</span>
			            </div>
			        </div>   
			                
					<div class = "info-commons dang-where">
					    <div class="block">모임 장소</div> 
					    <div class="detail-place block-white schedule-place-name">${scheduleDetail.placeName}</div>
					</div>
			           
					<div class = "dang-place-map"><div id="map" style="width:100%;height:100%;"></div></div>
			                 
					<div class = "info-commons dang-number">
					    <div class="block detail-maxhead">참여 인원</div>
					    <div class="detail-head block-white">
					    	<span class = "schedule-head">${countJoin}</span>
					 		명 / 
					 	<span class = "schedule-head-max">${scheduleDetail.scheduleHeadMax}</span>
					    	 명
					    </div>
					</div>      
			                
					<div class = "info-commons dang-who">
					    <div class="block">참여 멤버</div>                        
							<div class="block-white">
								<c:forEach var="JoinMemberVO" items="${joinMemberList}">
									<c:choose>
										<c:when test="${JoinMemberVO.attachmentNo == 0}">
											<img title="${JoinMemberVO.memberNick}" class="member-profile-hover img-circle"  src="${pageContext.request.contextPath}/images/basic-profile.png" width="45px" height="45px">
										</c:when>
										<c:otherwise>
											<img title="${JoinMemberVO.memberNick}" class="member-profile-hover img-circle" src="${pageContext.request.contextPath}/rest_attachment/download/${JoinMemberVO.attachmentNo}" width="45px" height="45px">
										</c:otherwise>
									</c:choose>															
								</c:forEach>
					    </div>
					</div>   

					<div class = "info-commons dang-money">
						<div class="block">참여 회비</div>
						<div class="detail-money block-white schedules-money"><fmt:formatNumber value="${scheduleDetail.scheduleMoney}" pattern="#,###"/>원</div>
					</div>    

					<div class="btn-box btn-join">
					<c:choose>
						<c:when test = "${loginGrade == '관리자'}">	
						</c:when>
						<c:otherwise>									
							<button type="submit" class="btn-plus">참여</button>
							<button type="submit" class="btn-minus">참여취소</button>
							<button type="submit" class="btn-edit cursor-pointer">수정</button>
							<button type="submit" class="btn-delete">삭제</button>							
							<button type="submit" class="btn-finish">마감</button>
						</c:otherwise>
					</c:choose>
					</div>					
				</div>    
			</div> <!-- 캘린더 박스 끝-->
	
			<div class="col-3"> <!-- 다가오는 일정 박스 시작-->
				<jsp:include page="/WEB-INF/views/template/dang_side_upcoming.jsp"></jsp:include>
			</div> <!-- 다가오는 일정 박스  끝-->
		</div>
	</div>
</div>
<!-- 댕모임 일정 수정 모달 -->
<div class="modal fade" id="scheduleEditModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
			<div class="modal-body">
				<div class = "container-fluid my-3">
					<div class = "row">
						<div class = "offset-3 col-6 d-flex justify-content-center align-items-center">
							<strong class = "strong-modal-schedule-edit">모임 수정</strong>
						</div>
						<div class = "offset-2 col-1 d-flex justify-content-center align-items-center">
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
					</div>
					<div class = "row">
						<div class = "col">
							<div class = "row">
								<div class = "col d-flex flex-row d-flex align-items-center">								
									<label for="message-text" class="col-form-label ms-2 me-1">모임 제목</label>
									<i class="fa-solid fa-asterisk text-danger me-2"></i>
									<span class="length-font">(</span>
									<span class="title-length length-font">0</span> 
									<span class="length-font">/ 20 )</span>
								</div>
							</div>
							<div class = "row">
								<div class = "col">								
									<input type="text" class="input-modal-schedule-name form-control" name="scheduleTitle" maxlength="20">
								</div>
							</div>
						</div>
					</div>
					<div class = "row mt-3">
						<div class = "col">
							<div class = "row">
								<div class = "col d-flex flex-row d-flex align-items-center">
									<label for="message-text" class="col-form-label ms-2 me-1">모임 내용</label>
									<i class="fa-solid fa-asterisk text-danger me-2"></i>
									<span class="length-font">(</span>
									<span class="content-length length-font">0</span>
									<span class="length-font">/ 100 )</span>
								</div>
							</div>
							<div class = "row">
								<div class = "col">
									<textarea  class="write-content form-control b-contentbox textarea-modal-schedule-content" name="scheduleContent" maxlength="100" rows="2" style="resize:none;"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class = "row mt-3">
						<div class = "col">
							<div class = "row">
								<div class = "col d-flex flex-row d-flex align-items-center">
									<label for="message-text" class="col-form-label ms-2 me-1">모임 시간</label>
									<i class="fa-solid fa-asterisk text-danger"></i>
								</div>
							</div>
							<div class = "row">
								<div class = "col-6">
									<input type="date" value="${sysdate}" class="when-date inbl w-100 b-contentbox form-control input-modal-schedule-when" name="scheduleStart">
								</div>
								<div class = "col-6">
									<input type="time" class="when-time inbl w-100 b-contentbox form-control input-modal-schedule-time" value="10:00" min="00:00" max="24:00"  name="scheduleHour">
								</div>
							</div>
						</div>
					</div>
					<div class = "row mt-3">
						<div class = "col">
							<div class = "row">
								<div class = "col d-flex flex-row d-flex align-items-center">
									<label for="message-text" class="col-form-label ms-2 me-1">모임 장소 찾기</label>
                        			<i class="fa-solid fa-asterisk text-danger"></i>
								</div>
							</div>
							<div class = "row">
								<div class = "col">
									<div class="where form-control div-modal-schedule-place" ></div>   
								</div>
							</div>
							<div class = "row position-relative">
								<div class = "col">								
									<!-- 지도가 표시될 div -->
									<div id="mapUpdate" class = "w-100" style="width: 100%; height: 500px;"></div>
		                            <!-- 지도 위에 표시될 마커 카테고리 -->
		 							<div class="categoryUpdate">
										<ul>
										    <li id="cafeMenuUpdate" onclick="changeMarker('cafeUpdate')">
										    	<span class="ico_comm ico_cafe"></span> 카페</li>
										    <li id="foodMenuUpdate" onclick="changeMarker('foodUpdate')">
										    	<span class="ico_comm ico_food"></span> 음식점</li>
										    <li id="fieldMenuUpdate" onclick="changeMarker('fieldUpdate')">
										    	<span class="ico_comm ico_field"></span> 운동장</li>
										    <li id="dogsalonMenuUpdate" onclick="changeMarker('dogsalonUpdate')">
										    	<span class="ico_comm ico_dogsalon"></span> 미용
										    </li>
										    <li id="parkMenuUpdate" onclick="changeMarker('parkUpdate')">
										    	<span class="ico_comm ico_park"></span> 공원
									    	</li>
										</ul>
		 							</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class = "row mt-3">
						<div class = "col">
							<div class = "row">
								<div class = "col">								
									<label for="write-categoryUpdate" class="col-form-label ms-2 me-1">최대 참여인원 </label>
									<i class="fa-solid fa-asterisk text-danger"></i>
								</div>
							</div>
							<div class = "row">
								<div class = "col">
									<select style="color: #757575;" name="scheduleHeadmax" class="persons rounded pb-1 ps-1  inbl w-50 b-contentbox form-content select-modal-schedule-head">
									    <option class="people-5">5</option>
									    <option class="people-10">10</option>
									    <option class="people-15">15</option>
										<option class="people-20">20</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					
					<div class = "row mt-3">
						<div class = "col">
							<div class = "row">
								<div class = "col">
									<label for="message-text" class="col-form-label ms-2 me-1" >참여 회비</label>
								</div>
							</div>
							<div class = row>
								<div class = "col d-flex flex-column">
									<input class="money form-control input-modal-schedule-money" id="updateMoney" name="scheduleMoney" maxLength="7" />
									<span class="invalid-money" >참여회비는 1백만원 미만으로 설정 가능합니다.</span>  
								</div>
							</div>
						</div>
					</div>
					
					<div class = "row mt-3">
						<div class = "col d-flex justify-content-end">
							<button type="button" class="btn btn-secondary edit-cancel" data-bs-dismiss="modal">취소</button>
			    			<button type="button" class="btn btn-primary edit-btn">수정</button>
						</div>
					</div>
				</div>
				
            </div>
        </div>
    </div>
</div> <!-- 댕모임 일정 수정 모달 끝 -->
<!-- 댕모임 일정 장소 수정 모달 시작-->
<div class="modal fade" id="editPlaceModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-place-body">
                <div class="body-flex body1">
                    <span class="span-placearea px-2"></span>
                <img src=""  class="place-img">
            </div>
            <div class="body-flex body2 ms-2">
                <span class="span-placename1"></span>
                 <span  class="span-placesort"></span><br>
                <span class="span-placeaddress"></span><br>
                <span id="placeoff-update" class="span-placeoff px-2"></span>
                <span class="span-placeoperation"></span><br>
                <i id="placetelIcon-update" class="fa-solid fa-square-phone"> </i><span id="placetel-update" class="span-placetel"></span><br>
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
</div> <!-- 댕모임 일정 장소 모달 끝-->
<!-- 카카오 맵 API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakoMapKey}"></script>
<script type="text/javascript">
		
	$(function(){			
		$(".invalid-money").hide();
		
		//댕모임 일정 번호
		var scheduleNo = $(".input-schedule-no").val();
		//댕모임  번호
		var dangNo = $(".input-dang-no").val();
		//댕모임 멤버 번호
		var memberNo =$(".input-member-no").val();
		//댕모임 개설자 번호
		var leaderNo =$(".input-leader-no").val();
		
		console.log("일정 번호 :" + scheduleNo);
		console.log("댕모임 번호 :" + dangNo);
		console.log("댕모임 멤버 번호 :" + memberNo);
		console.log("댕모임 개설자 번호 :" + leaderNo);

		//참여 회비는 1백만원미만으로 제한(6자)
		$(document).on("input", ".money", function(){
			var moneyLength = $(this).val().length;
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
		$(".btn-finish").hide(); //일정 인원수 마감
		
 		var today = new Date();
		console.log("현재 날짜 :" + today); 
		
		var sdate = $(".schedule-day").text();
		var scheduleDay = new Date(sdate);
		console.log("일정 날짜 변환 :" + scheduleDay);	
		console.log(today > scheduleDay);

		if(memberNo != ""){
			if(leaderNo == memberNo){ //개설자라면(로그인 멤버번호가 개설자 멤버번호와 일치하면)
				//수정, 삭제버튼 보여주기
				$(".btn-edit").show();
				$(".btn-delete").show();		
			} 
			else{//멤버번호가 공백이 아닌경우(관리자가 아닌경우)
				//해당 스케줄 번호의 일정 참여한 멤버번호 가 맞는지 확인위해 ajax 호출
				$.ajax({
					url : "http://localhost:8888/rest/dangSchedule/schedule_memberCheck?scheduleNo="+scheduleNo+"&memberNo="+memberNo,
					method : "get",
					async : false,
					contentType : "application/json",
					success : function(resp) {
						console.log("resp :" + resp);
						
						console.log(today);
						console.log(scheduleDay);
						console.log(today<=scheduleDay);
						console.log(${countJoin} >= ${scheduleDetail.scheduleHeadMax});
						console.log(resp.length == 0);
						
						if(today<=scheduleDay){ //일정이 현재날짜를 지나지 않았다면
							//${countJoin}명(참여인원) / ${scheduleDetail.scheduleHeadMax}명(최대참여인원)
							//일정상세에서 참여인원인 마감되었는지?
							if(${countJoin} >= ${scheduleDetail.scheduleHeadMax}){
								if(resp.length == 0) { //참여된 멤버가 아니라면
									$(".btn-finish").show();	    
									console.log("참여멤버 아님 마감")
		                       	} else { //참여된 멤버라면
									$(".btn-minus").show(); 
									console.log("참여멤버 참여취소")
		                       	}
							}
							else{ //일정상세에서 참여인원이 남아있는지?
		                     	if(resp.length == 0){ //참여된 멤버가 아니라면
		                     		$(".btn-plus").show();	 
		                     		console.log("참여멤버 아님 참여하기")
		                     	} else {//참여된 멤버라면
		                       		$(".btn-minus").show();
		                       		console.log("참여멤버 참여취소")
		                       	}
							}
						}
						else{ //일정이 현재날짜를 지났다면 (참여,참여취소,마감버튼 숨기기)
							$(".btn-plus").hide();	 
							$(".btn-minus").hide();
							$(".btn-finish").hide();	 
						}					
					}
				});			
			}
			
		}

			
		//상세일정에서 참여하기 클릭
		$(".btn-plus").click(function(){
			$.ajax({
				url : "http://localhost:8888/rest/dangSchedule/schedule_join?memberNo="+memberNo+"&scheduleNo="+scheduleNo,
				method : "post",
 				async : false,
				contentType : "application/json",
				success : function(resp) {
					console.log("resp :" +resp);
					$(".btn-plus").hide();
                          	
					window.confirm("일정 참여가 완료되었습니다");
                          	
					location.href="http://localhost:8888/dang/"+dangNo+"/schedule_detail?scheduleNo="+scheduleNo;
					$(".btn-minus").show(); 
				}
			});
		});
                  
		//상세일정에서 참여취소 클릭
		$(".btn-minus").click(function(){
                  	
			$.ajax({
				url : "http://localhost:8888/rest/dangSchedule/schedule_cancel?memberNo="+memberNo+"&scheduleNo="+scheduleNo,
 				method : "delete",
				async : false,
				contentType : "application/json",
				success : function(resp) {
					$(".btn-minus").hide();
					window.confirm("일정이 취소되었습니다");
                          	 
					$(".btn-plus").show();
					location.href="http://localhost:8888/dang/"+dangNo+"/schedule_detail?scheduleNo="+scheduleNo;
				}
			});                   	
		}); 
		
		//상세일정에서 수정버튼 클릭
		
		const input = document.querySelector('#updateMoney');
        input.addEventListener('keyup', function(e) {
          let value = e.target.value;
          value = Number(value.replaceAll(',', ''));
          if(isNaN(value)) {
            input.value = 0;
          }else {
            const formatValue = value.toLocaleString('ko-KR');
            input.value = formatValue;
          }
        })
		
		$(".btn-edit").click(function(e){
			$("#scheduleEditModal").modal("show");//모달 표시
			$(".input-modal-schedule-name").val($(".schedule-name").text());
			$(".textarea-modal-schedule-content").val($(".schedule-content").text());
			$(".input-modal-schedule-when").val($(".schedule-start").text());
			$(".input-modal-schedule-time").val($(".schedule-hour").text());
			$(".div-modal-schedule-place").text($(".schedule-place-name").text());
			$(".select-modal-schedule-head").val($(".schedule-head-max").text()).prop("selected", true);
			
			var scheduleMoneyWon = $(".schedules-money").text();
			var scheduleMoney = scheduleMoneyWon.substring(0, scheduleMoneyWon.length - 1);
			
	
			$(".input-modal-schedule-money").val(scheduleMoney);
			
			scheuleHeadNow = $(".schedule-head").text();
		});
		
		// 현재 인원
		var scheduleHeadNow;
		
		//일정수정 모달에서 수정 버튼 클릭
        $(".edit-btn").click(function(){
        	if(confirm("수정하시겠습니까?")==true){
        	// 설정한 총원
        	var scheduleHeadmax = $(".select-modal-schedule-head").val();
        	
        	
        	if(scheduleHeadmax < scheduleHeadNow) {
        		alert("현재 인원보다 적은 총원을 선택할 수 없습니다.")
        		return;
        	}
        	var originalPlaceNo=${scheduleDetail.placeNo};
        	
        	var scheduleNo = $(".input-schedule-no").val();
        	var dangNo = $(".input-dang-no").val();
			var placeNo = $(".div-modal-schedule-place").attr("data-placeno");
			
			var scheduleTitle = $(".input-modal-schedule-name").val();
			var scheduleContent =$(".textarea-modal-schedule-content").val();
			var scheduleStart = $(".input-modal-schedule-when").val();
			var scheduleHour = $(".input-modal-schedule-time").val();
			var scheduleMoney = $(".input-modal-schedule-money").val();
			var changestr = scheduleMoney.replace(',', '');
			var formData = new FormData();
			
			if(placeNo==null){
				console.log('선택안됨')
				placeNo=originalPlaceNo;
			}
			
			formData.append("scheduleNo", scheduleNo);
			formData.append("placeNo", placeNo);
			formData.append("scheduleTitle", scheduleTitle);
			formData.append("scheduleContent", scheduleContent);
			formData.append("scheduleHeadmax", scheduleHeadmax);
			formData.append("scheduleStart", scheduleStart);
			formData.append("scheduleHour", scheduleHour);
			formData.append("scheduleMoney", changestr);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/rest/dangSchedule/schedule_edit",
				method : "put",
				data : formData,
				contentType: false,
		        processData: false,
		        success : function(resp) {
		        	var dangNo = $(".input-dang-no").val();
		        	location.href = "${pageContext.request.contextPath}/dang/"+dangNo+"/schedule_detail?scheduleNo=" + scheduleNo;
		        }
			});
			
        	}else{
        		return;
        	}
		});
		
		//일정등록 모달에서 취소 버튼 클릭시 일정등록 모달 닫기 및 내용초기화
		$(document).on("click",".edit-cancel",function(){
			console.log('수정모달 닫기');
			$(".schedule-name").val(""); //일정 제목
			$(".write-content").val(""); //일정 내용
			$(".when-date ").val(""); //일정 날짜
			$(".when-time").val(""); //일정 시간		
			$(".where").val(""); //장소
			$("#persons").prop("selected", true);//최대 참여인원							
			$(".money").val(""); //회비
			
			setCafeMarkers(null);
            setFoodMarkers(null);
            setFieldMarkers(null);
            setDogsalonMarkers(null);
            setParkMarkers(null);
            changeMarker('cafeUpdate');
            $(".customoverlay").remove();
            mapUpdate.setLevel(1);
            mapUpdate.relayout();
		});
		
		//상세일정에서 삭제버튼 클릭
		$(".btn-delete").click(function(){
			
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
			} else{
				alert("일정 삭제가 취소되었습니다.");
			}
		});	
		
	});
		
		// 맵가져오기
        var placeNoInfo; //장소번호를 가져오는 변수
        var placeContents = []; // 장소번호를 가져와 내용을 담는 변수
        var placeOriginNo; // 클릭한 마커의 데이터장소번호를 뽑아내는 변수
        
        $(document).on("input", ".schedule-name", function(){
        	
        	
        	var nameLength = $(this).val().length;
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
        	$(".content-length").text(contentLength);
        	
         	if(contentLength >= 100) {
         		$(".content-length").css("color","red");
        
        	} 
         	else{
         		$(".content-length").css("color","black");
         	}
        });
        
        function detailMove() {
            window.open("http://localhost:8888/place/detail/" + placeNoInfo,'_blank');
        }
        
        // 장소 등록을 위한 장소 번호
        var placeNoSelected;
        var placeXSelected;
        var placeYSelected;
        $(document).on("click",".editPlace",function (e) {
			$("#editPlaceModal").modal("show");//모달 실행
			placeNoInfo = $(this).data("placeno");
			//비동기통신 시작
 			$.ajax({
				url: "http://localhost:8888/rest_place/place_one/"+placeNoInfo,
				method: "get",
				async: false,
				contentType: "application/json",
				success: function (resp) {
					$(".span-placeaddress").text(resp.placeAddress);
					$(".span-placearea").text(resp.placeArea);
					$(".span-placeinfo").html(resp.placeInfo);
					$(".span-placename1").text(resp.placeName);
					$(".span-placeoff").text(resp.placeOff);
					$(".span-placeoperation").text(resp.placeOperation);
					$(".span-placesort").text(resp.placeSort);
					$(".span-placetel").text(resp.placeTel);
					$(".span-placeurl").text(resp.placeUrl);
					$(".place-img").attr("src", "http://localhost:8888/rest_attachment/download/"+resp.attachmentNo);
					placeNoSelected = resp.placeNo;
					placeXSelected = resp.placeX;
					placeYSelected = resp.placeY;
					
					if(resp.placeOff==null){
						$("#placeoff-update").removeClass("span-placeoff");
					}else if(resp.placeOff!=null){
						$("#placeoff-update").addClass("span-placeoff");
						$(".span-placeoff").text(resp.placeOff);
					}
					if(resp.placeTel==null){
						$("#placetel-update").removeClass("span-placetel");
						$("#placetelIcon-update").removeClass("fa-solid");
						$("#placetelIcon-update").removeClass("fa-square-phone");
					}else if(resp.placeTel!=null){
						$("#placetel-update").addClass("span-placetel");
						$(".span-placetel").text(resp.placeTel);
						$("#placetelIcon-update").addClass("fa-solid");
						$("#placetelIcon-update").addClass("fa-square-phone");
					}
				}
			})
		});
        
        // 장소 선택 Modal에서 선택 시 일정 수정 Modal의 모임 장소에 입력되도록
		$(".btn-edit-place").click(function(){			
			var placeWhere = $(".span-placename1").text();
			//장소번호로 장소데이터 불러오기(테스트)
			$(".div-modal-schedule-place").attr("data-placeno", placeNoSelected);
			$(".where").text(placeWhere);
			$("#editPlaceModal").modal("hide");
		});
        
        var clickedOverlay = null;//클릭이벤트 오버레이 전역변수 초기값
        // 카페 마커가 표시될 좌표 배열입니다
        var cafePositions = [];
        // 음식점 마커가 표시될 좌표 배열입니다
        var foodPositions = [];
        //  운동장 마커가 표시될 좌표 배열입니다
        var fieldPositions = [];
        //  미용 마커가 표시될 좌표 배열입니다
        var dogsalonPositions = [];
        //  공원 마커가 표시될 좌표 배열입니다
        var parkPositions = [];
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
        
        
        $.ajax({//장소에 관한 restful 통신
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
        changeMarker('cafeUpdate'); // 지도에 카페 마커가 보이도록 설정합니다    
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
                kakao.maps.event.addListener(marker, 'click', function () {
					for (var i = 0; i < cafePositions.length; i++) {
						var thisPositions = this.getPosition().Ma
						var contentPositions = contentCafe[i].placeX
						if (contentPositions.toFixed(7) === thisPositions.toFixed(7)) {
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
					var customOverlay = new kakao.maps.CustomOverlay({
											map: mapUpdate,
											position: position,
 											content: content,
											yAnchor: 1
											});
					//다른 마커 클릭시 오버레이 닫기
					if (clickedOverlay) {
						clickedOverlay.setMap(null);
					}
					customOverlay.setMap(mapUpdate);
					clickedOverlay = customOverlay;
				});
            }
        }
        
        // 카페 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setCafeMarkers(mapUpdate) {
            for (var i = 0; i < cafeMarkers.length; i++) {
                cafeMarkers[i].setMap(mapUpdate);
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
                var markerImage = createMarkerImage(foodmarkerImageSrc, imageSize, imageOptions), 
                	marker = createMarker(foodPositions[i], markerImage);
                // 생성된 마커를 음식점 마커 배열에 추가합니다
                foodMarkers.push(marker);
                kakao.maps.event.addListener(marker, 'click', function () {
					for (var i = 0; i < foodPositions.length; i++) {
						var thisPositions = this.getPosition().Ma
						var contentPositions = contentFood[i].placeX
						if (contentPositions.toFixed(7) === thisPositions.toFixed(7)) {
							placeOriginNo = contentFood[i].placeNo;
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
					var customOverlay = new kakao.maps.CustomOverlay({
												map: mapUpdate,
												position: position,
												content: content,
												yAnchor: 1
											});
					//다른 마커 클릭시 오버레이 닫기
					if (clickedOverlay) {
						clickedOverlay.setMap(null);
					}
					customOverlay.setMap(mapUpdate);
					clickedOverlay = customOverlay;
				});
            }
        }
        
        // 음식점 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setFoodMarkers(mapUpdate) {
            for (var i = 0; i < foodMarkers.length; i++) {
                foodMarkers[i].setMap(mapUpdate);
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
                                var thisPositions = this.getPosition().Ma
                                var contentPositions = contentField[i].placeX
                                if (contentPositions.toFixed(7) === thisPositions.toFixed(7)) {
                                    placeOriginNo = contentField[i].placeNo;
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
                                    map: mapUpdate,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(mapUpdate);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        // 운동장 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setFieldMarkers(mapUpdate) {
            for (var i = 0; i < fieldMarkers.length; i++) {
                fieldMarkers[i].setMap(mapUpdate);
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
                                var thisPositions = this.getPosition().Ma
                                var contentPositions = contentDogsalon[i].placeX
                                if (contentPositions.toFixed(7) === thisPositions.toFixed(7)) {
                                    placeOriginNo = contentDogsalon[i].placeNo;
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
                                    map: mapUpdate,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(mapUpdate);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        // 미용 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setDogsalonMarkers(mapUpdate) {
            for (var i = 0; i < dogsalonMarkers.length; i++) {
                dogsalonMarkers[i].setMap(mapUpdate);
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
                                var thisPositions = this.getPosition().Ma
                                var contentPositions = contentPark[i].placeX
                                if (contentPositions.toFixed(7) === thisPositions.toFixed(7)) {
                                    placeOriginNo = contentPark[i].placeNo;
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
                                    map: mapUpdate,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(mapUpdate);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        // 공원 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setParkMarkers(mapUpdate) {
            for (var i = 0; i < parkMarkers.length; i++) {
                parkMarkers[i].setMap(mapUpdate);
            }
        }
        // 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
        function changeMarker(type) {
            var cafeMenuUpdate = document.getElementById('cafeMenuUpdate');
            var foodMenuUpdate = document.getElementById('foodMenuUpdate');
            var fieldMenuUpdate = document.getElementById('fieldMenuUpdate');
            var dogsalonMenuUpdate = document.getElementById('dogsalonMenuUpdate');
            var parkMenuUpdate = document.getElementById('parkMenuUpdate');
            // 카페 카테고리가 클릭됐을 때
            if (type === 'cafeUpdate') {
                // 카페 카테고리를 선택된 스타일로 변경하고
                cafeMenuUpdate.className = 'menu_selected';
                // 음식점과 운동장과 미용 카테고리는 선택되지 않은 스타일로 바꿉니다
                foodMenuUpdate.className = '';
                fieldMenuUpdate.className = '';
                dogsalonMenuUpdate.className = '';
                parkMenuUpdate.className = '';
                // 카페 마커들만 지도에 표시하도록 설정합니다
                setCafeMarkers(mapUpdate);
                setFoodMarkers(null);
                setFieldMarkers(null);
                setDogsalonMarkers(null);
                setParkMarkers(null);
            } else if (type === 'foodUpdate') { // 음식점 카테고리가 클릭됐을 때
                // 음식점 카테고리를 선택된 스타일로 변경하고
                cafeMenuUpdate.className = '';
                foodMenuUpdate.className = 'menu_selected';
                fieldMenuUpdate.className = '';
                dogsalonMenuUpdate.className = '';
                parkMenuUpdate.className = '';
                // 음식점 마커들만 지도에 표시하도록 설정합니다
                setCafeMarkers(null);
                setFoodMarkers(mapUpdate);
                setFieldMarkers(null);
                setDogsalonMarkers(null);
                setParkMarkers(null);
            } else if (type === 'fieldUpdate') { // 운동장 카테고리가 클릭됐을 때
                // 운동장 카테고리를 선택된 스타일로 변경하고
                cafeMenuUpdate.className = '';
                foodMenuUpdate.className = '';
                fieldMenuUpdate.className = 'menu_selected';
                dogsalonMenuUpdate.className = '';
                parkMenuUpdate.className = '';
                // 운동장 마커들만 지도에 표시하도록 설정합니다
                setCafeMarkers(null);
                setFoodMarkers(null);
                setFieldMarkers(mapUpdate);
                setDogsalonMarkers(null);
                setParkMarkers(null);
            } else if (type === 'dogsalonUpdate') {
                // 미용 카테고리를 선택된 스타일로 변경하고
                cafeMenuUpdate.className = '';
                foodMenuUpdate.className = '';
                fieldMenuUpdate.className = '';
                dogsalonMenuUpdate.className = 'menu_selected';
                parkMenuUpdate.className = '';
                // 미용 마커들만 지도에 표시하도록 설정합니다
                setCafeMarkers(null);
                setFoodMarkers(null);
                setFieldMarkers(null);
                setDogsalonMarkers(mapUpdate);
                setParkMarkers(null);
            } else if (type === 'parkUpdate') {
                // 공원 카테고리를 선택된 스타일로 변경하고
                cafeMenuUpdate.className = '';
                foodMenuUpdate.className = '';
                fieldMenuUpdate.className = '';
                dogsalonMenuUpdate.className = '';
                parkMenuUpdate.className = 'menu_selected';
                // 공원 마커들만 지도에 표시하도록 설정합니다
                setCafeMarkers(null);
                setFoodMarkers(null);
                setFieldMarkers(null);
                setDogsalonMarkers(null);
                setParkMarkers(mapUpdate);
            }
        }
		
	//스케줄 상세관련 카카오맵 출력
	var detailPlaceNo = ${scheduleDetail.placeNo};
	var placeX;
	var placeY; 
		
	$.ajax({
	   url : "http://localhost:8888/rest_place/place_one/"+ detailPlaceNo,
	   method : "get",
	   async : false,
	   contentType : "application/json",
	   success : function(resp) {
	      
	      placeX = resp.placeX 
	      placeY = resp.placeY
	      
	   }
	})
                         				
		
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	  mapOption = { 
	        center: new kakao.maps.LatLng(placeX, placeY), // 지도의 중심좌표
	        level: 1 // 지도의 확대 레벨
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
	
	var mapContainer2 = document.getElementById('mapUpdate'), // 지도를 표시할 div  
    mapOption2 = {
        center: new kakao.maps.LatLng(37.498004414546934,
            127.02770621963765), // 지도의 중심좌표 
        
        // 지도의 확대 레벨 
    };
	var mapUpdate = new kakao.maps.Map(mapContainer2, mapOption2); // 지도를 생성합니다
	
	var mapContainer2 = document.getElementById('mapUpdate'), // 지도를 표시할 div  
    mapOption2 = {
        center: new kakao.maps.LatLng(placeX, placeY), // 지도의 중심좌표 
        level: 4 // 지도의 확대 레벨
    };
	var mapUpdate = new kakao.maps.Map(mapContainer2, mapOption2); // 지도를 생성합니다
	var marker2 = new kakao.maps.Marker({
	  position: markerPosition,
	  image: markerImage // 마커이미지 설정 
	});
	marker2.setMap(mapUpdate);
	
	$('#scheduleEditModal').on('shown.bs.modal', function (e) {
		mapUpdate.relayout();
		mapUpdate.setCenter(new kakao.maps.LatLng(placeX, placeY));
	})
		
</script>