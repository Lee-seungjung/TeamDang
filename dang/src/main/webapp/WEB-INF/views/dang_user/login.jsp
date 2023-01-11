<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	
	* {
		border : 1px gray dotted;
	}

	.span-login-invalid {
		color: red;
	}
	
</style>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="댕모임 로그인" name="title"/>
</jsp:include>

<div class = "container-fluid my-3">	
	<div class = "row">
		<div class = "col-8 offset-2 my-3 py-5">
			<div class = "row">
				<div class = "col-6 offset-3">
					<div class = "row my-3">
						<div class = "col-10 offset-1 div-cert-check">
							<div class = "row p-2">
								<div class = "col d-flex justify-content-center align-items-center">
									<span>댕모임 로그인</span>
								</div>
							</div>
							<div class = "row p-2">
								<div class = "col">
									<input class = "input-user-id w-100" type = "text" placeholder = "아이디">
								</div>
							</div>
							<div class = "row p-2">
								<div class = "col">
									<input class = "input-user-pw w-100" type = "password" placeholder = "비밀번호">
								</div>
							</div>
							<div class = "row p-2">
								<div class = "col">
									<button type = "submit" class = "btn-login-submit w-100">로그인</button>
								</div>
							</div>
							<div class = "row p-2">
								<div class = "col-6 d-flex justify-content-center align-items-center">
									<a href = "find_id">아이디찾기</a>
								</div>
								<div class = "col-6 d-flex justify-content-center align-items-center">
									<a href = "find_pw">비밀번호찾기</a>
								</div>
							</div>
							<c:if test = "${param.error != null}">
							<div class = "row p-2">
								<div class = "col d-flex justify-content-center align-items-center">
									<span class = "span-check span-check-invalid check-login-error">회원 아이디 또는 비밀번호가 잘못되었습니다.</span>
								</div>
							</div>
							</c:if>
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
		$(".btn-login-submit").click(function(){
			var formLogin = $("<form>").attr("type", "hidden").attr("action", "login").attr("method", "post");
			var inputId = $("<input>").attr("type", "hidden").attr("name", "userId").attr("value", $(".input-user-id").val());
			var inputPw = $("<input>").attr("type", "hidden").attr("name", "userPw").attr("value", $(".input-user-pw").val());
			formLogin.append(inputId).append(inputPw);
			$("body").append(formLogin);
			formLogin.submit();
		});
	})

</script>