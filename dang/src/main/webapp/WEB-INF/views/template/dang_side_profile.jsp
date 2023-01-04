<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%-- 댕모임 사이드바 프로필 --%>
<div class = "col">
	<div class="p-3 profile-box border rounded-3 mb-3 shadow">
		
		<div class="profile-wrap text-center">
			<div class="row justify-content-center mb-3" >
				<div class="col-7">
					<img src="/images/bone.png" class="img-fluid">
				</div>
			</div>
			<div class="row d-flex justify-content-center">
				<div class="col-3 pe-1">
					<img src="/images/bone.png" class="img-fluid">
				</div>
				<div class="col-7 ps-1" style="display:flex; align-items:center">
					<span class="font-gray" style="font-size:20px; font-weight:bolder;">초코는 귀여워</span>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-10 ps-1">
					<span>초코가 세상에서 제일 귀엽지롱</span>
				</div>
			</div>
			
			<div class="row mt-3">
				<div class="col-10 offset-1">
					<div class="text-start mb-1" style="font-size:15px; color:#6C7AEF; font-weight:bolder;">
						<span>?</span>점
					</div>
					<div class="progress">	
						<div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<div class="text-start mt-1 font-gray" style="font-size:13px;">
						<span>LV.1</span>
					</div>
					
					<div class="profile-edit">
						<i class="fa-solid fa-pencil" style="font-size:23px;"></i>
						<p>프로필 편집</p>
					</div>
				</div>
			</div>
			
			<div class="row mt-2 mb-1">
				<div class="col">
					<hr>
					
					<div class="row justify-content-center">
						<div class="col-4">
							<i class="fa-regular fa-heart fa-2x"></i>
							<p class="font-gray" style="font-size:15px;">참여모임</p>
							<p class="font-gray" style="font-size:20px; font-weight:bolder;">2</p>
						</div>
						<div class="col-4">
							<i class="fa-regular fa-pen-to-square fa-2x"></i>
							<p class="font-gray" style="font-size:15px;">작성글</p>
							<p class="font-gray" style="font-size:20px; font-weight:bolder;">4</p>
						</div>
						<div class="col-4">
							<i class="fa-regular fa-comment-dots fa-2x"></i>
							<p class="font-gray" style="font-size:15px;">댓글</p>
							<p class="font-gray" style="font-size:20px; font-weight:bolder;">28</p>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<!-- 출석 체크 -->
	<div class="p-3 border rounded-3 text-center">
		<span>출석 체크</span>
	</div>
	
</div>
