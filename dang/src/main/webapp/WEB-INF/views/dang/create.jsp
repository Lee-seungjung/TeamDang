<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="댕모임 개설" name="title"/>
</jsp:include>

<style>
	
	* {
		
	}
	
	.strong-create-dang-title {
		font-size : 28px;
	}
	
	.strong-create-dang-category {
		font-size : 20px;
	}
	
	input, textarea, select {
		border-radius : 10px;
		border : 1px solid #76BEFF;
	}
	
	input:focus, textarea:focus, select:focus {
		outline : 2px solid #76BEFF;
	}
	
	.img-member-profile {
		border-radius: 50%;
	}
	
	.img-dang-profile {
		border-radius : 10px;
		aspect-ratio : 5/3;
	}
	
	.input-dang-profile {
		display : none;
	}	
	
	.OUTLINE {
        stroke-linejoin: round;
        stroke: #F5F2FF;
        stroke-width: 2;
        fill :#17065B;
    }

    .POINT {
        stroke: black;
        stroke-width: 1;
        fill: #ffffff;
    }

    .TEXT {
        stroke: #ffffff;
        stroke-width : 1;
        stroke-linecap: round;
        text-anchor: middle;
        alignment-baseline: middle;
        cursor: pointer;
    }

    .area-selected {
        fill : #4C28DD;
    }
    
    .btn-submit-create {
		background-color : #76BEFF;
		color : white;
		border: none;
		border-radius : 5px;
		font-size : 20px;
    }
    
    .span-dang-name-count-max,
    .span-dang-info-count-max {
    	color : red;
    }
    
    .div-create-dang-dang-info,
    .div-create-dang-dang-creator-info {
    	border : 1px solid #E8E8E8;
		border-radius : 15px;
    }
	
</style>

