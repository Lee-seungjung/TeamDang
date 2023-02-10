<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="댕모임 회원" name="title"/>
</jsp:include>

<style>
	.d-member-owner{
		position:absolute;
		width:20px;
		height:20px;
		margin-left:-20px;
	}
	.title-font{
		font-size:20px;
		font-weight:bolder;
	}
	.cover{
		object-fit: cover;
		width:100%;
		height:100%;
	}
	.cover-box{
		height:200px;
		overflow:hidden;
	}
	.btn.out-btn{
		border:1px solid #939aa1;
		font-size:0.7rem;
	}
	.btn.out-btn:hover{
		background-color:#e6e6e6;
		border-color:#e6e6e6;
	}
	.btn.out-btn:focus{
		box-shadow: 0 0 0 0.25rem rgba(220, 224, 227, 0.5);
	}
</style>

<div class = "container-fluid mt-3 mb-5">

	<div class = "col-8 offset-2">
		<div class = "row">
		
			<!-- 프로필 박스 시작-->
			<div class = "col-3">
				<jsp:include page="/WEB-INF/views/template/dang_side_profile.jsp"></jsp:include>
			</div>
			<!-- 프로필 박스 끝-->
			
			<!-- 멤버 메인-->
			<div class = "col-6">
				<div id="d-info">
					<div class="w-100 rounded-3 cover-box">
						<c:choose>
							<c:when test="${dangInfo.attachmentNo==null}">
								<img src="${pageContext.request.contextPath}/images/img-dang-profile-default.png"
									class = "img-cluid cover">
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath}/rest_attachment/download/${dangInfo.attachmentNo}"
									class = "img-cluid cover">
							</c:otherwise>
						</c:choose>
					</div>
					
					<div class="col-10 offset-1 mt-4 middle-items">
						<img src="${pageContext.request.contextPath}/images/logo2.png" width="23" height="23">
						<p class="title-font font-gray ms-1 me-2">${dangInfo.dangName}</p>
						<div class="middle-items">
							<img src="${pageContext.request.contextPath}/images/maps-and-flags.png" width="15" height="15">
							<span class="font-gray" style="font-size:13px; ">${dangInfo.dangArea}</span>
						</div>
					</div>
					<div class="col-10 offset-1">
						<p class="mt-2" style="font-size:15px;">${dangInfo.dangInfo}</p>
					</div>
				</div>
				
				<div id="d-member-list" class="mt-5">
					<div class="col-10 offset-1 middle-items">
						<i class="fa-solid fa-users pink me-1"></i>
						<span class="title-font font-gray">모임에 참여중인 멤버(<span>${memberCnt}</span>명)</span>
					</div>
					
					<div class="col-10 offset-1 mt-3">
						<c:forEach var="vo" items="${memberList}">
							<div class="d-member-wrap middle-items mb-2">
								<div class="d-member-img" style="position:relative;">
									<c:choose>
										<c:when test="${vo.attachmentNo==null}">
											<img src="${pageContext.request.contextPath}/images/basic-profile.png" 
													class="img-circle m-profile-info cursor-pointer" width="60" height="60" data-mno="${vo.memberNo}">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/rest_attachment/download/${vo.attachmentNo}" 
													class="img-circle m-profile-info cursor-pointer" width="60" height="60" data-mno="${vo.memberNo}">
										</c:otherwise>
									</c:choose>
									<c:if test="${vo.memberOwner=='Y'}">
										<img src="${pageContext.request.contextPath}/images/crown.png" class="d-member-owner">
									</c:if>
								</div>
								<div class="d-member-detail ms-3">
									<p style="font-size:16px; font-weight:15px;">${vo.memberNick}</p>
									<p style="font-size:13px;">${vo.memberMessage}</p>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				
				<div class="report-div mt-4">
					<div class="col-10 offset-1 text-center mt-1 mb-5">
						<c:choose>
							<c:when test="${profile.memberOwner=='N'}">
								<button type="button" class="btn out-btn m-out-btn w-25">탈퇴</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn out-btn m-close-btn w-25">해체</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				
			</div>
			
			<!-- 다가오는 일정 박스 시작-->
			<div class="col-3">
				<jsp:include page="/WEB-INF/views/template/dang_side_upcoming.jsp"></jsp:include>
			</div>
			<!-- 다가오는 일정 박스  끝-->
		</div>
	</div>
	
	<!-- 탈퇴 모달 시작 -->
	<div class="modal" id="m-deleteModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="height:20px;">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body middle-items">
					<i class="fa-solid fa-circle-exclamation pink fa-2x me-2"></i>
					<span>정말 탈퇴하시겠습니까?</span>
				</div>
				<div>
					<span style="font-size:13px; margin-left:35px;">
						탈퇴 시 회원 정보가 즉시 <strong class="pink">파기</strong>되며 재가입 시에도 <strong class="pink">복구 불가</strong>합니다.
					</span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary m-delete-btn">탈퇴</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 탈퇴 모달 끝 -->
	
	<!-- 해체 모달 시작 -->
	<div class="modal" id="m-closeModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="height:20px;">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body middle-items">
					<i class="fa-solid fa-circle-exclamation pink fa-2x me-2"></i>
					<span>정말 해체하시겠습니까?</span>
				</div>
				<div>
					<span style="font-size:13px; margin-left:35px;">
						해체 시 댕모임 정보가 즉시 <strong class="pink">파기</strong>되며 <strong class="pink">복구 불가</strong>합니다.
					</span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary modal-close-btn">해체</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 해체 모달 끝 -->
	
</div>

<script>
	$(function(){
		//탈퇴 여부 재확인 모달창 띄우기
		$(".m-out-btn").click(function(){
			$("#m-deleteModal").modal("show");
		});
		
		//확인 버튼 누를 경우 멤버 탈퇴(댕회원 삭제) 처리
		$(".m-delete-btn").click(function(){
			var dangNo = $("[name=dangNo]").val();
			var memberNo = $("[name=memberNo]").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_member/delete_member?dangNo="+dangNo+"&memberNo="+memberNo,
				method:"delete",
				success:function(resp){
					console.log(resp);
					if(resp){
						//홈화면으로 이동 또는 삭제가 완료되었습니다 화면으로 이동
						location.href="${pageContext.request.contextPath}/member/delete_success?dangNo="+dangNo;
					}
				}
			});
		});
		
		//해체 여부 재확인 모달창 띄우기
		$(".m-close-btn").click(function(){
			$("#m-closeModal").modal("show");
		});
		
		//확인 버튼 누를 경우 댕모임 해체(삭제) 처리
		$(".modal-close-btn").click(function(){
			var dangNo = $("[name=dangNo]").val();

			$.ajax({
				url:"${pageContext.request.contextPath}/rest_dang/close_dang?dangNo="+dangNo,
				method:"delete",
				success:function(resp){
					console.log("해체 성공!");
					if(resp){
						//홈화면으로 이동
						location.href="${pageContext.request.contextPath}/";
					}
				}
			});
		});
		
		
		
	});
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>