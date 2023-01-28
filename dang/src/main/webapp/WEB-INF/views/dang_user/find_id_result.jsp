<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="아이디 찾기" name="title"/>
</jsp:include>

<style>
	* {
		
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
	
	.div-dang-find-id-top {
		border-top-left-radius: 15px;
		border-top-right-radius : 15px;
	}
	
	.div-dang-find-id-bottom {
		border-bottom-left-radius: 15px;
		border-bottom-right-radius : 15px;
		box-shadow: 3px 3px 3px #E0E0E0;
		border : 1px solid #EBEBEB;
	}
	
	.div-find-id-container {
		border : 1px solid #EBEBEB;
		border-radius : 15px;
		background-color : white; 
	}
	
	.div-find-id-result {
		height : 15rem;;
	}
	
	.strong-find-id-result {
		font-size : 24px;
	}
	
	.i-find-id-result,
	.span-find-id-result {
		font-size : 24px;
	}
	
	.btn-href-login {
		border-radius : 10px;
		border : none;
		background-color : #76BEFF;
		color : white;
	}

</style>

<div class = "container-fluid my-5">	
	<div class = "row">
		<div class = "col-6 offset-3 my-3 py-2">
			<div class = "row">
				<div class = "col-8 offset-2 p-5">
					<div class = "row div-dang-find-id-top">
						<div class = "col px-2 py-2 d-flex justify-content-center align-items-center div-dang-find-menu div-dang-find-menu-selected">
							<span class = "span-find-id" onClick = "location.href = 'find_id'">아이디찾기</span>
						</div>
						<div class = "col px-2 py-2 d-flex justify-content-center align-items-center div-dang-find-menu">
							<span class = "span-find-pw" onClick = "location.href = 'find_pw'">비밀번호찾기</span>
						</div>
					</div>
					<div class = "row div-dang-find-id-bottom">
						<div class = "col">
							<div class = "row p-4 div-find-id-result">
								<div class = "col py-2">
									<div class = "row py-2">
										<div class = "col d-flex justify-content-center align-items-center">										
											<strong class = "strong-find-id-result">회원님의 아이디는 다음과 같습니다.</strong>
										</div>							
									</div>
									<div class = "row py-4">
										<div class = "col d-flex justify-content-center align-items-center">										
											<i class="fa-solid fa-user me-3 i-find-id-result"></i>
											<span class = "span-find-id-result">${findUserId}</span>
										</div>							
									</div>
									<div class = "row py-2">
										<div class = "col-6 offset-3 px-5">
											<button type = "button" class = "btn-href-login p-2 w-100" onClick = "location.href = 'login'">로그인</button>
										</div>
									</div>								
								</div>
							</div>
						</div>
					</div>
					<div class = "row py-4">
						<div class = "col div-cert-check"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">

	$(function(){
		
	})
	
</script>