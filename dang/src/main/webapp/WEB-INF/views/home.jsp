<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="DangHome" name="title"/>
</jsp:include>

<div class = "container-fluid mt-3">
	<div class = "col-8 offset-2">
		<div class = "row">
			<a href = "/dang/1">1번 댕모임</a>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>