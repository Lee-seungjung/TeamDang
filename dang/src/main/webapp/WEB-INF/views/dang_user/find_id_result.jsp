<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	
</style>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>

<div class = "container-fluid my-3">	
	<div class = "row">
		<div class = "col-8 offset-2 my-3 py-5">
			<div class = "row">
				<div class = "col-6 offset-3">
					<div class = "row">
						<div class = "col p-2">
							<a href = "${pageContext.request.contextPath}/user/find_id"><span>아이디 찾기</span></a>
						</div>
						<div class = "col p-2">
							<a href = "${pageContext.request.contextPath}/user/find_pw"><span>비밀번호 찾기</span></a>
						</div>
					</div>
					<div class = "row my-3">
						<div class = "col-8 offset-2">
							<div class = "col my-2 d-flex justify-content-center align-items-center">
								회원님의 아이디는 다음과 같습니다.
							</div>
							<div class = "col my-2 d-flex justify-content-center align-items-center">
								<i class="fa-solid fa-user me-2"></i>
								<span>${findUserId}</span>
							</div>
							<div class = "col my-2 d-flex justify-content-center align-items-center">
								<a href = "login">로그인</a>
							</div>
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
		
		// 초기 이메일 전송 버튼 비활성화
		$(".btn-email-submit").prop("disabled", true);
		
		// 초기 이메일 발송 문구 숨김
		$(".check-cert-send").hide();
		
		// 이메일 입력창 blur 시
		$(".input-user-email").blur(function(){
			var inputEmail = $(this).val();
			if(inputEmail == "") {
				$(".btn-email-submit").prop("disabled", true);
				return;
			} 
			$(".btn-email-submit").prop("disabled", false);
		});
		
		var certSerial;
		
		$(".btn-email-submit").click(function(){
			var inputEmail = $(".input-user-email").val();
			var btn = $(this);
			btn.prop("disabled", true);
			// 해당 이메일로 인증번호 발송
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_user/send_email?userEmail=" + inputEmail,
				method : "get",
				success : function(resp){
					// 이메일 발송이 완료되면 인증 버튼 다시 활성화
					btn.prop("disabled", false);
					// 인증메일 발송 메시지
					$(".check-cert-send").show();
					// 반환한 인증번호
					certSerial = resp;
				}
			}); 
		});
		
		$(".btn-cert-submit").click(function(){
			// 입력한 인증번호와 발급한 인증번호 비교
			var inputCert = $(".input-user-cert").val();
			if(certSerial == inputCert) {
				alert("인증 완료!");
				// 입력한 이메일을 form으로 전송
				var userEmail = $(".input-user-email").val();
				var form = $("<form>").attr("action", "find_id").attr("method", "post");
				form.append($("<input>").attr("name", "userEmail").attr("value", userEmail));
				$("body").append(form);
				form.submit();
			} else {
				alert("인증번호가 일치하지 않습니다.");	
			}
		});
	});
	
</script>