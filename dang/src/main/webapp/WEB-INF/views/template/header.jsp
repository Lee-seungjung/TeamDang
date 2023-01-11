<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<%-- 헤더 --%>
<head>
	<title>
		<c:choose>
			<c:when test = "${param.title != null}">
				${param.title}
			</c:when>
			<c:otherwise>
				홈페이지
			</c:otherwise>
		</c:choose>
	</title>
	
	<!-- 글꼴 cdn -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
	<!--font-awesome cdn -->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
	
	<!-- Bootstrap CDN -->
   	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
	<!-- Bootswatch CDN-->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/zephyr/bootstrap.css">
	
	<!--fullcalendar css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
    <!-- fullcalendar CDN -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <!-- fullcalendar 언어 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
    
	<!-- jquery CDN-->
	<!-- 공부할때는 일반 버전으로-->
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script> 
	<!-- 배포할때는 min 버전으로-->
	<!-- <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script> -->
	
	
	
</head>

<style>

	*{
		font-family: 'Noto Sans KR', 산세리프;
		font-size : 18px;
		border : 1px gray dotted;
    }
    
	a {
       text-decoration: none;
       color:black;
    }
    
    p{
    	margin-bottom:0;
    }
    
    .img-circle{
		border-radius: 50%;
    	border:none;
    	background-color:#fff;
    	overflow: hidden;
	}
	
	.font-gray{
		color:#373A3C;
	}
	
	.shadow1{
		box-shadow: 0 1rem 3rem rgba(0, 0, 0, 0.175) !important;
  	}
  	
	.btn.btn-primary{
		background-color:#76BEFF;
		color:#fff;
		border-color: #76BEFF;
	}
	
	.cursor-pointer{
		cursor: pointer;
	}
	
	.cursor-zoomin{
		cursor:zoom-in;
	}
	
	.img-user-profile {
		border-radius : 50%;
		border : 2px solid black;
		width : 1.8em;
	}
	
	.div-user-profile {
		cursor:pointer;
	}
	
	.span-check-invalid {
		color : green;
	}
	
	.span-check-invalid {
		color : red;
	}
    
</style>
<body>

<%-- 로그인 여부 --%>
<c:set var="login" value="${loginNo != null}"></c:set>

<div class = "container-fluid my-3">
	<div class = "row">
		<div class = "col-8 offset-2">
			<div class = "row">
				<div class = "col-2 px-5">
					<a href = "/">
						<img src = "/images/logo.png" class = "img-fluid">
					</a>
				</div>
				<div class = "col-4">
					여백
				</div>
				<div class = "col-6 d-flex flex-row">
					<div class = "col-4 d-flex justify-content-center align-items-center">
						<a href = "#">댕모임 찾기</a>
					</div>
					<c:choose>
					<c:when test = "${login}">
					<div class = "col-4 d-flex justify-content-center align-items-center">
						<label class = "col d-flex justify-content-center align-items-center div-user-profile" onClick = "location.href = '${pageContext.request.contextPath}/user/mypage'">
							<img class = "col-3 img-user-profile" src = "${pageContext.request.contextPath}/rest_attachment/download/${loginProfileImg}">
							<span class = "ms-2">
								${loginNick}
							</span>
						</label>
					</div>
					<div class = "col-4 d-flex justify-content-center align-items-center">
						<a href = "/user/logout">로그아웃</a>
					</div>
					</c:when>
					<c:otherwise>
						<div class = "col-4 d-flex justify-content-center align-items-center">
							<a href = "/user/join">회원가입</a>
						</div>
						<div class = "col-4 d-flex justify-content-center align-items-center">
							<a href = "/user/login">로그인</a>
						</div>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>	


			<div class = "col-3">
				<a href = "/dang/create">댕모임 개설</a>
			</div>

	<div class="container-fluid">