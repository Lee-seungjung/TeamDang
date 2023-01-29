<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 찾기" name="title"/>
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
	
	.btn-email-submit,
	.btn-cert-submit {
		border-radius : 10px;
		background-color : #787878;
		color : white;
		border : none;
	} 
	
	.btn-cert-complete {
		border-radius : 10px;
		background-color : #76BEFF;
		color : white;
		border : none;
	}
	
	.btn-email-submit:disabled,
	.btn-cert-submit:disabled,
	.btn-cert-complete:disabled {
		opacity : 0.5;
	}
	
	.div-find-pw-input {
		height : 20rem;
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
						<div class = "col py-2 div-find-pw-input">
							<div class = "row pt-4 px-4">
								<div class = "col">								
									<input class = "input-user-id w-100 p-2" type = "text" placeholder = "아이디">
								</div>
							</div>
							<div class = "row pt-4 px-4">
								<div class = "col-9">
									<input class = "input-user-email w-100 p-2" type = "text" placeholder = "가입시 입력한 이메일">
								</div>
								<div class = "col-3">
									<button class = "btn-email-submit w-100 p-2">전송</button>
								</div>
							</div>
							<div class = "row pt-4 px-4">
								<div class = "col-9">
									<input class = "input-user-cert w-100 p-2" type = "text" placeholder = "인증번호">
								</div>
								<div class = "col-3">
									<button class = "btn-cert-submit w-100 p-2">인증</button>
								</div>
							</div>
							<div class = "row py-4 px-4">
								<div class = "col">
									<button class = "w-100 p-2 btn-cert-complete">확인</button>
								</div>
							</div>
						</div>
					</div>
					<c:if test = "${param.fail != null}">
					<div class = "row py-4">
						<div class = "col d-flex justify-content-center align-items-center">						
							<span class = "span-check span-check-invalid check-id-different">잘못된 아이디 또는 이메일 입니다.</span>
						</div>
					</div>
					</c:if>
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
		
		// 초기 이메일 전송 버튼 비활성화
		$(".btn-email-submit").prop("disabled", true);
		
		// 초기 인증 버튼 비활성화
		$(".btn-cert-submit").prop("disabled", true);
		
		// 초기 확인 버튼 비활성화
		$(".btn-cert-complete").prop("disabled", true);
		
		$(".input-user-id").blur(function(){
			var inputId = $(this).val();
			if(inputId == "") {
				check.checkId = false;
				checkAll();
				return;
			} 
			check.checkId = true;
			checkAll();
		});
		
		// 이메일 입력창 blur 시
		$(".input-user-email").blur(function(){
			var inputEmail = $(this).val();
			if(inputEmail == "") {
				$(".btn-email-submit").prop("disabled", true);
				check.checkEmail = false;
				checkAll();
				return;
			}
			var regexp = /^[A-Za-z0-9]{6,30}@[0-9a-z]{4,252}.[a-z]{2,3}$/;
			if(regexp.test(inputEmail)) {
				$(".btn-email-submit").prop("disabled", false);
				check.checkEmail = true;
				checkAll();
			} else {
				$(".btn-email-submit").prop("disabled", true);	
				check.checkEmail = false;
				checkAll();
			}
		});
		
		var certSerial;
		
		$(".btn-email-submit").click(function(){
			// 초기화
			$(".div-check-sert-send").remove();
			
			var inputEmail = $(".input-user-email").val();
			
			// 발송 문구
			var checkCertSend = $("<div>").attr("class", "col d-flex justify-content-center align-items-center div-check-sert-send");
			checkCertSend.append($("<span>").attr("class", "span-check span-check-valid check-cert check-cert-send").html("인증번호를 발송했습니다.<br>인증번호가 오지 않으면 입력한 정보가 정확한지 확인하여 주세요."));
			
			$(".div-cert-check").append(checkCertSend);
			
			var btn = $(this);
			btn.prop("disabled", true);
			// 해당 이메일로 인증번호 발송
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_user/send_email?userEmail=" + inputEmail,
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
				check.checkCert = false;
				checkAll();
				return;
			}
			if(certSerial == inputCerial) {
				alert("인증 완료!");
				$(".btn-cert-complete").prop("disabled", false);
				check.checkCert = true;
				checkAll();
			} else {
				alert("인증번호가 일치하지 않습니다.");	
				check.checkCert = false;
				checkAll();
			}
		});
		
		$(".btn-cert-complete").click(function(){
			// 입력한 아이디와 이메일을 form으로 전송
			var userId = $(".input-user-id").val();
			var userEmail = $(".input-user-email").val();
			var form = $("<form>").attr("action", "find_pw").attr("method", "post");
			form.append($("<input>").attr("type", "hidden").attr("name", "userId").attr("value", userId))
				.append($("<input>").attr("type", "hidden").attr("name", "userEmail").attr("value", userEmail));
			$("body").append(form);
			form.submit();
		});
		
		// 유효성 검사
		var check = {
			checkId : false,
			checkEmail : false,
			checkCert : false,
			isAllValid : function(){
				return this.checkId && this.checkEmail && this.checkCert;
			}
		}
		
		// 유효성 검사 통과시 확인 버튼 비활성화 해제
		function checkAll() {
			if(check.isAllValid()) {
				$(".btn-cert-complete").prop("disabled", false);
			} else {
				$(".btn-cert-complete").prop("disabled", true);
			}
		}
	});
</script>