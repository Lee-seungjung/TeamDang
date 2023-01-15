<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="��� ��" name="title" />
</jsp:include>




<div class="container-fluid mb-5">
	<div class="row mt-2">
		<div class="col-md-8 offset-md-2"
			style="text-align: center; background: black;">
			<img
				src="http://localhost:8888/rest_attachment/download/${placeList.attachmentNo}"
				width="900" height="600">
		</div>
	</div>

	<div class="row mt-3">
		<div class="col-md-8 offset-md-2">
			<h5>${placeList.placeName}</h5>
		</div>
	</div>
	<div class="row mt-1">
		<div class="col-md-8 offset-md-2  text-light rounded">
			<p style="color: #F781D8">
				<c:if test="${placeList.placeSort eq 'ī��'}">
					<i class="fa-solid fa-mug-saucer"></i>
				</c:if>
				<c:if test="${placeList.placeSort eq '������'}">
					<i class="fa-solid fa-utensils"></i>
				</c:if>
				<c:if test="${placeList.placeSort eq '�̿�'}">
					<i class="fa-solid fa-ruler-horizontal"></i>
				</c:if>
				<c:if test="${placeList.placeSort eq '����'}">
					<i class="fa-thin fa-trees"></i>
				</c:if>
				<c:if test="${placeList.placeSort eq '���'}">
					<i class="fa-light fa-fence"></i>
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
							<i class="fa-solid fa-circle-check" style="color: #F781D8"></i><br>
							<span>������</span><br> <span style="font-size: 9">10kg
								�̸�</span>
						</div>
						<div class="col text-center">
							<c:choose>
								<c:when
									test="${placeList.dangSize eq '������' || placeList.dangSize eq '������'}">
									<i class="fa-solid fa-circle-check" style="color: #F781D8"></i>
									<br>
								</c:when>
								<c:otherwise>
									<i class="fa-regular fa-circle-xmark" style="color: #F781D8"></i><br>
								</c:otherwise>
							</c:choose>
							<span>������</span><br> <span style="font-size: 9">10 ~
								25kg</span>
						</div>
						<div class="col text-center">
							<c:choose>
								<c:when
									test="${placeList.dangSize eq '������'}">
									<i class="fa-solid fa-circle-check" style="color: #F781D8"></i>
									<br>
								</c:when>
								<c:otherwise>
									<i class="fa-regular fa-circle-xmark" style="color: #F781D8"></i><br>
								</c:otherwise>
							</c:choose>
							<span>������</span><br> <span style="font-size: 9">25kg
								�̻�</span>
						</div>
					</div>
					<div class="row">
						<div class="col">������ :</div>
						<div class="col text-end">�ǳ��̿�</div>
					</div>
					<div class="row mb-2">
						<div class="col">���ݹ�� :</div>
						<div class="col text-end">���� �Ǵ� ĳ����</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row mt-4">
		<div class="col-md-8 offset-md-2">
			<h5>��� ����</h5>
		</div>
	</div>

	<div class="row">
		<div class="col-md-8 offset-md-2">
			<div class="row ">
				<div class="col  border shadow" style="border-radius: 20px;">
					<p class="mt-3 ms-2">�ּ� <i class="fa-solid fa-house" style="font-size: 15; color: #F781D8"></i></p>
					<p class="ms-2" style="font-size: 12">${placeList.placeAddress}</p>
					<p class="mt-3 ms-2">��ȭ��ȣ <i class="fa-solid fa-phone" style="font-size: 15; color: #F781D8"></i></p>
					<p class="ms-2" style="font-size: 12">${placeList.placeTel}</p>
					<p class="mt-3 ms-2">Ư�̻��� <i class="fa-solid fa-circle-info" style="font-size: 15; color: #F781D8"></i></p>
					<p class="ms-2" style="font-size: 12">��������, ���尡��, ���� ���ͳݰ���, �ݷ����� ���ݰ���,
						�������̰���, ���������ݰ���</p>
					<p class="mt-3 ms-2">Ȩ������ <i class="fa-solid fa-globe" style="font-size: 15; color: #F781D8"></i></p>
					<a class="ms-2" href="${placeList.placeUrl}" style="font-size: 12">${placeList.placeUrl}</a>
					<p class="mt-3 ms-2">�����ð� <i class="fa-solid fa-clock" style="font-size: 15; color: #F781D8"></i></p>
					<p class="ms-2" style="font-size: 12">${placeList.placeOperation}</p>
					<p class="mt-3 ms-2">�޹��� <i class="fa-solid fa-plane" style="font-size: 15; color: #F781D8"></i></p>
					<p class="mb-4 ms-2" style="font-size: 12">${placeList.placeOff}</p>
				</div>
			</div>
		</div>
	</div>

	<div class="row mt-5 mb-3">
		<div class="col-md-8 offset-md-2">${placeList.placeInfo}</div>
	</div>
	
	<div class="row mt-5">
		<div class="col-md-8 offset-md-2">������ġ</div>
	</div>
	<div class="row mt-1 mb-3">
		<div class="col-md-8 offset-md-2">
			<div id="map" style="width: 100%; height: 350px;"></div>
		</div>
	</div>




	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b9a95746698992180eedc27d9eef265"></script>
	<script>
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center : new kakao.maps.LatLng(${placeList.placeX}, ${placeList.placeY}), // ������ �߽���ǥ
			level : 3
		// ������ Ȯ�� ����
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

		// ��Ŀ�� ǥ�õ� ��ġ�Դϴ� 
		var markerPosition = new kakao.maps.LatLng(${placeList.placeX}, ${placeList.placeY});

		// ��Ŀ�� �����մϴ�
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
		marker.setMap(map);

		// �Ʒ� �ڵ�� ���� ���� ��Ŀ�� �����ϴ� �ڵ��Դϴ�
		// marker.setMap(null);
	</script>