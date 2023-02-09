<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 변경" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/mypage_menu.jsp"></jsp:include>

<style>

	* {
		
	}

	.strong-mypage-title {
		font-size : 30px;
	}
	
	input {
		border-radius : 5px;
		border : 1px solid #76BEFF;
	}
	
	input:focus {
		outline : 2px solid #76BEFF;
	}
	
	.div-change-pw-input {
		height : 20rem;
	}
	
	.btn-change-user-pw-submit {
		border : 1px solid #76BEFF;
		border-radius : 5px;
		background-color : #76BEFF;
		color : white; 
	}

</style>

<div class = "container-fluid my-2">	
	<div class = "row">
		<div class = "col-4 offset-4 px-5">
			<div class = "row mt-4">
                <div class = "col d-flex justify-content-center align-items-center">
                    <strong class = "strong-mypage-title">비밀번호 변경</strong>
                </div>
            </div>
			<div class = "row my-3 div-change-pw-input">
				<form action = "change_pw" method = "post" class = "col-10 offset-1">
					<div class = "row my-3">
						<input name = "userPwNow" type = "password" class = "p-2 w-100" placeholder = "기존 비밀번호" maxlength = "16">
					</div>
					<div class = "row my-3">
						<input name = "userPw" type = "password" class = "p-2 w-100" placeholder = "새로운 비밀번호" maxlength = "16">
					</div>
					<div class = "row my-3">
						<input name = "userPwck" type = "password" class = "p-2 w-100" placeholder = "비밀번호 확인" maxlength = "16">
					</div>
					<div class = "row my-3">
						<button type = "submit" class = "btn-change-user-pw-submit p-2">변경</button>
					</div>
					<c:if test = "${param.error_step1 != null}">
						<div class = "row my-2">
							<div class = "col d-flex justify-content-center align-items-center">
								<span class = "span-check-invalid">비밀번호가 올바르지 않습니다.</span>
							</div>
						</div>
					</c:if>
					<c:if test = "${param.error_step2 != null}">
						<div class = "row my-2">
							<div class = "col d-flex justify-content-center align-items-center">					
								<span class = "span-check-invalid">비밀번호가 일치하지 않습니다.</span>
							</div>
						</div>
					</c:if>
				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">

	$(function(){
		// 마이페이지 메뉴 색 변경
		$(".img-change-user-pw").attr("src", "${pageContext.request.contextPath}/images/mypage-pw_change_pink.png");
	});
	
</script>