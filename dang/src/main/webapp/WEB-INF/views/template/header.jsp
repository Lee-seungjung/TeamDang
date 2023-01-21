<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

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
	
	<!-- 글꼴 CDN -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
	<!-- Font Awesome CDN -->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
	
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- Bootstrap CDN -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
	<!-- Full Calendar CSS-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css"> 
    <!-- Full Calendar CDN -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <!-- Full Calendar 언어팩 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
    
	<!-- jQuery CDN-->
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script> 
	
	<!-- Lodash CDN-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	<!-- SockJS CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
	
	<!-- MomentJS CDN-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
	<!-- MomentJS 언어팩 CDN-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
	
<style>

  * {
    font-family: 'Noto Sans KR', 산세리프;
    font-size : 18px;
  }

  a {
    text-decoration: none;
    color:black;
  }

  p {
    margin-bottom:0;
  }

  .inbl {
    display:inline-block;
  }
  
  .w-auto {
    width:auto;
  }
  
  .img-circle {
    border-radius: 50%;
    border:none;
    background-color:#fff;
    overflow: hidden;
  }

  .font-gray {
    color:#373A3C;
  }

  .btn.btn-primary {
    background-color:#76BEFF;
    color:#fff;
    border-color: #76BEFF;
  }
  
  .btn-outline-primary {
    color: #76BEFF;
    border-color: #76BEFF;
  }
  
  .btn-outline-primary:hover {
    color: #fff;
    font-weight:bolder;
    background-color: #76BEFF;
    border-color: #76BEFF;
  }
  .btn-outline-primary:focus {
    box-shadow: 0 0 0 0.25rem rgba(118, 190, 255, 0.5);
  }
  
  .btn-pink{
    background-color:#F94888;
    color:#fff;
    border-color: #F94888;
  }
  
  .btn-pink:hover {
    color:#fff;
  }

  .cursor-pointer {
    cursor: pointer;
  }

  .cursor-zoomin {
    cursor:zoom-in;
  }
  
  .img-user-profile {
    border-radius : 50%;
    border : 2px solid black;
    width : 1.8em;
    aspect-ratio: 1/1;
  }

  .div-user-profile {
    cursor:pointer;
  }

  .span-check-valid {
    color : green;
  }

  .span-check-invalid {
    color : red;
  }

  .form-control:focus {
    background-color: #fff;
    border-color: #a2c1f6;
    outline: 0;
    box-shadow: 0 0 0 0.25rem rgba(69, 130, 236, 0.25);
  }
  
  .form-select:focus {
    border-color: #a2c1f6;
    outline: 0;
    box-shadow: 0 0 0 0.25rem rgba(69, 130, 236, 0.25);
  }
  
  .gray:hover {
    color: black;
    background-color: #E6E6E6;
  }

  .middle-items{
    display:flex;
    align-items:center;
  }
  
  .blue{
    color:#76BEFF;
  }
  
  .pink{
    color:#F94888;
  }
  
  .text-truncate2 {
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    white-space: normal;
  }
  
  .zoomin {
    display: none;
    z-index: 500;
    max-width: 100%;
    height: auto;
    position: fixed;
    top:0; left: 0; bottom: 0; right: 0;
    background-color: gray;
    background: rgba(0, 0, 0, 0.8);
  }
  
  .zoomin-img {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }
</style>

</head>

<body>

<%-- 로그인 여부 --%>
<c:set var="login" value="${loginNo != null}"></c:set>

<div class = "container-fluid my-3">
	<div class = "row">
		<div class = "col-8 offset-2">
			<div class = "row">
				<div class = "col-2">
					<a href = "/">
						<img src = "${pageContext.request.contextPath}/images/logo.png" class = "img-fluid">
					</a>
				</div>
				<div class = "col-4">
					<a href = "/dang/1">1번 댕모임</a>
				</div>
				<div class = "col-6 d-flex flex-row">
					<div class = "col-4 d-flex justify-content-center align-items-center">
						<a href = "${pageContext.request.contextPath}/dang/search">댕모임 찾기</a>
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
						<a href = "${pageContext.request.contextPath}/user/logout">로그아웃</a>
					</div>
					</c:when>
					<c:otherwise>
						<div class = "col-4 d-flex justify-content-center align-items-center">
							<a href = "${pageContext.request.contextPath}/user/join">회원가입</a>
						</div>
						<div class = "col-4 d-flex justify-content-center align-items-center">
							<a href = "${pageContext.request.contextPath}/user/login">로그인</a>
						</div>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>	
