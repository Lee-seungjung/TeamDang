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
       
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	
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
    }
    
	a {
       text-decoration: none;
       color:black;
    }
    p{
    	margin-bottom:0;
    }
    .img-circle{
		border-radius: 70%;
    	border:none;
    	background-color:#fff;
    	overflow: hidden;
	}
	.font-gray{
		color:#373A3C;
	}
	.btn.btn-primary{
		background-color:#76BEFF;
		color:#fff;
		border-color: #76BEFF;
	}
    
</style>
<body>

<%-- 로그인 여부 --%>
<c:set var="login" value="${loginNo != null}"></c:set>

	<%--메인 navbar 시작--%>
	<nav class="nvbar navbar-expand-lg navbar-light bg-light">
	 <div class="container-fluid">
	    <a class="navbar-brand" href="#">댕모임</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" ari-controls="navbarColor03" aria-expanded="false" aia-label="Toggl navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collase navbar-collapse" id="navbarClor03">
	      <ul class="navbar-nav me-auto">
	       <li class="nav-item">
	          <a class="nav-link acive" href="#">Hoe
	           <span class="visually-hidden">(current)</span>
	          </a>
	        </li>
	       <li class="av-item">
	          <a class="nav-link" href="#">Features</a>
	        </li>
	       <li class="nav-item">
	          <a class="nav-link" href="#">Pricing</a>
	        </li>
	       <li class="nav-item">
	          <a class="nav-lnk" href="#">About</a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="rue" aria-expanded="false">Dropdown</a>
	          <div class="dropdown-menu">
	            <a class="dropdown-item" href="">Action</a>
	            <a class="dropdown-item" href="#">Another acion</a>
	            <a class="dropdown-item" href="#">Something else here</a>
	            <div class="dropdown-diider"></div>
	           <a class="dropdown-itm" href="#">Separated link</a>
	          </div>
	        </li>
	      </ul>
	      <form class="d-flex">
        <input class="form-control me-sm-2" type="search" placeholder="Search">
	       <button class="btn btn-seondary my- my-sm-0" type="submit">Search</button>
	      </form>
	    </div>
	  </div>
	</nav>
	<%--메인 navbar 끝--%>

<div class = "container-fluid">
	<div class = "col-8 offset-2">
		<div class = "row">
			<div class = "col-3">
				<a href = "/">홈</a>
			</div>
			<div class = "col-3">
				<a href = "/dang/create">댕모임 개설</a>
			</div>
		<c:choose>
		<c:when test = "${login}">
			<div class = "col-3">
				<a href = "/user/logout">로그아웃</a>
			</div>
			<div class = "col-3">
				<a href = "/user/mypage">마이페이지</a>
			</div>
		</c:when>
		<c:otherwise>
			<div class = "col-3">
				<a href = "/user/login">로그인</a>
			</div>
			<div class = "col-3">
				<a href = "/user/join">회원가입</a>
			</div>
		</c:otherwise>
		</c:choose>
		</div>
	</div>
</div>	

	<div class="container-fluid">