<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	
</style>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>

<div class = "container-fluid my-3">	
	<div class = "row">
		<div class = "col-8 offset-2 my-3 py-5">
			<div class = "row">
				<div class = "col-6 offset-3">
					<div class = "row">
						<div class = "col p-2 d-flex justify-content-center align-items-center">
							<a href = "/user/find_id"><span>아이디 찾기</span></a>
						</div>
						<div class = "col p-2 d-flex justify-content-center align-items-center">
							<a href = "/user/find_pw"><span>비밀번호 찾기</span></a>
						</div>
					</div>
					<div class = "row my-3">
						<div class = "col-10 offset-1 div-cert-check">
							<div class = "row p-2">
								<div class = "col">
									<span>비밀번호가 재설정 되었습니다!</span>
								</div>
							</div>
							<div class = "row p-2">
								<div class = "col-6">
									<button type = "button" class = "btn-href-login w-100" onClick = "location.href = 'login'">로그인</button>
								</div>
								<div class = "col-6">
									<button type = "button" class = "btn-href-home w-100" onClick = "location.href = '${pageContext.request.contextPath}/'">홈</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>