<form action = "create" method = "post" enctype="multipart/form-data" class = "form-create-dang container-fluid my-3 mb-5">
	<div class = "row">
		<div class = "col-6 offset-3">
			<div class = "row my-3">	
				<div class = "col-8 offset-2 px-5 shadow div-create-dang-dang-info">
					<div class = "row my-5">
						<div class = "col d-flex justify-content-center align-items-center">	
							<strong class = "strong-create-dang-title">댕모임 개설</strong>	
						</div>
					</div>
					<div class = "row my-3">
						<div class = "col">	
							<div class = "row">
								<strong class = "strong-create-dang-category">댕모임 프로필 사진</strong>	
							</div>
							<div class = "row my-3">
								<label for = "dangProfile" class = "col">
									<img src = "${pageContext.request.contextPath}/images/img-dang-profile.png" class = "w-100 img-dang-profile">
									<input name = "dangProfile" type = "file" id = "dangProfile" class = "input-dang-profile" accept = ".png, .jpg">
								</label>
							</div>
						</div>
					</div>
					<div class = "row my-3">
						<div class = "col">
							<div class = "row">
								<div class = "col d-flex">								
									<strong class = "strong-create-dang-category me-3">댕모임명</strong>
									<span class = "span-dang-name-count">
										[
										<span class = "span-dang-name">0</span>
										<span class = "span-dang-name-max"> / 10</span>
										]
									</span>
								</div>
							</div>
							<div class = "row my-3">		
								<div class = "col">								
									<input name = "dangName" type = "text" class = "w-100 p-2" placeholder = "댕모임명(10글자)">
								</div>					
							</div>
							<div class = "row my-3">		
								<div class = "col div-check-dang-name"></div>					
							</div>
						</div>
					</div>
					<div class = "row my-3">
						<div class = "col">
							<div class = "row">		
								<div class = "col d-flex">
									<strong class = "strong-create-dang-category me-3">댕모임 정보</strong>
									<span class = "span-dang-info-count">
										[
										<span class = "span-dang-info">0</span>
										<span class = "span-dang-info-max"> / 30</span>
										]
									</span>
								</div>					
							</div>
							<div class = "row my-3">			
								<div class = "col d-flex justify-content-center align-items-center">								
									<textarea name = "dangInfo" style="resize: none;" cols = "2" class = "textarea-dang-info w-100 p-2" placeholder = "댕모임 정보"></textarea>
								</div>				
							</div>
						</div>
					</div>
					<div class = "row mb-3">
						<div class = "col">
							<div class = "row">							
								<strong class = "strong-create-dang-category">댕모임 인원수</strong>
							</div>
							<div class = "row my-3">
								<div class = "col">								
									<select name = "dangHeadmax" class = "p-2 w-100">
										<option value = "">인원수</option>
										<c:forEach var = "i" begin = "5" end = "20" step = "5">
										<option value = "${i}">${i}</option>
										</c:forEach>
									</select>
								</div>					
							</div>
							<div class = "row my-3">		
								<div class = "col div-check-dang-headmax"></div>					
							</div>
						</div>
					</div>
					<div class = "row my-3"> <%-- form에 태그를 생성해서 전송해야 하는 부분 시작 --%>
						<div class = "col">
							<div class = "row">							
								<strong class = "strong-create-dang-category">댕모임 공개/비공개</strong>
							</div>
							<div class = "row my-3 px-2">
								<div class = "col-6 p-2">
									<input type = "radio" id = "dangPublic" class = "input-dang-private me-2">
									<span>공개</span>
								</div>
								<div class = "col-6 p-2">
									<input type = "radio" id = "dangPrivate" class = "input-dang-private me-2">
									<span>비공개</span>
								</div>
							</div>
							<div class = "row div-dang-password">
								<div class = "col">
									<input class = "input-dang-password w-100 p-2" type = "text" placeholder = "비밀번호(숫자 4자리)">
								</div>
							</div> <%-- form에 태그를 생성해서 전송해야 하는 부분 끝 --%>
							<div class = "row my-3">		
								<div class = "col div-check-dang-public"></div>					
							</div>
						</div>
					</div>
					<div class = "row my-3"> <%-- 지역은 차후 수정 --%>
						<div class = "col">
							<div class = "row">
								<strong class = "strong-create-dang-category">활동 지역</strong>
							</div>
							<div class = "row my-3">
								<div class = "col-10 offset-1">
									<svg class = "w-100 h-100" style='background:white;overflow:visible' width="800" height="656" xmlns="http://www.w3.org/2000/svg" viewbox = "50 50 700 550">">
									    <g>
									        <path id="CD11110" class="OUTLINE"
									            d="M 455 297 l 4 -2 1 0 1 0 3 -1 4 5 7 3 2 6 0 8 -11 2 -11 1 -8 0 -9 1 -8 1 -9 1 -9 -2 -10 -1 -9 1 -4 3 -2 3 -6 -6 -3 -4 -5 -6 -4 -5 -2 -5 5 -3 0 -6 0 -10 0 -9 1 -9 -3 -4 -2 0 -2 0 -1 -4 0 -9 -5 -9 1 -10 -1 -11 -1 -6 2 -6 5 -2 7 -3 10 -2 2 -1 3 0 1 0 4 -2 8 -1 3 6 4 1 3 8 3 10 1 6 3 5 0 9 0 7 -1 5 -6 3 -6 4 -1 5 6 4 5 3 5 4 9 1 10 0 4 4 3 4 5 10 1 3 z " />
									        <path id="CD11140" class="OUTLINE"
									            d="M 477 316 l 0 9 5 5 -1 3 -4 5 -4 5 -5 4 -4 7 -3 4 -4 3 -4 10 -2 -1 -3 -7 -2 -5 -2 1 -1 0 -2 -1 -3 1 0 0 -3 1 -4 2 -5 -5 -6 -3 -10 -3 -4 -1 -3 -1 -2 2 -4 -1 -3 -1 -9 0 -2 2 -4 3 0 -7 1 -4 -2 -2 0 -1 6 -3 6 -4 -1 -2 -2 -5 2 -3 4 -3 9 -1 10 1 9 2 9 -1 8 -1 9 -1 8 0 11 -1 z " />
									        <path id="CD11170" class="OUTLINE"
									            d="M 394 349 l 3 1 4 1 2 -2 3 1 4 1 10 3 6 3 5 5 4 -2 3 -1 0 0 3 -1 2 1 1 0 2 -1 2 5 3 7 2 1 5 9 6 2 2 9 -4 5 -4 5 -5 6 -3 4 -5 4 -5 5 -5 4 -5 3 -8 8 -5 8 -7 3 -7 -1 -10 -4 -3 -1 -6 -3 -6 -5 -5 -3 -6 -3 -9 -3 1 -5 0 -10 -2 -8 -6 -11 5 -2 4 -1 5 -4 5 -6 2 -5 3 -6 6 -5 0 -3 -2 -3 4 -3 2 -2 z " />
									        <path id="CD11200" class="OUTLINE"
									            d="M 511 315 l 7 4 6 6 4 4 6 5 2 0 15 3 4 0 -5 20 -3 5 -5 12 -3 7 -10 20 -7 -4 -5 -3 -4 -4 -10 -3 -10 0 -7 0 -12 0 -8 4 -2 -9 -6 -2 -5 -9 4 -10 4 -3 3 -4 4 -7 5 -4 4 -5 4 -5 1 -3 -5 -5 0 -9 6 1 11 -1 5 -2 2 -1 6 0 z " />
									        <path id="CD11215" class="OUTLINE"
									            d="M 605 315 l 1 1 -1 4 -1 7 -2 9 3 6 4 4 3 -3 9 -1 3 3 -4 10 -2 10 -2 5 -2 4 -4 5 -5 5 -5 4 -11 12 -3 3 -3 2 -8 5 -6 3 -5 1 -5 -1 -5 -1 -6 -2 -12 -5 -7 -4 13 -27 5 -12 3 -5 5 -20 3 -8 4 -5 4 -9 7 1 11 3 9 -3 4 -3 4 -2 z " />
									        <path id="CD11230" class="OUTLINE"
									            d="M 554 245 l 2 10 -2 5 -3 6 2 9 1 6 3 9 3 6 2 3 1 11 3 5 -4 9 -4 5 -3 8 -4 0 -15 -3 -2 0 -6 -5 -4 -4 -6 -6 -7 -4 -4 -2 -6 0 -2 1 -5 2 -11 1 -6 -1 0 -8 -2 -6 6 -4 6 -5 4 -6 3 -4 4 -5 2 -3 6 -8 4 -2 8 -3 4 -5 7 -1 7 -2 4 -6 7 -2 z " />
									        <path id="CD11260" class="OUTLINE"
									            d="M 621 218 l 5 3 1 6 0 10 2 8 -3 8 -3 5 0 3 3 4 -1 6 -4 2 -5 9 0 5 -4 6 -4 3 -4 5 -3 10 -4 2 -4 3 -9 3 -11 -3 -7 -1 -3 -5 -1 -11 -2 -3 -3 -6 -3 -9 -1 -6 -2 -9 3 -6 2 -5 -2 -10 0 -8 2 -11 6 -3 4 -1 9 -4 9 1 10 1 6 -2 9 -1 z " />
									        <path id="CD11290" class="OUTLINE"
									            d="M 455 297 l -3 -2 -1 -3 -5 -10 -3 -4 -4 -4 -10 0 -9 -1 -5 -4 -5 -3 -6 -4 1 -5 6 -4 6 -3 1 -5 0 -7 0 -9 -3 -5 -1 -6 -3 -10 -3 -8 -4 -1 -3 -6 9 -5 4 -3 4 1 5 4 6 4 3 2 4 5 5 5 7 3 5 2 -1 3 0 0 0 2 1 3 5 6 9 3 4 3 5 3 8 -1 6 4 9 -4 4 -6 4 -4 4 -4 4 -6 4 -3 5 4 4 5 5 5 5 4 9 0 9 -2 -2 11 0 8 -7 1 -7 2 -4 6 -7 2 -7 1 -4 5 -8 3 -4 2 -6 8 -2 3 -4 5 -3 4 -4 6 -6 5 -6 4 -7 -3 -4 -5 -3 1 -1 0 -1 0 z " />
									        <path id="CD11305" class="OUTLINE"
									            d="M 448 87 l 2 0 1 0 0 0 4 4 3 7 4 5 4 7 3 5 1 2 -2 4 -2 6 -2 9 -2 8 -1 5 0 4 2 4 5 3 3 0 2 -1 3 2 7 5 3 3 7 6 2 6 5 4 3 7 6 6 7 6 3 6 -4 3 -4 6 -4 4 -4 4 -4 6 -9 4 -6 -4 -8 1 -5 -3 -4 -3 -9 -3 -4 -6 -2 -3 0 -2 0 0 1 -3 -5 -2 -7 -3 -5 -5 -4 -5 -3 -2 -6 -4 -5 -4 -4 -1 3 -4 0 -6 -3 -4 1 -3 2 -3 -2 -4 -3 -7 -4 -9 4 -1 7 -7 4 -8 6 -4 2 -5 0 -13 -1 -7 2 -5 6 -5 7 -2 z " />
									        <path id="CD11320" class="OUTLINE"
									            d="M 463 157 l -2 -4 0 -4 1 -5 2 -8 2 -9 2 -6 2 -4 -1 -2 -3 -5 -4 -7 -4 -5 -3 -7 -1 -9 0 -8 4 -11 8 -8 10 1 9 0 3 4 1 6 3 5 9 -1 4 -2 4 -1 4 4 5 0 5 13 0 9 -1 5 -4 12 0 8 3 9 2 9 3 10 1 9 2 7 -2 13 -3 -4 -2 -3 -2 3 -5 5 -1 6 -4 9 -1 7 -6 -6 -3 -7 -5 -4 -2 -6 -7 -6 -3 -3 -7 -5 -3 -2 -2 1 -3 0 z " />
									        <path id="CD11350" class="OUTLINE"
									            d="M 619 183 l 1 7 -3 7 -6 5 -3 7 1 8 -9 1 -6 2 -10 -1 -9 -1 -9 4 -4 1 -6 3 -9 2 -9 0 -5 -4 -5 -5 -4 -5 -5 -4 -3 -6 -7 -6 1 -7 4 -9 1 -6 5 -5 2 -3 2 3 3 4 2 -13 -2 -7 -1 -9 -3 -10 -2 -9 -3 -9 0 -8 4 -12 1 -5 0 -9 6 -4 5 -2 4 -4 4 -6 6 0 3 1 4 0 5 -1 4 -2 7 -1 5 8 5 5 5 0 3 -1 5 4 -3 10 -2 7 -1 2 1 3 3 7 2 8 -2 11 -2 5 -3 4 0 4 2 6 1 6 0 10 3 5 7 0 5 -2 5 0 4 4 4 3 z " />
									        <path id="CD11380" class="OUTLINE"
									            d="M 368 148 l 3 2 1 3 2 11 2 9 2 8 3 5 0 5 -3 3 -5 5 -7 3 -5 2 -2 6 1 6 1 11 -1 10 -7 6 -4 3 -4 7 0 7 -5 2 -9 4 -4 4 -3 5 -3 7 -5 4 -3 4 -8 -1 0 -3 -1 0 -3 -2 -3 2 -4 5 -4 5 -5 5 -1 5 -9 -8 -12 -9 -1 -2 -6 -6 -4 -5 6 -9 1 2 -2 5 2 5 8 0 9 -1 3 -6 1 -4 2 -5 -1 -9 2 -8 -2 -10 2 -10 4 -7 3 -4 2 -6 2 -9 -1 -10 5 -4 0 -1 -1 -5 1 -4 1 -4 0 -5 -5 -3 -5 -5 0 -1 1 1 5 3 6 4 11 -1 10 -3 3 -3 4 -2 9 -4 4 -5 3 -5 5 -2 6 -2 3 4 z " />
									        <path id="CD11410" class="OUTLINE"
									            d="M 365 255 l 1 4 2 0 2 0 3 4 -1 9 0 9 0 10 0 6 -5 3 2 5 4 5 5 6 3 4 6 6 2 5 1 2 -6 4 -6 3 -3 3 -8 0 -10 1 -11 1 -7 2 -10 -4 -7 -6 -2 -10 -6 -3 -6 -2 -4 -2 -8 -4 -5 -5 -7 -5 1 -5 5 -5 4 -5 4 -5 3 -2 3 2 1 0 0 3 8 1 3 -4 5 -4 3 -7 3 -5 4 -4 9 -4 5 -2 0 -7 4 -7 4 -3 7 -6 5 9 z " />
									        <path id="CD11440" class="OUTLINE"
									            d="M 263 289 l 12 9 9 8 7 5 5 5 8 4 4 2 6 2 6 3 2 10 7 6 10 4 7 -2 11 -1 10 -1 8 0 3 -3 0 1 2 2 -1 4 0 7 2 3 0 3 -6 5 -3 6 -2 5 -5 6 -5 4 -4 1 -5 2 -7 -4 -5 -4 -5 -3 -5 -2 -4 1 -4 2 -6 -4 -11 0 -12 0 -5 -2 -6 -7 -6 -6 -8 -4 -8 -4 -5 -4 -5 -3 -11 -7 -8 -5 -4 -2 -6 -4 -4 -4 -4 -3 -6 -6 -1 -3 8 -4 4 -2 4 -2 10 -2 10 -2 3 -2 0 -1 -1 -6 0 -5 4 -5 5 -4 4 5 6 6 z " />
									        <path id="CD11470" class="OUTLINE"
									            d="M 240 363 l 8 -1 5 5 2 5 4 8 4 9 -2 3 2 2 0 2 -8 3 -5 4 -3 4 -2 12 0 4 -2 7 -4 6 -1 8 -2 6 -1 -1 -4 -2 -10 -2 -6 -2 -4 -5 -8 -1 -8 2 -4 4 -7 3 -4 3 -5 1 -3 -1 -4 -5 -4 -4 -4 -2 -3 -12 2 -9 1 -7 4 -5 0 -4 -4 -4 -4 -6 -2 -11 4 -7 3 -7 5 -2 1 6 5 5 2 6 3 9 3 7 3 4 12 1 7 -2 11 -1 7 -2 1 -8 0 -7 -1 -9 0 -10 2 -8 5 2 5 4 z " />
									        <path id="CD11500" class="OUTLINE"
									            d="M 134 254 l 3 3 6 4 4 4 4 6 4 3 6 4 5 4 6 4 5 3 4 4 6 5 3 2 6 5 9 6 1 3 6 6 4 3 4 4 6 4 4 2 8 5 11 7 -4 8 3 9 -8 1 -8 -2 -5 -4 -5 -2 -2 8 0 10 1 9 0 7 -1 8 -7 2 -11 1 -7 2 -12 -1 -3 -4 -3 -7 -3 -9 -2 -6 -5 -5 -1 -6 -5 2 -3 7 -10 2 -9 -1 -7 -4 -3 -2 0 1 -9 5 -2 5 -6 2 -2 -6 -4 -5 -5 -4 -7 -2 -9 -2 -7 -4 -4 1 -1 -2 -2 -2 1 -1 -3 -2 -2 -7 8 -4 2 -5 6 -2 -1 -5 -2 -5 0 -3 2 1 0 1 5 -3 3 -3 -1 -2 2 -1 1 -5 8 -4 1 -1 1 1 2 -5 2 -6 1 3 1 2 2 -9 2 -4 2 2 1 -4 5 -5 0 -6 -3 -5 -1 -6 0 -5 3 -4 4 -6 4 2 z " />
									        <path id="CD11530" class="OUTLINE"
									            d="M 245 419 l 6 7 4 4 5 2 4 4 4 9 -1 9 2 9 1 6 1 5 3 7 5 5 4 3 -3 5 -4 5 -10 1 -7 -3 -4 -5 -5 -4 -5 -3 -2 0 -2 1 -3 -5 -4 -2 3 -2 0 -1 -3 0 -3 2 -1 -5 -2 -6 -2 1 -1 1 1 1 -4 4 -5 3 -4 5 -4 4 -6 6 -9 2 -2 4 -1 10 -6 0 -8 -1 -5 -4 -4 0 -4 2 -9 0 -5 1 -8 1 2 -4 4 -5 2 -8 2 -5 3 -4 -2 -5 -3 -1 -8 -5 -1 -7 6 -3 4 -6 2 -4 2 -6 5 -6 4 2 4 4 4 5 3 1 5 -1 4 -3 7 -3 4 -4 8 -2 8 1 4 5 6 2 10 2 4 2 1 1 2 -6 1 -8 4 -6 2 -7 z " />
									        <path id="CD11545" class="OUTLINE"
									            d="M 241 486 l 2 -1 2 0 5 3 5 4 4 5 7 3 10 -1 11 -1 6 1 3 10 -3 8 3 6 3 6 1 6 4 8 8 3 3 4 5 4 2 6 -7 7 -2 5 -3 6 -8 1 -5 4 -4 7 -9 -1 -4 -4 -3 -4 -2 -9 -3 -5 -2 -3 1 -3 -1 -3 -3 -4 -6 -3 -4 -6 -1 -9 -4 -4 -1 -4 2 -2 -2 -3 -3 -5 -4 -6 -2 -4 -4 -9 -3 -8 -1 -4 1 -2 z " />
									        <path id="CD11560" class="OUTLINE"
									            d="M 249 345 l 5 3 5 4 8 4 8 4 6 6 6 7 5 2 12 0 11 0 6 4 4 -2 4 -1 5 2 5 3 5 4 7 4 6 11 2 8 0 10 -1 5 -11 2 -8 1 -9 1 -8 2 -2 5 -3 8 -2 3 -3 10 -2 8 -9 2 -3 1 -4 7 -4 5 -3 5 -4 6 -4 -3 -5 -5 -3 -7 -1 -5 -1 -6 -2 -9 1 -9 -4 -9 -4 -4 -5 -2 -4 -4 -6 -7 2 -12 3 -4 5 -4 8 -3 0 -2 -2 -2 2 -3 -4 -9 -4 -8 -2 -5 -5 -5 -3 -9 z " />
									        <path id="CD11590" class="OUTLINE"
									            d="M 367 426 l 6 3 5 3 6 5 6 3 3 1 10 4 7 1 -3 4 0 0 4 5 2 8 -2 11 0 6 -1 11 0 8 0 9 -5 -2 -14 0 -3 -2 -5 -4 -6 -10 0 -11 -2 -6 -7 3 -3 1 -2 -2 -7 -3 -9 1 -7 0 -11 -2 -6 -1 -6 7 -6 1 -10 4 -4 3 -2 1 -12 3 4 -6 3 -5 4 -5 4 -7 3 -1 9 -2 2 -8 3 -10 2 -3 3 -8 2 -5 8 -2 9 -1 8 -1 11 -2 z " />
									        <path id="CD11620" class="OUTLINE"
									            d="M 323 470 l 6 1 11 2 7 0 9 -1 7 3 2 2 3 -1 7 -3 2 6 0 11 6 10 5 4 3 2 14 0 5 2 2 8 4 6 3 4 0 11 1 5 -9 4 -7 2 -3 1 -5 4 -5 7 -8 5 -2 7 -1 5 -5 2 -9 2 -9 1 -10 2 -4 2 -2 0 -3 -5 -2 -6 -5 -4 -5 -7 -4 -4 -2 -6 -5 -4 -3 -4 -8 -3 -4 -8 -1 -6 -3 -6 -3 -6 3 -8 -3 -10 -6 -1 -11 1 4 -5 3 -5 12 -3 2 -1 4 -3 10 -4 6 -1 z " />
									        <path id="CD11650" class="OUTLINE"
									            d="M 460 413 l 1 0 2 -3 6 9 1 6 0 1 3 9 5 15 5 13 6 17 7 10 6 -1 5 5 1 3 4 9 7 13 3 5 6 -2 4 0 6 -1 9 -2 8 -4 5 -3 2 -2 11 0 4 8 2 3 5 6 2 7 4 4 1 7 -5 8 -6 10 0 6 -6 4 -4 4 -5 0 -4 -1 -4 0 -2 6 -2 8 -1 4 -1 2 1 3 -4 0 -10 2 -9 0 -8 0 -7 -4 -4 -6 -5 -5 -4 -2 -5 -4 1 -5 2 -4 -1 -8 0 -5 -2 -4 2 -5 0 -1 -3 -4 -2 -9 -2 -6 -5 0 -2 7 -3 6 -6 4 -8 2 -4 1 -2 0 -6 -3 -3 -3 0 0 -1 -2 -3 -6 -2 -8 -8 -2 -5 3 1 3 0 1 -4 4 -6 3 -4 3 -1 -5 0 -11 -3 -4 -4 -6 -2 -8 0 -9 0 -8 1 -11 0 -6 2 -11 -2 -8 -4 -5 0 0 3 -4 7 -3 5 -8 8 -8 5 -3 5 -4 5 -5 5 -4 3 -4 z " />
									        <path id="CD11680" class="OUTLINE"
									            d="M 503 387 l 10 3 4 4 5 3 7 4 7 4 12 5 0 10 0 4 1 13 1 6 1 10 6 2 7 1 6 2 3 2 12 4 5 2 5 3 6 3 5 4 5 5 3 6 3 5 3 5 4 7 2 2 5 10 3 4 4 5 -10 11 -2 6 -4 0 -3 -4 -9 -2 -4 0 0 2 -1 1 -3 3 -11 3 -1 -7 -4 -4 -2 -7 -5 -6 -2 -3 -4 -8 -11 0 -2 2 -5 3 -8 4 -9 2 -6 1 -4 0 -6 2 -3 -5 -7 -13 -4 -9 -1 -3 -5 -5 -6 1 -7 -10 -6 -17 -5 -13 -5 -15 -3 -9 0 -1 -1 -6 -6 -9 -2 3 -1 0 -7 -6 5 -6 4 -5 4 -5 8 -4 12 0 7 0 z " />
									        <path id="CD11710" class="OUTLINE"
									            d="M 621 374 l 6 2 4 2 4 4 0 8 -2 5 -1 3 0 7 5 2 8 5 5 3 8 4 3 2 5 3 5 2 -4 3 0 6 -3 10 4 5 5 3 10 0 9 3 5 5 -1 4 -2 7 -3 9 -4 3 -5 4 -5 5 -2 6 -3 7 -5 5 -10 0 -6 0 0 8 -4 5 -6 -2 -2 -1 -1 4 -4 -5 -3 -4 -5 -10 -2 -2 -4 -7 -3 -5 -3 -5 -3 -6 -5 -5 -5 -4 -6 -3 -5 -3 -5 -2 -12 -4 -3 -2 -6 -2 -7 -1 -6 -2 -1 -10 -1 -6 -1 -13 0 -4 0 -10 6 2 5 1 5 1 5 -1 6 -3 8 -5 3 -2 3 -3 11 -12 5 -4 5 -5 4 -5 z " />
									        <path id="CD11740" class="OUTLINE"
									            d="M 726 320 l 1 7 3 9 0 9 1 9 1 10 1 5 -1 -1 -5 -1 -3 0 -4 2 -11 0 -8 1 -5 6 -4 5 -4 6 -2 4 -1 8 -4 7 -3 2 1 1 -1 2 -6 7 -1 8 -5 -2 -5 -3 -3 -2 -8 -4 -5 -3 -8 -5 -5 -2 0 -7 1 -3 2 -5 0 -8 -4 -4 -4 -2 -6 -2 -7 0 2 -4 2 -5 2 -10 4 -10 1 -1 4 -6 7 -6 5 -3 6 -3 8 -3 4 -1 5 0 11 0 9 -4 7 -5 8 -6 11 -6 11 0 0 7 3 6 z " />
									    </g>
									    <g>
									        <text id="11110" class="TEXT" x="399" y="277">종로구</text>
									        <text id="11140" class="TEXT" x="433" y="338">중구</text>
									        <text id="11170" class="TEXT" x="407" y="395">용산구</text>
									        <text id="11200" class="TEXT" x="505" y="356">성동구</text>
									        <text id="11215" class="TEXT" x="577" y="365">광진구</text>
									        <text id="11230" class="TEXT" x="528" y="294">동대문구</text>
									        <text id="11260" class="TEXT" x="589" y="270">중랑구</text>
									        <text id="11290" class="TEXT" x="466" y="258">성북구</text>
									        <text id="11305" class="TEXT" x="459" y="181">강북구</text>
									        <text id="11320" class="TEXT" x="494" y="125">도봉구</text>
									        <text id="11350" class="TEXT" x="560" y="153">노원구</text>
									        <text id="11380" class="TEXT" x="323" y="218">은평구</text>
									        <text id="11410" class="TEXT" x="342" y="302">서대문구</text>
									        <text id="11440" class="TEXT" x="293" y="339">마포구</text>
									        <text id="11470" class="TEXT" x="209" y="421">양천구</text>
									        <text id="11500" class="TEXT" x="156" y="334">강서구</text>
									        <text id="11530" class="TEXT" x="199" y="470">구로구</text>
									        <text id="11545" class="TEXT" x="279" y="537">금천구</text>
									        <text id="11560" class="TEXT" x="295" y="413">영등포구</text>
									        <text id="11590" class="TEXT" x="361" y="461">동작구</text>
									        <text id="11620" class="TEXT" x="353" y="529">관악구</text>
									        <text id="11650" class="TEXT" x="481" y="515">서초구</text>
									        <text id="11680" class="TEXT" x="533" y="464">강남구</text>
									        <text id="11710" class="TEXT" x="624" y="448">송파구</text>
									        <text id="11740" class="TEXT" x="675" y="358">강동구</text>
									    </g>
									</svg>
								</div>
							</div>
							<div class = "row my-3">		
								<div class = "col div-check-dang-area"></div>					
							</div>
						</div>
					</div>
				</div>
			</div> <%-- 댕모임 개설 관련 --%>
			<div class = "row my-3">	
				<div class = "col-8 offset-2 shadow px-5 div-create-dang-dang-creator-info">
					<div class = "row my-4">
						<div class = "col">
							<div class = "row">
								<strong class = "strong-create-dang-category">댕모임 내에서 사용할 닉네임</strong>
							</div>
							<div class = "row my-3">		
								<div class = "col">								
									<input name = "memberNick" type = "text" placeholder = "닉네임(2~6자)" class = "p-2 w-100" maxlength = "6">
								</div>					
							</div>
							<div class = "row">		
								<div class = "col div-check-member-nick"></div>					
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class = "row my-3">
				<div class = "col-6 offset-3 px-5">
					<div class = "row my-4">
						<div class = "col">
							<button type = "button" class = "btn-submit-create w-100 p-2">개설</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">

	$(function(){
		
		// 초기 비밀번호 입력창 숨김
		$(".div-dang-password").hide();
		
		// 미리보기용 첨부파일 번호 리스트
		var attachmentPreviewNoList = [];
		
		// 댕모임 프로필 사진 미리보기
		$(".input-dang-profile").change(function(){
			if(this.files.length > 0) { // 첨부파일을 선택했다면
				var formData = new FormData();
				formData.append("attachment", this.files[0]);
				$.ajax({
					url : "${pageContext.request.contextPath}/rest_attachment/upload_preview",
					method : "post",
					data : formData,
					processData:false,
                    contentType:false,
                    success : function(resp) {
                    	console.log(resp);
                    	// 프로필 이미지 태그의 src를 반환한 주소로 변경
                    	$(".img-dang-profile").attr("src", resp.url);
                    	// 해당 이미지의 첨부파일 번호를 미리보기 첨부파일 리스트에 저장
                    	attachmentPreviewNoList.push(resp.attachmentNo);
                    }
				});
			} else {
				$(".img-input-dang-profile").prop("src", "${pageContext.request.contextPath}/images/img-dang-profile.png");
			}
		});
		
		// 미리보기용 첨부파일 삭제 (등록 Modal과 수정 Modal에서 미리보기에 사용되었던)
		$(window).bind("beforeunload", function(){
			// 미리보기용 첨부파일 리스트의 길이가 0이면(지울 첨부파일이 없다면)
			if(attachmentPreviewNoList.length == 0) {
				return;
			}
			// 그렇지 않다면 첨부파일 삭제 실행
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_attachment/delete_preview",
				method : "delete",
				data : {
					attachmentPreviewNoList : attachmentPreviewNoList
				}
			})
		});
		
		// 댕모임명 글자수 제한
		$(document).on("input", "[name=dangName]", function(){
			$(".span-dang-name-count").removeClass("span-dang-name-count-max");
			var inputDangName = document.querySelector("[name=dangName]");
			var textDangName = inputDangName.value;
			
			var spanDangName = document.querySelector(".span-dang-name");
			spanDangName.textContent = textDangName.length;
			
			var size = textDangName.length;
			
			while(size > 10) {
				inputDangName.value = inputDangName.value.substring(0, size - 1);
				size --;
			}
			spanDangName.textContent = size;
			
			// 댕모임명 입력창에 입력된 글자수가 10글자일 때 
			if(size >= 10) {
				$(".span-dang-name-count").addClass("span-dang-name-count-max"); // 댕모임명 입력창의 글자색을 빨간색으로
			}
		});
		
		// 댕모임명 유효성 검사
		$("[name=dangName]").blur(function(){
			$(".check-dang-name").remove();
			if($(this).val() != "") {
				formValidCheck.checkDangName = true;
			} else {
				$(".div-check-dang-name")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-dang-name check-dang-name-empty").text("댕모임명을 입력해 주세요.")
					)
				formValidCheck.checkDangName = false;
			}
		});
		
		// 댕모임 정보 텍스트 수 제한
		$(document).on("input", ".textarea-dang-info", function(){
			$(".span-dang-info-count").removeClass("span-dang-info-count-max");
			// 댕모임 정보 입력창
			var textareaDangInfo = document.querySelector(".textarea-dang-info");
			var textDangInfo = textareaDangInfo.value;
			
			var spanDangInfo = document.querySelector(".span-dang-info");
			spanDangInfo.textContent = textDangInfo.length;
			
			var size = textDangInfo.length;
			
			while(size > 30) {
				textareaDangInfo.value = textareaDangInfo.value.substring(0, size - 1);
				size --;
			}
			spanDangInfo.textContent = size;
			// 댕모임 정보 입력창에 입력된 글자수가 30글자일 때
			if(size >= 30) {
				$(".span-dang-info-count").addClass("span-dang-info-count-max"); // 댕모임 정보 입력 글자수를 빨간색으로
			}
		});
		
		// 댕모임 회원 총원
		$("[name=dangHeadmax]").change(function(){
			// 초기화
			$(".check-dang-headmax").remove();
			// 입력창의 입력값이 비어있는지 여부
			if($(this).val() != "") {
				formValidCheck.checkDangHeadmax = true;
			} else {
				$(".div-check-dang-headmax")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-dang-headmax check-dang-headmax-empty").text("총원을 선택해 주세요.")
					)
				formValidCheck.checkDangHeadmax = false;
			}
		});
		
		// 댕모임 비공개 여부
		$(".input-dang-private").click(function(){
			var countChecked = $(".input-dang-private:checked").length;
			if(countChecked > 1) {
				$(".input-dang-private").prop("checked", false); // 이전 체크를 모두 초기화
				$(this).prop("checked", true); // 새로 체크한 항목에 체크
			}
			
			if($(this).is(":checked")){
				$(".check-dang-public").remove();
				formValidCheck.checkDangPrivate = true;
			} else {
				formValidCheck.checkDangPrivate = false;
			}
		});
		
		// 댕모임 비공개 체크시 이벤트
		$(".input-dang-private").change(function(){
			if($("#dangPrivate").is(":checked")) {
				$(".div-dang-password").show();
				formValidCheck.checkDangPw = false;
			} else {
				$(".div-dang-password").hide();
				formValidCheck.checkDangPw = true;
			}
		});
		
		// 비공개 댕모임 비밀번호 입력 자릿수 제한
		$(document).on("input", ".input-dang-password", function(){
			
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
			
			var inputDangPassword = document.querySelector(".input-dang-password");
			
			var size = inputDangPassword.value.length;
			while(size > 4) {
				inputDangPassword.value = inputDangPassword.value.substring(0, size - 1);
				size --;
			}
		});
		
		// 비공개 댕모임 비밀번호 유효성 검사
		$(".input-dang-password").blur(function(){
			// helper text 초기화
			$(".check-dang-public").remove();
			// 댕모임 비밀번호 입력창의 값
			var inputDangPassword = $(this).val();
			if(inputDangPassword == "") {
				$(".div-check-dang-public")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-dang-public check-dang-public-pw-empty").text("댕모임 비밀번호를 입력해 주세요.")
					)
				formValidCheck.checkDangPw = false;
				return;
			} 
			var regexp = /^[0-9]{4}$/;
			if(regexp.test(inputDangPassword)) {
				formValidCheck.checkDangPw = true;
			} else {
				$(".div-check-dang-public")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-dang-public check-dang-public-pw-empty").text("숫자 4자리를 입력해 주세요.")
					)
				formValidCheck.checkDangPw = false;
			}
		});
		
		// 선택한 댕모임 활동 지역
		var dangArea;
		
		// 댕모임 활동 지역
		$(".TEXT").click(function () {
			// 댕모임 활동지역 미선택 helper text 삭제
			$(".check-dang-area").remove();
			// 선택(색상) 초기화
        	$(".OUTLINE").removeClass("area-selected");
			// 클릭한 지역의 id 선택
            var id = $(this).prop("id");
			// 클릭한 지역의 색 변경
        	$("#CD" + id).addClass("area-selected");
			// 지역 선택
            dangArea = $(this).text();
            formValidCheck.checkDangArea = true;
        });
		
		// 댕모임 닉네임 입력 글자수를 최대 6자리로 제한
		$(document).on("input", "[name=memberNick]", function(){
			var inputUserNick = document.querySelector("[name=memberNick]");
			var textUserNick = inputUserNick.value;
			var size = textUserNick.length;
			while(size > 6) {
				inputUserNick.value = inputUserNick.value.substring(0, size - 1);
				size --;
			}
		});
		
		// 댕모임 닉네임
		$("[name=memberNick]").blur(function(){
			$(".check-member-nick").remove();
			if($(this).val().length >= 2 && $(this).val().length <= 6) {
				formValidCheck.checkMemberNick = true;
			} else {
				$(".div-check-member-nick")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-member-nick check-member-nick-invalid").text("2글자 이상의 닉네임을 입력해 주세요.")
					)
				formValidCheck.checkMemberNick = false;
			}
		});
		
		// form 전송
		$(".btn-submit-create").click(function(e){
			// 기본 이벤트 차단(form 전송)
			e.preventDefault();
			// 초기화
			$(".check-dang-name").remove();
			$(".check-dang-headmax").remove();
			$(".check-dang-public").remove();
			$(".check-dang-area").remove();
			$(".check-member-nick").remove();
			
			// 댕모임명을 입력하지 않았으면 helper text 표시
			if($(".div-check-dang-name").val().length < 1) {
				$(".div-check-dang-name")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-dang-name check-dang-name-empty").text("댕모임명을 입력해 주세요.")	
					)
			}
			
			// 댕모임 인원수를 선택하지 않았으면 helper text 표시
			if($("[name=dangHeadmax]").val() == "") {
				$(".div-check-dang-headmax")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-dang-headmax check-dang-headmax-empty").text("총원을 선택해 주세요.")		
					)
			}
			
			// 댕모임 공개 여부를 설정하지 않았으면 helper text 표시
			if($(".input-dang-private:checked").length < 1) {
				$(".div-check-dang-public")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-dang-public check-dang-public-empty").text("공개/비공개 여부를 선택해 주세요.")
					)
			}
			
			// 댕모임 비공개 선택시 비밀번호를 입력하지 않았다면 helper text 표시
			if($("#dangPrivate").is(":checked") && $(".input-dang-password").val() == "") {
				$(".div-check-dang-public")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-dang-public check-dang-public-pw-empty").text("댕모임 비밀번호를 입력해 주세요.")
					)
			}
			
			// 댕모임 활동 지역을 설정하지 않았으면 helper text 표시
			if($(".area-selected").length < 1) {
				$(".div-check-dang-area")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-dang-area check-dang-area-empty").text("활동 지역을 선택해 주세요.")
					)
			}
			
			// 댕모임 내 닉네임을 입력하지 않았으면 helper text 표시
			if($("[name=memberNick]").val().length < 1) {
				$(".div-check-member-nick")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-member-nick check-member-nick-empty").text("2글자 이상의 닉네임을 입력해 주세요.")
					)
			}
			
			return;
			
			// 댕모임 개설 유효성 검사를 통과하지 못하면 return
			if(formValidCheck.isAllValid() == false) {
				return;
			}
			var form = $(".form-create-dang");
			form.append($("<input>").attr("type", "hidden").attr("name", "dangArea").attr("value",dangArea));
			// 비공개 댕모임일 경우에만
			if($("#dangPrivate").is(":checked")) {
				form
					.append($("<input>").attr("type", "hidden").attr("name", "dangPrivate").attr("value", "Y"))
					.append($("<input>").attr("type", "hidden").attr("name", "dangPw").attr("value", $(".input-dang-password").val()));
			}
			form.submit();
		})
		
		// 댕모임 개설 유효성 판정
		var formValidCheck = {
			checkDangName : false,
			checkDangHeadmax : false,
			checkDangArea : false,
			checkMemberNick : false,
			checkDangPrivate : false,
			checkDangPw : false,
			// 판정 결과 반환
			isAllValid : function() {
				return this.checkDangName && this.checkDangHeadmax && this.checkDangArea && this.checkMemberNick && this.checkDangPrivate && this.checkDangPw;
			}
		};
	});
	
</script>