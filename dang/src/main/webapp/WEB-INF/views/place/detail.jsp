<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />

<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="장소 상세" name="title" />
</jsp:include>

<style>
* {
	border: 1px gray dotted;
}
</style>



<div class="container-fluid mb-5">
	${placeList}
	<div class="row mt-2">
		<div class="col-md-8 offset-md-2" style="text-align : center;">
			<img src="http://localhost:8888/rest_attachment/download/${placeList.attachmentNo}" width="75%" height="100%">
		</div>
	</div>
	
	<div class="row mt-4">
		<div class="col-md-8 offset-md-2">
			<h5>${placeList.placeName}</h5>
		</div>
	</div>
	<div class="row mt-4">
		<div class="col-md-8 offset-md-2  text-light rounded">
			<p style="color : #F781D8">
			<c:if test="${placeList.placeSort eq '카페'}">
			<i class="fa-solid fa-mug-saucer"></i>
			</c:if>
			<c:if test="${placeList.placeSort eq '음식점'}">
			<i class="fa-solid fa-utensils"></i> 
			</c:if>
			<c:if test="${placeList.placeSort eq '미용'}">
			<i class="fa-solid fa-ruler-horizontal"></i>
			</c:if>
			<c:if test="${placeList.placeSort eq '공원'}">
			<i class="fa-thin fa-trees"></i>
			</c:if>
			<c:if test="${placeList.placeSort eq '운동장'}">
			<i class="fa-light fa-fence"></i>
			</c:if>
			
			 ${placeList.placeSort}
			
			
			</p>
		</div>
	</div>
	
	
</div>