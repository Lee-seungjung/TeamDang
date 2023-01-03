<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="댕모임 가입" name="title"/>
</jsp:include>

<div class = "container-fluid">
	
	<div class = "col">
		<div class = "row">
			가입 페이지
		</div>
		<div class = "col-8 offset-2">
			<form action = "join" method = "post">
			<div class = "row">
				아이디 : <input name = "userId" type = "text">
			</div>
			<div class = "row">
				비밀번호 : <input name = "userPw" type = "password">
			</div>
			<div class = "row">
				이메일 : <input name = "userEmail" type = "text">
			</div>
			<div class = "row">
				닉네임 : <input name = "userNick" type = "text">
			</div>
			<div class = "row">
				전화번호 : <input name = "userTel" type = "text">
			</div>
			<div class = "row">
				성별 : 
				<select name = "userGender">
					<option>성별 선택</option>
					<option value = "M">남자</option>
					<option value = "F">여자</option>
				</select>
			</div>
			<div class = "row">
				<button type = "submit">가입</button>
			</div>
			</form>
		</div>	
	</div>	
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">

</script>