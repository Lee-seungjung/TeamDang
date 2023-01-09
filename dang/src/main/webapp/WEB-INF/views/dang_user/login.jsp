<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.span-login-invalid {
		color: red;
	}
</style>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="댕모임 로그인" name="title"/>
</jsp:include>

<div class = "container-fluid">
	<div class = "col-8 offset-2">
		<div class = "row">
			<div class = "col-4 offset-4">			
				<div class = "d-flex justify-content-center my-3">			
					<span>댕모임 로그인</span>
				</div>
				<div class = "d-flex justify-content-center align-items-center my-3">
					<input class = "input-user-id flex-fill" type = "text" placeholder = "아이디">
				</div>
				<div class = "d-flex justify-content-center align-items-center my-3">
					<input class = "input-user-pw flex-fill" type = "password" placeholder = "비밀번호">
				</div>
				<div class = "d-flex justify-content-center align-items-center my-3">
					<button class = "btn-login">로그인</button>
				</div>
				<div class = "d-flex justify-content-center align-items-center my-3">
					<div class = "offset-6 col-3">
						<a href = "/user/find_id">아이디찾기</a>
					</div>
					<div class = "col-3">
						<a href = "/user/find_pw">비밀번호찾기</a>
					</div>
				</div>
				<div class = "d-flex justify-content-center align-items-center my-3">
					<a href = "/user/join">회원가입</a>
				</div>
				<c:if test = "${param.error != null}">
					<div class = "d-flex justify-content-center align-items-center my-3">
						<span class = "span-login-invalid">회원 아이디 또는 비밀번호가 잘못되었습니다.</span>
					</div>
				</c:if>
			</div>
		</div>
	</div>	
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">

	$(function(){
		$(".btn-login").click(function(){
			var formLogin = $("<form>").attr("type", "hidden").attr("action", "login").attr("method", "post");
			var inputId = $("<input>").attr("type", "hidden").attr("name", "userId").attr("value", $(".input-user-id").val());
			var inputPw = $("<input>").attr("type", "hidden").attr("name", "userPw").attr("value", $(".input-user-pw").val());
			formLogin.append(inputId).append(inputPw);
			$("body").append(formLogin);
			formLogin.submit();
		});
	})

</script>