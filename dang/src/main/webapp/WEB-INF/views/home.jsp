<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="댕모임 메인" name="title"/>
</jsp:include>

<style>

	* {
		
	}

	.img-carousel {
		aspect-ratio : 11/3;
	}

	.div-home-menu {
		border : 1px solid #EBEBEB;
		border-radius : 15px;
		background-color : white;
	}
	
	.div-home-submenu {
		border-radius : 10px;
		background-color : #EEEEEE;
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
    
    .img-dang-profile {
    	height : 300px;
    	border-radius : 15px 15px 0 0 !important;
    }
    
    .div-outer-dang-info {
    	border-radius : 15px !important;
    }
    
    .span-dang-createdate {
    	font-size : 10px;
    	color : #9D9FA2;
    }
    
    .strong-dang-name {
    	font-size : 24px;
    }
    
    .span-dang-info {
    	color : #9D9FA2;
    }
    
    .span-dang-hashtag {
    	white-space : nowrap;
    	background-color : #7E9AFF;
    	color : white;
    	border-radius : 5px;
    }
    
    .modal-backdrop {
    	background-color : #CEE3F2 !important;
    	opacity: 0.5;
    }
    
    .btn-dang {
    	border : none;
    	border-radius : 5px;
    }
    
    .btn-dang-like {
    	background-color: #F94888;
    	color : white;
    }
    
    .btn-dang-join,
    .btn-dang-join-private {
    	background-color: #FFE34E;
    	color : white;
    }
    
    .btn-dang-enter {
    	background-color: #76BEFF;
    	color : white;
    }
    
    .btn-dang-return {
    	border-radius : 5px;
		background-color : #787878;
		color : white;
		border : none;
    }
    
    .div-dang-head {
    	border-radius : 5px;
    	background-color: #EDEDED;
    }
    
    .div-select-dang {
    	cursor:pointer;
    }
    
    .img-dang-home-category {
    	width : 3rem;
    	height : 3rem;
    }
	
	.div-dang-search-initial-text,
	.div-dang-search-none {
		height : 15rem;
	}
	
	.strong-dang-search-main {
		font-size : 20px;
	}
	
	.span-modal-join-dang-helper{
	    font-weight: bold;
	}
	
	.btn-modal-join-dang-nick-search {
	    background-color: #6A6A6A;
	    color: white;
	    border: none;
	    border-radius: 10px;
	}
	
	.btn-modal-join-submit {
	    background-color: #76BEFF;
	    color: white;
	    border: none;
	    border-radius: 10px;
	}
	
	.input-modal-join  {
	    background-color: #EAEAEA;
	    border: none;
	    border-radius: 10px;
	}
</style>


<%-- 로그인 중인 회원의 회원 번호 --%>
<input type = "hidden" id = "loginNo" value = "${loginNo}"> 


<div class = "container-fluid"> <%-- container 시작 --%>
	<div class = "row">
		<div class = "col-8 offset-2">
			<div class = "row my-3"> <%-- 스와이퍼 영역 --%>
				<div id="carousel-main" class="carousel slide" data-bs-ride="carousel">
				  	<div class="carousel-inner">
				    	<div class="carousel-item active">
				     		<img src = "${pageContext.request.contextPath}/images/img-carousel-dog.jpg" class = "w-100 img-carousel div-home-menu">
				    	</div>
				    	<div class="carousel-item">
				      		<img src = "${pageContext.request.contextPath}/images/img-carousel-dog.jpg" class = "w-100 img-carousel div-home-menu">
				    	</div>
				    	<div class="carousel-item">
				      		<img src = "${pageContext.request.contextPath}/images/img-carousel-dog.jpg" class = "w-100 img-carousel div-home-menu">
				    	</div>
				  	</div>
				  	<button class="carousel-control-prev" type="button" data-bs-target="#carousel-main" data-bs-slide="prev">
				    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    	<span class="visually-hidden">이전</span>
				  	</button>
				  	<button class="carousel-control-next" type="button" data-bs-target="#carousel-main" data-bs-slide="next">
				    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
				    	<span class="visually-hidden">다음</span>
				  	</button>
				</div>
			</div>
			<div class = "row my-4">
				<div class = "col-8">
					<div class = "col div-home-menu shadow" style="height: 450px;">
						<div class = "row px-4 py-2">
							<div class = "col p-2 d-flex align-items-center">						
								<img src = "${pageContext.request.contextPath}/images/img-home-dang-recommendation.png" class= "me-2 img-dang-home-category">
								<strong>댕모임 찾기</strong>
							</div>
						</div>
						<div class = "row px-4 py-2">
							<div class = "col-6 px-2 pt-2 pb-4">
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
							<div class = "col-6 px-4 py-1 div-dang-search">
								<div class = "col d-flex flex-column justify-content-center align-items-center div-dang-search-initial-text">								
									<strong class = "mt-1 strong-dang-search-main">우리 지역에서</strong>
									<strong class = "mt-1 strong-dang-search-main">가장 핫한 댕모임을</strong>
									<strong class = "my-1 strong-dang-search-main">확인해 보세요!</strong>
								</div>
							</div> <%-- 비동기 조회 후 상위 5개 댕모임 태그 붙일 영역 --%>
						</div>
					</div>
				</div>
				<div class = "col-4">
					<div class = "col div-home-menu shadow" style="height: 450px;">
						<div class = "row px-4 py-2">
							<div class = "col p-2 d-flex align-items-center">
								<img src = "${pageContext.request.contextPath}/images/img-home-place-recommendation.png" class= "me-2 img-dang-home-category">		
								<strong>댕모임 장소 추천</strong>
							</div>
						</div>
						<div class = "row px-4 py-2">
							<div class = "col p-2">
								<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
								  <div class="carousel-indicators">
								    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
								    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
								  </div>
								  <div class="carousel-inner">
								    <div class="carousel-item active">
								    	<a href="${pageContext.request.contextPath}/place/detail/${recommendPlace[0].placeNo}">
								      		<img src= "${pageContext.request.contextPath}/rest_attachment/download/${recommendPlace[0].attachmentNo}" height="329px" class="d-block w-100" alt="...">
								      	</a>
								      <div class="carousel-caption d-none d-md-block">
								         <h5>${recommendPlace[0].placeName}</h5>
								        <p>${recommendPlace[0].placeArea}</p>
								      </div>
								    </div>
								    <div class="carousel-item">
								    	<a href="${pageContext.request.contextPath}/place/detail/${recommendPlace[1].placeNo}">
								      	<img src= "${pageContext.request.contextPath}/rest_attachment/download/${recommendPlace[1].attachmentNo}" height="329px" class="d-block w-100" alt="...">
										</a>								      	
								      <div class="carousel-caption d-none d-md-block">
								         <h5>${recommendPlace[1].placeName}</h5>
								        <p>${recommendPlace[1].placeArea}</p>
								      </div>
								    </div>
								    <div class="carousel-item">
								    	<a href="${pageContext.request.contextPath}/place/detail/${recommendPlace[2].placeNo}">
								      		<img src= "${pageContext.request.contextPath}/rest_attachment/download/${recommendPlace[2].attachmentNo}" height="329px" class="d-block w-100" alt="...">
										</a>								      		
								      <div class="carousel-caption d-none d-md-block">
								         <h5>${recommendPlace[2].placeName}</h5>
								        <p>${recommendPlace[2].placeArea}</p>
								      </div>
								    </div>
								  </div>
								  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
								</div>
							</div>
						</div>
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div> <%-- container 끝 --%>

<%-- 댕모임 상세 Modal --%>
<div class="modal fade" id="modalDangDetail" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered d-flex flex-column justify-content-center algin-items-center">
        <div class="modal-content card div-outer-dang-info"></div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">

	$(function(){
		
		// 지역 선택
		$(".TEXT").click(function () {
			// 선택(색상) 초기화
        	$(".OUTLINE").removeClass("area-selected");
			// 클릭한 지역의 id 선택
            var id = $(this).prop("id");
			// 클릭한 지역의 색 변경
        	$("#CD" + id).addClass("area-selected");
			
			// 클릭한 지역 이름
			var dangArea = $(this).text();
			console.log(dangArea);
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_dang/top?dangArea="+dangArea,
				method : "get",
				success : function(resp){
					$(".div-dang-search").empty();
					if(resp.length == 0) {
						var row = $("<div>").attr("class", "row p-1")
											.append(
												$("<div>").attr("class", "col d-flex flex-column justify-content-center align-items-center div-dang-search-none")
													.append(
														$("<div>").attr("class", "row mt-2")
															.append(
																$("<div>").attr("class", "offset-3 col-6")
																	.append(
																		$("<img>").attr("src", "${pageContext.request.contextPath}/images/img-dog-play.png").attr("class", "w-100")			
																	)
															)
													)
													.append(
														$("<div>").attr("class", "row my-2")
															.append(
																$("<div>").attr("class", "col d-flex flex-column")
																	.append(
																		$("<strong>").text("아직 해당 지역의 댕모임이 없습니다.")		
																	)
															)
													)
											)
						$(".div-dang-search").append(row);
					} else {						
						for(var i = 0 ; i < resp.length ; i ++) {
							var row = $("<div>").attr("class", "row p-2 my-2 div-home-submenu div-select-dang").attr("data-dangno", resp[i].dangNo)
											.append($("<div>").attr("class", "col-4").text(resp[i].dangArea))
											.append($("<div>").attr("class", "col-8").text(resp[i].dangName));
							$(".div-dang-search").append(row);
						}
					}
				}
			})
        });
		
		// 댕모임 번호
		var dangNo;
		// 댕모임 비공개 여부
		var dangPrivate;
		// 댕모임 비밀번호
		var dangPw;
		
		// 상위 5개 댕모임 클릭시
		$(document).on("click", ".div-select-dang", function(){
			dangNo = $(this).attr("data-dangno");
			$("#modalDangDetail").modal("show");
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_dang/detail?dangNo="+dangNo,
				method : "get",
				success : function(resp){
					
					console.log(resp);
					dangPrivate = resp.dangInfo.dangPrivate;
					dangPw = resp.dangInfo.dangPw;
					
					var target = $(".div-outer-dang-info");
					target.empty();
					
					var dangProfileImg;
					if(resp.dangInfo.attachmentNo != null) {						
						dangProfileImg = $("<img>").attr("class", "card-img-top img-dang-profile").attr("src" , "${pageContext.request.contextPath}/rest_attachment/download/"+resp.dangInfo.attachmentNo)
					} else {
						dangProfileImg = $("<img>").attr("class", "card-img-top img-dang-profile w-100").attr("src" , "${pageContext.request.contextPath}/images/img-dang-profile-default.png")
					}
					var dangInfoDetail = $("<div>").attr("class", "modal-body card-body").append(
						$("<div>").attr("class", "container-fluid")
							.append(
								$("<div>").attr("class", "row my-3")
									.append(
										$("<div>").attr("class","span-dang-createdate").text("since." + resp.dangInfo.dangCreatetime)
									)
							)
							.append(
								$("<div>").attr("class", "row my-3")
									.append(
										$("<div>").attr("class", "col-9")
											.append(
												$("<strong>").attr("class", "card-title strong-dang-name").text(resp.dangInfo.dangName)
											)
									)
									.append(
										$("<div>").attr("class", "col-3 d-flex justify-content-end align-items-center")
											.append(
												$("<button>").attr("class", "flex-fill btn-dang btn-dang-like py-1").attr("type", "button")
												.append(
													$("<i>").attr("class", "fa-regular fa-heart me-1")
												)
												.append(
													$("<span>").text(resp.dangInfo.dangLike)
												)
											)
									)
							)
							.append(
								$("<div>").attr("class", "row my-3")
									.append(
										$("<span>").attr("class", "card-text span-dang-info").text(resp.dangInfo.dangInfo)	
									)
							)
							.append(
								$("<div>").attr("class", "row my-3")
									.append(
										$("<span>").attr("class", "d-flex flex-row flex-wrap div-hashtag-list")
									)
							)
							.append(
								$("<div>").attr("class", "row")
									.append(
										$("<div>").attr("class", "col-4")
											.append(
												$("<div>").attr("class", "div-dang-head px-1 py-1 d-flex justify-content-center align-items-center w-100")
													.append(
														$("<i>").attr("class", "fa-solid fa-paw me-1")		
													)
													.append(
														$("<span>").attr("class", "span-dang-head").text(resp.dangInfo.dangHead)
													)
													.append(
														$("<span>").text(" / ")	
													)
													.append(
														$("<span>").attr("class", "span-dang-headmax").text(resp.dangInfo.dangHeadmax)	
													)
											)
									)
									.append(
										$("<div>").attr("class", "col-4 d-flex justify-content-end align-items-center div-dang-member-state")
									)
									.append(
										$("<div>").attr("class", "col-4 d-flex justify-content-end align-items-center")
											.append(
												$("<button>").attr("class", "flex-fill py-1 btn-dang btn-dang-return").attr("type", "button").text("돌아가기")
											)
									)
							)
						);
					
					target.append(dangProfileImg).append(dangInfoDetail);
					
					// 가입하기, 입장하기 버튼
					if(resp.isMember != null) {
						if(resp.isMember == 1) {
							$(".div-dang-member-state")
								.append(
									$("<button>").attr("class", "flex-fill py-1 btn-dang btn-dang-enter").attr("type", "button").text("입장하기")
								)	
						} else {
							if(resp.dangInfo.dangPrivate == "Y") {
								$(".div-dang-member-state")
								.append(
									$("<button>").attr("class", "flex-fill py-1 btn-dang btn-dang-join").attr("type", "button").text("가입하기")		
										.append(
											$("<i>").attr("class", "fa-solid fa-lock ms-2")		
										)
								)
							} else {
								$(".div-dang-member-state")
								.append(
									$("<button>").attr("class", "flex-fill py-1 btn-dang btn-dang-join").attr("type", "button").text("가입하기")	
								)	
							}
						}	
					}
					
					for(var i = 0 ; i < resp.dangHashtag.length ; i ++) {
						$(".div-hashtag-list").append(
							$("<span>").attr("class", "span-dang-hashtag mx-1 px-1 my-1").attr("data-hashtagno", resp.dangHashtag[i].hashtagNo).text("#" + resp.dangHashtag[i].hashtagContent)
						)
					}
				}
			});
		});
		
		// 입장하기 버튼
		$(document).on("click", ".btn-dang-enter", function(){
			location.href = "${pageContext.request.contextPath}/dang/"+dangNo;
		});
		
		// 가입하기 버튼
		$(document).on("click", ".btn-dang-join", function(){
			console.log("가입하기 버튼");
			///location.href = "${pageContext.request.contextPath}/dang/search";
			var target = $(".div-outer-dang-info");
			
			var inputDangJoinContainer = $("<div>").attr("class", "container-fluid div-input-dang-join");
			
			var rowInputDangJoinNick = $("<div>").attr("class", "row mb-3")
				.append(
					$("<div>").attr("class", "col-10 offset-1 d-flex flex-column div-modal-dang-join-check-nick")
						.append(
							$("<span>").attr("class", "span-modal-join-dang-helper").text("닉네임을 입력해 주세요.")		
						)
						.append(
							$("<div>").attr("class", "d-flex")
								.append(
									$("<input>").attr("class", "flex-fill me-2 p-2 input-modal-join input-modal-join-dang-nick").attr("type", "text").attr("maxlength", 10).attr("placeholder", "닉네임(1~10자)")	
								)
								.append(
									$("<button>").attr("class", "px-3 btn-modal-join-dang-nick-search").attr("type", "button").text("확인")	
								)
						)
				)
				
			var rowInputDangJoinMessage = $("<div>").attr("class", "row mb-3")
				.append(
					$("<div>").attr("class", "col-10 offset-1 d-flex flex-column")
						.append(
							$("<span>").attr("class", "span-modal-join-dang-helper").text("가입 인사를 작성해 주세요.")
						)
						.append(
							$("<div>").attr("class", "d-flex")
								.append(
									$("<input>").attr("class", "flex-fill p-2 input-modal-join input-modal-join-dang-message").attr("type", "text").attr("maxlength", 30).attr("placeholder", "가입 인사(최대 30자)")
								)
						)
				)
			
			inputDangJoinContainer.append(rowInputDangJoinNick).append(rowInputDangJoinMessage)
				
			if(dangPrivate == "Y") {
				var rowInputDangJoinPrivate = $("<div>").attr("class", "row mb-3")
					.append(
						$("<div>").attr("class", "col-10 offset-1 d-flex flex-column div-modal-dang-join-check-pw")
							.append(
								$("<span>").attr("class", "span-modal-join-dang-helper").text("비밀번호를 입력해 주세요.")
							)
							.append(
								$("<div>").attr("class", "d-flex")
									.append(
										$("<input>").attr("class", "flex-fill p-2 input-modal-join input-modal-join-dang-pw").attr("type", "text").attr("maxlength", 4).attr("placeholder", "비밀번호(숫자 4자리)")
									)
							)
					)
				inputDangJoinContainer.append(rowInputDangJoinPrivate)
			}
			
			var rowInputDangJoinButton = $("<div>").attr("class", "row mb-3 row-modal-join-submit")
				.append(
					$("<div>").attr("class", "col-10 offset-1 d-flex justify-content-center align-items-center")
						.append(
							$("<button>").attr("class", "py-2 px-3 btn-modal-join-submit").text("가입하기")
						)
				)
				
			inputDangJoinContainer.append(rowInputDangJoinButton);
			
			$(".modal-body").after(inputDangJoinContainer);
			
			/* $(".div-outer-dang-info").after(
				$("<div>").attr("class", "container-fluid mt-3 div-input-dang-join").attr("style", "background-color:red;").text("ㅎㅇ")	
			) */
		});
		
		// 모달 내 닉네임 중복 검사 버튼
		$(document).on("click", ".btn-modal-join-dang-nick-search", function(e){
			// 이벤트 전파 방지
			e.stopPropagation();
			// 초기화
			$(".span-check").remove();
			// 닉네임 입력창의 입력값
			var inputNick = $(".input-modal-join-dang-nick").val();
			// 입력창의 값이 비어있다면
			if(inputNick == "") {
				$(".div-modal-dang-join-check-nick")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-nick check-nick-empty").text("닉네임을 입력해 주세요.")
					)
				formJoinValid.checkNick = false;
				return;
			}
			
			// 버튼 비활성화
			var button = $(this);
			button.attr("disabled", true);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_member/checkNick/"+dangNo+"/"+inputNick,
				method : "get",
				success : function(resp){
					console.log(resp);
					if(resp == false ) {
						console.log("이미 존재하는 닉네임");
						$(".div-modal-dang-join-check-nick")
							.append(
								$("<span>").attr("class", "span-check span-check-invalid check-nick check-nick-already").text("이미 사용 중인 닉네임입니다.")
							)
						formJoinValid.checkNick = false;
					} else {
						console.log("사용할 수 있는 닉네임");
							$(".div-modal-dang-join-check-nick")
							.append(
								$("<span>").attr("class", "span-check span-check-valid check-nick check-nick-valid").text("멋진 닉네임이네요!")
							)
						formJoinValid.checkNick = true;
					}
					// 버튼 비활성화 해제
					button.attr("disabled", false);
				}
			});
		});
		
		// 모달 내 비밀번호 입력창
		$(document).on("blur", ".input-modal-join-dang-pw", function(){
			console.log(dangPrivate);
			// 비밀번호 helper text 초기화
			$(".check-pw").remove();
			// Modal 내 비밀번호 입력창의 값
			var inputPw = $(".input-modal-join-dang-pw").val();
			// 비밀번호 미입력시
			if(inputPw == "") {
				$(".div-modal-dang-join-check-pw")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-pw check-pw-empty").text("비밀번호를 입력해 주세요.")	
					)
				formJoinValid.checkPw = false;
				return;
			}
			// 비밀번호 입력시
			if(dangPw != inputPw) { // 비밀번호가 옳지 않다면
				$(".div-modal-dang-join-check-pw")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-pw check-pw-invalid").text("비밀번호가 일치하지 않습니다.")	
					)
				formJoinValid.checkPw = false;
				return;
			}
			formJoinValid.checkPw = true;
		});
		
		// 모달 내 가입하기 버튼
		$(document).on("click", ".btn-modal-join-submit", function(){
			// 공개 댕모임이라면
			if(dangPrivate == "N") {
				formJoinValid.checkPw = true;
			}
			console.log("isAllValid = " + formJoinValid.isAllValid());
			// 유효성 검사를 통과하지 못하면 return
			if(formJoinValid.isAllValid() == false) {
				return;
			}
			
			// 중복 가입 방지를 위한 가입 버튼 비활성화
			var button = $(this);
			button.attr("disabled", true);
			
			// 회원 번호
			var userNo = $("#loginNo").val();
			// 닉네임
			var memberNick = $(".input-modal-join-dang-nick").val();
			// 상태 메시지
			var memberMessage = $(".input-modal-join-dang-message").val();
			// 댕모임 가입
			var form = $("<form>").attr("action", "${pageContext.request.contextPath}/member/join").attr("method", "post")
							.append(
								$("<input>").attr("type", "hidden").attr("name", "dangNo").attr("value", dangNo)
							)
							.append(
								$("<input>").attr("type", "hidden").attr("name", "userNo").attr("value", userNo)
							)
							.append(
								$("<input>").attr("type", "hidden").attr("name", "memberNick").attr("value", memberNick)	
							)
							.append(
								$("<input>").attr("type", "hidden").attr("name", "memberMessage").attr("value", memberMessage)
							);
			$("body").append(form);
			form.submit();
			// 가입 완료 메시지
			alert("댕모임 가입이 완료되었습니다!");
		});
		
		// 가입 유효성 검사
		var formJoinValid = {
			checkNick : false,
			checkPw : false,
			isAllValid : function() {
				return this.checkNick && this.checkPw;
			}
		}
		
		// 돌아가기 버튼
		$(document).on("click", ".btn-dang-return", function(){
			// 가입 입력창 삭제
			$(".div-input-dang-join").remove();
			$("#modalDangDetail").modal("hide");
			// 변수 초기화
			dangNo = null;
			dangPrivate = null;
			dangPw = null;
		});
		
		// ESC키 입력시
		$(document).keydown(function(event) {
			// 가입 입력창 삭제
		    if (event.keyCode == 27 || event.which == 27) {
		    	$(".div-input-dang-join").remove();
		    	$("#modalDangDetail").modal("hide");
		    	// 변수 초기화
				dangNo = null;
				dangPrivate = null;
				dangPw = null;
		    }
		});
	});

</script>