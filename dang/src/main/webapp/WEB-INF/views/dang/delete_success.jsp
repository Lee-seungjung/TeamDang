<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="댕모임 탈퇴" name="title"/>
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
						<h4 style="font-weight:bolder;">댕모임 탈퇴가 정상적으로 처리되었습니다!</h4>
						<p>그동안 댕모임을 이용해주셔서 감사합니다.</p>
					</div>
					<div class="mt-4 mb-5">
						<a href="${pageContext.request.contextPath}/" class="btn btn-primary">홈으로 이동</a>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>