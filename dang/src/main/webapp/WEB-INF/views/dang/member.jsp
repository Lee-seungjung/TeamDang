<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
						<img src="${pageContext.request.contextPath}/images/puppys2.jpg"
									style="height:auto;" class = "w-100 rounded-3">
					</div>
					<div class="col-10 offset-1 mt-4 middle-items">
						<p class="title-font font-gray me-2">${dangInfo.dangName}</p>
						<div>
							<img src="${pageContext.request.contextPath}/images/maps-and-flags.png" width="15" height="15">
							<span class="font-gray" style="font-size:13px; margin-left:-3px;">${dangInfo.dangArea}</span>
						</div>
					</div>
					<div class="col-10 offset-1">
						<p class="mt-2" style="font-size:15px;">${dangInfo.dangInfo}</p>
					</div>
				</div>
				
				<div id="d-member-list" class="mt-5">
					<div class="col-10 offset-1">
						<p class="title-font font-gray">모임에 참여중인 멤버(<span>${memberCnt}</span>명)</p>
					</div>
					<div class="col-10 offset-1 mt-3">
						<!-- 반복문 들어갈 자리 -->
						<div class="d-member-wrap middle-items">
							<div class="d-member-img" style="position:relative;">
								<img src="" class="img-circle" width="70" height="70">
								<img src="${pageContext.request.contextPath}/images/crown.png" class="d-member-owner">
							</div>
							<div class="d-member-detail ms-3">
								<p style="font-weight:10px;">댕모임닉네임</p>
								<p style="font-size:15px;">댕모임회원 상태메세지</p>
							</div>
						</div>
						
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
	
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>