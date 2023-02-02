<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="신고접수 완료" name="title"/>
</jsp:include>

<style>
	hr{
		margin:0;
		color:#C3C3C3;
	}
</style>

<hr>
<div class = "container-fluid mt-5">	
	<div class = "row">
		<div class = "col-8 offset-2 my-3 py-5">
			<div class = "row">
				<div class = "col-6 offset-3 text-center">
					<div>
						<img src="${pageContext.request.contextPath}/images/logo2.png" width="130" height="130">
					</div>
					<div class="mt-4">
						<h4 style="font-weight:bolder;">신고 접수가 정상적으로 완료되었습니다!</h4>
						<p>관리자 승인 후 처리될 예정입니다.</p>
					</div>
					<div class="mt-4 mb-5">
						<a href="${pageContext.request.contextPath}/" class="btn btn-primary">홈으로 이동</a>
						<a href="${prevUrl}" class="btn btn-pink">댕모임 돌아가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>