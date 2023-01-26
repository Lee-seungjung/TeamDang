<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

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
	}
	.btn.report-btn{
		border:1px solid #939aa1;
		font-size:0.7rem;
	}
	.btn.report-btn:hover{
		background-color:#e6e6e6;
		border-color:#e6e6e6;
	}
	.btn.report-btn:focus{
		box-shadow: 0 0 0 0.25rem rgba(220, 224, 227, 0.5);
	}
</style>

<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="댕모임 회원" name="title"/>
</jsp:include>

<div class = "container-fluid mt-3">

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
					<div>
						<c:choose>
							<c:when test="${dangInfo.attachmentNo==null}">
								<img src="${pageContext.request.contextPath}/images/img-dang-profile-default.png"
									style="height:200px;" class = "w-100 rounded-3 cover">
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath}/rest_attachment/download/${dangInfo.attachmentNo}"
									style="height:200px;" class = "w-100 rounded-3 cover">
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
					<div class="col-10 offset-1 text-end">
						<button type="button" class="btn report-btn">탈퇴</button>
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
	
	<!-- 삭제 모달 시작 -->
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
						<span>정말 삭제하시겠습니까?</span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary m-delete-btn">확인</button>
						<button type="button" class="btn btn-secondary m-cancel-btn" data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 삭제 모달 끝 -->
	
</div>

<script>
	$(function(){
		$(".report-btn").click(function(){
			//탈퇴 여부 재확인 모달창 띄우기
			$("#m-deleteModal").modal("show");
			//확인 버튼 누를 경우 멤버 탈퇴(댕회원 삭제) 처리
			
			
		});
	});
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>