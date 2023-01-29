<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 찾기" name="title"/>
</jsp:include>

<style>
	* {
		border : 1px gray dotted;
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
	
	.btn-change-complete {
		border-radius : 10px;
		background-color : #76BEFF;
		color : white;
		border : none;
	}
	
	.btn-change-complete:disabled {
		opacity : 0.5;
	}
	
	.div-find-pw-input {
		height : 15rem;
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
									<input class = "input-user-pw w-100 p-2" type = "password" placeholder = "새 비밀번호" maxlength = "16">
								</div>
							</div>
							<div class = "row pt-4 px-4">
								<div class = "col">								
									<input class = "input-user-pwck w-100 p-2" type = "password" placeholder = "비밀번호 확인" maxlength = "16">
								</div>
							</div>
							<div class = "row py-4 px-4">
								<div class = "col d-flex justify-content-center align-items-center">								
									<button class = "btn-change-complete w-100 p-2">확인</button>
								</div>
							</div>
						</div>
					</div>
					<c:if test = "${param.fail_step1 != null}">
					<div class = "row py-4">
						<span class = "span-check span-check-invalid check-pw-different">비밀번호가 일치하지 않습니다.</span>
					</div>
					</c:if>
					<c:if test = "${param.fail_step2 != null}">
					<div class = "row py-4">
						<span class = "span-check span-check-invalid check-pw-invalid">비밀번호는 영문 대/소문자, 숫자, 특수문자(!@#$)를 반드시 포함한 8~16자가 되어야 합니다.</span>
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
<%-- 
<div class = "container-fluid my-3">	
	<div class = "row">
		<div class = "col-8 offset-2 my-3 py-5">
			<div class = "row">
				<div class = "col-6 offset-3">
					<div class = "row">
						<div class = "col p-2 d-flex justify-content-center align-items-center">
							<a href = "${pageContext.request.contextPath}/user/find_id"><span>아이디 찾기</span></a>
						</div>
						<div class = "col p-2 d-flex justify-content-center align-items-center">
							<a href = "${pageContext.request.contextPath}/user/find_pw"><span>비밀번호 찾기</span></a>
						</div>
					</div>
					<div class = "row my-3">
						<div class = "col-10 offset-1">
							<div class = "row p-2">
								<div class = "col">							
									<input class = "input-user-pw w-100" type = "password" placeholder = "새 비밀번호" maxlength = "16">
								</div>
							</div>
							<div class = "row p-2">
								<div class = "col">								
									<input class = "input-user-pwck w-100" type = "password" placeholder = "비밀번호 확인" maxlength = "16">
								</div>
							</div>
							<div class = "row p-2">
								<button class = "btn-change-complete">확인</button>
							</div>
							<c:if test = "${param.fail_step1 != null}">
							<div class = "row p-2">
								<span class = "span-check span-check-invalid check-pw-different">비밀번호가 일치하지 않습니다.</span>
							</div>
							</c:if>
							<c:if test = "${param.fail_step2 != null}">
							<div class = "row p-2">
								<span class = "span-check span-check-invalid check-pw-invalid">비밀번호는 영문 대/소문자, 숫자, 특수문자(!@#$)를 반드시 포함한 8~16자가 되어야 합니다.</span>
							</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">

	$(function(){
		
		// 초기 확인 버튼 비활성화
		$(".btn-change-complete").prop("disabled", true);
		
		// 새 비밀번호 입력창
		$(".input-user-pw").blur(function(){
			var inputUserPw = $(this).val();
			var inputUserPwck = $(".input-user-pwck").val();
			// 입력되지 않았을 때
			if(inputUserPw == "") {
				check.checkPw = false;
				checkAll();
				return;
			} 
			// 8글자 이상일 때
			if(inputUserPw.length >= 8) {				
				if(inputUserPw.length == inputUserPwck.length) {
					check.checkPw = true;
					check.checkPwck = true;
					checkAll();	
				} else {
					check.checkPw = false;
					check.checkPwck = false;
					checkAll();	
				}
			} else {
				check.checkPw = false;
				checkAll();	
			}
		});
		
		// 비밀번호 확인 입력창
		$(".input-user-pwck").blur(function(){
			var inputUserPw = $(".input-user-pw").val();
			var inputUserPwck = $(this).val();
			// 입력되지 않았을 때
			if(inputUserPwck == "") {
				check.checkPwck = false;
				checkAll();
				return;
			} 
			// 8글자 이상일 때
			if(inputUserPwck.length >= 8) {				
				if(inputUserPw.length == inputUserPwck.length) {
					check.checkPw = true;
					check.checkPwck = true;
					checkAll();	
				} else {
					check.checkPw = false;
					check.checkPwck = false;
					checkAll();	
				}
			} else {
				check.checkPwck = false;
				checkAll();	
			}
		});
		
		//현재 주소
		var url_href = window.location.href;
		var url = new URL(url_href);
		
		// 요청 파라미터 변수화
		var userNo = url.searchParams.get("userNo");
		
		// 확인 버튼 클릭시 
		$(".btn-change-complete").click(function(e){
			// 기본 이벤트 차단(form 전송)
			e.preventDefault();
			// 새 비밀번호 입력창
			var inputUserPw = $(".input-user-pw").val();
			// 비밀번호 확인창
			var inputUserPwck = $(".input-user-pwck").val();
			// 두 입력창에 입력된 문자의 길이가 다를 경우
			if(!inputUserPw.length == inputUserPwck.length) {
				
			}
			// form 생성 후 전송
			var form = $("<form>").attr("action", "find_pw_change").attr("method", "post");
			form
				.append($("<input>").attr("type", "hidden").attr("name", "userNo").attr("value", userNo))
				.append($("<input>").attr("type", "hidden").attr("name", "userPw").attr("value", inputUserPw))
				.append($("<input>").attr("type", "hidden").attr("name", "userPwck").attr("value", inputUserPwck));
			$("body").append(form);
			form.submit();
		});
		
		// 유효성 검사
		var check = {
			checkPw : false,
			checkPwck : false,
			isAllValid : function(){
				return this.checkPw && this.checkPwck;
			}
		}
		
		// 유효성 검사 통과시 확인 버튼 비활성화 해제
		function checkAll() {
			console.log(check.checkPw);
			console.log(check.checkPwck);
			if(check.isAllValid()) {
				$(".btn-change-complete").prop("disabled", false);
			} else {
				$(".btn-change-complete").prop("disabled", true);
			}
		}
	});
</script>