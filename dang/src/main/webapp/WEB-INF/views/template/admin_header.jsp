<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
        /* 사이드바 래퍼 스타일 */
        
        #page-wrapper {
          padding-left: 250px;
        }
        
        #sidebar-wrapper {
          position: fixed;
          width: 250px;
          height: 100%;
          margin-left: -250px;
          background: #76BEFF;
          overflow-x: hidden;
          overflow-y: auto;
        }
        
        #page-content-wrapper {
          width: 100%;
          padding: 20px;
        }
        /* 사이드바 스타일 */
        
        .sidebar-nav {
          width: 250px;
          margin: 0;
          padding: 0;
          list-style: none;
        }
        
        .sidebar-nav li {
          text-indent: 1.5em;
          line-height: 2.8em;
        }
        
        .sidebar-nav li a {
          display: block;
          text-decoration: none;
          color: #fff;
        }
        
        .sidebar-nav li a:hover {
          color: #fff;
          background: rgba(255, 255, 255, 0.2);
        }
        
        .sidebar-nav > .sidebar-brand {
          font-size: 0.5em;
          line-height: 1em;
        }
      
      </style>


</head>
<body>
    <div id="page-wrapper">
        <!-- 사이드바 -->
        <div id="sidebar-wrapper">
          <ul class="sidebar-nav">
            <li class="sidebar-brand">
              <img src="${pageContext.request.contextPath}/images/logo.png" width="200px" height="100px" class="mt-3 mb-3">
            </li>
            <hr class="ms-2 me-2">
            <p class="text-center"><img src="./static/mapmarker/cafe.png" class="me-2">관리자 누구</p>
            <hr class="ms-2 me-2">
            <li><a href="${pageContext.request.contextPath}/admin/dash_board" class="mb-2"><i class="fa-solid fa-border-all"></i> 대쉬 보드</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/place_insert" class="mb-2"><i class="fa-solid fa-location-dot"></i> 장소 등록</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/place_list" class="mb-2"><i class="fa-solid fa-map-location"></i> 장소 조회</a></li>
            <li><a href="#" class="mb-2"><i class="fa-solid fa-user"></i> 회원 관리</a></li>
            <li><a href="#" class="mb-2"><i class="fa-solid fa-bell"></i> 신고 접수</a></li>
            
          </ul>
        </div>
    

    <nav class="navbar navbar-light bg-light shadow-sm">
      <div class="container-fluid">
        <a class="navbar-brand ms-3">관리자 페이지</a>
        <form class="d-flex">
          <button class="btn btn-outline-success" type="submit">댕모임 홈으로</button>
          <button class="btn btn-outline-success ms-3 me-5" type="submit">로그아웃</button>
        </form>
      </div>
    </nav>

