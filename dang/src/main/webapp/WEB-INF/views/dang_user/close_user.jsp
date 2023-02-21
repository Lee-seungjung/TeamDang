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
	
	input {
		border-radius : 5px;
		border : 1px solid #76BEFF;
	}
	
	input:focus {
		outline : 2px solid #76BEFF;
	}
	
	.btn-close-ck-submit {
		border : 1px solid #787878;
		border-radius : 5px;
		background-color : #787878;
		color : white; 
	}
</style>

<div class = "container-fluid my-2">	
	<div class = "row">
		<div class = "col-4 offset-4 px-5">
			<div class = "row my-4">
                <div class = "col d-flex justify-content-center align-items-center">
                    <strong class = "strong-mypage-title">회원 탈퇴</strong>
                </div>
            </div>
            <div class = "row my-2">
                <div class = "col d-flex flex-column justify-content-center align-items-center">
					<span>회원 탈퇴를 원하면 <strong>"즉시 탈퇴"</strong>를 입력해 주세요.</span>
                </div>
            </div>
			<div class = "row mb-2 div-edit-user-info-pwck-input">
				<form action = "close_user_ck" method = "get" class = "col-10 offset-1">
					<div class = "row my-4">
						<input name = "closeCheck" type = "text" class = "p-2 w-100" placeholder = "즉시 탈퇴" autocomplete = "false">
					</div>
					<div class = "row my-4">
						<button type = "submit" class = "p-2 btn-close-ck-submit">확인</button>
					</div>
					<c:if test = "${param.error != null}">
					<div class = "row my-2">
						<div class = "col d-flex justify-content-center align-items-center">				
							<span class = "span-check-invalid">올바른 문구를 입력해 주세요.</span>
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