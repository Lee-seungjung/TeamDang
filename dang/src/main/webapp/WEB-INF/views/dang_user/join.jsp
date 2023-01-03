<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="댕모임 가입" name="title"/>
</jsp:include>

<style>
	
	.input-check-gender {
		display: none;
	}
	
	.img-user-gender {
		border-radius: 50%;
		padding: 5px;
	}
	
	.gender-selected {
		border: 5px solid black;
		padding: 1px;
	}
	
</style>

<div class = "container-fluid my-3">	
	<div class = "row">
		<div class = "col-6 offset-3 my-3 py-5">
			<div class = "col mx-5">
				<div class = "row mt-3">
					<div class = "d-flex flex-column">
						<span>아이디</span>
						<input class = "flex-fill" id = "userId" type = "text" autocomplete = "false">
					</div>
				</div>
				<div class = "row mt-3">
					<div class = "d-flex flex-column">
						<span>비밀번호</span>
						<input class = "flex-fill" id = "userPw" type = "password" autocomplete = "false">
					</div>
				</div>
				<div class = "row mt-3">
					<div class = "d-flex flex-column">
						<span>비밀번호 확인</span>
						<input class = "flex-fill" id = "userPwck" type = "password" autocomplete = "false">
					</div>
				</div>
				<div class = "row mt-3">
					<div class = "d-flex flex-column">
						<span>닉네임</span>
						<input class = "flex-fill" type = "text" autocomplete = "false">
					</div>
				</div>
				<div class = "row mt-3">
					<div class = "d-flex flex-column">
						<span>전화번호</span>
						<input class = "flex-fill" type = "text" autocomplete = "false">
					</div>
				</div>
				<div class = "row mt-3">
					<div class = "d-flex flex-column">
						<span>성별</span>
						<div class = "d-flex flex-row">
							<label class = "col-3 offset-2" for = "checkGenderMan">
								<input type = "checkbox" class = "input-check-gender" id = "checkGenderMan" value = "M">
								<img class = "img-fluid img-user-gender" src = "${pageContext.request.contextPath}/images/icon-man.png">
							</label>
							<label class = "col-3 offset-2" for = "checkGenderWoman">
								<input type = "checkbox" class = "input-check-gender" id = "checkGenderWoman" value = "F">
								<img class = "img-fluid img-user-gender" src = "${pageContext.request.contextPath}/images/icon-woman.png">
							</label>
						</div>
					</div>
				</div>
				<div class = "row mt-3">
					<div class = "d-flex flex-column">
						<span>이메일</span>
						<div class = "d-flex flex-row">						
							<input class = "flex-fill" id = "userEmail" type = "text">
							<button id = "sendEmail" type = "button">인증</button>
						</div>
						<div class = "d-flex flex-row mt-3">						
							<input class = "flex-fill" id = "userCert" type = "text">
						</div>
					</div>
				</div>
				<div class = "row mt-3">
					<button type = "submit">가입</button>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">

	$(function(){
		// 회원가입 단계별 판정 객체
		var checkId;
		var checkPw;
		var checkEmail;
		var checkGender;
		
		// Helper text 태그
		var spanCheckValid = $("<span>").attr("class", "span-check span-check-valid");
		var spanCheckInvalid = $("<span>").attr("class", "span-check span-check-invalid");
		
		// ID 검사
		$("#userId").blur(function(){
			// 초기화
			$("#check-id").remove();
			checkId = false;
			//console.log("앞에" + checkId);
			// 검사할 ID 입력창의 값
			var inputId = $(this).val();
			// 아무 값도 입력되지 않았을 때
			if(inputId == "") {
				$("#userId").after(spanCheckInvalid.attr("id", "check-id").text("ID를 입력해주세요."));
			} else {
				// 정규표현식 : 영문 소문자, 숫자를 포함한 8~20자리
				var regexp = /^[a-z0-9]{8,20}$/;
				// 정규표현식 만족 여부에 따라 다른 처리
				if(regexp.test(inputId)) { // 정규표현식을 만족할 경우
					// 비동기 ID 조회
					$.ajax({
						url:"${pageContext.request.contextPath}/rest_user/check_id?userId=" + inputId,
						method : "get",
						success : function(resp){
							if(resp) {
								$("#userId").after(spanCheckValid.attr("id", "check-id").text("사용할 수 있는 아이디입니다."));
								checkId = true;
								//console.log("뒤에" + checkId);
							} else {
								$("#userId").after(spanCheckInvalid.attr("id", "check-id").text("이미 사용 중이거나 탈퇴한 아이디입니다."));
							}
						}
					});		
				} else { // 정규표현식을 만족하지 않을 경우
					$("#userId").after(spanCheckInvalid.attr("id", "check-id").text("영문 소문자, 숫자를 반드시 포함된 8~20자가 되어야 합니다."));
				}
			}
		});
		
		// PW 검사
		$("#userPw").blur(function(){
			// 초기화
			$("#check-pw").remove();
			checkPw = false;
			// 검사할 PW 입력창의 값
			var inputPw = $(this).val();
			// 아무 값도 입력하지 않았을 때
			if(inputPw == "") {
				$("#userPw").after(spanCheckInvalid.attr("id", "check-pw").text("비밀번호를 입력해주세요."));
			} else {
				// 정규표현식 : 영문 대문자, 소문자, 숫자, 특수문자(!@#$)를 반드시 포함하는 8~16자리
				var regexp = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$]{8,16}$/;
				// 정규표현식 여부에 따라 서로 다른 처리
				if(regexp.test(inputPw)) { // 정규표현식을 만족한다면
					$("#userPw").after(spanCheckValid.attr("id", "check-pw").text("사용할 수 있는 비밀번호입니다."));
					checkPw = true;
				
				} else { // 정규표현식을 만족하지 않을 경우
					$("#userPw").after(spanCheckValid.attr("id", "check-pw").text("영문 대/소문자, 숫자, 특수문자(!@#$)를 반드시 포함한 8~16자가 되어야 합니다."))
				}
			}
		});
		
		// Email 인증
		$("#sendEmail").click(function(){
			// 이메일 입력창의 값
			var inputEmail = $("#userEmail").val();
			// 이메일을 입력하지 않았다면 return
			if(inputEmail == "") return;
			// 전송 버튼
			var btn = $(this);
			// 이메일 발송 처리 중 중복 발송을 방지하기 위해 비활성화
			btn.attr("disabled", true);
			// 해당 이메일로 인증번호 발송
			$.ajax({
				url : "http://localhost:8888/rest_user/send_email?userEmail=" + inputEmail,
				method : "get",
				success : function(){
					btn.attr("disabled", false);
					console.log("성공");
					
					// 인증 번호를 입력하면
					$("#userCert").blur(function(){
						// 입력 인증번호
						var inputSerial = $(this).val();
						// 입력 인증번호로 비동기 조회
						$.ajax({
							
						});
					});)
				}
			}); 
		});
		
		// 성별 선택
		$(".input-check-gender").click(function(){
			// 이미지 태그
			var target = $(this).next();
			// 성별 선택 갯수
			var countChecked = $(".input-check-gender:checked").length;
			// 1개만 선택하도록
			if(countChecked > 1) return;
			// 선택한 성별의 테두리 변경
			if($(this).is(":checked")) {
				console.log(target);
				target.addClass("gender-selected");
				checkGender = true;
			} else {
				target.removeClass("gender-selected");
			}
		});
	});
</script>