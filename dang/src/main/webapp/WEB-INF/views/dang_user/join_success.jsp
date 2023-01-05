<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="댕모임 가입 완료" name="title"/>
</jsp:include>

<div class = "container-fluid my-3">	
	<div class = "row">
		<div class = "col-6 offset-3 my-3 py-5">
			<div class = "col mx-5">
				<div class = "row mt-3">
					<div class = "d-flex flex-row justify-content-center align-items-center">
						<div class = "col-2">
							댕모임
						</div>
						<div class = "col-2">
							이미지
						</div>
					</div>
				</div>
				
				<div class = "row mt-3">
					<div class = "d-flex flex-column justify-content-center align-items-center">
						<span>댕모임 회원이 되신 것을 환영합니다!</span>
						<span>회원가입이 완료되었습니다.</span>
					</div>
				</div>
				<div class = "row mt-3">
					<div class = "col-3 offset-3">
						<button onClick = "location.href='/user/login'">로그인</button>
					</div>
					<div class = "col-3 offset-1">
						<button onClick = "location.href='/'">홈</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>