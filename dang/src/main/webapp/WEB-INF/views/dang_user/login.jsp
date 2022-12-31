<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="댕모임 가입" name="title"/>
</jsp:include>

<div class = "container-fluid">
	
	<div class = "col">
		<div class = "row">
			로그인 페이지
		</div>
		<div class = "col-8 offset-2">
			<div class = "row">
				아이디 : <input class = "input-user-id" type = "text">
			</div>
			<div class = "row">
				비밀번호 : <input class = "input-user-pw" type = "password">
			</div>
			<div class = "row">
				<button class = "btn-login" type = "submit">로그인</button>
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