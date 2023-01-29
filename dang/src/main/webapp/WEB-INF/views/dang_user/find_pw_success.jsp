<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 찾기" name="title"/>
</jsp:include>

<style>
	* {
		border : 1px gray dotted;
	}
	
	input {
		border-radius : 10px;
		border : 1px solid #76BEFF;
	}
	
	input:focus {
		outline : 2px solid #76BEFF;
	}
	
	.span-find-id,
	.span-find-pw {
		font-size : 20px;
	}
	
	.div-dang-find-menu {
		border-top-left-radius: 15px;
		border-top-right-radius : 15px;
		border : 1px solid #EBEBEB;
		background-color : #76BEFF;
		color : white;
		border : 1px solid #76BEFF;
		opacity : 0.5;
	}
	
	.div-dang-find-menu:hover {
		opacity : 1;
	}
	
	.div-dang-find-menu-selected {
		opacity : 1;
	}
	
	.div-dang-find-pw-top {
		border-top-left-radius: 15px;
		border-top-right-radius : 15px;
	}
	
	.div-dang-find-pw-bottom {
		border-bottom-left-radius: 15px;
		border-bottom-right-radius : 15px;
		box-shadow: 3px 3px 3px #E0E0E0;
		border : 1px solid #EBEBEB;
	}
	
	.btn-change-complete {
		border-radius : 10px;
		background-color : #76BEFF;
		color : white;
		border : none;
	}
	
	.btn-change-complete:disabled {
		opacity : 0.5;
	}
	
	.div-find-pw-result {
		height : 300px;
	}
	
	.strong-find-pw-result {
		font-size : 24px;
	}
	
	.btn-href-login {
		border-radius : 10px;
		border : none;
		background-color : #76BEFF;
		color : white;
	}
	
	.btn-href-home {
		border-radius : 10px;
		border : none;
		background-color : #787878;
		color : white;
	}
	
	.div-find-pw-result {
		height : 15rem;
	}
	
</style>

<div class = "container-fluid my-5">	
	<div class = "row">
		<div class = "col-6 offset-3 my-3 py-2">
			<div class = "row">
				<div class = "col-8 offset-2 p-5">
					<div class = "row div-dang-find-pw-top">
						<div class = "col px-2 py-2 d-flex justify-content-center align-items-center div-dang-find-menu">
							<span class = "span-find-id" onClick = "location.href = 'find_id'">아이디찾기</span>
						</div>
						<div class = "col px-2 py-2 d-flex justify-content-center align-items-center div-dang-find-menu div-dang-find-menu-selected">
							<span class = "span-find-pw" onClick = "location.href = 'find_pw'">비밀번호찾기</span>
						</div>
					</div>
					<div class = "row div-dang-find-pw-bottom">
						<div class = "col py-2 div-find-pw-result">
							<div class = "row p-4 div-find-pw-result">
								<div class = "col py-2">
									<div class = "row pt-3 pb-5">
										<div class = "col d-flex justify-content-center align-items-center">										
											<strong class = "strong-find-pw-result">비밀번호가 재설정 되었습니다!</strong>
										</div>							
									</div>
									<div class = "row py-4">
										<div class = "col-6 px-5">
											<button type = "button" class = "btn-href-login p-2 w-100" onClick = "location.href = 'login'">로그인</button>
										</div>
										<div class = "col-6 px-5">
											<button type = "button" class = "btn-href-home p-2 w-100" onClick = "location.href = '${pageContext.request.contextPath}/'">홈으로</button>
										</div>
									</div>								
								</div>
							</div>
						</div>
					</div>
					<div class = "row py-4">
						<div class = "col"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>