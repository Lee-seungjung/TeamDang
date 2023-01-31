<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
   <jsp:param value="댕모임 조회" name="title"/>
</jsp:include>

<style>

	* {
		border : 1px gray dotted;
	}
	
	.strong-page-title {
		font-size : 30px;
	}
	
	.img-dang-logo {
		width : 2.5rem;
		aspect-ratio : 1/1;
	}
	
	.strong-text-dang-detail {
		font-size : 24px;
	}
	
	.div-dang-detail-container {
		border-radius : 10px;
		border : 1px solid #D9D9D9;
	}
	
	.img-dang-detail-profile {
		aspect-ratio : 1/1;
		border-radius : 10px;
	}
	
</style>

<div class = "container-fluid mt-5">
	<div class = "row">
		<div class = "col-10 offset-1">
			<div class = "row text-center">
				<strong class = "strong-page-title">댕모임 조회</strong>
			</div>
			<div class = "row mt-4">
				<div class = "col-7 py-3 px-4">
					<div class = "row div-dang-detail-container p-3">
						<div class = "col">						
							<div class = "row">
								<div class = "col d-flex justify-content-start align-items-center">
									<img class = "img-dang-logo me-2" src = "${pageContext.request.contextPath}/images/logo2.png">
									<strong class = "strong-text-dang-detail">댕모임 상세 정보</strong>
								</div>
							</div>
							<div class = "row mt-3">
								<div class = "col-9">
									<div class = "row mt-2">
										<div class = "col-4">
										댕모임명
										</div>
										<div class = "col-8">
										gd
										</div>
									</div>
									<div class = "row mt-2">
										<div class = "col-4">
										개설일
										</div>
										<div class = "col-8">
										gd
										</div>
									</div>
									<div class = "row mt-2">
										<div class = "col-4">
										인원수
										</div>
										<div class = "col-8">
										gd
										</div>
									</div>
									<div class = "row my-2">
										<div class = "col-4">
										좋아요
										</div>
										<div class = "col-8">
										gd
										</div>
									</div>
								</div>
								<div class = "col-3 p-3 d-flex justify-content-center align-items-center">
									<img src = "/images/img-dang-profile.png" class = "w-100 img-dang-detail-profile">
								</div>
							</div>
							<div class = "row mt-2">
								<div class = "col-5">
								댕모임정보
								</div>
								<div class = "col-7">
								gd
								</div>
							</div>
							<div class = "row mt-2">
								<div class = "col-5">
								해시태그
								</div>
								<div class = "col-7">
								gd
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class = "col-5 py-3 px-4">
					<div class = "row div-dang-detail-container">
						<div class = "col">
						dd
						</div>
					</div>
				</div>
			</div>
			<div class = "row mt-4">
				dd
			</div>
		</div>
	</div>
</div>