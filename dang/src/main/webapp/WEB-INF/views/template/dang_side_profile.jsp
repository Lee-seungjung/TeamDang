<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>


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
	
	.category, .category * {
		margin: 0;
		padding: 0;
		color: #000;
	} 
	
	.category {
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
	
	.category .menu_selected {
		background: #76BEFF;
		color: #fff;
		margin: 0 -1px;
	}
	
	.category li {
		list-style: none;
		float: left;
		width: 60px;
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
			url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png')
			no-repeat;
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
 /*        .border1 {
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
        } */
        
    .form-content:focus {
	  background-color: #fff;
	  border-color: #contentPositionsc1f6;
	  outline: 0;
	  box-shadow: 0 0 0 0.25rem rgba(69, 130, 236, 0.25);
	}
	
	.where{
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
	
 /*    .body1{
        width: 33%;
        position: relative;
    }
    .body2{
        width: 67%;
        padding: 10px;
    } */
    
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
    }
    .modal-profile-report-btn{
    	text-align:center;
    	padding:5px 10px;
    }
    .modal-profile-siren{
    	width:22px;
    	height:22px;
    	margin-bottom:3px;
    }
    .fn:focus{
    	box-shadow: none;
    }
    .profile-info-img{
    	 width:130px;
    	 height:130px;
    	 margin-left:100%;
    	 margin-top:50%;
    }
    .profile-info-owner{
    	 width:30px;
    	 height:30px;
    	 margin-left:750%;
    	 margin-top:215%;
    	 display:none;
    }
</style>

<%-- 댕모임 사이드바 프로필 --%>
<div class = "col">
	<div class="p-3 profile-box border rounded-3 mb-3 shadow">
		<div class="profile-wrap text-center">
		
			<div class="row justify-content-center mb-3 mt-1" >
				<div class="col-10">
					<c:choose>
						<c:when test="${attachmentNo == null}">
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
						<div class="modal-dialog modal-dialog-centered">
							<form class="edit-form modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">프로필 수정</h5>
								</div>
								<div class="modal-body">
									<div class="mb-3">
										<img src="" class="img-circle profile-img profile-css change-img cursor-pointer">
										<img src="${pageContext.request.contextPath}/images/edit-camera.png" class="camera-icon profile-img">
                							<input type="file" style="display:none;" class="input-file form-control" accept=".jpg, .png, .gif">
                							<input type="hidden" name="attachmentNo" value="${attachmentNo}">
                							<input type="hidden" name="originAttachmentNo" value="${attachmentNo}">
									</div>
									<div class="mb-3 text-start">
										<label for="recipient-name" class="col-form-label ms-2 me-1">닉네임</label><i class="fa-solid fa-asterisk text-danger"></i>
										<input type="text" value="${profile.memberNick}" name="memberNick" class="form-control" id="recipient-name" autocomplete="off">
										<span class="invalid-feedback">1~6자 내로 입력해주세요!</span>
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
									<button type="button" class="btn btn-secondary p-cancel-btn" data-bs-dismiss="modal">취소</button>
									<button type="submit" class="btn btn-primary p-confirm-btn" data-bs-dismiss="modal">확인</button>
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
						<div class="col-4">
							<i class="fa-regular fa-heart fa-2x" style="color:#FEA59C;"></i>
							<p class="font-gray" style="font-size:15px;">참여모임</p>
							<p class="font-gray" style="font-size:20px; font-weight:bolder;">${joinScheduleCount}</p>
						</div>
						<div class="col-4">
							<i class="fa-regular fa-pen-to-square fa-2x" style="color:#FFE699;"></i>
							<p class="font-gray" style="font-size:15px;">작성글</p>
							<p class="font-gray" style="font-size:20px; font-weight:bolder;">${boardWriteCount}</p>
						</div>
						<div class="col-4">
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
		<span data-bs-toggle="modal" data-bs-target="#day-check-modal" class="checkAttendance cursor-pointer">${attendance}</span>
	</div>

	<!-- 출석체크 Modal -->
	<div class="modal fade" id="day-check-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header mb-2" style="margin:0 auto;">
					<img src="${pageContext.request.contextPath}/images/logo.png" width="70" height="35">
					<p style="color:#303030; font-size:15px;" class="ms-1 me-1 modal-title-fir"> 댕모임의 </p>
					<h5 class="modal-title modal-title-sec" id="exampleModalLabel" style="display:block; font-size:25px; color:#6C7AEF; font-weight:bolder"> 등급 포인트가 +1 </h5>
					<p style="color:#303030; font-size:15px;" class="ms-1 modal-title-third"> 올라갑니다!</p>
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
					<img src="${pageContext.request.contextPath}/images/basic-profile.png" 
							class="img-circle profile-info-img">
				</div>
				<div style="position:absolute;">
					<img src="${pageContext.request.contextPath}/images/crown.png" class="profile-info-owner">
				</div>
				<div class="modal-body" >
					<div class="row">
						<div class="col-8 offset-2 text-center" style="margin-top:90px;">
							<p class="font-gray nick-font profile-info-nick">닉네임</p>
							<p class="mt-1 profile-info-message" style="font-size:14px;">상태메세지에요 이건 상태메시지에요</p>
						</div>
						<div class="col 6 offset 3 text-center m-3 mb-5">
							<button type="button" class="btn btn-primary modal-profile-btn fn profile-info-grade" style="cursor:default;">등급</button>
							<button type="button" class="btn btn-primary ms-1 me-1 modal-profile-btn fn profile-info-score" style="cursor:default;">활동점수</button>
							<a type="button" class="btn btn-outline-pink modal-profile-report-btn"
									href="#">
								<img src="${pageContext.request.contextPath}/images/siren.png" class="modal-profile-siren">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 댕모임 일정 등록 -->
	 <div class="p-3 border rounded-3 text-center shadow gray mt-3">
		<span data-bs-toggle="modal" data-bs-target="#staticBackdrop" class="addSchedule cursor-pointer">일정 등록</span>
	</div>

    <!-- 댕모임 일정 등록 모달 -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">일정 등록</h5>
                    <button type="button" class="btn-close write-cancel" data-bs-dismiss="modal" aria-label="Close"></button>
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
                                <p><input type="date" value="${sysdate}" id="Date" class="when-date inbl w-50 b-contentbox form-control" name="scheduleStart"><input type="time" class="when-time inbl w-50 b-contentbox form-control" value="10:00" min="00:00"
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
                                    <div id="insertMap" style="width: 100%; height: 350px;"></div>
                                    <!-- 지도 위에 표시될 마커 카테고리 -->
                                    <div class="category">
                                        <ul>
                                            <li id="cafeMenuInsert" onclick="changeInsertMarker('cafeInsert')"><span
                                                    class="ico_comm ico_cafe"></span> 카페</li>
                                            <li id="foodMenuInsert" onclick="changeInsertMarker('foodInsert')"><span
                                                    class="ico_comm ico_food"></span> 음식점</li>
                                            <li id="fieldMenuInsert" onclick="changeInsertMarker('fieldInsert')"><span
                                                    class="ico_comm ico_field"></span> 운동장</li>
                                            <li id="dogsalonMenuInsert" onclick="changeInsertMarker('dogsalonInsert')"><span
                                                    class="ico_comm ico_dogsalon"></span> 미용
                                            </li>
                                            <li id="parkMenuInsert" onclick="changeInsertMarker('parkInsert')"><span
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
                        <button type="button" class="btn btn-primary write-btn">등록</button>
                    </div>

            </div>
        </div>
    </div>
        <!-- 댕모임 일정 등록 모달 끝 -->

	    <!-- 댕모임 일정 장소 모달 시작-->
    <div class="modal fade" id="edit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-place-body me-2">
                    <div class="body-flex body1">
                        <span class="span-placearea px-2"></span>
                    <img src=""  class="place-img">
                </div>
                <div class="body-flex body2 ms-3">
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
                    <button type="button" class="btn btn-primary btn-placeurl" onclick="pageUrlMove()" >홈페이지</button>                
                    <button type="button" class="btn btn-secondary " onclick="detailMove()">상세보기</button>
                    <button type="button" class="btn btn-select-place">등록하기</button>
                </div>
            </div>
        </div>
    </div>
      <!-- 댕모임 일정 장소 모달 끝-->

	<!-- 댕모임 정보 수정 -->
	<c:if test = "${profile.memberOwner == 'Y'}">
	<div class="p-3 border rounded-3 text-center shadow mt-3 gray">
		<i class="fa-solid fa-gear"></i>
		<a class="cursor-pointer" href = "/dang/${dangNo}/edit">댕모임 수정</a>
	</div>
	</c:if>
	
	<%--필요한 데이터 준비 --%>
	<input type="hidden" name="memberNo" value="${profile.memberNo}">
	<input type="hidden" name="dangNo" value="${profile.dangNo}">
	<input type="hidden" name="userNo" value="${profile.userNo}">
	
	<input type="hidden" class="cl" data-no="23">
	<input type="hidden" class="cl" data-no="27">
	
</div>

<spring:eval var="kakoMapKey" expression="@environment.getProperty('custom.kakaomap.key')" />

  <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakoMapKey }"></script>
    <script>
        var placeNoInfo; //장소번호를 가져오는 변수
        var placeContents = []; // 장소번호를 가져와 내용을 담는 변수
        var placeOriginNo; // 클릭한 마커의 데이터장소번호를 뽑아내는 변수
		
        
        
		$(".btn-select-place").click(function(){			
			var placeWhere = $(".span-placename").text();	
			//장소번호로 장소데이터 불러오기(테스트)
			$(".where").attr("data-placeno", placeNoInfo);
			
			$(".where").text(placeWhere);
			
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
        
        //장소 가게 홈페이지 이동 함수
        function pageUrlMove() {
   			var url = $(".span-placeurl").text();
   		 	console.log(url=='');
   		 	 if(url==''){
   		 		alert('해당하는 홈페이지가 없습니다.');
   		 	}else{
	   			window.open(url); 
   		 	}
   		}
        
        //장소 상세보기 이동 함수
        function detailMove() {
            //location.href = "http://localhost:8888/place/detail/" + placeNoInfo;
            window.open('http://localhost:8888/place/detail/'+ placeNoInfo, '_blank'); 
        }
        
        $(document).on("click",".edit",function (e) {
                    $("#edit").modal("show");//모달 실행
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
                               
                                
                               
                            }
                        })
                });
        
        
        //초기 지도 중심좌표를 설정하기 위한 변수
        var gangNam="강남구";
        var gangdong="강동구";
        var gangbuk="강북구";
        var gangseo="강서구";
        var gwanwk="관악구";
        var gwangjin="광진구";
        var guro="구로구";
        var geumcheon="금천구"
        var nowon="노원구";
        var dobong="도봉구";
        var dongdae="동대문구";
        var dongjak="동작구";
        var mapo="마포구";
        var sdm="서대문구";
        var seocho="서초구";
        var sd="성동구";
        var db="성북구";
        var songpa="송파구";
        var yangcheon="양천구";
        var ydp="영등포구";
        var yongsan="용산구";
        var ep="은평구";
        var jongno="종로구";
        var junggu="중구";
        var jungnang="중랑구";
        
        var centerPositionX;
        var centerPositionY;
        
      	// 현재 댕모임의 관심지역
       	var thisDangArea;
        
        $.ajax({
            url: "http://localhost:8888/rest_dang/detail?dangNo="+${dangNo},
            method: "get",
            async: false,
            contentType: "application/json",
            success: function (resp) {
            	thisDangArea=resp.dangInfo.dangArea;
            }
        })
        
       
       if(thisDangArea==gangNam){//강남구
   	  	centerPositionX=37.5174;
   		centerPositionY=127.0475;
       }else if(thisDangArea==gangdong){//강동구
    	centerPositionX=37.5327;
   		centerPositionY=127.1379;
       }else if(thisDangArea==gangbuk){//강북구
    	centerPositionX=37.6399;
  		centerPositionY=127.0257;
       }else if(thisDangArea==gangseo){//강서구
   	   	centerPositionX=37.5512;
		centerPositionY=126.8506;
	   }else if(thisDangArea==gwanwk){//관악구
		centerPositionX=37.4783;
		centerPositionY=126.9522;
	  }else if(thisDangArea==gwangjin){//광진구
		centerPositionX=37.5383;
		centerPositionY=127.0828;
	  }else if(thisDangArea==guro){//구로구
		centerPositionX=37.4954;
		centerPositionY=126.8877;
	  }else if(thisDangArea==geumcheon){//금천구
		centerPositionX=37.4568;
		centerPositionY=126.8963;
	  }else if(thisDangArea==nowon){//노원구
		centerPositionX=37.654;
		centerPositionY=127.0566;
	  }else if(thisDangArea==dobong){//도봉구
		centerPositionX=37.6691;
		centerPositionY=127.0469;
	  }else if(thisDangArea==dongdae){//동대문구
		centerPositionX=37.574;
		centerPositionY=127.0401;
	  }else if(thisDangArea==dongjak){//동작구
		centerPositionX=37.5123;
		centerPositionY=126.9395;
	  }else if(thisDangArea==mapo){//마포구
	   	centerPositionX=37.5662;
		centerPositionY=126.9022;
	  }else if(thisDangArea==sdm){//서대문구
	   	centerPositionX=37.5792;
		centerPositionY=126.9365;
	  }else if(thisDangArea==seocho){//서초구
	   	centerPositionX=37.4834;
		centerPositionY=127.0322;
	  }else if(thisDangArea==sd){//성동구
	   	centerPositionX=37.5638;
		centerPositionY=127.0372;
	  }else if(thisDangArea==db){//성북구
	   	centerPositionX=37.589;
		centerPositionY=127.0167;
	  }else if(thisDangArea==songpa){//송파구
	   	centerPositionX=37.5148;
		centerPositionY=127.1061;
	  }else if(thisDangArea==yangcheon){//양천구
	   	centerPositionX=37.5168;
		centerPositionY=126.8661;
	  }else if(thisDangArea==ydp){//영등포구
	   	centerPositionX=37.5267;
		centerPositionY=126.8954;
	  }else if(thisDangArea==yongsan){//용산구
	   	centerPositionX=37.5324;
		centerPositionY=126.9909;
	  }else if(thisDangArea==ep){//은평구
	   	centerPositionX=37.6026;
		centerPositionY=126.9291;
	  }else if(thisDangArea==jongno){//종로구
	   	centerPositionX=37.5735;
		centerPositionY=126.9793;
	  }else if(thisDangArea==junggu){//중구
	   	centerPositionX=37.564;
		centerPositionY=126.9974;
	  }else{
		centerPositionX=37.6061;
		centerPositionY=127.0932;
	  }
        
        var mapContainerInsert = document.getElementById('insertMap'), // 지도를 표시할 div  
            mapOptionInsert = {
                center: new kakao.maps.LatLng(centerPositionX,
                		centerPositionY), // 지도의 중심좌표 
                
                // 지도의 확대 레벨 
            };
        var insertMap = new kakao.maps.Map(mapContainerInsert, mapOptionInsert); // 지도를 생성합니다
        
      
  		$('#staticBackdrop').on('shown.bs.modal', function (e) {
   			insertMap.relayout();
 		})
        var clickedOverlay = null;//클릭이벤트 오버레이 전역변수 초기값
        // 카페 마커가 표시될 좌표 배열입니다
        var cafePositionsInsert = [
        ];
        // 음식점 마커가 표시될 좌표 배열입니다
        var foodPositionsInsert = [
        ];
        //  운동장 마커가 표시될 좌표 배열입니다
        var fieldPositionsInsert = [
        ];
        //  미용 마커가 표시될 좌표 배열입니다
        var dogsalonPositionsInsert = [
        ];
        //  공원 마커가 표시될 좌표 배열입니다
        var parkPositionsInsert = [
        ];
        // 카페에 정보를 담을 배열
        var contentCafeInsert = [];
        // 음식점에 정보를 담을 배열
        var contentFoodInsert = [];
        // 운동장에 정보를 담을 배열
        var contentFieldInsert = [];
        // 미용에 정보를 담을 배열
        var contentDogsalonInsert = [];
        // 공원에 정보를 담을 배열
        var contentParkInsert = [];
        $.ajax({
            url: "http://localhost:8888/rest_place/place_list",
            method: "get",
            async: false,
            contentType: "application/json",
            success: function (resp) {
                for (var i = 0; i < resp.length; i++) {
                    if (resp[i].placeSort === "카페") {//DB에서 불러온 값이 카페이면 카페정보배열에 밀어넣기
                        cafePositionsInsert.push(new kakao.maps.LatLng(
                            resp[i].placeX, resp[i].placeY))
                        contentCafeInsert.push(resp[i]);
                    } else if (resp[i].placeSort === "음식점") {
                        foodPositionsInsert.push(new kakao.maps.LatLng(
                            resp[i].placeX, resp[i].placeY))
                        contentFoodInsert.push(resp[i]);
                    } else if (resp[i].placeSort === "운동장") {
                        fieldPositionsInsert.push(new kakao.maps.LatLng(
                            resp[i].placeX, resp[i].placeY))
                        contentFieldInsert.push(resp[i]);
                    } else if (resp[i].placeSort === "미용") {
                        dogsalonPositionsInsert.push(new kakao.maps.LatLng(
                            resp[i].placeX, resp[i].placeY))
                        contentDogsalonInsert.push(resp[i]);
                    } else if (resp[i].placeSort === "공원") {
                    	parkPositionsInsert.push(new kakao.maps.LatLng(
                            resp[i].placeX, resp[i].placeY))
                        contentParkInsert.push(resp[i]);
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
        cafeMarkersInsert = [], // 카페 마커 객체를 가지고 있을 배열입니다
            foodMarkersInsert = [], // 음식점 마커 객체를 가지고 있을 배열입니다
            fieldMarkersInsert = []; // 운동장 마커 객체를 가지고 있을 배열입니다
        dogsalonMarkersInsert = []; // 미용 마커 객체를 가지고 있을 배열입니다
        parkMarkersInsert = []; // 공원 마커 객체를 가지고 있을 배열입니다
        createcafeMarkersInsert(); // 카페 마커를 생성하고 카페 마커 배열에 추가합니다
        createfoodMarkersInsert(); // 음식점 마커를 생성하고 음식점 마커 배열에 추가합니다
        createfieldMarkersInsert(); // 운동장 마커를 생성하고 운동장 마커 배열에 추가합니다
        createdogsalonMarkersInsert(); // 미용 마커를 생성하고 운동장 마커 배열에 추가합니다
        createparkMarkersInsert(); // 공원 마커를 생성하고 운동장 마커 배열에 추가합니다
        changeInsertMarker('cafeInsert'); // 지도에 카페 마커가 보이도록 설정합니다
        
        
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
        function createcafeMarkersInsert() {
            for (var i = 0; i < cafePositionsInsert.length; i++) {
                var imageSize = new kakao.maps.Size(40, 26), imageOptions = {
                    spriteOrigin: new kakao.maps.Point(0, 0),
                    spriteSize: new kakao.maps.Size(20, 20)
                };
                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(cafemarkerImageSrc,
                    imageSize, imageOptions), marker = createMarker(
                        cafePositionsInsert[i], markerImage);
                // 생성된 마커를 카페 마커 배열에 추가합니다
                //makeOverListener(map, marker, infowindow)
                cafeMarkersInsert.push(marker);
                kakao.maps.event
                    .addListener(
                        marker,
                        'click',
                        function () {
                            for (var i = 0; i < cafePositionsInsert.length; i++) {
                                var thisPositions = this.getPosition().Ma
                                var contentPositions = contentCafeInsert[i].placeX
                                if (contentPositions.toFixed(7) === thisPositions.toFixed(7)) {
                                    placeOriginNo = contentCafeInsert[i].placeNo;
                                    content = '<div class="customoverlay">'
                                        + '  <a class="edit" data-placeno=' + contentCafeInsert[i].placeNo + ' target="_blank">'
                                        + '    <span class="title " data-placeno=' + contentCafeInsert[i].placeNo + ' >'
                                        + contentCafeInsert[i].placeName
                                        + '</span>'
                                        + '  </a>'
                                        + '</div>';
                                }
                            }
                            var position = this.getPosition();
                            // 커스텀 오버레이를 생성합니다
                            var customOverlay = new kakao.maps.CustomOverlay(
                                {
                                    map: insertMap,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(insertMap);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        // 카페 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setcafeMarkersInsertInsert(insertMap) {
            for (var i = 0; i < cafeMarkersInsert.length; i++) {
                cafeMarkersInsert[i].setMap(insertMap);
            }
        }
        // 음식점 마커를 생성하고 음식점 마커 배열에 추가하는 함수입니다
        function createfoodMarkersInsert() {
            for (var i = 0; i < foodPositionsInsert.length; i++) {
                var imageSize = new kakao.maps.Size(40, 26), imageOptions = {
                    spriteOrigin: new kakao.maps.Point(0, 0),
                    spriteSize: new kakao.maps.Size(20, 20)
                };
                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(foodmarkerImageSrc, imageSize,
                    imageOptions), marker = createMarker(foodPositionsInsert[i],
                        markerImage);
                // 생성된 마커를 음식점 마커 배열에 추가합니다
                foodMarkersInsert.push(marker);
                kakao.maps.event
                    .addListener(
                        marker,
                        'click',
                        function () {
                            for (var i = 0; i < foodPositionsInsert.length; i++) {
                                var thisPositions = this.getPosition().Ma
                                var contentPositions = contentFoodInsert[i].placeX
                                if (contentPositions.toFixed(7) === thisPositions.toFixed(7)) {
                                    placeOriginNo = contentFoodInsert[i].placeNo;
                                    content = '<div class="customoverlay">'
                                        + '  <a class="edit" data-placeno=' + contentFoodInsert[i].placeNo + ' target="_blank">'
                                        + '    <span class="title " data-placeno=' + contentFoodInsert[i].placeNo + ' >'
                                        + contentFoodInsert[i].placeName
                                        + '</span>'
                                        + '  </a>'
                                        + '</div>';
                                }
                            }
                            var position = this.getPosition();
                            // 커스텀 오버레이를 생성합니다
                            var customOverlay = new kakao.maps.CustomOverlay(
                                {
                                    map: insertMap,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(insertMap);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        // 음식점 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setfoodMarkersInsertInsert(insertMap) {
            for (var i = 0; i < foodMarkersInsert.length; i++) {
                foodMarkersInsert[i].setMap(insertMap);
            }
        }
        // 운동장 마커를 생성하고 운동장 마커 배열에 추가하는 함수입니다
        function createfieldMarkersInsert() {
            for (var i = 0; i < fieldPositionsInsert.length; i++) {
                var imageSize = new kakao.maps.Size(40, 26), imageOptions = {
                    spriteOrigin: new kakao.maps.Point(0, 0),
                    spriteSize: new kakao.maps.Size(20, 20)
                };
                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(fieldmarkerImageSrc, imageSize,
                    imageOptions), marker = createMarker(fieldPositionsInsert[i],
                        markerImage);
                // 생성된 마커를 운동장 마커 배열에 추가합니다
                fieldMarkersInsert.push(marker);
                kakao.maps.event
                    .addListener(
                        marker,
                        'click',
                        function () {
                            for (var i = 0; i < fieldPositionsInsert.length; i++) {
                                var thisPositions = this.getPosition().Ma
                                var contentPositions = contentFieldInsert[i].placeX
                                if (contentPositions.toFixed(7) === thisPositions.toFixed(7)) {
                                    placeOriginNo = contentFieldInsert[i].placeNo;
                                    content = '<div class="customoverlay">'
                                        + '  <a class="edit" data-placeno=' + contentFieldInsert[i].placeNo + ' target="_blank">'
                                        + '    <span class="title " data-placeno=' + contentFieldInsert[i].placeNo + ' >'
                                        + contentFieldInsert[i].placeName
                                        + '</span>'
                                        + '  </a>'
                                        + '</div>';
                                }
                            }
                            var position = this.getPosition();
                            // 커스텀 오버레이를 생성합니다
                            var customOverlay = new kakao.maps.CustomOverlay(
                                {
                                    map: insertMap,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(insertMap);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        // 운동장 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setfieldMarkersInsertInsert(insertMap) {
            for (var i = 0; i < fieldMarkersInsert.length; i++) {
                fieldMarkersInsert[i].setMap(insertMap);
            }
        }
        // 미용 마커를 생성하고 미용 마커 배열에 추가하는 함수입니다
        function createdogsalonMarkersInsert() {
            for (var i = 0; i < dogsalonPositionsInsert.length; i++) {
                var imageSize = new kakao.maps.Size(40, 26), imageOptions = {
                    spriteOrigin: new kakao.maps.Point(0, 0),
                    spriteSize: new kakao.maps.Size(20, 20)
                };
                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(dogsalonmarkerImageSrc, imageSize,
                    imageOptions), marker = createMarker(
                        dogsalonPositionsInsert[i], markerImage);
                // 생성된 마커를 미용 마커 배열에 추가합니다
                dogsalonMarkersInsert.push(marker);
                kakao.maps.event
                    .addListener(
                        marker,
                        'click',
                        function () {
                            for (var i = 0; i < dogsalonPositionsInsert.length; i++) {
                                var thisPositions = this.getPosition().Ma
                                var contentPositions = contentDogsalonInsert[i].placeX
                                if (contentPositions.toFixed(7) === thisPositions.toFixed(7)) {
                                    placeOriginNo = contentDogsalonInsert[i].placeNo;
                                    content = '<div class="customoverlay">'
                                        + '  <a class="edit" data-placeno=' + contentDogsalonInsert[i].placeNo + ' target="_blank">'
                                        + '    <span class="title " data-placeno=' + contentDogsalonInsert[i].placeNo + ' >'
                                        + contentDogsalonInsert[i].placeName
                                        + '</span>'
                                        + '  </a>'
                                        + '</div>';
                                }
                            }
                            var position = this.getPosition();
                            // 커스텀 오버레이를 생성합니다
                            var customOverlay = new kakao.maps.CustomOverlay(
                                {
                                    map: insertMap,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(insertMap);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        // 미용 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setdogsalonMarkersInsertInsert(insertMap) {
            for (var i = 0; i < dogsalonMarkersInsert.length; i++) {
                dogsalonMarkersInsert[i].setMap(insertMap);
            }
        }
        // 공원 마커를 생성하고 공원 마커 배열에 추가하는 함수입니다
        function createparkMarkersInsert() {
            for (var i = 0; i < parkPositionsInsert.length; i++) {
                var imageSize = new kakao.maps.Size(40, 26), imageOptions = {
                    spriteOrigin: new kakao.maps.Point(0, 0),
                    spriteSize: new kakao.maps.Size(20, 20)
                };
                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(parkmarkerImageSrc, imageSize,
                    imageOptions), marker = createMarker(parkPositionsInsert[i],
                        markerImage);
                // 생성된 마커를 공원 마커 배열에 추가합니다
                parkMarkersInsert.push(marker);
                kakao.maps.event
                    .addListener(
                        marker,
                        'click',
                        function () {
                            for (var i = 0; i < parkPositionsInsert.length; i++) {
                                var thisPositions = this.getPosition().Ma
                                var contentPositions = contentParkInsert[i].placeX
                                if (contentPositions.toFixed(7) === thisPositions.toFixed(7)) {
                                    placeOriginNo = contentParkInsert[i].placeNo;
                                    content = '<div class="customoverlay">'
                                        + '  <a class="edit" data-placeno=' + contentParkInsert[i].placeNo + ' target="_blank">'
                                        + '    <span class="title " data-placeno=' + contentParkInsert[i].placeNo + ' >'
                                        + contentParkInsert[i].placeName
                                        + '</span>'
                                        + '  </a>'
                                        + '</div>';
                                }
                            }
                            var position = this.getPosition();
                            // 커스텀 오버레이를 생성합니다
                            var customOverlay = new kakao.maps.CustomOverlay(
                                {
                                    map: insertMap,
                                    position: position,
                                    content: content,
                                    yAnchor: 1
                                });
                            //다른 마커 클릭시 오버레이 닫기
                            if (clickedOverlay) {
                                clickedOverlay.setMap(null);
                            }
                            customOverlay.setMap(insertMap);
                            clickedOverlay = customOverlay;
                        });
            }
        }
        // 공원 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setparkMarkersInsertInsert(insertMap) {
            for (var i = 0; i < parkMarkersInsert.length; i++) {
                parkMarkersInsert[i].setMap(insertMap);
            }
        }
        // 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
        function changeInsertMarker(type) {
            var cafeMenuInsert = document.getElementById('cafeMenuInsert');
            var foodMenuInsert = document.getElementById('foodMenuInsert');
            var fieldMenuInsert = document.getElementById('fieldMenuInsert');
            var dogsalonMenuInsert = document.getElementById('dogsalonMenuInsert');
            var parkMenuInsert = document.getElementById('parkMenuInsert');
            // 카페 카테고리가 클릭됐을 때
            if (type === 'cafeInsert') {
                // 카페 카테고리를 선택된 스타일로 변경하고
                cafeMenuInsert.className = 'menu_selected';
                // 음식점과 운동장과 미용 카테고리는 선택되지 않은 스타일로 바꿉니다
                foodMenuInsert.className = '';
                fieldMenuInsert.className = '';
                dogsalonMenuInsert.className = '';
                parkMenuInsert.className = '';
                // 카페 마커들만 지도에 표시하도록 설정합니다
                setcafeMarkersInsertInsert(insertMap);
                setfoodMarkersInsertInsert(null);
                setfieldMarkersInsertInsert(null);
                setdogsalonMarkersInsertInsert(null);
                setparkMarkersInsertInsert(null);
            } else if (type === 'foodInsert') { // 음식점 카테고리가 클릭됐을 때
                // 음식점 카테고리를 선택된 스타일로 변경하고
                cafeMenuInsert.className = '';
                foodMenuInsert.className = 'menu_selected';
                fieldMenuInsert.className = '';
                dogsalonMenuInsert.className = '';
                parkMenuInsert.className = '';
                // 음식점 마커들만 지도에 표시하도록 설정합니다
                setcafeMarkersInsertInsert(null);
                setfoodMarkersInsertInsert(insertMap);
                setfieldMarkersInsertInsert(null);
                setdogsalonMarkersInsertInsert(null);
                setparkMarkersInsertInsert(null);
            } else if (type === 'fieldInsert') { // 운동장 카테고리가 클릭됐을 때
                // 운동장 카테고리를 선택된 스타일로 변경하고
                cafeMenuInsert.className = '';
                foodMenuInsert.className = '';
                fieldMenuInsert.className = 'menu_selected';
                dogsalonMenuInsert.className = '';
                parkMenuInsert.className = '';
                // 운동장 마커들만 지도에 표시하도록 설정합니다
                setcafeMarkersInsertInsert(null);
                setfoodMarkersInsertInsert(null);
                setfieldMarkersInsertInsert(insertMap);
                setdogsalonMarkersInsertInsert(null);
                setparkMarkersInsertInsert(null);
            } else if (type === 'dogsalonInsert') {
                // 미용 카테고리를 선택된 스타일로 변경하고
                cafeMenuInsert.className = '';
                foodMenuInsert.className = '';
                fieldMenuInsert.className = '';
                dogsalonMenuInsert.className = 'menu_selected';
                parkMenuInsert.className = '';
                // 미용 마커들만 지도에 표시하도록 설정합니다
                setcafeMarkersInsertInsert(null);
                setfoodMarkersInsertInsert(null);
                setfieldMarkersInsertInsert(null);
                setdogsalonMarkersInsertInsert(insertMap);
                setparkMarkersInsertInsert(null);
            } else if (type === 'parkInsert') {
                // 공원 카테고리를 선택된 스타일로 변경하고
                cafeMenuInsert.className = '';
                foodMenuInsert.className = '';
                fieldMenuInsert.className = '';
                dogsalonMenuInsert.className = '';
                parkMenuInsert.className = 'menu_selected';
                // 공원 마커들만 지도에 표시하도록 설정합니다
                setcafeMarkersInsertInsert(null);
                setfoodMarkersInsertInsert(null);
                setfieldMarkersInsertInsert(null);
                setdogsalonMarkersInsertInsert(null);
                setparkMarkersInsertInsert(insertMap);
            }
        }

    </script>
    
    <script>
		$(function(){
			
			var now_utc = Date.now()
			var timeOff = new Date().getTimezoneOffset()*60000;
			var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
			document.getElementById("Date").setAttribute("min", today);
			
			$(".invalid-money").hide();
			
	 		//참여 회비는 1백만원미만으로 제한(6자)
	 		$(document).on("input", ".money", function(){
	 			
				var moneyLength = $(this).val().length;
				
				console.log(moneyLength);
				
				if(moneyLength >= 7) {
					$(".invalid-money").show();
				}
			});

			//모달 띄워지기 직전 캘린더 미리 생성
			$("#day-check-modal").on("shown.bs.modal", function () {
				createCalendar();
				
			});
			
			//출석체크 모달
			var isDoubleClick = false; //더블클릭 방지체크
			$(document).on("click",".day-check",function(){
				var attendance = $(".checkAttendance").text();
				console.log("출석 상태 = "+attendance);
				
				if(attendance=='출석 완료'){
					isDoubleClick = true;
				}else{
					isDoubleClick = false;
				}

				if(attendance=='출석 완료' && isDoubleClick==true){
					$(".close-btn").show();
					$(".attendance-btn").hide();
					//모달 타이틀 문구 변경
					$(".modal-title-fir").text("출석 체크가 ");
					$(".modal-title-sec").text("완료");
					$(".modal-title-third").text(" 되었습니다!");
					return;
				}else{
					$(".close-btn").hide();
					$(".attendance-btn").show();
				}
			});
			
			//출석하기 버튼
			$(document).on("click",".attendance-btn",function(){
				var memberNo = $("[name=memberNo]").val();
				var attendance = $(".checkAttendance").text();
				
				if(attendance=='출석 체크' && isDoubleClick==false){
					console.log("출석기록 없음!");
					
					//1. 오늘날짜 배경에 로고 이미지 넣기
					var today = $('#calendar').children().find(".fc-day-today");
					today.addClass("addImg");
					
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
	                    	isDoubleClick = true;
	                  		//버튼 막기
	                  		$(".attendance-btn").hide();
	                    	$(".close-btn").show();

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
						
				}else{
					console.log("출석기록 있음!");
					isDoubleClick = false;
					return;
				}
				
			});
			
			//출석모달 닫기
			$(".close-btn").click(function(){
				var today = $('#calendar').children().find(".fc-day-today");
				today.removeClass("addImg");
			});
			
			//프로필 수정
			//프로필 클릭하면 첨부파일 열림
			$(".profile-img").click(function(){
				$(".input-file").click();
			});
			
			var sideProfilePreviewNoList = []; //미리보기 리스트
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
	                    	sideProfilePreviewNoList.push(newAttachmentNo); //미리보기 배열에 값 넣기
	                    	
	                    	//페이지 벗어나면 첨부파일 DB 삭제
	                    	$(window).on("beforeunload", function(){
	                    		var originAttachmentNo = $("[name=originAttachmentNo]").val();
	                    		console.log("페이지 벗어남!");
	                    		
	                			if(sideProfilePreviewNoList.length == 0) {
	                				return;
	                			}
	                			
	                			$.ajax({
	                				url : "${pageContext.request.contextPath}/rest_attachment/delete_preview",
	                				method : "delete",
	                				data : {
	                					attachmentPreviewNoList : sideProfilePreviewNoList
	                				}
	                			});
	                    		$("[name=attachmentNo]").val(originAttachmentNo);
	                    		sideProfilePreviewNoList.length=0;
							});	
				        }
					});
				}
			});
			
			//모달 취소버튼 클릭 시 첨부파일 DB 삭제
			$(".p-cancel-btn").click(function(){
				var originAttachmentNo = $("[name=originAttachmentNo]").val();
				console.log("모달 취소 버튼 클릭");
				console.log(sideProfilePreviewNoList);
				deleteAttachmentNo(sideProfilePreviewNoList);
				$("[name=attachmentNo]").val(originAttachmentNo);
				sideProfilePreviewNoList.length=0;
				console.log("배열값 0으로 변경!");
				console.log(sideProfilePreviewNoList);
			});
			
			//프로필 수정 전 준비
			$(document).on("click",".profile-edit",function(){
				var originAttachmentNo = $("[name=originAttachmentNo]").val();
				console.log(originAttachmentNo);
				if(originAttachmentNo==""){
					$(".change-img").attr("src","${pageContext.request.contextPath}/images/basic-profile.png");
				}else{
					$(".change-img").attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+originAttachmentNo); //기존 프로필이미지
				}
				
				var originMemberNick = $(".originNickName").text(); //기존 닉네임
				var originMessage = $(".originMessage").text(); //기존 상태메세지
				
				$("[name=memberNick]").val(originMemberNick).removeClass("is-valid is-invalid invalid");
				$("[name=memberMessage]").val(originMessage).removeClass("is-valid is-invalid invalid");
			});		
			
			//입력 항목 상태 판정
			check={
					memberNick : false, memberNickRegex : /^[a-zA-Z0-9ㄱ-ㅎ가-힣]{1,6}$/,
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
	    		    		async:false,
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
					$(".length").css("color","#495057").text(30);
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
				var roomNo = $("[name=roomNo]").val();
				var attachmentNo=$("[name=attachmentNo]").val();
				var originAttachmentNo = $("[name=originAttachmentNo]").val();
				var memberNo = $("[name=memberNo]").val();
				var originMemberNick = $(".originNickName").text(); //기존 닉네임
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
							async:false,
							contentType:"application/json",
							data:JSON.stringify(imgInsertData),
							success:function(){
								//배열속 값이 1일 경우 비동기화 요청 중지
								if(sideProfilePreviewNoList.length == 1) {
									return;
								}
								
								//마지막 업로드 파일 제외한 나머지 파일 삭제
								for(var i=sideProfilePreviewNoList.length-2; i>=0; i--){
									$.ajax({
										url:"${pageContext.request.contextPath}/rest_attachment/delete/"+sideProfilePreviewNoList[i],
										method:"delete",
										async:false,
										data:sideProfilePreviewNoList[i],
										success:function(resp){
											console.log("나머지 파일 삭제!");
										}
									});
								}
								
								//배열 초기화
								sideProfilePreviewNoList.length=0;
							}
						});
					}else{
						if(attachmentNo!=originAttachmentNo){  //1 새로운 파일 있을 경우 insert 후 기존파일 삭제처리
							$.ajax({ //1
								url:"${pageContext.request.contextPath}/rest_user/img_insert",
								method:"post",
								async:false,
								contentType:"application/json",
								data:JSON.stringify(imgInsertData),
								success:function(){
									$.ajax({
										url:"${pageContext.request.contextPath}/rest_attachment/delete/"+originAttachmentNo,
										method:"delete",
										async:false,
										data:originAttachmentNo,
										success:function(resp){
											$("[name=originAttachmentNo]").val(attachmentNo);
											console.log("원래 사진 삭제");
										}
									});
									
									//배열속 값이 1일 경우 비동기화 요청 중지
									if(sideProfilePreviewNoList.length == 1) {
										return;
									}
									
									//마지막 업로드 파일 제외한 나머지 파일 삭제
									for(var i=sideProfilePreviewNoList.length-2; i>=0; i--){
										$.ajax({
											url:"${pageContext.request.contextPath}/rest_attachment/delete/"+sideProfilePreviewNoList[i],
											method:"delete",
											async:false,
											data:sideProfilePreviewNoList[i],
											success:function(resp){
												console.log("나머지 파일 삭제!");
											}
										});
									}
									
									//배열 초기화
									sideProfilePreviewNoList.length=0;
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
						async:false,
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
								
								//기존 게시글 닉네임 변경
								updateNickData={
										memberNo:memberNo,
										memberNick:memberNick
								}
								$.ajax({
									url:"${pageContext.request.contextPath}/rest_board/update_nick",
									method:"patch",
									async:false,
									contentType:"application/json",
									data:JSON.stringify(updateNickData),
									success:function(resp){
										//이미 출력된 기존 닉네임을 새로운 닉네임으로 변경
										var nickcheck = $(".board-box").children().find(".nick-font");
										//기존 닉네임과 예전 닉네임이 같을 경우
										//원래 닉네임과 새로운 닉네임이 다를 경우 변경
										for(var i=0; i<nickcheck.length; i++){
											var nick = nickcheck.eq(i).text();
											if(nick==originMemberNick && originMemberNick!=memberNick){
												nickcheck.eq(i).text(memberNick);
											}
										}
									}
								});
								//댓글 닉네임 변경
								$.ajax({
									url:"${pageContext.request.contextPath}/rest_reply/update_nick",
									method:"patch",
									async:false,
									contentType:"application/json",
									data:JSON.stringify(updateNickData),
									success:function(resp){
										
										//이미 출력된 기존 닉네임을 새로운 닉네임으로 변경
										var nickcheck = $(".reply-box").children().find(".re-nick-font");
										//기존 닉네임과 예전 닉네임이 같을 경우
										//원래 닉네임과 새로운 닉네임이 다를 경우 변경
										for(var i=0; i<nickcheck.length; i++){
											var nick = nickcheck.eq(i).text();
											if(nick==originMemberNick && originMemberNick!=memberNick){
												nickcheck.eq(i).text(memberNick);
											}
										}
									}
								});
								
								
								//채팅 닉네임 변경
								updateChatNickData={
										userNo:userNo,
										roomNo:roomNo,
										memberNick:memberNick
								}
								$.ajax({
									url:"${pageContext.request.contextPath}/rest_chat/update_nick",
									method:"patch",
									async:false,
									contentType:"application/json",
									data:JSON.stringify(updateChatNickData),
									success:function(resp){
									}
								});
								
								//멤버 프로필 사진, 닉네임, 상태메세지 변경
								var mTag = $(".m-profile-info[data-mno="+memberNo+"]");
								var url = "${pageContext.request.contextPath}/rest_attachment/download/"+attachmentNo;
								mTag.attr("src",url);
								mTag.parent().next().children().text(memberNick);
								mTag.parent().next().children().next().text(memberMessage);
								
								//헤더 프로필 변경
								$(".img-user-profile").attr("src",url);
								
								//게시판 프로필 사진 변경
								var bTag = $(".board-box[data-mno="+memberNo+"]").children().find(".b-profile-info").children();
								bTag.attr("src",url);
								
								//대화 프로필 사진 변경
								var cTag =  $(".c-profile-info[data-uno="+userNo+"]");
								cTag.attr("src",url);
							}
						}
					});
				}
			});
			
			//신고 처리
			$(".modal-profile-report-btn").click(function(){
				var memberNo = $(this).data("mno"); //신고당한 사람의 memberNo
				location.href="${pageContext.request.contextPath}/dang/report/"+memberNo
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
			function deleteAttachmentNo(sideProfilePreviewNoList){
				console.log("함수안 삭제 실행중!");
				console.log(sideProfilePreviewNoList);
				if(sideProfilePreviewNoList.length == 0) {
					return;
				}
				$.ajax({
					url : "${pageContext.request.contextPath}/rest_attachment/delete_preview",
					method : "delete",
					async:false,
					data : {
						attachmentPreviewNoList : sideProfilePreviewNoList
					},
					success:function(resp){
						console.log("삭제성공!");
						console.log(resp);
					}
				});
			}
			
			//일정등록 모달에서 등록 버튼 클릭
			$(".write-btn").click(function(e){
				console.log(${profile.memberNo});
				var memberNo = ${profile.memberNo};
				var scheduleTitle = $("[name=scheduleTitle]").val();
				var scheduleContent =$("[name=scheduleContent]").val();
				var scheduleStart = $("[name=scheduleStart]").val();
				var scheduleHour = $("[name=scheduleHour]").val();
				var placeNo = $(".where").attr('data-placeno');
				var scheduleHeadmax = $("[name=scheduleHeadmax]").val();
				var scheduleMoney = $("[name=scheduleMoney]").val();
				saveData(scheduleTitle, memberNo, scheduleContent, scheduleStart, scheduleHour, placeNo, scheduleHeadmax, scheduleMoney); 
			});
	
			//일정등록 모달에서 취소 버튼 클릭시 일정등록 모달 닫기 및 내용초기화
			$(document).on("click",".write-cancel",function(){
				console.log("취소버튼클릭");
				$(".schedule-name").val(""); //일정 제목
				$(".write-content").val(""); //일정 내용
				$(".when-date ").val(""); //일정 날짜
				$(".when-time").val(""); //일정 시간		
				$(".where").val(""); //장소
				$("#persons").prop("selected", true);//최대 참여인원							
				$(".money").val(""); //회비 
			});
			
			//일정 등록 함수
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
				var result = confirm("일정을 등록하시겠습니까?")
				
				if(result ==true){
					$.ajax({
						url:"http://localhost:8888/rest/dangSchedule/schedule_insert",
						method:"post",
						contentType:"application/json",
						data:JSON.stringify(data),
						success:function(resp){
							console.log("수정성공");	
							
							location.href='http://localhost:8888/dang/'+${dangNo}+'/schedule_detail?scheduleNo='+resp;
							
							//var placeNo = $(".schedule-where").attr('data-placeno');
						}
					});
					alert("일정 등록이 완료되었습니다.")
				}
				else {
					alert("일정 등록이 취소되었습니다.")
					//적혀진 값들 지우기
					
				}
			}
			
			//프로필 상세 정보(게시글)
			$(document).on("click",".b-profile-info",function(){
				var memberNo = $(this).parents(".board-box").data("mno");
				var url = $(this).children().attr("src");
				detailInfo(memberNo, url);
			});
			//프로필 상세 정보(댓글)
			$(document).on("click",".r-profile-info",function(){
				var memberNo = $(this).data("mno");
				var url = $(this).attr("src");
				detailInfo(memberNo, url);
			});
			//프로필 상세 정보(채팅)
			$(document).on("click",".c-profile-info",function(){
				var dangNo = $("[name=dangNo]").val();
				var userNo = $(this).data("uno");
				var url = $(this).attr("src");
				//유저번호로 멤버번호 찾기
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_member/find_member_no?userNo="+userNo+"&dangNo="+dangNo,
					method:"get",
					success:function(resp){
						detailInfo(resp, url);
					}
				});
			});
			
			//프로필 상세정보(멤버)
			$(document).on("click",".m-profile-info",function(){
				var memberNo = $(this).data("mno");
				var url = $(this).attr("src");
				detailInfo(memberNo, url);
			});
			
			//프로필 상세정보 함수
			function detailInfo(memberNo, url){
				var originMemberNo = $("[name=memberNo]").val();	
			
				$(".profile-info-owner").attr("style","dispaly:none;")
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_member/find_member?memberNo="+memberNo,
					method:"get",
					success:function(resp){
						console.log(resp);
						if(resp.memberOwner=='Y'){
							$(".profile-info-owner").show();
						}
						$(".profile-info-img").attr("src",url);
						$(".profile-info-nick").text(resp.memberNick);
						$(".profile-info-message").text(resp.memberMessage);
						$(".profile-info-grade").text(resp.memberGrade);
						var text = resp.memberScore+"점";
						$(".profile-info-score").text(text);
						if(originMemberNo==memberNo){
							$(".modal-profile-report-btn").hide();
						}else{
							$(".modal-profile-report-btn").show();
							$(".modal-profile-report-btn").attr("data-mno",resp.memberNo);
						}
						$("#profile-info-modal").modal("show");
					}
				});
			}
			
		});
	</script>