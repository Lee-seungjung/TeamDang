<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

	* {
		
	}
	
	.strong-dang-edit-info-title {
		font-size : 24px;
	}

	.strong-dang-edit-info-text {
		font-size : 20px;
	}
	
	.content-full {
		color : red;
	}

	.form-edit-dang {
		border : 1px solid #E8E8E8;
		border-radius : 15px;
	}
	
	input, textarea, select {
		border-radius : 10px;
		border : 1px solid #76BEFF;
	}
	
	input:focus, textarea:focus, select:focus {
		outline : 2px solid #76BEFF;
	}
	
	
	.img-edit-dang-profile {
		border-radius : 20px;
		border : 2px solid;
		aspect-ratio : 1/1;
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
	
</style>

<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="댕모임 수정" name="title"/>
</jsp:include>

<div class = "container-fluid mt-3 mb-5">

	<div class = "col-8 offset-2">
		<div class = "row">
		
			<!-- 프로필 박스 시작-->
			<div class = "col-3">
				<jsp:include page="/WEB-INF/views/template/dang_side_profile.jsp"></jsp:include>
			</div>
			<!-- 프로필 박스 끝-->
			<form class = "col-6 form-edit-dang shadow" action = "edit" method = "post" enctype = "multipart/form-data">
				<div class = "row my-3">	
					<div class = "col mx-4">
						<div class = "row my-3">
							<div class = "col d-flex justify-content-center align-items-center">
								<strong class = "strong-dang-edit-info-title">댕모임 정보 변경</strong>
							</div>
						</div>
						<div class = "row my-3">
							<div class = "col-10 offset-1 d-flex flex-column">
								<strong class = "strong-dang-edit-info-text my-3">댕모임 프로필 사진</strong>
								<div class = "row">
									<div class = "col-5 d-flex justify-content-center align-items-center">
										<c:choose>
										<c:when test = "${dangEditInfo.attachmentNo != null}"> <%-- 첨부파일 번호가 없을 때 --%>
											<img src = "${pageContext.request.contextPath}/rest_attachment/download/${dangEditInfo.attachmentNo}" class = "img-fluid img-edit-dang-profile">
										</c:when>
										<c:otherwise>
											<img src = "${pageContext.request.contextPath}/images/basic-profile.png" class = "img-fluid img-edit-dang-profile">
										</c:otherwise>
										</c:choose>
									</div>
									<div class = "col-2 d-flex justify-content-center align-items-center">
										<img src = "${pageContext.request.contextPath}/images/icon-change.png" class = "img-fluid">
									</div>
									<div class = "col-5 d-flex justify-content-center align-items-center">
										<label for = "dangProfile">
											<img src = "${pageContext.request.contextPath}/images/basic-profile.png" class = "img-fluid img-edit-dang-profile img-input-dang-profile">
											<input name = "dangProfile" type = "file" id = "dangProfile" class = "input-dang-profile" accept = ".png, .jpg">
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class = "row my-3">
							<div class = "col-10 offset-1 d-flex flex-column">
								<div class = "my-3 d-flex">
									<strong class = "strong-dang-edit-info-text me-1">댕모임명</strong>
									<span class = "span-dang-edit-info-dang-name">
										[
										<span class = "span-dang-name">0</span>
										<span class = "span-dang-name-max"> / 10</span>
										]
									</span>
								</div>
								<input type = "hidden" name = "dangNo" value = "${dangEditInfo.dangNo}">
								<input name = "dangName" class = "p-2" type = "text" placeholder = "댕모임명(10글자)" maxlength = "10" value = "${dangEditInfo.dangName}">
							</div>
						</div>
						<div class = "row my-3">
							<div class = "col-10 offset-1 d-flex flex-column">
								<div class = "my-3 d-flex">
									<strong class = "strong-dang-edit-info-text me-1">댕모임 정보</strong>
									<span class = "span-dang-edit-info-dang-info">
										[
										<span class = "span-dang-info">0</span>
										<span class = "span-dang-info-max"> / 30</span>
										]
									</span>
								</div>
								<textarea name = "dangInfo" style="resize: none;" cols = "2" class = "textarea-dang-info p-2" placeholder = "댕모임 정보" maxlength = "30">${dangEditInfo.dangInfo}</textarea>
							</div>
						</div>
						<div class = "row my-3">
							<div class = "col-10 offset-1 d-flex flex-column">
								<strong class = "strong-dang-edit-info-text my-4">댕모임 인원수</strong>
								<div class = "row">
									<div class = "col-6">
										<select name = "dangHeadmax" class = "p-2 w-100">
											<option value = "">인원수</option>
											<c:forEach var = "i" begin = "5" end = "20" step = "5">
											<option value = "${i}" <c:if test = "${dangEditInfo.dangHeadmax == i}">selected</c:if>>${i}</option>
											</c:forEach>
										</select>
									</div>
									<div class = "col-6">
										<input value = "현재원 : ${dangEditInfo.dangHead} / ${dangEditInfo.dangHeadmax}" disabled class = "p-2 w-100 input-dang-head-now" data-danghead = "${dangEditInfo.dangHead}" data-dangheadmax = "${dangEditInfo.dangHeadmax}">
									</div>
								</div>
							</div>
						</div>
						<div class = "row my-3"> <%-- form에 태그를 생성해서 전송해야 하는 부분 시작 --%>
							<div class = "col-10 offset-1 d-flex flex-column">
								<strong class = "col strong-dang-edit-info-text my-4">댕모임 공개 여부</strong>
								<div class = "col d-flex flex-row">							
									<div class = "col-6">
										<c:choose>
										<c:when test = "${dangEditInfo.dangPrivate == 'N'}">
											<input type = "radio" id = "dangPublic" class = "input-dang-private dang-public" checked>
										</c:when>
										<c:otherwise>
											<input type = "radio" id = "dangPublic" class = "input-dang-private dang-public">
										</c:otherwise>
										</c:choose>
										<span>공개</span>
									</div>
									<div class = "col-6">
										<c:choose>
										<c:when test = "${dangEditInfo.dangPrivate == 'Y'}">
											<input type = "radio" id = "dangPrivate" class = "input-dang-private dang-private" checked>
										</c:when>
										<c:otherwise>
											<input type = "radio" id = "dangPrivate" class = "input-dang-private dang-private">
										</c:otherwise>
										</c:choose>
										<span>비공개</span>
									</div>
								</div>
							</div>
						</div>
						<div class = "row my-3 div-dang-password">
							<div class = "col-10 offset-1 d-flex flex-column">
								<strong class = "strong-dang-edit-info-text my-4">비밀번호</strong>
								<input class = "input-dang-password p-2" type = "text" placeholder = "비밀번호(숫자 4자리)" value = "${dangEditInfo.dangPw}" maxlength = "4">
							</div>
						</div> <%-- form에 태그를 생성해서 전송해야 하는 부분 시작 --%>
						<div class = "row my-3"> <%-- 지역은 차후 수정 --%>
							<div class = "col-10 offset-1 d-flex flex-column">
								<strong class = "strong-dang-edit-info-text my-4">활동 지역</strong>
								<input type = "hidden" id = "dangArea" value = "${dangEditInfo.dangArea}">
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
							<div class = "d-flex flex-row justify-content-center align-items-center">
								<button type = "button" class = "btn btn-primary btn-submit-edit">수정</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<!-- 다가오는 일정 박스 시작-->
			<div class="col-3">
				<jsp:include page="/WEB-INF/views/template/dang_side_upcoming.jsp"></jsp:include>
			</div>
			<!-- 다가오는 일정 박스  끝-->
		</div>
	</div>
</div>

<script type="text/javascript">

	$(function(){
		
		// 댕모임 수정 유효성 판정
		var formValidCheck = {
			checkDangName : true,
			checkDangHeadmax : true,
			checkDangArea : true,
			checkMemberNick : true,
			checkDangPrivate : true,
			checkDangPw : true,
			// 판정 결과 반환
			isAllValid : function() {
				return this.checkDangName && this.checkDangHeadmax && this.checkDangArea && this.checkMemberNick && this.checkDangPrivate && this.checkDangPw;
			}
		};
		
		function formValid() {
			console.log("checkDangName = " + formValidCheck.checkDangName);
			console.log("checkDangHeadmax = " + formValidCheck.checkDangHeadmax);
			console.log("checkDangArea = " + formValidCheck.checkDangArea);
			console.log("checkMemberNick = " + formValidCheck.checkMemberNick);
			console.log("checkDangPrivate = " + formValidCheck.checkDangPrivate);
			console.log("checkDangPw = " + formValidCheck.checkDangPw);
		}
		
		// 초기 페이지 로드시 정보
		// 댕모임명
		var dangNameNowLength = $("[name=dangName]").val().length;
		$(".span-dang-name").text(dangNameNowLength);
		if(dangNameNowLength >= 10) {
			$(".span-dang-edit-info-dang-name").addClass("content-full")
		}
		
		// 댕모임 정보
		var dagnInfoNowLength = $("[name=dangInfo]").val().length;
		$(".span-dang-info").text(dagnInfoNowLength);
		if(dagnInfoNowLength >= 30) {
			$(".span-dang-edit-info-dang-info").addClass("content-full")
		}
		
		// 선택했던 활동 지역 표시
		var dangAreaNameNowSelected = $("#dangArea").val();
		var dangAreaNowSelected = $('text:contains("'+dangAreaNameNowSelected+'")');
		var dangAreaIdNowSelected = dangAreaNowSelected.prop("id");
		$("#CD"+dangAreaIdNowSelected).addClass("area-selected");
		// 선택한 활동 지역 (초기값은 수정 전 선택된 활동지역으로)
		var dangArea = dangAreaNameNowSelected;
		
		// 댕모임 비밀번호
		if($(".dang-private").is(":checked")){
			$(".div-dang-password").show();
		} else {
			$(".div-dang-password").hide();
		}
		
		// 원본 댕모임 프로필 다운로드 링크 저장
		var dangProfileImgoriginal = $(".img-input-dang-profile").prop("src");
		
		// 미리보기용 첨부파일 번호 리스트
		var attachmentPreviewNoList = [];
		
		// 변경할 댕모임 프로필 미리보기
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
                    	// 프로필 이미지 태그의 src를 반환한 주소로 변경
                    	$(".img-input-dang-profile").prop("src", resp.url);
                    	// 해당 이미지의 첨부파일 번호를 미리보기 첨부파일 리스트에 저장
                    	attachmentPreviewNoList.push(resp.attachmentNo);
                    }
				});
			} else { // 첨부파일을 선택하지 않았다면
				// 원래 프로필 이미지로 변경
				$(".img-input-dang-profile").prop("src", dangProfileImgoriginal);
			}
		});
		
		// 미리보기용 첨부파일 삭제
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
		
		// 변경할 댕모임명 글자수 제한
		$(document).on("input", "[name=dangName]", function(){
			var inputDangName = document.querySelector("[name=dangName]");
			var textDangName = inputDangName.value;
			
			var spanDangName = document.querySelector(".span-dang-name");
			spanDangName.textContent = textDangName.length;
			
			var size = textDangName.length;
			
			if(size >= 10) {
				while(size > 10) {
					inputDangName.value = inputDangName.value.substring(0, size - 1);
					size --;
				}	
				$(".span-dang-edit-info-dang-name").addClass("content-full");
			} else {
				$(".span-dang-edit-info-dang-name").removeClass("content-full");
			}
			spanDangName.textContent = size;
		});
		
		// 변경할 댕모임명 유효성 검사 - 공백만 아니면 true
		$("[name=dangName]").blur(function(){
			if($(this).val() != "") {
				formValidCheck.checkDangName = true;
				formValid();
			} else {
				formValidCheck.checkDangName = false;
				formValid();
			}
		});
		
		// 댕모임 정보 텍스트 수 제한
		$(document).on("input", ".textarea-dang-info", function(){
			// 댕모임 정보 입력창
			var textareaDangInfo = document.querySelector(".textarea-dang-info");
			var textDangInfo = textareaDangInfo.value;
			
			var spanDangInfo = document.querySelector(".span-dang-info");
			spanDangInfo.textContent = textDangInfo.length;
			
			var size = textDangInfo.length;
			
			if(size >= 30) {
				while(size > 30) {
					textareaDangInfo.value = textareaDangInfo.value.substring(0, size - 1);
					size --;
				}
				$(".span-dang-edit-info-dang-info").addClass("content-full");
			} else {
				$(".span-dang-edit-info-dang-info").removeClass("content-full");
			}
			spanDangInfo.textContent = size;
		});
		
		// 댕모임 회원 총원
		$("[name=dangHeadmax]").change(function(){
			var dangHeadmaxSelected = $(this).val();
			var headNow = $(".input-dang-head-now").data("danghead");
			var headmaxNow = $(".input-dang-head-now").data("dangheadmax");
			if(dangHeadmaxSelected != "") {
				console.log(headNow)
				console.log(dangHeadmaxSelected)
				console.log(dangHeadmaxSelected < headNow)
				if(dangHeadmaxSelected < headNow) {
					formValidCheck.checkDangHeadmax = false;
					alert("현재 인원보다 적은 총원은 선택할 수 없습니다.");
					$(this).val(headmaxNow).prop("selected", true);
					return;
				}
				formValidCheck.checkDangHeadmax = true;
			} else {
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
				formValidCheck.checkDangPrivate = true;
				formValid();
				if($("#dangPublic").is(":checked")){
					formValidCheck.checkDangPw = true;
					formValid();
					return;
				}
			} else {
				formValidCheck.checkDangPrivate = false;
				formValid();
			}
		});
		
		// 댕모임 비공개 체크시 이벤트
		$(".input-dang-private").change(function(){
			if($("#dangPrivate").is(":checked")) {
				$(".div-dang-password").show();
				formValidCheck.checkDangPw = false;
				formValid();
			} else {
				$(".div-dang-password").hide();
				formValidCheck.checkDangPw = true;
				formValid();
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
			// 댕모임 비밀번호 입력창의 값
			var inputDangPassword = $(this).val();
			if(inputDangPassword == "") {
				formValidCheck.checkDangPw = false;
				formValid();
				return;
			} 
			var regexp = /^[0-9]{4}$/;
			if(regexp.test(inputDangPassword)) {
				formValidCheck.checkDangPw = true;
				formValid();
			} else {
				formValidCheck.checkDangPw = false;
				formValid();
			}
		});
		
		// 활동 지역 변경
		$(".TEXT").click(function() {
			// 선택(색상) 초기화
        	$(".OUTLINE").removeClass("area-selected");
			// 클릭한 지역의 id 선택
            var id = $(this).prop("id");
			// 클릭한 지역의 색 변경
        	$("#CD" + id).addClass("area-selected");
			// 지역 선택
            dangArea = $(this).text();
            formValidCheck.checkDangArea = true;
			formValid();
        });
		
		// 수정 확인 버튼
		$(".btn-submit-edit").click(function(e){
			// 기본 이벤트 차단
			e.preventDefault();
			// 유효성 검사 통과 여부
			if(!formValidCheck.isAllValid()) {
				return;
			} 
			var form = $(".form-edit-dang");
			form.append($("<input>").attr("type", "hidden").attr("name", "dangArea").attr("value",dangArea));
			if($(".dang-private").is(":checked")) {
				form
					.append($("<input>").attr("type", "hidden").attr("name", "dangPrivate").attr("value", "Y"))
					.append($("<input>").attr("type", "hidden").attr("name", "dangPw").attr("value", $(".input-dang-password").val()));
			} else {
				form
					.append($("<input>").attr("type", "hidden").attr("name", "dangPrivate").attr("value", "N"));
			}
			alert("댕모임 정보 수정이 완료되었습니다!");
			form.submit();
		});
	});
	
</script>