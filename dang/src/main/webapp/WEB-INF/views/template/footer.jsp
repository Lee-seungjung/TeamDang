<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<style>

</style>

<%-- 로그인 상태 판정 --%>
<c:set var="login" value="${loginNo != null}"></c:set>

<div class = "container-fluid">
	<div class = "row">
		<div class = "col-8 offset-2">
			<div class = "row">
				<div class = "col d-flex justify-content-center align-itesm-center">
					<img src = "${pageContext.request.contextPath}/images/logo.png" class = "w-50">
				</div>
				<div class = "col d-flex justify-content-center align-itesm-center">
					<span class = "align-self-center">이용약관</span>
				</div>
				<div class = "col d-flex justify-content-center align-itesm-center">
					<span class = "align-self-center">개인정보처리방침</span>
				</div>
				<div class = "col d-flex justify-content-center align-itesm-center">
					<span class = "align-self-center">통합검색 고객센터</span>
				</div>
				<div class = "col d-flex justify-content-center align-itesm-center">
					<span class = "align-self-center">TEL.02-1111-1111</span>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>