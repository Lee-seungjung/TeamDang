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
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Bootswatch CDN-->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/zephyr/bootstrap.css">
	
	<!-- jquery CDN-->
	<!-- 공부할때는 일반 버전으로-->
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script> 
	<!-- 배포할때는 min 버전으로-->
	<!-- <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script> -->
</head>

<style>

	*{
		font-family: 'Noto Sans KR', 산세리프;
		border: 1px dotted gray;
    }
    
	a {
       text-decoration: none;
    }
    
</style>
<body>

<%-- 로그인 여부 --%>
<c:set var="login" value="${loginNo != null}"></c:set>

	<%--메인 navbar 시작--%>
	<nav class="nvbar navbar-expand-lg navbar-light bg-light">
	 <div class="container-fluid">
	    <a class="navbar-brand" href="#">Navbar</a>
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
		<c:choose>
		<c:when test = "${login}">
			<a href = "/user/logout">로그아웃</a>
		</c:when>
		<c:otherwise>
			<a href = "/user/login">로그인</a>
			<a href = "/user/join">회원가입</a>
		</c:otherwise>
		</c:choose>
		</div>
	</div>
</div>	

	<div class="container-fluid">