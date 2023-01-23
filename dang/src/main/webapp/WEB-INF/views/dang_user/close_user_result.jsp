<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원탈퇴" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/mypage_menu.jsp"></jsp:include>

<style>

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
								<div class = "col-8 offset-2">
									<div class = "d-flex flex-column justify-content-center align-items-center">									
										<span>회원탈퇴</span>
										<span>회원탈퇴가 완료되었습니다.</span>
										<span>그동안 댕모임을 이용해주셔서 감사합니다.</span>
									</div>
									<div class = "d-flex flex-column justify-content-center align-items-center">
										<a href = "/">홈</a>
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

<script type="text/javascript">

	$(function(){
		$(".div-mypage-edit-user-info").css("background-color", "#F94888");
	});
	
</script>