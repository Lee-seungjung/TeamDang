<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
   <jsp:param value="댕모임 조회" name="title"/>
</jsp:include>

<style>

	* {
		
	}
	
	.strong-page-title {
		font-size : 30px;
	}
	
	.img-dang-logo, 
	.img-dang-creator-logo {
		width : 2.5rem;
		aspect-ratio : 1/1;
	}
	
	.strong-text-dang-detail {
		font-size : 24px;
	}
	
	.div-dang-detail-container {
		border-radius : 10px;
		border : 1px solid #D9D9D9;
		background-color : #F1F4FF;
	}
	
	.div-col-dang-detail-info-container {
		position : relative;
	}
	
	.img-dang-detail-dang-profile {
		aspect-ratio : 1/1;
		border-radius : 20px;
		width : 10rem;
	}
	
	.div-dang-detail-img {
		position : absolute;
		top: 50%;
	    left: 83%;
	    transform: translate(-50%, -50%);
	}
	
	.div-col-dang-creator-detail-info-container {
		position : relative;
	}

	.img-dang-creator-detail-profile {
		aspect-ratio : 1/1;
		border-radius : 20px;
		width : 10rem;
	}

	.div-dang-creator-detail-img {
		position : absolute;
		top: 50%;
	    left: 83%;
	    transform: translate(-50%, -50%);
	}
	
	/* 지도 관련 */
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
    
    /* 검색창 */
   	input {
		border-radius : 10px;
		border : 1px solid #76BEFF;
	}
	 
	input:focus {
		outline : 2px solid #76BEFF;
	}
	
	.div-admin-dang-list {
		height : 15rem;
	}
	
	.span-dang-private {
		background-color : #FFE34E;
    	border : none;
    	border-radius : 5px;
	}
	
	.btn-dang-search-submit {
		border-radius : 5px;
		background-color : #76BEFF;
		color : white;
		border : none;
	}
	
	.div-row-dang-list-border {
		border-bottom : 1px solid black;
	}
	
	/* 댕모임 상세 */
	.div-row-dang-detail-dang-info {
		height : 4rem;
	}
	
	.div-row-dang-detail-dang-hashtag {
		height : 10rem;
	}
	
	.span-dang-detail,
	.span-dang-creator-detail {
		font-weight : bolder;
	}
	
	/* 지도 영역 */
	.text-dang-select-clear {
		font-size : 24px;
		stroke: red;
        stroke-width : 2;
        stroke-linecap: round;
        text-anchor: middle;
        alignment-baseline: middle;
        cursor: pointer;
	}
	
	/* 댕모임 목록 */
	.span-admin-dang-list-dang-name {
		cursor : pointer;
	}
	    
    /* 페이지네이션 */
    ul {
	    list-style: none;
	    margin:0px; 
	    padding:0px;
	}
	
	.ul-dang-list-page-item {
		cursor : pointer;
		width : 2.5rem;
		height : 2rem;
		border : 1px solid #CEE3F2;
		color : #76BEFF;
	}
	
	.ul-dang-list-page-item:hover {
		border : 2px solid #76BEFF;
		background-color : #F0F9FF;
	}
	
	.ul-dang-list-page-item-selected {
		border : 2px solid #76BEFF;
		background-color : #76BEFF;
		color : white;
	}
	
</style>

