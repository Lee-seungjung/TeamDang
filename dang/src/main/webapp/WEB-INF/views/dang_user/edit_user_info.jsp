<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
		border : 2px black solid;
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
		color : red;
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
				<form action = "edit_info" method = "post" enctype="multipart/form-data" class = "col form-edit-info"> <%-- form 시작 --%>
					<div class = "row my-4">
						<div class = "col-4 offset-4">
							<label class = "label-user-profile" for = "userProfile">
								<img src = "${pageContext.request.contextPath}/rest_attachment/download/${userInfo.attachmentNo}" class = "img-fluid img-edit-profile">
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
						<div class = "col-4 d-flex justify-content-center align-items-center div-info-category">
							<span class = "span-info-category">아이디</span>
						</div>
						<input value = "${userInfo.userId}" disabled class = "col-8 p-2">
						<input type = "hidden" name = "userNo" value = "${userInfo.userNo}">
					</div>
					<div class = "row my-4 mx-4 div-input-edit-user-info">
						<div class = "col-4 d-flex justify-content-center align-items-center div-info-category">
							<span>닉네임</span>
						</div>
						<input name = "userNick" class = "col-8 p-2" value = "${userInfo.userNick}">
					</div>
					<div class = "row my-4 mx-4 div-input-edit-user-info">
						<div class = "col-4 d-flex justify-content-center align-items-center div-info-category">
							<span>이메일</span>
						</div>
						<input name = "userEmail" class = "col-8 p-2" value = "${userInfo.userEmail}">
					</div>
					<div class = "row my-4 mx-4 div-input-edit-user-info">
						<div class = "col-4 d-flex justify-content-center align-items-center div-info-category">
							<span>전화번호</span>
						</div>
						<input name = "userTel" class = "col-8 p-2" value = "${userInfo.userTel}">
					</div>
					<div class = "row my-4 mx-4 div-input-edit-user-info">
						<div class = "col-4 d-flex justify-content-center align-items-center div-info-category">
							<span>가입일</span>
						</div>
						<input value = "${userInfo.userJoindate}" class = "col-8 p-2" disabled>
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
		
		// 수정 전 프로필 다운로드 링크
		var originalProfile = $(".img-user-profile").attr("src");
		
		// 수정한 회원 프로필 미리보기
		$(".input-user-profile").change(function(){
			if(this.files.length > 0) {
				var formData = new FormData();
				formData.append("attachment", this.files[0]);
				$.ajax({
					url : "${pageContext.request.contextPath}/rest_attachment/upload",
					method : "post",
					data : formData,
					processData:false,
                    contentType:false,
                    success : function(resp) {
                    	console.log(resp);
                    	$(".img-edit-profile").prop("src", resp);
                    }
				});
			}
		});
	});
	
</script>