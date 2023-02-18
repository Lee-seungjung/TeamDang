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
	
	.label-user-profile {
		border : 2px solid #76BEFF;
		border-radius : 50%;
		aspect-ratio : 1/1;
	}
	
	.input-user-profile {
		display : none;
	}
	
	.img-edit-profile {
		border-radius : 50%;
		object-fit : fill;
		aspect-ratio : 1/1;
	}
	
	.btn-edit-user-info-cert-send,
	.btn-edit-user-info-cert-submit {
		border-radius : 10px;
		background-color : #787878;
		color : white;
		border : none;
	}
	
	.btn-edit-user-info-cert-send:disabled,
	.btn-edit-user-info-cert-submit:disabled {
		opacity : 0.5;
	}
	
	.btn-edit-user-info-submit {
		border : 1px solid #76BEFF;
		border-radius : 5px;
		background-color : #76BEFF;
		color : white;
	}
	
	input {
		border : none;
		border-radius : 5px;
	}
	
	input:focus {
		outline : 2px solid #76BEFF;
	}
	
	input:disabled {
		border : none;
		color : #C8C8C9;
	}
	
	.div-info-category {
		background-color : #76BEFF;
		color : white;
		border-radius : 5px;
	}
	
	.div-input-edit-user-info {
		border-radius : 5px;
		border : 1px solid #76BEFF;
	}
	
	.span-close-user {
		color : #C7C7C7;
		cursor : pointer;
	}
	
</style>

