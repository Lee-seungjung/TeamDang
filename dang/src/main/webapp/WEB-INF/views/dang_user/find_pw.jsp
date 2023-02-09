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
				<form class = "col-8 offset-2 p-5">
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
									<input class = "input-user-id w-100 p-2" type = "text" placeholder = "아이디" maxlength = "20">
								</div>
							</div>
							<div class = "row pt-4 px-4">
								<div class = "col-9">
									<input class = "input-user-email w-100 p-2" type = "text" placeholder = "가입시 입력한 이메일">
								</div>
								<div class = "col-3">
									<button type = "button" class = "btn-email-submit w-100 p-2">전송</button>
								</div>
							</div>
							<div class = "row pt-4 px-4">
								<div class = "col-9">
									<input class = "input-user-cert w-100 p-2" type = "text" placeholder = "인증번호">
								</div>
								<div class = "col-3">
									<button type = "button" class = "btn-cert-submit w-100 p-2">인증</button>
								</div>
							</div>
							<div class = "row py-4 px-4">
								<div class = "col">
									<button type = "button" class = "w-100 p-2 btn-cert-complete">확인</button>
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
						<div class = "col div-cert-check d-flex justify-content-center align-items-center"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">

	$(function(){
		
		$(".input-user-id").blur(function(){
			// helper text 초기화
			$(".div-cert-check").empty();
			// 아이디 입려창
			var inputId = $(this).val();
			if(inputId == "") {
				$(".div-cert-check")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-cert check-cert-id-empty").text("아이디를 입력해 주세요.")
					)
				formValidCheck.checkId = false;
				return;
			} 
			formValidCheck.checkId = true;
		});
		
		var certSerial;
		
		$(".btn-email-submit").click(function(){
			// 인증번호 유효성 초기화
			formValidCheck.checkCert = false;
			// helper text 초기화
			$(".div-cert-check").empty();
			// 이메일 입력창의 값
			var inputEmail = $(".input-user-email").val();
			// 이메일을 입력하지 않았다면 return
			if(inputEmail == "") {
				$(".div-cert-check")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-cert check-cert-email-empty").text("이메일을 입력해 주세요.")
					)
				formValidCheck.checkEmail = false;
				return;
			}
			// 이메일 형식 검사
			var regexp = /^[A-Za-z0-9]{6,30}@[0-9a-z]{4,252}.[a-z]{2,3}$/
			if(regexp.test(inputEmail) == false) {
				$(".div-cert-check")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-cert check-cert-email-invalid").text("올바른 이메일 형식이 아닙니다.")
					)
				formValidCheck.checkEmail = false;
				return;
			}
			formValidCheck.checkEmail = true;
			// 발송 문구
			var checkCertSend = $("<div>").attr("class", "col d-flex justify-content-center align-items-center");
			checkCertSend.append($("<span>").attr("class", "span-check span-check-valid check-cert check-cert-send").html("인증번호를 발송했습니다.<br>인증번호가 오지 않으면 입력한 정보가 정확한지 확인하여 주세요."));
			$(".div-cert-check").append(checkCertSend);
			// 이메일 전송 중 전송 버튼 비활성화
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
			// helper text 초기화
			$(".div-cert-check").empty();
			// 입력한 인증번호와 발급한 인증번호 비교
			var inputCerial = $(".input-user-cert").val();
			// 인증번호가 빈 값일 때
			if(inputCerial == "") {
				$(".div-cert-check")
					.append(
						$("<span>").attr("class", "span-check span-check-valid check-cert check-cert-empty").text("인증번호를 입력해 주세요.")
					)
				formValidCheck.checkCert = false;
				return;
			}
			// 인증번호 입력시
			if(certSerial == inputCerial) {
				alert("인증 완료!");
				formValidCheck.checkCert = true;
			} else {
				$(".div-cert-check")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-cert check-cert-invalid").text("인증번호가 일치하지 않습니다.")
					)
				formValidCheck.checkCert = false;
			}
		});
		
		$(".btn-cert-complete").click(function(){
			if(formValidCheck.isAllValid() == false) {
				return;
			}
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
		var formValidCheck = {
			checkId : false,
			checkEmail : false,
			checkCert : false,
			isAllValid : function(){
				return this.checkId && this.checkEmail && this.checkCert;
			}
		}
	});
</script>