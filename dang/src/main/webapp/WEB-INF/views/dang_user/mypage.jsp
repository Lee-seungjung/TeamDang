<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/mypage_menu.jsp"></jsp:include>

<style>

	* {
		border : 1px gray dotted;
	}
	
	.img-mypage-profile {
		border-radius : 50%;
		border : 2px solid black;
		aspect-ratio : 1/1;
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
							<div class = "row">
								<div class = "col-4 d-flex justify-content-center align-items-center">
									<img class = "img-fluid img-mypage-profile" src = "${pageContext.request.contextPath}/rest_attachment/download/${userInfo.attachmentNo}">
								</div>
								<div class = "col-8 align-self-center">
									<div class = "row my-2">
										<div class = "col-3 offset-2">
											<span class = "span-info-category">ID.</span>
										</div>
										<div class = "col-6">
											<span class = "span-info">${userInfo.userId}</span>
										</div>
									</div>
									<div class = "row my-2">
										<div class = "col-3 offset-2">
											<span class = "span-info-category">Nick.</span>
										</div>
										<div class = "col-6">
											<span class = "span-info">${userInfo.userNick}</span>
										</div>
									</div>
									<div class = "row my-2">
										<div class = "col-3 offset-2">
											<span class = "span-info-category">E-Mail.</span>
										</div>
										<div class = "col-6">
											<span class = "span-info">${userInfo.userEmail}</span>
										</div>
									</div>
									<div class = "row my-2">
										<div class = "col-3 offset-2">
											<span class = "span-info-category">TEL.</span>
										</div>
										<div class = "col-6">
											<span class = "span-info">${userInfo.userTel}</span>
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
										<div class = "col-3 offset-2">
											<span class = "span-info-category">Login.</span>
										</div>
										<div class = "col-6">
											<span class = "span-info">${userInfo.userLogindate}</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>