<div class = "container-fluid my-2">	
	<div class = "row">
		<div class = "col-4 offset-4 px-5">
			<div class = "row my-4">
                <div class = "col d-flex justify-content-center align-items-center">
                    <strong class = "strong-mypage-title">회원정보 변경</strong>
                </div>
            </div>
			<div class = "row my-4">
				<form action = "edit_user_info" method = "post" enctype="multipart/form-data" class = "col form-edit-info"> <%-- form 시작 --%>
					<div class = "row my-4">
						<div class = "col-4 offset-4">
							<label class = "label-user-profile w-100" for = "userProfile">
								<c:choose>
								<c:when test = "${userInfo.attachmentNo != null}">
									<img src = "${pageContext.request.contextPath}/rest_attachment/download/${userInfo.attachmentNo}" class = "w-100 img-edit-profile">
								</c:when>
								<c:otherwise>
									<img src = "${pageContext.request.contextPath}/images/basic-profile.png" class = "w-100 img-edit-profile">
								</c:otherwise>
								</c:choose>
								<input name = "userProfile" type = "file" id = "userProfile" class = "input-user-profile" accept = ".png, .jpg">
							</label>
						</div>
					</div>
					<div class = "row mx-4">
						<div class = "d-flex justify-content-end align-items-center">						
							<span class = "span-close-user" onclick="location.href = '${pageContext.request.contextPath}/user/close_pwck'">회원탈퇴</span>
						</div>
					</div>
					<div class = "row my-4 mx-4 div-input-edit-user-info">
						<div class = "col-3 d-flex justify-content-center align-items-center div-info-category">
							<span class = "span-info-category">아이디</span>
						</div>
						<input value = "${userInfo.userId}" disabled class = "col-9 p-2">
						<input type = "hidden" name = "userNo" value = "${userInfo.userNo}">
					</div>
					<div class = "row my-4 mx-4 div-input-edit-user-info">
						<div class = "col-3 d-flex justify-content-center align-items-center div-info-category">
							<span>닉네임</span>
						</div>
						<input name = "userNick" class = "col-9 p-2" value = "${userInfo.userNick}" maxlength = "6">
					</div>
					<div class = "row my-4 mx-4 div-input-edit-user-info">
						<div class = "col-3 d-flex justify-content-center align-items-center div-info-category">
							<span>전화번호</span>
						</div>
						<input name = "userTel" class = "col-9 p-2" value = "${userInfo.userTel}" maxlength = "13">
					</div>
					<div class = "row my-4 mx-4 div-input-edit-user-info">
						<div class = "col-3 d-flex justify-content-center align-items-center div-info-category">
							<span>이메일</span>
							<input type = "checkbox" class = "ms-2 input-edit-user-info-change-email">
						</div>
						<input name = "userEmail" class = "col-7 p-2 input-change-email" value = "${userInfo.userEmail}">
						<button type = "button" class = "col-2 p-2 btn-change-email btn-edit-user-info-cert-send">인증</button>
					</div>
					<div class = "row my-4 mx-4 div-input-edit-user-info">
						<div class = "col-3 d-flex justify-content-center align-items-center div-info-category">
							<span>이메일 인증</span>
						</div>
						<input class = "col-7 p-2 input-change-email input-edit-user-info-cert" maxlength = "6">
						<button type = "button" class = "col-2 p-2 btn-change-email btn-edit-user-info-cert-submit">확인</button>
					</div>
					<div class = "row my-4 mx-4">
						<div class = "col d-flex flex-column justify-content-center align-items-center div-change-email-helper-text">
							<!-- <span class = "span-check span-check-invalid check-cert check-cert-email-empty">이메일을 입력해 주세요.</span>
							<span class = "span-check span-check-invalid check-cert check-cert-email-invalid">올바른 이메일 형식이 아닙니다.</span>
							<span class = "span-check span-check-invalid check-cert check-cert-email-same">기존 이메일과 동일한 이메일입니다.</span>
							<span class = "span-check span-check-invalid check-cert check-cert-already">이미 사용 중인 이메일입니다.</span> -->
							<!-- <span class = "span-check span-check-valid check-cert check-cert-send">인증번호를 발송했습니다.<br>인증번호가 오지 않으면 입력한 정보가 정확한지 확인하여 주세요.</span> -->
						<!-- 	<span class = "span-check span-check-valid check-cert check-cert-valid">인증 완료!</span>
							<span class = "span-check span-check-invalid check-cert check-cert-invalid">인증번호를 다시 확인해주세요.</span> -->
						</div>
					</div>
					<div class = "row my-4 mx-4">
						<div class = "col-6 offset-3">
							<button type = "submit" class = "btn-edit-user-info-submit w-100 p-2">변경</button>
						</div>
					</div>
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
		
		// 초기 이메일 변경 관련 비활성화
		$(".input-change-email").prop("disabled", true);
		$(".btn-change-email").prop("disabled", true);
		
		// 수정 전 프로필 다운로드 링크
		var originalProfile = $(".img-edit-profile").attr("src");
		
		// 미리보기용 첨부파일 번호 리스트
		var attachmentPreviewNoList = [];
		
		// 업로드하려는 회원 프로필 사진 미리보기
		$(".input-user-profile").change(function(){
			if(this.files.length > 0) { // 첨부파일을 선택했다면
				var formData = new FormData();
				formData.append("attachment", this.files[0]);
				$.ajax({
					url : "${pageContext.request.contextPath}/rest_attachment/upload_preview",
					method : "post",
					data : formData,
					processData:false,
                    contentType:false,
                    success : function(resp) {
                    	// 프로필 이미지 태그의 src를 반환한 주소로 변경
                    	$(".img-edit-profile").prop("src", resp.url);
                    	// 해당 이미지의 첨부파일 번호를 미리보기 첨부파일 리스트에 저장
                    	attachmentPreviewNoList.push(resp.attachmentNo);
                    }
				});
			} else { // 첨부파일을 선택하지 않았다면
				// 원래 프로필 이미지로 변경
				$(".img-edit-profile").prop("src", originalProfile);
			}
		});
		
		// 미리보기용 첨부파일 삭제
		$(window).bind("beforeunload", function(){
			// 미리보기용 첨부파일 리스트의 길이가 0이면(지울 첨부파일이 없다면)
			if(attachmentPreviewNoList.length == 0) {
				return;
			}
			// 그렇지 않다면 첨부파일 삭제 실행
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_attachment/delete_preview",
				method : "delete",
				data : {
					attachmentPreviewNoList : attachmentPreviewNoList
				}
			})
		});
		
		// 닉네임 체크
		$("[name=userNick]").blur(function(){
			if($(this).val().length == 0) {
				formValidCheck.checkNick = false;
				return;
			}
			formValidCheck.checkNick = true;
		});
		
		// 변경 전 이메일
		var userEmailOrigin = $("[name=userEmail]").val();
		
		// 이메일 변경 체크
		$(".input-edit-user-info-change-email").change(function(){
			if($(".input-edit-user-info-change-email").is(":checked") == true) { // 체크되어있다면
				$(".input-change-email").prop("disabled", false);
				$(".btn-change-email").prop("disabled", false);
				formValidCheck.checkEmail = false;
			} else { // 그렇지 않다면 (이메일을 변경하지 않음)
				$("[name=userEmail]").val(userEmailOrigin);
				$(".input-edit-user-info-cert").val("");
				$(".div-change-email-helper-text").empty();
				$(".input-change-email").prop("disabled", true);
				$(".btn-change-email").prop("disabled", true);
				formValidCheck.checkEmail = true;
			}
		});
		
		// 이메일 보내기 체크
		$(".btn-edit-user-info-cert-send").click(function(){
			// helper text 초기화
			$(".div-change-email-helper-text").empty();
			// 이메일 입력창의 값
			var inputEmail = $("[name=userEmail]").val();
			console.log(inputEmail)
			// 이메일을 입력하지 않았다면 return
			if(inputEmail == "") {
				$(".div-change-email-helper-text")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-cert check-cert-email-empty").text("이메일을 입력해 주세요.")
					)
				formValidCheck.checkEmail = false;
				return;
			}
			// 이메일 형식 검사
			var regexp = /^[A-Za-z0-9]{6,30}@[0-9a-z]{4,252}.[a-z]{2,3}$/
			if(regexp.test(inputEmail) == false) {
				$(".div-change-email-helper-text")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-cert check-cert-email-invalid").text("올바른 이메일 형식이 아닙니다.")
					)
				formValidCheck.checkEmail = false;
				return;
			}
			// 해당 회원의 기존 이메일과의 검사
			if(userEmailOrigin == inputEmail) {
				$(".div-change-email-helper-text")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-cert check-cert-email-same").text("기존 이메일과 동일한 이메일입니다.")
					)
				formValidCheck.checkEmail = false;
				return;
			}
			// 비동기 중복 검사가 완료될 때까지 인증메일 전송 버튼 비활성화
			$(".btn-edit-user-info-cert-send").prop("disabled", true);
			// 이메일 중복 검사
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_user/check_email?userEmail=" + inputEmail,
				method : "get",
				success : function(resp){
					console.log(resp);
					if(resp == true) { // 이미 사용 중인 이메일이면 resp는 true이므로
						// 
						$(".div-change-email-helper-text")
							.append(
								$("<span>").attr("class", "span-check span-check-invalid check-cert check-cert-already").text("이미 사용 중인 이메일입니다.")
							)
						formValidCheck.checkEmail = false;
						// 인증메일 전송 버튼 비활성화 해제
						$(".btn-edit-user-info-cert-send").prop("disabled", false);
						return;
					} else {
						// 해당 이메일로 인증번호 발송
						$.ajax({
							url : "${pageContext.request.contextPath}/rest_user/send_email?userEmail=" + inputEmail,
							method : "get",
							success : function(resp){
								// 
								$(".div-change-email-helper-text")
									.append(
										$("<span>").attr("class", "span-check span-check-valid check-cert check-cert-send").html("인증번호를 발송했습니다.<br>인증번호가 오지 않으면 입력한 정보가 정확한지 확인하여 주세요.")
									)
								// 인증메일 전송 버튼 비활성화 해제
								$(".btn-edit-user-info-cert-send").prop("disabled", false);
								// 반환한 인증번호
								certSerial = resp;
							}
						}); 
					}
				}
			}); 
		});
		
		// 반환된 인증 번호
		var certSerial;
		
		$(".btn-edit-user-info-cert-submit").click(function(){
			// helper text 초기화
			$(".div-change-email-helper-text").empty();
			// 인증번호 입력창의 값
			var inputCertSerial = $(".input-edit-user-info-cert").val();
			if(certSerial != inputCertSerial) {
				$(".div-change-email-helper-text")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-cert check-cert-invalid").text("인증번호를 다시 확인해주세요.")
					)
				formValidCheck.checkEmail = false;
				return;
			}
			alert("이메일 인증 완료!");
			formValidCheck.checkEmail = true;
		});
		
		// 정보 수정 버튼
		$(".btn-edit-user-info-submit").click(function(e){
			// 기본 이벤트(폼 전송) 차단
			e.preventDefault();
			console.log(formValidCheck.isAllValid())
			// 회원정보 변경 유효성 판정
			if(formValidCheck.isAllValid() == false) {
				return;
			}
			if($(".input-edit-user-info-change-email").is(":checked") == false) {
				$(".form-edit-info")
				.append(
					$("<input>").attr("type", "hidden").attr("name", "userEmail").attr("value", userEmailOrigin)
				)
			}
			// 유효성 검사를 통과했을 때 폼 전송
			$(".form-edit-info").submit();
		});
		
		// 회원정보 변경 유효성 판정
		var formValidCheck = {
			// 회원가입 단계별 판정
			checkNick : true,
			checkEmail : true,
			// 판정 결과 반환
			isAllValid : function() {
				return this.checkNick && this.checkEmail;
			}
		};
	});
	
</script>