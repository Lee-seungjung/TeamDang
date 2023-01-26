<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 변경" name="title"/>
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
						<div class = "col">
							<div class = "row">
								<div class = "col-8 offset-2">
									<div class = "d-flex flex-column justify-content-center align-items-center">									
										<span>비밀번호 변경</span>
										<span>비밀번호 변경이 완료되었습니다.</span>
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
		// 마이페이지 메뉴 색 변경
		$(".img-change-user-pw").attr("src", "${pageContext.request.contextPath}/images/mypage-pw_change_pink.png");
	});
	
</script>