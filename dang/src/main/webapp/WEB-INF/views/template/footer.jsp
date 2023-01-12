<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
</body>
<%--header body 끝 --%>

<%--footer 시작 --%>

<%-- 로그인 상태 판정 --%>
<c:set var="login" value="${loginNo != null}"></c:set>

<div class = "container-fluid">

	<div class = "col-8 offset-2">
		<div class = "row">
			로그인 상태 : ${login}
		</div>
		<div class = "row">
			로그인 회원 번호 : ${loginNo}
		</div>
		<div class = "row">
			로그인 회원 등급 : ${loginGrade}
		</div>
	</div>

</div>

</html>