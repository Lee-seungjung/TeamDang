<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="댕모임 찾기" name="title"/>
</jsp:include>

<style>
	
	.strong-title {
		font-size : 32px;
	}
</style>

<div class = "container-fluid my-3 div-container-dang-search"> <%-- container 시작 --%>
	<div class = "row">
		<div class = "col-8 offset-2">
			<div class = "row my-2">
				<div class = "col d-flex justify-content-center align-items-center">
					<strong class = "strong-title">페이지를 찾을 수 없습니다.</strong>
				</div>
			</div>
			<div class = "row my-2">
				<div class = "col-6 offset-3">
					<img src = "/images/img-not-found.jpg" class = "w-100">
				</div>
			</div>
			<div class = "row my-2">
				<div class = "col-6 offset-3 d-flex flex-column justify-content-center align-items-center">
					<span class = "span-content my-1">방문하시려는 페이지의 주소가 잘못 되었거나,</span>
					<span class = "span-content my-1">페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.</span>
					<span class = "span-content my-1">입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.</span>
				</div>
			</div>
		</div>
	</div>
</div> <%-- container 끝 --%>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>