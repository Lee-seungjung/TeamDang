<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 공용 header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>

	* {
		
	}
	
	.dang-nav{
		background-color:#76BEFF;
		height:50px;
		text-align:center;
	}
	.nav-font>a{
		font-size:18px;
		color:white;
	}
	.nav-font>a:hover{
    	color:#fff;
    }
	.nav-font{
		line-height:50px;
		text-align:center;
	}
	.progress {
	 	background-color: #F1F4FF;
	 	height: 0.5rem;
	 }
	 

</style>
<%-- 댕모임 header --%>
<div class = "container-fluid">
	<div class = "row dang-nav ">
		<div class = "col-8 offset-2">
			<div class = "row">
				<div class = "col nav-font">
					<a href = "/dang/${dangNo}/board">게시글</a>
				</div>
				<div class = "col nav-font">
					<a href = "/dang/${dangNo}/album" >사진첩</a>
				</div>
				<div class = "col nav-font">
					<a href = "/dang/${dangNo}/calendar">일정</a>
				</div>
				<div class = "col nav-font">
					<a href = "/dang/${dangNo}/chat">대화</a>
				</div>
				<div class = "col nav-font">
					<a href = "/dang/${dangNo}/member">멤버</a>
				</div>
			</div>
		</div>
	</div>
</div>
