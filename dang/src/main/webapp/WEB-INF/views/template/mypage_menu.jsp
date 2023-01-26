<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

	.div-icon-mypage {
		aspect-ratio : 1/1;	
		border-radius : 50%;
		cursor : pointer;
	}
	
	.i-mypage {
		font-size : 2.5vw;
	}
	
</style>

<div class= "container-fluid my-3">
	<div class = "row">
		<div class = "offset-2 col-8">
			<div class = "row">
				<div class = "col-2">
					<div class = "row">
						<div class = "col-10 offset-1">			
							<div class = "offset-2 col-8 d-flex justify-content-center align-items-center div-icon-mypage" onClick = "location.href='#'">
								<img class = "w-100 img-change-interest-area" src = "${pageContext.request.contextPath}/images/mypage-interest_area_gray.png">
							</div>
							<div class = "w-100 d-flex justify-content-center align-items-center">						
								<span>관심지역 설정</span>
							</div>
						</div>
					</div>
				</div>
				<div class = "col-2">
					<div class = "row">
						<div class = "col-10 offset-1">			
							<div class = "offset-2 col-8 d-flex justify-content-center align-items-center div-icon-mypage" onClick = "location.href='${pageContext.request.contextPath}/user/edit_pwck'">
								<img class = "w-100 img-change-user-info" src = "${pageContext.request.contextPath}/images/mypage-myinfo_edit_gray.png">
							</div>
							<div class = "w-100 d-flex justify-content-center align-items-center">						
								<span>회원정보 변경</span>
							</div>
						</div>
					</div>
				</div>
				<div class = "col-2">
					<div class = "row">
						<div class = "col-10 offset-1">			
							<div class = "offset-2 col-8 d-flex justify-content-center align-items-center div-icon-mypage"  onClick = "location.href='${pageContext.request.contextPath}/user/change_pw'">
								<img class = "w-100 img-change-user-pw" src = "${pageContext.request.contextPath}/images/mypage-pw_change_gray.png">
							</div>
							<div class = "w-100 d-flex justify-content-center align-items-center">						
								<span>비밀번호 변경</span>
							</div>
						</div>
					</div>
				</div>
				<div class = "col-2">
					<div class = "row">
						<div class = "col-10 offset-1">			
							<div class = "offset-2 col-8 d-flex justify-content-center align-items-center div-icon-mypage"  onClick = "location.href='${pageContext.request.contextPath}/user/edit_puppy_info'">
								<img class = "w-100 img-change-puppy-info" src = "${pageContext.request.contextPath}/images/mypage-mydang_edit_gray.png">
							</div>
							<div class = "w-100 d-flex justify-content-center align-items-center">						
								<span>댕댕이 정보 변경</span>
							</div>
						</div>
					</div>
				</div>
				<div class = "col-2">
					<div class = "row">
						<div class = "col-10 offset-1">			
							<div class = "offset-2 col-8 d-flex justify-content-center align-items-center div-icon-mypage div-mypage-edit-interest-area"  onClick = "location.href='#'">
								<img class = "w-100 img-select-user-dang" src = "${pageContext.request.contextPath}/images/mypage-join_dang_gray.png">
							</div>
							<div class = "w-100 d-flex justify-content-center align-items-center">						
								<span>가입한 댕모임</span>
							</div>
						</div>
					</div>
				</div>
				<div class = "col-2">
					<div class = "row">
						<div class = "col-10 offset-1">			
							<div class = "offset-2 col-8 d-flex justify-content-center align-items-center div-icon-mypage"  onClick = "location.href='#'">
								<img class = "w-100" class = "img-select-user-schedule" src = "${pageContext.request.contextPath}/images/mypage-join-meeting-gray.png">
							</div>
							<div class = "w-100 d-flex justify-content-center align-items-center">						
								<span>참여일정 조회</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

	$(function(){
		// Query String	
		// - 현재 주소
		var urlHref = window.location.href;
		var url = new URL(urlHref);
		// - Query String
		var queryString = url.searchParams.toString();
	});
	
</script>