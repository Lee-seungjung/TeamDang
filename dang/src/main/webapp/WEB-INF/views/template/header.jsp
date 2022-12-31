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
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/litera/bootstrap.css">
		
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
    }

</style>

<%--header body 시작 --%>
<body>

	<div class="container-fluid">












