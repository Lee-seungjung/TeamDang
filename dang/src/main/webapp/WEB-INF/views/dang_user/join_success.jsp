<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="댕모임 가입" name="title"/>
</jsp:include>

<style>
	* {
		
	}
	
	.strong-dang-join-complete-title {
		font-size : 36px;
	}
	
	.btn-href-login {
		border : none;
		border-radius : 5px;
		background-color : #76BEFF;	
		color : white;
	}
	
	.btn-href-home {
		border : none;
		border-radius : 5px;
		background-color : #787878;
		color : white;
	}
</style>

<div class = "container-fluid my-3">	
	<div class = "row">
		<div class = "col-6 offset-3">
			<div class = "row">
				<div class = "offset-2 col-8">
					<div class = "row mt-5">
						<div class = "col-4 offset-4">
							<img src = "${pageContext.request.contextPath}/images/logo2.png" class = "w-100">
						</div>
					</div>
					<div class = "row mt-4">
						<div class = "col d-flex justify-content-center align-items-center">
							<strong class = "strong-dang-join-complete-title">가입이 완료 되었습니다!</strong>
						</div>
					</div>
					<div class = "row mt-2">
						<div class = "col d-flex justify-content-center align-items-center">
							<span>댕모임 활동에 참여해서 경험치를 쌓아보세요.</span>
						</div>
					</div>
					<div class = "row mt-2 mb-5">
						<div class = "col d-flex justify-content-center align-items-center">
							<span>레벨에 따른 재밌는 뱃지를 준비해두었어요.</span>
						</div>
					</div>
					<div class = "row mb-5">
						<div class = "col-3 offset-2 d-flex justify-content-center align-items-center">
							<button class = "p-2 w-100 btn-href-login" onClick = "location.href='login'">로그인</button>
						</div>
						<div class = "col-3 offset-2 d-flex justify-content-center align-items-center">
							<button class = "p-2 w-100 btn-href-home" onClick = "location.href='/'">홈</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>