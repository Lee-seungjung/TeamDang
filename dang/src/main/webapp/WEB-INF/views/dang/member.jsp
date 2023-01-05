<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

</style>

<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="댕모임 회원" name="title"/>
</jsp:include>

<div class = "container-fluid mt-3">

	<div class = "col-10 offset-1">
		<div class = "row">
		
			<!-- 프로필 박스 시작-->
			<div class = "col-3">
				<jsp:include page="/WEB-INF/views/template/dang_side_profile.jsp"></jsp:include>
			</div>
			<!-- 프로필 박스 끝-->
			
			<div class = "col-6" style="background: white">
				<div class = "col" style="background: green">
					d
				</div>
			</div>
			<div class = "col-3" style="background: white">
				<div class = "col" style="background: green">
					d
				</div>
			</div>
		</div>
	</div>

</div>