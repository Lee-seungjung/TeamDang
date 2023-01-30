<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원정보 변경" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/mypage_menu.jsp"></jsp:include>

<style>
	* {
			
	}

	.strong-mypage-title {
		font-size : 30px;
	}
	
	.span-change-user-info-result {
		font-size : 20px;
	}
	
	.img-change-user-info-result {
		width : 2rem;
		height : 2rem;
	}
	
	.div-col-edit-user-info-success-content {
		height : 19rem;
	}
</style>

<div class = "container-fluid my-2">	
	<div class = "row">
		<div class = "col-4 offset-4 px-5">
			<div class = "row my-4">
                <div class = "col d-flex justify-content-center align-items-center">
                    <strong class = "strong-mypage-title">회원정보 변경</strong>
                </div>
            </div>
			<div class = "row my-4 div-col-edit-user-info-success-content">
				<div class = "col d-flex flex-row justify-content-center align-items-start mt-3">
					<div class = "d-flex justify-content-center align-items-center">					
						<img src = "${pageContext.request.contextPath}/images/img-checked.png" class = "img-change-user-info-result me-3">
						<span class = "my-2 span-change-user-info-result">회원정보 변경이 완료되었습니다.</span>
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
		$(".img-change-user-info").attr("src", "${pageContext.request.contextPath}/images/mypage-myinfo_edit_pink.png");
	});
	
</script>