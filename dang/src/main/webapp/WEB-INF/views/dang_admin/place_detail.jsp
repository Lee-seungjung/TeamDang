<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:eval var="kakoMapKey" expression="@environment.getProperty('custom.kakaomap.key')" />

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
   <jsp:param value="장소 관리" name="title"/>
</jsp:include>    

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<div class="container-fluid mb-5">
	<div class="row mt-2">
		<div class="col-md-8 offset-md-2"
			style="text-align: center;">
			<img
				src="${pageContext.request.contextPath}/rest_attachment/download/${placeList.attachmentNo}"
				 height="600" class="w-100">
		</div>
	</div>

	<div class="row mt-3">
		<div class="col-md-8 offset-md-2">
			<h5>${placeList.placeName}</h5>
		</div>
	</div>
	<div class="row mt-1">
		<div class="col-md-8 offset-md-2  text-light rounded">
			<p style="color: #F94888">
				<c:if test="${placeList.placeSort eq '카페'}">
					<i class="fa-solid fa-mug-saucer"></i>
				</c:if>
				<c:if test="${placeList.placeSort eq '음식점'}">
					<i class="fa-solid fa-utensils"></i>
				</c:if>
				<c:if test="${placeList.placeSort eq '미용'}">
					<i class="fa-solid fa-scissors"></i>
				</c:if>
				<c:if test="${placeList.placeSort eq '공원'}">
					<i class="fa-thin fa-trees"></i>
				</c:if>
				<c:if test="${placeList.placeSort eq '운동장'}">
					<i class="fa-solid fa-person-running"></i>
				</c:if>

				${placeList.placeSort}


			</p>
		</div>
	</div>

	<div class="row mt-2">
		<div class="col-md-8 offset-md-2">
			<div class="row ">
				<div class="col border shadow" style="border-radius: 20px;">
					<div class="row mt-3 mb-5">
						<div class="col text-center">
							<i class="fa-solid fa-circle-check" style="color: #F94888"></i><br>
							<span>소형견</span><br> <span style="font-size: 9">10kg
								미만</span>
						</div>
						<div class="col text-center">
							<c:choose>
								<c:when
									test="${placeList.dangSize eq '중형견' || placeList.dangSize eq '대형견'}">
									<i class="fa-solid fa-circle-check" style="color: #F94888"></i>
									<br>
								</c:when>
								<c:otherwise>
									<i class="fa-regular fa-circle-xmark" style="color: #F94888"></i><br>
								</c:otherwise>
							</c:choose>
							<span>중형견</span><br> <span style="font-size: 9">10 ~
								25kg</span>
						</div>
						<div class="col text-center">
							<c:choose>
								<c:when
									test="${placeList.dangSize eq '대형견'}">
									<i class="fa-solid fa-circle-check" style="color: #F94888"></i>
									<br>
								</c:when>
								<c:otherwise>
									<i class="fa-regular fa-circle-xmark" style="color: #F94888"></i><br>
								</c:otherwise>
							</c:choose>
							<span>대형견</span><br> <span style="font-size: 9">25kg
								이상</span>
						</div>
					</div>
					<div class="row">
						<div class="col">허용공간 :</div>
						<c:choose>
							<c:when
								test="${placeList.placeSort == '카페' ||placeList.placeSort=='미용실'||placeList.placeSort=='음식점'}">
								<div class="col text-end">실내이용</div>
							</c:when>
							<c:otherwise>
								<div class="col text-end">야외이용</div>
							</c:otherwise>
						</c:choose>
						
					</div>
					<div class="row mb-2">
						<div class="col">동반방법 :</div>
						
						<c:choose>
							<c:when
								test="${placeList.dangSize eq '대형견'}">
								<div class="col text-end">목줄착용</div>
							</c:when>
							<c:otherwise>
								<div class="col text-end">가방 또는 캐리어</div>
							</c:otherwise>
						</c:choose>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row mt-4">
		<div class="col-md-8 offset-md-2">
			<h5>장소 정보</h5>
		</div>
	</div>

	<div class="row">
		<div class="col-md-8 offset-md-2">
			<div class="row ">
				<div class="col  border shadow" style="border-radius: 20px;">
					<p class="mt-3 ms-2">주소 <i class="fa-solid fa-house" style="font-size: 15; color: #F94888"></i></p>
					<p class="ms-2" style="font-size: 12">${placeList.placeAddress}</p>
					<c:if test="${placeList.placeTel != null}">	
					<p class="mt-3 ms-2">전화번호 <i class="fa-solid fa-phone" style="font-size: 15; color: #F94888"></i></p>
					<p class="ms-2" style="font-size: 12">${placeList.placeTel}</p>
					</c:if>
					<c:if test="${placeList.specialNote != null}">	
					<p class="mt-3 ms-2">특이사항 <i class="fa-solid fa-circle-info" style="font-size: 15; color: #F94888"></i></p>
					<p class="ms-2" style="font-size: 12">${placeList.specialNote}</p>
					</c:if>
					<c:if test="${placeList.placeUrl != null}">	
					<p class="mt-3 ms-2">홈페이지 <i class="fa-solid fa-globe" style="font-size: 15; color: #F94888"></i></p>
					<a class="ms-2" href="${placeList.placeUrl}" style="font-size: 12">${placeList.placeUrl}</a>
					</c:if>
					<c:if test="${placeList.placeOperation != null}">	
					<p class="mt-3 ms-2">영업시간 <i class="fa-solid fa-clock" style="font-size: 15; color: #F94888"></i></p>
					<p class="ms-2" style="font-size: 12">${placeList.placeOperation}</p>
					</c:if>
					<c:if test="${placeList.placeOff != null}">
					<p class="mt-3 ms-2">휴무일 <i class="fa-solid fa-plane" style="font-size: 15; color: #F94888"></i></p>
					<p class="mb-4 ms-2" style="font-size: 12">${placeList.placeOff}</p>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<div class="row mt-5 mb-3">
		<div class="col-md-8 offset-md-2">${placeList.placeInfo}</div>
	</div>
	
	<div class="row mt-5">
		<div class="col-md-8 offset-md-2">매장위치</div>
	</div>
	<div class="row mt-1 mb-3">
		<div class="col-md-8 offset-md-2">
			<div id="map" style="width: 100%; height: 350px;"></div>
		</div>
	</div>

</div>


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakoMapKey}"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(${placeList.placeX}, ${placeList.placeY}), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(${placeList.placeX}, ${placeList.placeY});

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
	</script>