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
						<div class = "col p-2 d-flex justify-content-center align-items-center">
							<a href = "/user/find_id"><span>아이디 찾기</span></a>
						</div>
						<div class = "col p-2 d-flex justify-content-center align-items-center">
							<a href = "/user/find_pw"><span>비밀번호 찾기</span></a>
						</div>
					</div>
					<div class = "row my-3">
						<div class = "col-10 offset-1 div-cert-check">
							<div class = "row p-2">
								<div class = "col-9">
									<input class = "input-user-email w-100" type = "text" placeholder = "가입시 입력한 이메일">
								</div>
								<div class = "col-3">
									<button class = "btn-email-submit w-100">전송</button>
								</div>
							</div>
							<div class = "row p-2">
								<div class = "col-9">
									<input class = "input-user-cert w-100" type = "text" placeholder = "인증번호">
								</div>
								<div class = "col-3">
									<button class = "btn-cert-submit w-100">인증</button>
								</div>
							</div>
							<div class = "row p-2">
								<button class = "btn-cert-complete">확인</button>
							</div>
							<c:if test = "${param.fail != null}">
							<div class = "row p-2">
								<span class = "span-check-id-invalid">입력하신 이메일로 가입한 아이디가 없습니다.</span>
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
		
		// 초기 이메일 전송 버튼 비활성화
		$(".btn-email-submit").prop("disabled", true);
		
		// 초기 인증 버튼 비활성화
		$(".btn-cert-submit").prop("disabled", true);
		
		// 초기 확인 버튼 비활성화
		$(".btn-cert-complete").prop("disabled", true);
		
		// 이메일 입력창 blur 시
		$(".input-user-email").blur(function(){
			var inputEmail = $(this).val();
			if(inputEmail == "") {
				$(".btn-email-submit").prop("disabled", true);
				return;
			}
			var regexp = /^[A-Za-z0-9]{6,30}@[0-9a-z]{4,252}.[a-z]{2,3}$/;
			if(regexp.test(inputEmail)) {
				$(".btn-email-submit").prop("disabled", false);
			} else {
				$(".btn-email-submit").prop("disabled", true);	
			}
		});
		
		var certSerial;
		
		$(".btn-email-submit").click(function(){
			var inputEmail = $(".input-user-email").val();
			
			// 발송 문구
			var checkCertSend = $("<div>").attr("class", "col my-2 d-flex justify-content-center align-items-center");
			checkCertSend.append($("<span>").attr("class", "span-check span-check-valid check-cert check-cert-send").html("인증번호를 발송했습니다.<br>인증번호가 오지 않으면 입력한 정보가 정확한지 확인하여 주세요."));
			
			$(".div-cert-check").append(checkCertSend);
			
			var btn = $(this);
			btn.prop("disabled", true);
			// 해당 이메일로 인증번호 발송
			$.ajax({
				url : "http://localhost:8888/rest_user/send_email?userEmail=" + inputEmail,
				method : "get",
				success : function(resp){
					// 이메일 발송이 완료되면 인증 버튼 다시 활성화
					btn.prop("disabled", false);
					// 인증 확인 버튼 활성화
					$(".btn-cert-submit").prop("disabled", false);
					// 인증메일 발송 메시지
					$(".check-cert-send").show();
					// 반환한 인증번호
					certSerial = resp;
				}
			}); 
		});
		
		$(".btn-cert-submit").click(function(){
			// 입력한 인증번호와 발급한 인증번호 비교
			var inputCerial = $(".input-user-cert").val();
			if(inputCerial == "") {
				alert("인증번호를 입력해 주세요.");
				return;
			}
			if(certSerial == inputCerial) {
				alert("인증 완료!");
				$(".btn-cert-complete").prop("disabled", false);
			} else {
				alert("인증번호가 일치하지 않습니다.");	
			}
		});
		
		$(".btn-cert-complete").click(function(){
			// 입력한 이메일을 form으로 전송
			var userEmail = $(".input-user-email").val();
			var form = $("<form>").attr("action", "find_id").attr("method", "post");
			form.append($("<input>").attr("type", "hidden").attr("name", "userEmail").attr("value", userEmail));
			$("body").append(form);
			form.submit();
		});
	});
	
</script>