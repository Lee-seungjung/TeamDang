<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

	.div-icon-mypage {
		aspect-ratio : 1/1;	
		border-radius : 50%;
		background-color : #E8E8E8;
		color : white;
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
							<div class = "offset-2 col-8 d-flex justify-content-center align-items-center div-icon-mypage" onClick = "location.href='${pageContext.request.contextPath}/user/mypage'">
								<i class="fa-solid fa-user i-mypage i-mypage-main"></i>
							</div>
							<div class = "w-100 d-flex justify-content-center align-items-center">						
								<span>내 정보</span>
							</div>
						</div>
					</div>
				</div>
				<div class = "col-2">
					<div class = "row">
						<div class = "col-10 offset-1">			
							<div class = "offset-2 col-8 d-flex justify-content-center align-items-center div-icon-mypage div-mypage-edit-user-info" onClick = "location.href='${pageContext.request.contextPath}/user/edit_pwck'">
								<i class="fa-solid fa-user-pen i-mypage"></i>
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
							<div class = "offset-2 col-8 d-flex justify-content-center align-items-center div-icon-mypage div-mypage-edit-user-pw"  onClick = "location.href='${pageContext.request.contextPath}/user/change_pw'">
								<i class="fa-solid fa-user-lock i-mypage"></i>
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
							<div class = "offset-2 col-8 d-flex justify-content-center align-items-center div-icon-mypage div-mypage-edit-puppy-info"  onClick = "location.href='${pageContext.request.contextPath}/puppy/edit_info'">
								<i class="fa-solid fa-dog i-mypage"></i>
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
							<div class = "offset-2 col-8 d-flex justify-content-center align-items-center div-icon-mypage div-mypage-edit-interest-area"  onClick = "location.href='${pageContext.request.contextPath}/user/edit_pwck'">
								<i class="fa-solid fa-map i-mypage"></i>
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
							<div class = "offset-2 col-8 d-flex justify-content-center align-items-center div-icon-mypage div-mypage-select-dang-join"  onClick = "location.href='#'">
								<i class="fa-solid fa-paw i-mypage"></i>
							</div>
							<div class = "w-100 d-flex justify-content-center align-items-center">						
								<span>가입한 댕모임</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
