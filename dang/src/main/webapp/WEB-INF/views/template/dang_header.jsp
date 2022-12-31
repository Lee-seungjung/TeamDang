<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 공용 header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<%-- 댕모임 header --%>
<div class = "container-flud">
	<div class = "col">
		<div class = "col-8 offset-2">
			<div class = "row">
				<div class = "col">
					<a href = "/dang/${dangNo}">게시글</a>
				</div>
				<div class = "col">
					<a href = "/dang/${dangNo}/album">사진첩</a>
				</div>
				<div class = "col">
					<a href = "/dang/${dangNo}/calendar">일정</a>
				</div>
				<div class = "col">
					<a href = "/dang/${dangNo}/chat">대화</a>
				</div>
				<div class = "col">
					<a href = "/dang/${dangNo}/member">멤버</a>
				</div>
			</div>
		</div>
	</div>
</div>