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
						<span class = "span-check span-check-invalid check-id check-id-empty">ID를 입력해주세요.</span>
						<span class = "span-check span-check-valid check-id check-id-valid">사용할 수 있는 아이디입니다.</span>
						<span class = "span-check span-check-invalid check-id check-id-already">이미 사용 중이거나 탈퇴한 아이디입니다.</span>
						<span class = "span-check span-check-invalid check-id check-id-invalid">영문 소문자, 숫자를 반드시 포함된 8~20자가 되어야 합니다.</span>
					</div>
				</div>
				<div class = "row mt-3">
					<div class = "d-flex flex-column">
						<span>비밀번호</span>
						<input class = "flex-fill" id = "userPw" type = "password" autocomplete = "false">
						<span class = "span-check span-check-valid check-pw check-pw-empty">비밀번호를 입력해주세요.</span>
						<span class = "span-check span-check-valid check-pw check-pw-valid">사용할 수 있는 비밀번호입니다.</span>
						<span class = "span-check span-check-valid check-pw check-pw-invalid">영문 대/소문자, 숫자, 특수문자(!@#$)를 반드시 포함한 8~16자가 되어야 합니다.</span>
					</div>
				</div>
				<div class = "row mt-3">
					<div class = "d-flex flex-column">
						<span>비밀번호 확인</span>
						<input class = "flex-fill" id = "userPwck" type = "password" autocomplete = "false">
						<span class = "span-check span-check-valid check-pwck check-pwck-empty">비밀번호를 한번 더 입력해주세요.</span>
						<span class = "span-check span-check-valid check-pwck check-pwck-valid">비밀번호가 일치합니다.</span>
						<span class = "span-check span-check-valid check-pwck check-pwck-different">비밀번호가 일치하지 않습니다.</span>
						<span class = "span-check span-check-valid check-pwck check-pwck-invalid">영문 대/소문자, 숫자, 특수문자(!@#$)를 반드시 포함한 8~16자가 되어야 합니다.</span>
					</div>
				</div>
				<div class = "row mt-3">
					<div class = "d-flex flex-column">
						<span>닉네임</span>
						<input class = "flex-fill" id = "userNick" type = "text" autocomplete = "false">
						<span class = "span-check span-check-valid check-nick-valid">멋진 닉네임이네요!</span>
					</div>
				</div>
				<div class = "row mt-3">
					<div class = "d-flex flex-column">
						<span>전화번호(선택)</span>
						<input class = "flex-fill" id = "userTel" type = "text" autocomplete = "false">
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
						<div class = "d-flex flex-column mt-3">						
							<input class = "flex-fill" id = "userCert" type = "text">
							<span class = "span-check span-check-valid check-cert check-cert-send">인증번호를 발송했습니다.<br>인증번호가 오지 않으면 입력한 정보가 정확한지 확인하여 주세요.</span>
							<span class = "span-check span-check-valid check-cert check-cert-valid">인증 완료!</span>
							<span class = "span-check span-check-valid check-cert check-cert-invalid">인증번호를 다시 확인해주세요.</span>
						</div>
					</div>
				</div>
				<div class = "row mt-3">
					<button type = "submit" class = "btn-submit-join">가입</button>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">

	$(function(){
		
		// 기본적으로 가입 버튼은 비활성화
		$(".btn-submit-join").attr("disabled", true);
		
		// 기본적으로 Helper Text는 숨김 처리
		$(".span-check").hide();
		
		// ID 검사
		$("#userId").blur(function(){
			// 초기화
			$(".check-id").hide();
			// 검사할 ID 입력창의 값
			var inputId = $(this).val();
			// 아무 값도 입력되지 않았을 때
			if(inputId == "") {
				$(".check-id-empty").show();
				return;
			}
			// 정규표현식 : 영문 소문자, 숫자를 포함한 8~20자리
			var regexp = /^[a-z0-9]{8,20}$/;
			// 정규표현식 만족 여부에 따라 다른 처리
			if(!regexp.test(inputId)) { // 정규표현식을 만족하지 않을 경우
				$(".check-id-invalid").show();
				return;
			}
			// 비동기 ID 조회
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_user/check_id?userId=" + inputId,
				method : "get",
				success : function(resp){
					// checkId의 값의 변화가 console에 바로 반영되지 않는 이유가 뭐지?
					if(resp) {
						formValidCheck.checkId = true;
						$(".check-id-valid").show();
					} else {
						formValidCheck.checkId = false;
						$(".check-id-already").show();
					}
				}
			});	
		});
		
		// PW 검사
		$("#userPw").blur(function(){
			// 초기화
			$(".check-pw").hide();
			// 검사할 PW 입력창의 값
			var inputPw = $(this).val();
			// 아무 값도 입력하지 않았을 때
			if(inputPw == "") {
				formValidCheck.checkPw = false;
				$(".check-pw-empty").show();
				return;
			} 
			// 정규표현식 : 영문 대문자, 소문자, 숫자, 특수문자(!@#$)를 반드시 포함하는 8~16자리
			var regexp = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$]{8,16}$/;
			// 정규표현식 여부에 따라 서로 다른 처리
			if(regexp.test(inputPw)) { // 정규표현식을 만족한다면
				formValidCheck.checkPw = true;
				$(".check-pw-valid").show();
			} else { // 정규표현식을 만족하지 않을 경우
				formValidCheck.checkPw = false;
				$(".check-pw-invalid").show();
			}
		});
		
		// PWCK 검사
		$("#userPwck").blur(function(){
			// 초기화
			$(".check-pwck").hide();
			// PW 입력창의 값
			var inputPw = $("#userPw").val();
			// PW 입력창이 올바르지 않을 경우
			if(!formValidCheck.checkPw) {
				formValidCheck.checkPwck = false;
				$(".check-pwck").hide();
				return;
			}
			// PWCK 입력창의 값
			var inputPwck = $(this).val();
			// 아무 값도 입력하지 않았을 때
			if(inputPwck == "") {
				formValidCheck.checkPwck = false;
				$(".check-pwck-empty").show();
				return;
			} 
			// 정규표현식 : 영문 대문자, 소문자, 숫자, 특수문자(!@#$)를 반드시 포함하는 8~16자리
			var regexp = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$]{8,16}$/;
			if(!regexp.test(inputPwck)) {
				formValidCheck.checkPwck = false;
				$(".check-pwck-invalid").show();
				return
			} 
			// PW 입력창의 값과 PWCK 입력창의 값이 다르면
			if(inputPwck != inputPw) {
				formValidCheck.checkPwck = false;
				$(".check-pwck-different").show();
				return;
			} else {
				formValidCheck.checkPwck = true;
				$(".check-pwck-valid").show();
			}
		});
		
		// 닉네임 입력
		$("#userNick").blur(function(){
			if($(this).val() == "") {
				$(".check-nick-valid").hide();
			} else {
				$(".check-nick-valid").show();	
			}
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
				formValidCheck.checkGender = true;
				target.addClass("gender-selected");
			} else {
				formValidCheck.checkGender = false;
				target.removeClass("gender-selected");
			}
		});
		
		var certSerial;
		
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
				success : function(resp){
					// 이메일 발송이 완료되면 인증 버튼 다시 활성화
					btn.attr("disabled", false);
					// 인증메일 발송 메시지
					$(".check-cert-send").show();
					// 반환한 인증번호
					certSerial = resp;
				}
			}); 
		});
		
		// 인증번호 입력창 blur 시
		$("#userCert").blur(function(){
			// 초기화
			$(".check-cert").hide();
			if($("#userCert").val() == certSerial) {
				formValidCheck.checkEmail = true;
				$(".check-cert-valid").show();
			} else {
				formValidCheck.checkEmail = false;
				$(".check-cert-invalid").show();
			}
		});
		
		// 가입 버튼 활성화/비활성화
		$("input").blur(function(){
			
			console.log("checkId = " + formValidCheck.checkId);
			console.log("checkPw = " + formValidCheck.checkPw);
			console.log("checkPwck = " + formValidCheck.checkPwck);
			console.log("checkGender = " + formValidCheck.checkGender);
			console.log("checkEmail = " + formValidCheck.checkEmail);
			console.log("isAllValid() = " + formValidCheck.isAllValid());
			
			formValid();
		})
		
		// form 전송
		$(".btn-submit-join").click(function(){
			var form = $("<form>").attr("action", "join").attr("method", "post");
			form
			.append($("<input>").attr("name", "userId").attr("value", $("#userId").val()))
			.append($("<input>").attr("name", "userPw").attr("value", $("#userPw").val()))
			.append($("<input>").attr("name", "userNick").attr("value", $("#userNick").val()))
			.append($("<input>").attr("name", "userTel").attr("value", $("#userTel").val()))
			.append($("<input>").attr("name", "userGender").attr("value", $(".input-check-gender:checked").val()))
			.append($("<input>").attr("name", "userEmail").attr("value", $("#userEmail").val()));
			
			$("body").append(form);
			form.submit();
		})
		
		// 회원가입 유효성 판정
		var formValidCheck = {
			// 회원가입 단계별 판정
			checkId : false,
			checkPw : false,
			checkPwck : false,
			checkGender : false,
			checkEmail : false,
			// 판정 결과 반환
			isAllValid : function() {
				return this.checkId && this.checkPw && this.checkPwck && this.checkGender && this.checkEmail;
			}
		};
		
		function formValid() {
			if(formValidCheck.isAllValid()) {
				$(".btn-submit-join").attr("disabled", false);
			} else {
				$(".btn-submit-join").attr("disabled", true);
			}
		}
	});
</script>