<div class = "container-fluid mt-5 mb-5">
	<div class = "row">
		<div class = "col-10 offset-1">
			<div class = "row text-center">
				<strong class = "strong-page-title">댕모임 조회</strong>
			</div>
			
			<div class = "row mt-5">
				<div class = "col-6 d-flex justify-content-center align-items-center">
					<div class = "row">
						<div class = "offset-1 col-10 px-5 py-1">
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
							    	<text id="00000" class="text-dang-select-clear" x="700" y="590">초기화</text>
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
				</div>
				<div class = "col-6 align-items-center">
					<div class = "row mt-2">
						<div class = "offset-1 col-7">
							<input class = "w-100 p-1 input-dang-search-keyword">
						</div>
						<div class = "col-3">
							<button class = "w-100 p-1 btn-dang-search-submit">검색</button>
						</div>
					</div>
					<div class = "row mt-2 px-3 py-1 div-row-dang-list-border">
						<div class = "col-6 d-flex justify-content-center align-items-center p-1">
							<span>댕모임명</span>
						</div>
						<div class = "col-2 d-flex justify-content-center align-items-center p-1">
							<span>인원</span>
						</div>
						<div class = "col-2 d-flex justify-content-center align-items-center p-1">
							<span>좋아요</span>
						</div>
						<div class = "col-2 d-flex justify-content-center align-items-center p-1">
							<span>비공개</span>
						</div>
					</div>
					<div class = "row px-3">
						<div class = "col div-admin-dang-list">
							<c:forEach var = "dangListAdmin" items = "${dangListAdmin}">
							<div class = "row mt-2">
								<div class = "col-6 d-flex justify-content-center align-items-center p-1">
									<span class = "span-admin-dang-list-dang-name" data-dangno = "${dangListAdmin.dangNo}" data-userno = "${dangListAdmin.userNo}">${dangListAdmin.dangName}</span>
								</div>
								<div class = "col-2 d-flex justify-content-center align-items-center p-1">
									<span>${dangListAdmin.dangHead}</span> 
									<span>/</span>
									<span>${dangListAdmin.dangHeadmax}</span>
								</div>
								<div class = "col-2 d-flex justify-content-center align-items-center p-1">
									<i class="fa-solid fa-heart me-2"></i>
									<span>${dangListAdmin.dangLike}</span>
								</div>
								<div class = "col-2 d-flex justify-content-center align-items-center p-1">
									<c:if test = "${dangListAdmin.dangPrivate == 'Y'}">
										<span class = "px-3 span-dang-private">							
											<i class="fa-solid fa-lock"></i>
										</span>
									</c:if>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
					<div class = "row mb-2">
						<div class = "col d-flex justify-content-center align-items-center">
							<ul class = "d-flex flex-row ul-dang-list-page-navigator">
								<li class = "ul-dang-list-page-item ul-dang-list-page-item-first d-flex justify-content-center align-items-center" data-pagefirst = "1">
									<span><i class="fa-solid fa-backward"></i></span>
								</li>
								
								<c:choose>
								<c:when test = "${dangListAdminRestRequestDto.blockPrev() != 0}">
								<li class = "ul-dang-list-page-item ul-dang-list-page-item-prev d-flex justify-content-center align-items-center" data-pageprev = "${dangListAdminRestRequestDto.blockPrev()}">
									<span><i class="fa-solid fa-backward-step"></i></span>
								</li>
								</c:when>
								<c:otherwise>
								<li class = "ul-dang-list-page-item ul-dang-list-page-item-prev d-flex justify-content-center align-items-center" data-pageprev = "1">
									<span><i class="fa-solid fa-backward-step"></i></span>
								</li>
								</c:otherwise>
								</c:choose>
		
								<c:forEach var = "i" begin = "${dangListAdminRestRequestDto.blockStart()}" end = "${dangListAdminRestRequestDto.blockEnd()}" step = "1">
								<li class = "ul-dang-list-page-item ul-dang-list-page-item-unit d-flex justify-content-center align-items-center">
									<span>${i}</span>
								</li>
								</c:forEach>
								
								<c:choose>
								<c:when test = "${dangListAdminRestRequestDto.blockNext() >= dangListAdminRestRequestDto.blockLast()}">
								<li class = "ul-dang-list-page-item ul-dang-list-page-item-next d-flex justify-content-center align-items-center" data-pagenext = "${dangListAdminRestRequestDto.blockLast()}">
									<span><i class="fa-solid fa-forward-step"></i></span>
								</li>
								</c:when>
								<c:otherwise>
								<li class = "ul-dang-list-page-item ul-dang-list-page-item-next d-flex justify-content-center align-items-center" data-pagenext = "${dangListAdminRestRequestDto.blockNext()}">
									<span><i class="fa-solid fa-forward-step"></i></span>
								</li>
								</c:otherwise>
								</c:choose>
								
								<li class = "ul-dang-list-page-item ul-dang-list-page-item-last d-flex justify-content-center align-items-center" data-pagelast = "${dangListAdminRestRequestDto.blockLast()}">
									<span><i class="fa-solid fa-forward"></i></span>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<div class = "row mt-5">
				<div class = "col-6 py-2 px-4">
					<div class = "row div-dang-detail-container p-3"> <%-- 댕모임 상세 정보 시작 --%>
						<div class = "col">						
							<div class = "row mt-3">
								<div class = "col d-flex justify-content-start align-items-center">
									<img class = "img-dang-logo me-2" src = "${pageContext.request.contextPath}/images/logo2.png">
									<strong class = "strong-text-dang-detail">댕모임 상세 정보</strong>
								</div>
							</div>
							<div class = "row mt-3 px-3">
								<div class = "col div-col-dang-detail-info-container">
									<div class = "div-dang-detail-img">
										<img src = "${pageContext.request.contextPath}/images/img-dang-profile.png" class = "img-dang-detail-dang-profile">
									</div>
									<div class = "row mt-3">
										<div class = "col-3 p-1 d-flex justify-content-start align-items-start">
											<strong>댕모임명</strong>
										</div>
										<div class = "col-9 p-1">
											<span class = "span-dang-detail span-dang-detail-dang-name"></span>
										</div>
									</div>
									<div class = "row mt-3">
										<div class = "col-3 p-1 d-flex justify-content-start align-items-start">
											<strong>개설일</strong>
										</div>
										<div class = "col-9 p-1">
											<span class = "span-dang-detail span-dang-detail-dang-createtime"></span>
										</div>
									</div>
									<div class = "row mt-3">
										<div class = "col-3 p-1 d-flex justify-content-start align-items-start">
											<strong>인원수</strong>
										</div>
										<div class = "col-9 p-1">
											<span class = "span-dang-detail span-dang-detail-dang-head-count"></span>
										</div>
									</div>
									<div class = "row my-3">
										<div class = "col-3 p-1 d-flex justify-content-start align-items-start">
											<strong>좋아요</strong>
										</div>
										<div class = "col-9 p-1">
											<span class = "span-dang-detail span-dang-detail-dang-like"></span>
										</div>
									</div>
								</div>
							</div>
							<div class = "row mt-3 px-3 div-row-dang-detail-dang-info">	
								<div class = "col-3 p-1 d-flex justify-content-start align-items-start">
									<strong>댕모임 정보</strong>
								</div>
								<div class = "col-9 p-1">
									<span class = "span-dang-detail span-dang-detail-dang-info"></span>
								</div>
							</div>
							<div class = "row mt-3 px-3 mb-3 div-row-dang-detail-dang-hashtag">
								<div class = "col-3 p-1 d-flex justify-content-start align-items-start">
									<strong>해시태그</strong>
								</div>
								<div class = "col-9 p-1">
									<span class = "d-flex flex-column span-dang-detail span-dang-detail-dang-hashtag">
									</span>
								</div>
							</div>
						</div>
					</div> <%-- 댕모임 상세 정보 끝 --%>
				</div>
				<div class = "col-6 py-2 px-4">
					<div class = "row div-dang-detail-container p-3">
						<div class = "col">
							<div class = "row mt-3">
								<div class = "col d-flex justify-content-start align-items-center">
									<img class = "img-dang-creator-logo me-2" src = "${pageContext.request.contextPath}/images/crown.png">
									<strong class = "strong-text-dang-detail">개설자 상세 정보</strong>
								</div>
							</div>
							<div class = "row mt-3 px-3">
								<div class = "col div-col-dang-creator-detail-info-container">
									<div class = "div-dang-creator-detail-img">
										<img class = "img-dang-creator-detail-profile" src = "${pageContext.request.contextPath}/images/basic-profile.png">
									</div>
									<div class = "row mt-2">
										<div class = "col-3 p-1 d-flex justify-content-start align-items-start">
											<strong>아이디</strong>
										</div>
										<div class = "col-9 p-1">
											<span class = "span-dang-creator-detail span-dang-creator-detail-user-id"></span>
										</div>
									</div>
									<div class = "row mt-3">
										<div class = "col-3 p-1 d-flex justify-content-start align-items-start">
											<strong>성별</strong>
										</div>
										<div class = "col-9 p-1">
											<span class = "span-dang-creator-detail span-dang-creator-detail-user-gender"></span>
										</div>
									</div>
									<div class = "row mt-3">
										<div class = "col-3 p-1 d-flex justify-content-start align-items-start">
											<strong>닉네임</strong>
										</div>
										<div class = "col-9 p-1">
											<span class = "span-dang-creator-detail span-dang-creator-detail-member-nick"></span>
										</div>
									</div>
									<div class = "row mt-3">
										<div class = "col-3 p-1 d-flex justify-content-start align-items-start">
											<strong>등급</strong>
										</div>
										<div class = "col-9 p-1">
											<span class = "span-dang-creator-detail span-dang-creator-detail-member-grade"></span>
										</div>
									</div>
								</div>
							</div>
							<div class = "row mt-3 px-3">
								<div class = "col-3 p-1 d-flex justify-content-start align-items-start">
									<strong>전화번호</strong>
								</div>
								<div class = "col-9 p-1">
									<span class = "span-dang-creator-detail span-dang-creator-detail-user-tel"></span>
								</div>
							</div>
							<div class = "row mt-3 px-3">
								<div class = "col-3 p-1 d-flex justify-content-start align-items-start">
									<strong>이메일</strong>
								</div>
								<div class = "col-9 p-1">
									<span class = "span-dang-creator-detail span-dang-creator-detail-user-email"></span>
								</div>
							</div>
							<div class = "row mt-3 px-3">
								<div class = "col-3 p-1 d-flex justify-content-start align-items-start">
									<strong>가입일</strong>
								</div>
								<div class = "col-9 p-1">
									<span class = "span-dang-creator-detail span-dang-creator-detail-user-joindate"></span>
								</div>
							</div>
							<div class = "row mt-3 mb-3 px-3">
								<div class = "col-3 p-1 d-flex justify-content-start align-items-start">
									<strong>최종 로그인</strong>
								</div>
								<div class = "col-9 p-1">
									<span class = "span-dang-creator-detail span-dang-creator-detail-user-logindate"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

	$(function(){
		
		var p = 1;
		
		var dangArea;
		
		var keyword;
		
		// 초기 페이지네이션 1페이지를 선택
		$(".ul-dang-list-page-item-unit").filter(":contains(1)").addClass("ul-dang-list-page-item-selected");
		
		// 초기화 클릭시
		$(document).on("click", ".text-dang-select-clear", function(){
			// 페이지 번호 초기화
			p = 1;
			// 검색어 초기화
			keyword = null;
			// 검색창 초기화
			$(".input-dang-search-keyword").val("");
			// 지역 선택(색상) 초기화
        	$(".OUTLINE").removeClass("area-selected");
			// 지역 초기화
			dangArea = null;
			// 비동기 전체 조회
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/dang_list",
				method : "post",
				success : function(resp) {
					console.log(resp);
					
					if(resp.dangListAdmin.length == 0) {
						// 목록 초기화
						$(".div-admin-dang-list").empty();
						// 댕모임 없음
						$(".div-admin-dang-list")
							.append(
								$("<div>").attr("class", "col h-100 d-flex justify-content-center align-items-center")
									.append(
										$("<span>").attr("class", "span-dang-list-none").text("댕모임 목록이 존재하지 않습니다.")		
									)		
							)
						// 페이지네이션 초기화
						$(".ul-dang-list-page-item-unit").remove();
						createPagination(1);
					} else {
						// 목록 초기화
						$(".div-admin-dang-list").empty();
						// 목록 생성
						for(var i = 0 ; i < resp.dangListAdmin.length ; i ++) {						
							createRowDangList(resp.dangListAdmin[i])
						}
						
						// 페이지네이션 초기화
						$(".ul-dang-list-page-item-unit").remove();
						// 페이지네이션 생성
						for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
							createPagination(i);
						}
						
						// 페이지네이션 양 끝 버튼 설정
						$(".ul-dang-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
						$(".ul-dang-list-page-item-last").attr("data-pagelast", resp.blockLast);
						if(resp.blockPrev <= 1) {
							$(".ul-dang-list-page-item-prev").attr("data-pageprev", 1);
						} else {
							$(".ul-dang-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
						}
						if(resp.blockNext > resp.blockLast) {
							$(".ul-dang-list-page-item-next").attr("data-pagenext", resp.blockLast);
						} else {
							$(".ul-dang-list-page-item-next").attr("data-pagenext", resp.blockNext);
						}
					}
					// 1페이지 선택
					$(".ul-dang-list-page-item-unit").filter(":contains(1)").addClass("ul-dang-list-page-item-selected");
				}
			});
		});
		
		// 페이지 이동
		$(document).on("click", ".ul-dang-list-page-item-unit", function(){
			// 페이지 번호
			p = $(this).children().text();
			console.log(p);
			// 데이터 전송 객체
			var formData = new FormData();
			formData.append("p", p);
			// 전체 검색에 대한 경우
			if(dangArea != null) {
				formData.append("dangArea", dangArea);
			}
			if(keyword != null) {			
				formData.append("dangName", keyword);
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/dang_list",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					console.log(resp);
					
					if(resp.dangListAdmin.length == 0) {
						// 목록 초기화
						$(".div-admin-dang-list").empty();
						// 댕모임 없음
						$(".div-admin-dang-list")
							.append(
								$("<div>").attr("class", "col h-100 d-flex justify-content-center align-items-center")
									.append(
										$("<span>").attr("class", "span-dang-list-none").text("댕모임 목록이 존재하지 않습니다.")		
									)		
							)
						// 페이지네이션 초기화
						$(".ul-dang-list-page-item-unit").remove();
						createPagination(1);
					} else {
						// 목록 초기화
						$(".div-admin-dang-list").empty();
						// 목록 생성
						for(var i = 0 ; i < resp.dangListAdmin.length ; i ++) {						
							createRowDangList(resp.dangListAdmin[i])
						}
						
						// 페이지네이션 초기화
						$(".ul-dang-list-page-item-unit").remove();
						// 페이지네이션 생성
						for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
							createPagination(i);
						}
						
						// 페이지네이션 양 끝 버튼 설정
						$(".ul-dang-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
						$(".ul-dang-list-page-item-last").attr("data-pagelast", resp.blockLast);
						if(resp.blockPrev <= 1) {
							$(".ul-dang-list-page-item-prev").attr("data-pageprev", 1);
						} else {
							$(".ul-dang-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
						}
						if(resp.blockNext > resp.blockLast) {
							$(".ul-dang-list-page-item-next").attr("data-pagenext", resp.blockLast);
						} else {
							$(".ul-dang-list-page-item-next").attr("data-pagenext", resp.blockNext);
						}
						// 페이지네이션 선택 초기화
						$(".ul-dang-list-page-item-unit").removeClass("ul-dang-list-page-item-selected");
						// 페이지 선택
						$(".ul-dang-list-page-item-unit").filter(":contains("+p+")").addClass("ul-dang-list-page-item-selected");
					}
				}
			});
		});
		
		// 다음 페이지로
		$(document).on("click", ".ul-dang-list-page-item-next", function(){
			// 페이지 번호
			p = $(this).attr("data-pagenext");
			// 데이터 전송 객체
			var formData = new FormData();
			formData.append("p", p);
			// 전체 검색에 대한 경우
			if(dangArea != null) {
				formData.append("dangArea", dangArea);
			}
			if(keyword != null) {			
				formData.append("dangName", keyword);
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/dang_list",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					console.log(resp);
					
					if(resp.dangListAdmin.length == 0) {
						// 목록 초기화
						$(".div-admin-dang-list").empty();
						// 댕모임 없음
						$(".div-admin-dang-list")
							.append(
								$("<div>").attr("class", "col h-100 d-flex justify-content-center align-items-center")
									.append(
										$("<span>").attr("class", "span-dang-list-none").text("댕모임 목록이 존재하지 않습니다.")		
									)		
							)
						// 페이지네이션 초기화
						$(".ul-dang-list-page-item-unit").remove();
						createPagination(1);
					} else {
						// 목록 초기화
						$(".div-admin-dang-list").empty();
						// 목록 생성
						for(var i = 0 ; i < resp.dangListAdmin.length ; i ++) {						
							createRowDangList(resp.dangListAdmin[i])
						}
						
						// 페이지네이션 초기화
						$(".ul-dang-list-page-item-unit").remove();
						// 페이지네이션 생성
						for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
							createPagination(i);
						}
						
						// 페이지네이션 양 끝 버튼 설정
						$(".ul-dang-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
						$(".ul-dang-list-page-item-last").attr("data-pagelast", resp.blockLast);
						if(resp.blockPrev <= 1) {
							$(".ul-dang-list-page-item-prev").attr("data-pageprev", 1);
						} else {
							$(".ul-dang-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
						}
						if(resp.blockNext > resp.blockLast) {
							$(".ul-dang-list-page-item-next").attr("data-pagenext", resp.blockLast);
						} else {
							$(".ul-dang-list-page-item-next").attr("data-pagenext", resp.blockNext);
						}
						// 페이지네이션 선택 초기화
						$(".ul-dang-list-page-item-unit").removeClass("ul-dang-list-page-item-selected");
						// 페이지 선택
						$(".ul-dang-list-page-item-unit").filter(":contains("+p+")").addClass("ul-dang-list-page-item-selected");
					}
				}
			});
		});
		
		// 이전 페이지로
		$(document).on("click", ".ul-dang-list-page-item-prev", function(){
			// 페이지 번호
			p = $(this).attr("data-pageprev");
			// 데이터 전송 객체
			var formData = new FormData();
			formData.append("p", p);
			// 전체 검색에 대한 경우
			if(dangArea != null) {
				formData.append("dangArea", dangArea);
			}
			if(keyword != null) {			
				formData.append("dangName", keyword);
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/dang_list",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					console.log(resp);
					
					if(resp.dangListAdmin.length == 0) {
						// 목록 초기화
						$(".div-admin-dang-list").empty();
						// 댕모임 없음
						$(".div-admin-dang-list")
							.append(
								$("<div>").attr("class", "col h-100 d-flex justify-content-center align-items-center")
									.append(
										$("<span>").attr("class", "span-dang-list-none").text("댕모임 목록이 존재하지 않습니다.")		
									)		
							)
						// 페이지네이션 초기화
						$(".ul-dang-list-page-item-unit").remove();
						createPagination(1);
					} else {
						// 목록 초기화
						$(".div-admin-dang-list").empty();
						// 목록 생성
						for(var i = 0 ; i < resp.dangListAdmin.length ; i ++) {						
							createRowDangList(resp.dangListAdmin[i])
						}
						
						// 페이지네이션 초기화
						$(".ul-dang-list-page-item-unit").remove();
						// 페이지네이션 생성
						for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
							createPagination(i);
						}
						
						// 페이지네이션 양 끝 버튼 설정
						$(".ul-dang-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
						$(".ul-dang-list-page-item-last").attr("data-pagelast", resp.blockLast);
						if(resp.blockPrev <= 1) {
							$(".ul-dang-list-page-item-prev").attr("data-pageprev", 1);
						} else {
							$(".ul-dang-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
						}
						if(resp.blockNext > resp.blockLast) {
							$(".ul-dang-list-page-item-next").attr("data-pagenext", resp.blockLast);
						} else {
							$(".ul-dang-list-page-item-next").attr("data-pagenext", resp.blockNext);
						}
						// 페이지네이션 선택 초기화
						$(".ul-dang-list-page-item-unit").removeClass("ul-dang-list-page-item-selected");
						// 페이지 선택
						$(".ul-dang-list-page-item-unit").filter(":contains("+p+")").addClass("ul-dang-list-page-item-selected");
					}
				}
			});
		});
		
		// 맨 앞으로
		$(document).on("click", ".ul-dang-list-page-item-first", function(){
			// 맨 앞 페이지 번호
			p = $(this).attr("data-pagefirst");			
			// 데이터 전송 객체
			var formData = new FormData();
			formData.append("p", p);
			// 전체 검색에 대한 경우
			if(dangArea != null) {
				formData.append("dangArea", dangArea);
			}
			if(keyword != null) {			
				formData.append("dangName", keyword);
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/dang_list",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					console.log(resp);
					
					if(resp.dangListAdmin.length == 0) {
						// 목록 초기화
						$(".div-admin-dang-list").empty();
						// 댕모임 없음
						$(".div-admin-dang-list")
							.append(
								$("<div>").attr("class", "col h-100 d-flex justify-content-center align-items-center")
									.append(
										$("<span>").attr("class", "span-dang-list-none").text("댕모임 목록이 존재하지 않습니다.")		
									)		
							)
						// 페이지네이션 초기화
						$(".ul-dang-list-page-item-unit").remove();
						createPagination(1);
					} else {
						// 목록 초기화
						$(".div-admin-dang-list").empty();
						// 목록 생성
						for(var i = 0 ; i < resp.dangListAdmin.length ; i ++) {						
							createRowDangList(resp.dangListAdmin[i])
						}
						
						// 페이지네이션 초기화
						$(".ul-dang-list-page-item-unit").remove();
						// 페이지네이션 생성
						for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
							createPagination(i);
						}
						
						// 페이지네이션 양 끝 버튼 설정
						$(".ul-dang-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
						$(".ul-dang-list-page-item-last").attr("data-pagelast", resp.blockLast);
						if(resp.blockPrev <= 1) {
							$(".ul-dang-list-page-item-prev").attr("data-pageprev", 1);
						} else {
							$(".ul-dang-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
						}
						if(resp.blockNext > resp.blockLast) {
							$(".ul-dang-list-page-item-next").attr("data-pagenext", resp.blockLast);
						} else {
							$(".ul-dang-list-page-item-next").attr("data-pagenext", resp.blockNext);
						}
						// 페이지네이션 선택 초기화
						$(".ul-dang-list-page-item-unit").removeClass("ul-dang-list-page-item-selected");
						// 페이지 선택
						$(".ul-dang-list-page-item-unit").filter(":contains("+p+")").addClass("ul-dang-list-page-item-selected");
					}
				}
			});
		});
		
		// 맨 뒤로
		$(document).on("click", ".ul-dang-list-page-item-last", function(){
			// 맨 뒤 페이지 번호
			p = $(this).attr("data-pagelast");

			// 데이터 전송 객체
			var formData = new FormData();
			formData.append("p", p);
			// 전체 검색에 대한 경우
			if(dangArea != null) {
				formData.append("dangArea", dangArea);
			}
			if(keyword != null) {			
				formData.append("dangName", keyword);
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/dang_list",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					console.log(resp);
					
					if(resp.dangListAdmin.length == 0) {
						// 목록 초기화
						$(".div-admin-dang-list").empty();
						// 댕모임 없음
						$(".div-admin-dang-list")
							.append(
								$("<div>").attr("class", "col h-100 d-flex justify-content-center align-items-center")
									.append(
										$("<span>").attr("class", "span-dang-list-none").text("댕모임 목록이 존재하지 않습니다.")		
									)		
							)
						// 페이지네이션 초기화
						$(".ul-dang-list-page-item-unit").remove();
						createPagination(1);
					} else {
						// 목록 초기화
						$(".div-admin-dang-list").empty();
						// 목록 생성
						for(var i = 0 ; i < resp.dangListAdmin.length ; i ++) {						
							createRowDangList(resp.dangListAdmin[i])
						}
						
						// 페이지네이션 초기화
						$(".ul-dang-list-page-item-unit").remove();
						// 페이지네이션 생성
						for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
							createPagination(i);
						}
						
						// 페이지네이션 양 끝 버튼 설정
						$(".ul-dang-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
						$(".ul-dang-list-page-item-last").attr("data-pagelast", resp.blockLast);
						if(resp.blockPrev <= 1) {
							$(".ul-dang-list-page-item-prev").attr("data-pageprev", 1);
						} else {
							$(".ul-dang-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
						}
						if(resp.blockNext > resp.blockLast) {
							$(".ul-dang-list-page-item-next").attr("data-pagenext", resp.blockLast);
						} else {
							$(".ul-dang-list-page-item-next").attr("data-pagenext", resp.blockNext);
						}
						// 페이지네이션 선택 초기화
						$(".ul-dang-list-page-item-unit").removeClass("ul-dang-list-page-item-selected");
						// 페이지 선택
						$(".ul-dang-list-page-item-unit").filter(":contains("+p+")").addClass("ul-dang-list-page-item-selected");
					}
				}
			});
		});
		
		// 검색창 조회
		$(document).on("click", ".btn-dang-search-submit", function(){
			// 
			if(dangArea == null) {
				alert("지역을 선택해 주세요.");
				return;
			}
			// 검색어 설정
			keyword = $(".input-dang-search-keyword").val();
			// 페이지 초기화
			p = 1;
			
			// 데이터 전송 객체
			var formData = new FormData();
			formData.append("dangArea", dangArea);
			formData.append("p", p);
			formData.append("dangName", keyword);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/dang_list",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					console.log(resp);
					
					if(resp.dangListAdmin.length == 0) {
						// 목록 초기화
						$(".div-admin-dang-list").empty();
						// 댕모임 없음
						$(".div-admin-dang-list")
							.append(
								$("<div>").attr("class", "col h-100 d-flex justify-content-center align-items-center")
									.append(
										$("<span>").attr("class", "span-dang-list-none").text("댕모임 목록이 존재하지 않습니다.")		
									)		
							)
						// 페이지네이션 초기화
						$(".ul-dang-list-page-item-unit").remove();
						createPagination(1);
					} else {
						// 목록 초기화
						$(".div-admin-dang-list").empty();
						// 목록 생성
						for(var i = 0 ; i < resp.dangListAdmin.length ; i ++) {						
							createRowDangList(resp.dangListAdmin[i])
						}
						
						// 페이지네이션 초기화
						$(".ul-dang-list-page-item-unit").remove();
						// 페이지네이션 생성
						for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
							createPagination(i);
						}
						
						// 페이지네이션 양 끝 버튼 설정
						$(".ul-dang-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
						$(".ul-dang-list-page-item-last").attr("data-pagelast", resp.blockLast);
						if(resp.blockPrev <= 1) {
							$(".ul-dang-list-page-item-prev").attr("data-pageprev", 1);
						} else {
							$(".ul-dang-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
						}
						if(resp.blockNext > resp.blockLast) {
							$(".ul-dang-list-page-item-next").attr("data-pagenext", resp.blockLast);
						} else {
							$(".ul-dang-list-page-item-next").attr("data-pagenext", resp.blockNext);
						}
						// 페이지네이션 선택 초기화
						$(".ul-dang-list-page-item-unit").removeClass("ul-dang-list-page-item-selected");
						// 페이지 선택
						$(".ul-dang-list-page-item-unit").filter(":contains(1)").addClass("ul-dang-list-page-item-selected");
					}
				}
			});
		});
		
		// 지역을 클릭하면 해당 지역의 댕모임 조회 1페이지로 이동
		$(document).on("click", ".TEXT", function(){
			// 검색어 초기화
			$(".input-dang-search-keyword").val("");
			// 선택(색상) 초기화
        	$(".OUTLINE").removeClass("area-selected");
			// 클릭한 지역의 id 선택
            var id = $(this).prop("id");
			// 클릭한 지역의 색 변경
        	$("#CD" + id).addClass("area-selected");
			// 지역 선택
			dangArea = $(this).text();
			// 페이지 초기화
			p = 1;
			// 데이터 전송 객체
			var formData = new FormData();
			formData.append("dangArea", dangArea);
			formData.append("p", p);
			// 비동기 조회
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/dang_list",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					console.log(resp);
					
					if(resp.dangListAdmin.length == 0) {
						// 목록 초기화
						$(".div-admin-dang-list").empty();
						// 댕모임 없음
						$(".div-admin-dang-list")
							.append(
								$("<div>").attr("class", "col h-100 d-flex justify-content-center align-items-center")
									.append(
										$("<span>").attr("class", "span-dang-list-none").text("댕모임 목록이 존재하지 않습니다.")		
									)		
							)
						// 페이지네이션 초기화
						$(".ul-dang-list-page-item-unit").remove();
						createPagination(1);
					} else {
						// 목록 초기화
						$(".div-admin-dang-list").empty();
						// 목록 생성
						for(var i = 0 ; i < resp.dangListAdmin.length ; i ++) {						
							createRowDangList(resp.dangListAdmin[i])
						}
						
						// 페이지네이션 초기화
						$(".ul-dang-list-page-item-unit").remove();
						// 페이지네이션 생성
						for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
							createPagination(i);
						}
						
						// 페이지네이션 양 끝 버튼 설정
						$(".ul-dang-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
						$(".ul-dang-list-page-item-last").attr("data-pagelast", resp.blockLast);
						if(resp.blockPrev <= 1) {
							$(".ul-dang-list-page-item-prev").attr("data-pageprev", 1);
						} else {
							$(".ul-dang-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
						}
						if(resp.blockNext > resp.blockLast) {
							$(".ul-dang-list-page-item-next").attr("data-pagenext", resp.blockLast);
						} else {
							$(".ul-dang-list-page-item-next").attr("data-pagenext", resp.blockNext);
						}
						// 페이지네이션 선택 초기화
						$(".ul-dang-list-page-item-unit").removeClass("ul-dang-list-page-item-selected");
						// 페이지 선택
						$(".ul-dang-list-page-item-unit").filter(":contains(1)").addClass("ul-dang-list-page-item-selected");
					}
				}
			});
		});
		
		// 댕모임 목록 생성 함수
		function createRowDangList(resp){
			var target = $(".div-admin-dang-list");
			
			var row = $("<div>").attr("class", "row mt-2");

			var colDangName = $("<div>").attr("class", "col-6 d-flex justify-content-center align-items-center p-1")
									.append(
										$("<span>").attr("class", "span-admin-dang-list-dang-name").attr("data-dangno", resp.dangNo).attr("data-userno", resp.userNo).text(resp.dangName)		
									);
			
			var colDangHead = $("<div>").attr("class", "col-2 d-flex justify-content-center align-items-center p-1")
									.append(
										$("<span>").text(resp.dangHead)		
									)
									.append(
										$("<span>").text("/")
									)
									.append(
										$("<span>").text(resp.dangHeadmax)
									)
									
			var colDangLike = $("<div>").attr("class", "col-2 d-flex justify-content-center align-items-center p-1")
									.append(
										$("<i>").attr("class", "fa-solid fa-heart me-2")
									)
									.append(
										$("<span>").text(resp.dangLike)
									)
			
			var colDangPrivate = $("<div>").attr("class", "col-2 d-flex justify-content-center align-items-center p-1")
			if(resp.dangPrivate == "Y") {
				colDangPrivate
					.append(
						$("<span>").attr("class", "px-3 span-dang-private")
							.append(
								$("<i>").attr("class", "fa-solid fa-lock")		
							)
					)
			}
			
			row.append(colDangName).append(colDangHead).append(colDangLike).append(colDangPrivate);
			
			target.append(row);
		}	
		
		// 페이지네이션 생성 함수
		function createPagination(resp) {
			$(".ul-dang-list-page-item-next")
			.before(
				$("<li>").attr("class", "ul-dang-list-page-item ul-dang-list-page-item-unit d-flex justify-content-center align-items-center")
					.append(
						$("<span>").text(resp)	
					)
			)
		}
		
		// 댕모임 상세 조회
		$(document).on("click", ".span-admin-dang-list-dang-name", function(){
			var dangNo = $(this).attr("data-dangno");
			var userNo = $(this).attr("data-userno");
			console.log(dangNo);
			console.log(userNo);
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/dang_detail?dangNo="+dangNo+"&userNo="+userNo,
				success : function(resp) {
					console.log(resp);
					
					// 초기화
					$(".span-dang-detail").empty();
					$(".span-dang-creator-detail").empty();
					// 댕모임 정보
					$(".span-dang-detail-dang-name").text(resp.dangDetailAdminDto.dangName);
					$(".span-dang-detail-dang-createtime").text(resp.dangDetailAdminDto.dangCreatetime);
					$(".span-dang-detail-dang-head-count").text(resp.dangDetailAdminDto.dangHead + "/" + resp.dangDetailAdminDto.dangHeadmax);
					$(".span-dang-detail-dang-like").text(resp.dangDetailAdminDto.dangLike);
					$(".span-dang-detail-dang-info").text(resp.dangDetailAdminDto.dangInfo);
					
					for(var i = 0 ; i < resp.dangHashtag.length ; i ++) {
						$(".span-dang-detail-dang-hashtag")
							.append(
								$("<span>").attr("class", "my-1").text("#"+resp.dangHashtag[i].hashtagContent)		
							)
					}
					
					if(resp.dangDetailAdminDto.attachmentNo != null) {
						$(".img-dang-detail-dang-profile").attr("src", "${pageContext.request.contextPath}/rest_attachment/download/" + resp.dangDetailAdminDto.attachmentNo)	
					} else {
						$(".img-dang-detail-dang-profile").attr("src", "${pageContext.request.contextPath}/images/img-dang-profile.png")
					}
					
					$(".span-dang-creator-detail-user-id").text(resp.dangDetailCreatorAdminDto.userId);
					$(".span-dang-creator-detail-member-nick").text(resp.dangDetailCreatorAdminDto.memberNick);
					
					if(resp.dangDetailCreatorAdminDto.userGender == "M") {						
						$(".span-dang-creator-detail-user-gender").text("남자");
					} else {
						$(".span-dang-creator-detail-user-gender").text("여자");
					}
					
					$(".span-dang-creator-detail-member-grade").text(resp.dangDetailCreatorAdminDto.memberGrade + " / " + resp.dangDetailCreatorAdminDto.memberScore + "point")
					
					$(".span-dang-creator-detail-user-tel").text(resp.dangDetailCreatorAdminDto.userTel);
					
					$(".span-dang-creator-detail-user-email").text(resp.dangDetailCreatorAdminDto.userEmail);
					
					$(".span-dang-creator-detail-user-joindate").text(resp.dangDetailCreatorAdminDto.userJoindate);
					$(".span-dang-creator-detail-user-logindate").text(resp.dangDetailCreatorAdminDto.userLogindate);
					if(resp.dangDetailCreatorAdminDto.attachmentNo != null) {
						$(".img-dang-creator-detail-profile").attr("src", "${pageContext.request.contextPath}/rest_attachment/download/" + resp.dangDetailCreatorAdminDto.attachmentNo);
					} else {						
						$(".img-dang-creator-detail-profile").attr("src", "${pageContext.request.contextPath}/images/basic-profile.png");
					}
				}
			});
		});
		
		function clearDangDetailInfo() {
			// 정보 초기화
			$(".span-dang-detail").empty();
			$(".span-dang-creator-detail").empty();
			// 프로필 초기화
			$(".img-dang-creator-detail-profile").attr("src", "${pageContext.request.contextPath}/images/basic-profile.png");
			$(".img-dang-creator-detail-profile").attr("src", "${pageContext.request.contextPath}/images/basic-profile.png");
		}
	});

</script>