<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	
</style>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>

<div class = "container-fluid my-3">	
	<div class = "row">
		<div class = "col-8 offset-2 my-3 py-5">
			<div class = "row">
				<div class = "col d-flex justify-content-center align-items-center">				
					<a href = "mypage">마이페이지</a>
				</div>
			</div>
			<div class = "row">			
				<div class = "col-3">
					<%-- 사이드 메뉴 불러오기 --%>
					<jsp:include page="/WEB-INF/views/template/mypage_side_menu.jsp"></jsp:include>
				</div>
				<div class = "col-9">
					<div class = "row px-3">
						<div class = "col div-user-info p-5">
							<div class = "row">
								<div class = "col-8 offset-2">
									<div class = "d-flex flex-column justify-content-center align-items-center">									
										<span>회원 탈퇴</span>
										<span>회원 탈퇴를 원하면 <strong>"즉시 탈퇴"</strong>를 입력해 주세요.</span>
									</div>
									<form action = "close_user_ck" method = "get">
									<div class = "d-flex flex-column justify-content-center align-items-center">
										<input name = "closeCheck" type = "text" class = "flex-fill" placeholder = "즉시 탈퇴">
									</div>
									<div class = "d-flex flex-column justify-content-center align-items-center">
										<button type = "submit">확인</button>
									</div>
									</form>
									<c:if test = "${param.error != null}">
										<div class = "d-flex flex-column justify-content-center align-items-center">
											<span>올바른 문구를 입력해 주세요.</span>
										</div>
									</c:if>
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

<script type="text/javascript">

	$(function(){
		
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
                    	$(".img-user-profile").prop("src", resp);
                    }
				});
			}
		});
		
		// 수정
		
	});
	
</script>