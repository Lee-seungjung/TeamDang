<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원정보 변경" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/mypage_menu.jsp"></jsp:include>

<style>
	* {
		
	}

	.strong-mypage-title {
		font-size : 30px;
	}
	
	.div-edit-user-innfo-pwck {
		height : 12rem;
	}
	
	.btn-edit-user-info-pwck-submit {
		border : 1px solid #76BEFF;
		border-radius : 5px;
		background-color : #76BEFF;
		color : white; 
	}
	
	input {
		border-radius : 5px;
		border : 1px solid #76BEFF;
	}
	
	input:focus {
		outline : 2px solid #76BEFF;
	}
	
	.div-edit-user-info-pwck-input {
		height : 18rem;
	}
	
</style>

<div class = "container-fluid my-2">	
	<div class = "row">
		<div class = "col-4 offset-4 px-5">
			<div class = "row my-4">
                <div class = "col d-flex justify-content-center align-items-center">
                    <strong class = "strong-mypage-title">회원정보 변경</strong>
                </div>
            </div>
            <div class = "row my-2">
                <div class = "col d-flex flex-column justify-content-center align-items-center">
					<span>회원님의 정보를 보호하기 위해 비밀번호를 다시 확인합니다.</span>
                </div>
            </div>
			<div class = "row mb-2 div-edit-user-info-pwck-input">
				<form action = "edit_pwck" method = "post" class = "col-10 offset-1 div-edit-user-innfo-pwck">
					<div class = "row my-4">
						<input name = "userPw" type = "password" class = "p-2 w-100" placeholder = "비밀번호 확인" maxlength = "16">
					</div>
					<div class = "row my-4">
						<button type = "submit" class = "btn-edit-user-info-pwck-submit p-2">확인</button>
					</div>
					<c:if test = "${param.error != null}">
					<div class = "row my-2">
						<div class = "col d-flex justify-content-center align-items-center">				
							<span class = "span-check-invalid">비밀번호가 올바르지 않습니다.</span>
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
		$(".img-change-user-info").attr("src", "${pageContext.request.contextPath}/images/mypage-myinfo_edit_pink.png");
	});
	
</script>