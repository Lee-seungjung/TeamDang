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
	<!--chartJS CDN-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
   
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
          background: #F1F4FF;
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
          color: #404040;
        }
        
        .sidebar-nav li a:hover {
          color: #76BEFF;
          background: rgba(255, 255, 255, 0.2);
        }
        
        .sidebar-nav > .sidebar-brand {
          font-size: 0.5em;
          line-height: 1em;
        }
        
        .btn.btn-primary {
		    background-color:#76BEFF;
		    color:#fff;
		    border-color: #76BEFF;
		}
		
		p{
			margin:0;
		}
		
		.cursor-pointer{
			cursor: pointer;
		}
		
		.middle-items{
		    display:flex;
		    align-items:center;
		}
		
		.pink{
			color:#F94888;
		}     
	   
		* {
			font-size : 18px;
		}
	   
		.btn-outline-success{
			border: 1px solid white;
			background-color: #76BEFF;
			color: white;	   
		}
      
		.navbar-light{
			background-color: #F1F4FF;
		}
		
		.li-admin-info {
			text-indent : 0 !important;
			border-top: 1px solid #C8C8C9;
			border-bottom : 1px solid #C8C8C9;
		}
		
		.li-admin-menu {
			text-indent : 0 !important;
		}
		
		.strong-admin-nick {
			font-size : 24px;
		}
		
		.img-admin-info-profile-img {
			border-radius : 50%;
			width : 2.5rem;
			aspect-ratio : 1/1;
		}
      
	</style>

</head>
<body>
    <div id="page-wrapper">
        <!-- 사이드바 -->
        <div id="sidebar-wrapper">
          <ul class="sidebar-nav">
            <li class="sidebar-brand">
              <img src="${pageContext.request.contextPath}/images/logo.png" width="200px" height="100px" class="mt-3 mb-3 cursor-pointer" onClick = "location.href = '${pageContext.request.contextPath}/admin/dash_board'">
            </li>
            <li class = "li-admin-info py-2 my-2">
            	<span class="d-flex justify-content-center align-items-center">
            		<c:choose>
            		<c:when test = "${loginProfileImg != null}">
            			<img class = "img-admin-info-profile-img" src="${pageContext.request.contextPath}/rest_attachment/download/${loginProfileImg}">
            		</c:when>
            		<c:otherwise>
            			<img class = "img-admin-info-profile-img" src="${pageContext.request.contextPath}/images/basic-profile.png">
            		</c:otherwise>
            		</c:choose>
            		<strong class = "ms-3 strong-admin-nick">${loginNick}</strong>
            	</span>
            </li>
            <li class = "li-admin-menu my-3">
            	<span class = "d-flex justify-content-center align-items-center cursor-pointer" onclick = "location.href = '${pageContext.request.contextPath}/admin/dash_board'">
            		<i class="fa-solid fa-border-all col-4 text-end"></i>
            		<span class = "col-8 ps-2">대쉬 보드</span>
            	</span>
            </li>
            <li class = "li-admin-menu my-3">
            	<span class = "d-flex justify-content-center align-items-center cursor-pointer" onclick = "location.href = '${pageContext.request.contextPath}/admin/place_insert'">
            		<i class="fa-solid fa-location-dot col-4 text-end"></i>
            		<span class = "col-8 ps-2">장소 등록</span>
            	</span>
            </li>
            <li class = "li-admin-menu my-3">
            	<span class = "d-flex justify-content-center align-items-center cursor-pointer" onclick = "location.href = '${pageContext.request.contextPath}/admin/place_list'">
            		<i class="fa-solid fa-map-location col-4 text-end"></i>
            		<span class = "col-8 ps-2">장소 조회</span>
            	</span>
            </li>
            <li class = "li-admin-menu my-3">
            	<span class = "d-flex justify-content-center align-items-center cursor-pointer" onclick = "location.href = '${pageContext.request.contextPath}/admin/user_list'">
            		<i class="fa-solid fa-user col-4 text-end"></i>
            		<span class = "col-8 ps-2">회원 관리</span>
            	</span>
            </li>
            <li class = "li-admin-menu my-3">
            	<span class = "d-flex justify-content-center align-items-center cursor-pointer" onclick = "location.href = '${pageContext.request.contextPath}/admin/report'">
            		<i class="fa-solid fa-bell col-4 text-end"></i>
            		<span class = "col-8 ps-2">신고 관리</span>
            	</span>
            </li>
             <li class = "li-admin-menu my-3">
            	<span class = "d-flex justify-content-center align-items-center cursor-pointer" onclick = "location.href = '${pageContext.request.contextPath}/admin/dang_list'">
            		<i class="fa-solid fa-paw col-4 text-end"></i>
            		<span class = "col-8 ps-2">댕모임 관리</span>
            	</span>
            </li>
          </ul>
        </div>
    

    <nav class="navbar navbar-light bg-light shadow-sm">
      <div class="container-fluid">
        <a class="navbar-brand ms-3">관리자 페이지</a>
        <form class="d-flex">
          <button onClick = "location.href = '${pageContext.request.contextPath}/'"  class="btn btn-outline-success" type="button">댕모임 홈</button>
          <button onclick = "location.href = '${pageContext.request.contextPath}/user/logout'" class="btn btn-outline-success ms-3 me-5" type="button">로그아웃</button>
        </form>
      </div>
    </nav>

