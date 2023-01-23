<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원정보 변경" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/mypage_menu.jsp"></jsp:include>

<style>
	
	* {
		border : 1px gray dotted;
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
	
	.input-edit-user-info {
		border : 2px black solid;
	}
	
	.div-user-info {
		background-color: #dfe6e9;
		border-radius: 15px;
		font-size : 18px;
	}
</style>

<div class = "container-fluid my-3">	
	<div class = "row">
		<div class = "col-8 offset-2 my-3 py-5">
			<div class = "row">
				<div class = "col d-flex justify-content-center align-items-center">				
					<a href = "mypage">마이페이지</a>
				</div>
			</div>
			<div class = "row">		
				<div class = "col">
					<div class = "row px-3">
						<div class = "col div-user-info p-5">
							<form action = "edit_info" method = "post" enctype="multipart/form-data" class = "form-edit-info"> <%-- form 시작 --%>
							<div class = "row">
								<div class = "col-4 d-flex justify-content-center align-items-center">
									<label class = "label-user-profile" for = "userProfile">
										<img src = "${pageContext.request.contextPath}/rest_attachment/download/${userInfo.attachmentNo}" class = "img-fluid img-edit-profile">
										<input name = "userProfile" type = "file" id = "userProfile" class = "input-user-profile" accept = ".png, .jpg">
									</label>
								</div>
								<div class = "col-8 align-self-center">
									<div class = "row my-2">
										<div class = "col-3 offset-2">
											<span class = "span-info-category">ID.</span>
										</div>
										<div class = "col-6">
											<input value = "${userInfo.userId}" disabled>
											<input type = "hidden" name = "userNo" value = "${userInfo.userNo}">
										</div>
									</div>
									<div class = "row my-2">
										<div class = "col-3 offset-2">
											<span class = "span-info-category">Nick.</span>
										</div>
										<div class = "col-6">
											<input name = "userNick" class = "input-edit-user-info w-100" value = "${userInfo.userNick}">
										</div>
									</div>
									<div class = "row my-2">
										<div class = "col-3 offset-2">
											<span class = "span-info-category">E-Mail.</span>
										</div>
										<div class = "col-6">
											<input name = "userEmail" class = "input-edit-user-info w-100" value = "${userInfo.userEmail}">
										</div>
									</div>
									<div class = "row my-2">
										<div class = "col-3 offset-2">
											<span class = "span-info-category">TEL.</span>
										</div>
										<div class = "col-6">
											<input name = "userTel" class = "input-edit-user-info w-100" value = "${userInfo.userTel}">
										</div>
									</div>
									<div class = "row my-2">
										<div class = "col-3 offset-2">
											<span class = "span-info-category">Since.</span>
										</div>
										<div class = "col-6">
											<span class = "span-info">${userInfo.userJoindate}</span>
										</div>
									</div>
									<div class = "row my-2">
										<div class = "col-3 offset-5 d-flex">
											<button type = "submit" class = "flex-fill">변경</button>
										</div>
									</div>
								</div>
							</div>
							</form> <%-- form 끝 --%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class = "col-2 d-flex justify-content-center align-items-center">
					<a href = "${pageContext.request.contextPath}/user/close_pwck">
						회원탈퇴
					</a>
				</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">

	$(function(){
		
		// 사이드 메뉴의 회원정보 변경 색 변경
		$(".div-mypage-edit-user-info").css("background-color", "#F94888");
		
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
		
		// 수정
		
		
		
	});
	
</script>