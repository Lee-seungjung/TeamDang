<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원정보 변경" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/mypage_menu.jsp"></jsp:include>

<style>
	
</style>

<div class = "container-fluid my-3">	
	<div class = "row">
		<div class = "col-8 offset-2 my-3 py-5">
			<div class = "row">
				<div class = "col d-flex justify-content-center align-items-center">				
					<a href = "mypage">마이페이지</a>
				</div>
			</div>
			<div class = "row">	
				<div class = "col">
					<div class = "row px-3">
						<div class = "col">
							<div class = "row">
								<div class = "col-8 offset-2">
									<div class = "d-flex flex-column justify-content-center align-items-center">									
										<span>비밀번호 확인</span>
										<span>회원님의 정보를 보호하기 위해 비밀번호를 다시 확인합니다.</span>
									</div>
									<form action = "edit_pwck" method = "post">
									<div class = "d-flex flex-column justify-content-center align-items-center">
										<input name = "userPw" type = "password" class = "flex-fill" placeholder = "비밀번호 확인">
									</div>
									<div class = "d-flex flex-column justify-content-center align-items-center">
										<button type = "submit">확인</button>
									</div>
									</form>
									<c:if test = "${param.error != null}">
										<div class = "d-flex flex-column justify-content-center align-items-center">
											<span>비밀번호가 올바르지 않습니다.</span>
										</div>
									</c:if>
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

<script type="text/javascript">

	$(function(){
		$(".div-mypage-edit-user-info").css("background-color", "#F94888");
	});
	
</script>