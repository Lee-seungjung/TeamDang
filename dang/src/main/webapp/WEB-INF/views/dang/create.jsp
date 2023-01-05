<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="댕모임 개설" name="title"/>
</jsp:include>

<div class = "container-fluid mt-3">
	<div class = "row">
		<div class = "col-6 offset-3">
			<form action = "create" method = "post">
			<div class = "row mt-3">
				<input name = "dangName" type = "text" placeholder = "댕모임명">
			</div>
			<div class = "row mt-3">
				<input name = "dangInfo" type = "text" placeholder = "댕모임 정보">
			</div>
			<div class = "row mt-3">
				<input name = "dangHeadmax" type = "number" placeholder = "총원">
			</div>
			<div class = "row mt-3">
				<select name = "dangAreaNo">
					<option value = "1">노량진</option>
				</select>
			</div>
			<div class = "row mt-3">
				<input name = "memberNick" placeholder = "닉네임">
			</div>
			<div class = "row mt-3">
				<button type = "submit">개설</button>
			</div>
			</form>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>