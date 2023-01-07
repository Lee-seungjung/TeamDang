<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

	* {
		border : 1px gray dotted;
	}
	
	.img-member-profile {
		border-radius: 50%;
	}
	
	.input-dang-profile, 
	.input-member-profile {
		display : none;
	}	

</style>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="댕모임 개설" name="title"/>
</jsp:include>

<div class = "container-fluid my-3">
	<div class = "row">
		<div class = "col-6 offset-3">
			<div class = "row my-3">
				<form action = "create" method = "post" enctype="multipart/form-data" class = "form-create-dang">
				<div class = "col-6 offset-3">
					<div class = "row my-3">
						<div class = "col-10 offset-1">		
							<label for = "dangProfile">
								<img src = "${pageContext.request.contextPath}/images/img-dang-profile.png" class = "img-fluid">
								<input name = "dangProfile" type = "file" id = "dangProfile" class = "input-dang-profile" accept = ".png, .jpg">
							</label>
						</div>
					</div>
					<div class = "row my-3">
						<div class = "col-8 offset-2 d-flex flex-column">
							<input name = "dangName" type = "text" placeholder = "댕모임명(10글자)">
							<div class = "d-flex justify-content-end align-items-center">
								<span class = "span-dang-name">0</span>
								<span class = "span-dang-name-max"> / 10</span>
							</div>
						</div>
					</div>
					<div class = "row my-3">
						<div class = "col-8 offset-2 d-flex flex-column">
							<textarea name = "dangInfo" style="resize: none;" cols = "2" class = "textarea-dang-info" placeholder = "댕모임 정보"></textarea>
							<div class = "d-flex justify-content-end align-items-center">
								<span class = "span-dang-info">0</span>
								<span class = "span-dang-info-max"> / 30</span>
							</div>
						</div>
					</div>
					<div class = "row my-3">
						<div class = "col-8 offset-2 d-flex flex-column">
							<select name = "dangHeadmax">
								<option value = "">인원수</option>
								<c:forEach var = "i" begin = "5" end = "20" step = "5">
								<option value = "${i}">${i}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class = "row my-3"> <%-- 지역은 차후 수정 --%>
						<div class = "col-8 offset-2 d-flex flex-column">
							<select name = "dangAreaNo">
								<option value = "">활동지역</option>
								<option value = "1">노량진</option>
							</select>
						</div>
					</div>
					<div class = "row my-3"> <%-- form에 태그를 생성해서 전송해야 하는 부분 시작 --%>
						<div class = "col-8 offset-2 d-flex flex-row">
							<div class = "col">
								<input type = "radio" id = "dangPublic" class = "input-dang-private">
								<span>공개</span>
							</div>
							<div class = "col">
								<input type = "radio" id = "dangPrivate" class = "input-dang-private">
								<span>비공개</span>
							</div>
						</div>
					</div>
					<div class = "row my-3 div-dang-password">
						<div class = "col-8 offset-2 d-flex flex-column">
							<input class = "input-dang-password" type = "text" placeholder = "비밀번호(숫자 4자리)">
						</div>
					</div> <%-- form에 태그를 생성해서 전송해야 하는 부분 시작 --%>
					<div class = "row my-3">
						<div class = "col-8 offset-2 d-flex flex-column">
							<input name = "memberNick" type = "text" placeholder = "닉네임">
						</div>
					</div>
					<div class = "row my-3">
						<div class = "d-flex flex-row justify-content-center align-items-center">
							<button type = "button" class = "btn-submit-create">개설</button>
						</div>
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
		
		// 초기 생성 버튼 비활성화
		$(".btn-submit-create").attr("disabled", true);
		
		// 초기 비밀번호 입력창 숨김
		$(".div-dang-password").hide();
		
		// 댕모임명 글자수 제한
		$(document).on("input", "[name=dangName]", function(){
			var inputDangName = document.querySelector("[name=dangName]");
			var textDangName = inputDangName.value;
			
			var spanDangName = document.querySelector(".span-dang-name");
			spanDangName.textContent = textDangName.length;
			
			var size = textDangName.length;
			
			while(size > 10) {
				inputDangName.value = inputDangName.value.substring(0, size - 1);
				size --;
			}
			spanDangName.textContent = size;
		});
		
		// 댕모임명 유효성 검사
		$("[name=dangName]").blur(function(){
			if($(this).val() != "") {
				formValidCheck.checkDangName = true;
				formValid();
			} else {
				formValidCheck.checkDangName = false;
				formValid();
			}
		});
		
		// 댕모임 정보 텍스트 수 제한
		$(document).on("input", ".textarea-dang-info", function(){
			// 댕모임 정보 입력창
			var textareaDangInfo = document.querySelector(".textarea-dang-info");
			var textDangInfo = textareaDangInfo.value;
			
			var spanDangInfo = document.querySelector(".span-dang-info");
			spanDangInfo.textContent = textDangInfo.length;
			
			var size = textDangInfo.length;
			
			while(size > 30) {
				textareaDangInfo.value = textareaDangInfo.value.substring(0, size - 1);
				size --;
			}
			spanDangInfo.textContent = size;
		});
		
		// 댕모임 회원 총원
		$("[name=dangHeadmax]").change(function(){
			if($(this).val() != "") {
				formValidCheck.checkDangHeadmax = true;
				formValid();
			} else {
				formValidCheck.checkDangHeadmax = false;
				formValid();
			}
		});
		
		// 댕모임 활동 지역
		$("[name=dangAreaNo]").change(function(){
			if($(this).val() != "") {
				formValidCheck.checkDangAreaNo = true;
				formValid();
			} else {
				formValidCheck.checkDangAreaNo = false;
				formValid();
			}
		});
		
		// 댕모임 비공개 여부
		$(".input-dang-private").click(function(){
			var countChecked = $(".input-dang-private:checked").length;
			if(countChecked > 1) {
				$(".input-dang-private").prop("checked", false); // 이전 체크를 모두 초기화
				$(this).prop("checked", true); // 새로 체크한 항목에 체크
			}
			
			if($(this).is(":checked")){
				formValidCheck.checkDangPrivate = true;
				formValid();
			} else {
				formValidCheck.checkDangPrivate = false;
				formValid();
			}
		});
		
		// 댕모임 비공개 체크시 이벤트
		$(".input-dang-private").change(function(){
			if($("#dangPrivate").is(":checked")) {
				$(".div-dang-password").show();
				formValidCheck.checkDangPw = false;
				formValid();
			} else {
				$(".div-dang-password").hide();
				formValidCheck.checkDangPw = true;
				formValid();
			}
		});
		
		// 비공개 댕모임 비밀번호 입력 자릿수 제한
		$(document).on("input", ".input-dang-password", function(){
			
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
			
			var inputDangPassword = document.querySelector(".input-dang-password");
			
			var size = inputDangPassword.value.length;
			while(size > 4) {
				inputDangPassword.value = inputDangPassword.value.substring(0, size - 1);
				size --;
			}
		});
		
		// 비공개 댕모임 비밀번호 유효성 검사
		$(".input-dang-password").blur(function(){
			// 댕모임 비밀번호 입력창의 값
			var inputDangPassword = $(this).val();
			if(inputDangPassword == "") {
				formValidCheck.checkDangPw = false;
				formValid();
				return;
			} 
			var regexp = /^[0-9]{4}$/;
			if(regexp.test(inputDangPassword)) {
				formValidCheck.checkDangPw = true;
				formValid();
			} else {
				formValidCheck.checkDangPw = false;
				formValid();
			}
		});
		
		// 댕모임 닉네임
		$("[name=memberNick]").blur(function(){
			if($(this).val() != "") {
				formValidCheck.checkMemberNick = true;
				formValid();
			} else {
				formValidCheck.checkMemberNick = false;
				formValid();
			}
		});
		
		// form 전송
		$(".btn-submit-create").click(function(e){
			// 기본 이벤트 차단(form 전송)
			e.preventDefault()
			// 비공개 댕모임일 경우에만
			if(formValidCheck.checkDangPrivate) {
				$(".form-create-dang")
					.append($("<input>").attr("type", "hidden").attr("name", "dangPrivate").attr("value", "Y"))
					.append($("<input>").attr("type", "hidden").attr("name", "dangPw").attr("value", $(".input-dang-password").val()));
			}
			$(".form-create-dang").submit();
		})
		
		// 댕모임 개설 유효성 판정
		var formValidCheck = {
			checkDangName : false,
			checkDangHeadmax : false,
			checkDangAreaNo : false,
			checkMemberNick : false,
			checkDangPrivate : false,
			checkDangPw : false,
			// 판정 결과 반환
			isAllValid : function() {
				return this.checkDangName && this.checkDangHeadmax && this.checkDangAreaNo && this.checkMemberNick && this.checkDangPrivate && this.checkDangPw;
			}
		};
		
		function formValid() {
			console.log(formValidCheck.checkDangName);
			console.log(formValidCheck.checkDangHeadmax);
			console.log(formValidCheck.checkDangAreaNo);
			console.log(formValidCheck.checkMemberNick);
			console.log(formValidCheck.checkDangPrivate);
			console.log(formValidCheck.checkDangPw);
			// 유효성 판정을 위해 강제 이벤트 발생
			if(formValidCheck.isAllValid()) {
				$(".btn-submit-create").attr("disabled", false);
			} else {
				$(".btn-submit-create").attr("disabled", true);
			}
		}
	});
	
</script>