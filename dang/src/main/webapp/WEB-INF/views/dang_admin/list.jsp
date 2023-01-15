<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>다양한 이미지 마커 표시하기</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<!-- Bootswatch CDN-->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/zephyr/bootstrap.css">
<style>
#mapwrap {
	position: relative;
	overflow: hidden;
}

.category, .category * {
	margin: 0;
	padding: 0;
	color: #000;
}

.category {
	position: absolute;
	overflow: hidden;
	top: 10px;
	left: 10px;
	width: 250px;
	height: 50px;
	z-index: 10;
	border: 1px solid black;
	border-radius: 10px;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
	font-size: 12px;
	text-align: center;
	background-color: #fff;
}

.category .menu_selected {
	background: #f3d4d1;
	color: #fff;
	border-left: 1px solid #915B2F;
	border-right: 1px solid #915B2F;
	margin: 0 -1px;
}

.category li {
	list-style: none;
	float: left;
	width: 50px;
	height: 60px;
	padding-top: 5px;
	cursor: pointer;
}

.category .ico_comm {
	display: block;
	margin: 0 auto 2px;
	width: 22px;
	height: 26px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png')
		no-repeat;
}

.category .ico_cafe {
	background-position: 0px 0px;
	background-image: url("./mapmarker/cafe.png");
}

.category .ico_food {
	background-position: -10px -36px;
}

.category .ico_field {
	background-position: -10px -72px;
}

.category .ico_dogsalon {
	background-position: 0px 0px;
	background-image: url("./mapmarker/cafe.png");
}

.category .ico_park {
	background-position: 0px 0px;
	background-image: url("./mapmarker/cafe.png");
}

.customoverlay {
	position: relative;
	bottom: 40px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
}

.customoverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.customoverlay a {
	display: block;
	text-decoration: none;
	color: #000;
	text-align: center;
	border-radius: 6px;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.customoverlay .title {
	display: block;
	text-align: center;
	background: #fff;
	margin-right: 35px;
	padding: 10px 15px;
	font-size: 14px;
	font-weight: bold;
}

.customoverlay:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}
</style>
</head>

<body>
	<div class="container-fluid mb-5">
		<div class="row mt-2">
			<div class="col-md-8 offset-md-2 text-center">
				<p>서울시 ${placeCount}곳의 동반장소를 검색해주세요.</p>
			</div>
		</div>
	
		<div class="row mt-2">
			<div class="col-md-8 offset-md-2">
					<div id="mapwrap">
					<!-- 지도가 표시될 div -->
					<div id="map" style="width: 100%; height: 350px;"></div>
					<!-- 지도 위에 표시될 마커 카테고리 -->
					<div class="category">
						<ul>
							<li id="cafeMenu" onclick="changeMarker('cafe')"><span
								class="ico_comm ico_cafe"></span> 카페</li>
							<li id="foodMenu" onclick="changeMarker('food')"><span
								class="ico_comm ico_food"></span> 음식점</li>
							<li id="fieldMenu" onclick="changeMarker('field')"><span
								class="ico_comm ico_field"></span> 운동장</li>
							<li id="dogsalonMenu" onclick="changeMarker('dogsalon')"><span
								class="ico_comm ico_dogsalon"></span> 미용</li>
							<li id="parkMenu" onclick="changeMarker('park')"><span
								class="ico_comm ico_park"></span> 공원</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	


	<div class="modal fade" id="edit" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<span class="span-placeaddress"></span><br> <span
						class="span-placearea"></span><br> <span
						class="span-placeinfo"></span><br> <span
						class="span-placename"></span><br> <span
						class="span-placeoff"></span><br> <span
						class="span-placeoperation"></span><br> <span
						class="span-placesort"></span><br> <span
						class="span-placetel"></span><br> <span class="span-placeurl"></span><br>
					<img src="" width="100" height="100" class="origin-img"><br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary"
						onclick="detailMove()">상세보기</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b9a95746698992180eedc27d9eef265"></script>
	<script>
		
		
		var placeNoInfo; //장소번호를 가져오는 변수
		var placeContents = []; // 장소번호를 가져와 내용을 담는 변수
		var placeOriginNo; // 클릭한 마커의 데이터장소번호를 뽑아내는 변수
		var abc;
		function detailMove() {
			location.href = "http://localhost:8888/place/detail/"+placeNoInfo;
		}
		$(document)
				.on(
						"click",
						".edit",
						function(e) {

							$("#edit").modal("show");//모달 실행

							placeNoInfo = $(this).data("placeno");

							//비동기통신 시작
							$
									.ajax({
										url : "http://localhost:8888/rest_place/place_one/"
												+ placeNoInfo,
										method : "get",
										async : false,
										contentType : "application/json",
										success : function(resp) {
											console.log(resp)
											$(".span-placeaddress").text(
													resp.placeAddress);
											$(".span-placearea").text(
													resp.placeArea);
											$(".span-placeinfo").html(
													resp.placeInfo);
											$(".span-placename").text(
													resp.placeName);
											$(".span-placeoff").text(
													resp.placeOff);
											$(".span-placeoperation").text(
													resp.placeOperation);
											$(".span-placesort").text(
													resp.placeSort);
											$(".span-placetel").text(
													resp.placeTel);
											$(".span-placeurl").text(
													resp.placeUrl);
											$(".origin-img")
													.attr(
															"src",
															"http://localhost:8888/rest_attachment/download/"
																	+ resp.attachmentNo);
											abc=resp.placeNo;
											
										}
									})

						});
		
		console.log(placeNoInfo);

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.498004414546934,
					127.02770621963765), // 지도의 중심좌표 
			level : 9
		// 지도의 확대 레벨 
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		var clickedOverlay = null;//클릭이벤트 오버레이 전역변수 초기값

		// 카페 마커가 표시될 좌표 배열입니다
		var cafePositions = [

		];

		// 음식점 마커가 표시될 좌표 배열입니다
		var foodPositions = [

		];

		//  운동장 마커가 표시될 좌표 배열입니다
		var fieldPositions = [

		];

		//  미용 마커가 표시될 좌표 배열입니다
		var dogsalonPositions = [

		];

		//  공원 마커가 표시될 좌표 배열입니다
		var parkPositions = [

		];

		// 카페에 정보를 담을 배열
		var contentCafe = [];

		// 음식점에 정보를 담을 배열
		var contentFood = [];

		// 운동장에 정보를 담을 배열
		var contentField = [];

		// 미용에 정보를 담을 배열
		var contentDogsalon = [];

		// 공원에 정보를 담을 배열
		var contentPark = [];

		$.ajax({
			url : "http://localhost:8888/rest_place/place_list",
			method : "get",
			async : false,
			contentType : "application/json",
			success : function(resp) {
				for (var i = 0; i < resp.length; i++) {
					if (resp[i].placeSort === "카페") {//DB에서 불러온 값이 카페이면 카페정보배열에 밀어넣기
						cafePositions.push(new kakao.maps.LatLng(
								resp[i].placeX, resp[i].placeY))
						contentCafe.push(resp[i]);
					} else if (resp[i].placeSort === "음식점") {
						foodPositions.push(new kakao.maps.LatLng(
								resp[i].placeX, resp[i].placeY))
						contentFood.push(resp[i]);
					} else if (resp[i].placeSort === "운동장") {
						fieldPositions.push(new kakao.maps.LatLng(
								resp[i].placeX, resp[i].placeY))
						contentField.push(resp[i]);
					} else if (resp[i].placeSort === "미용") {
						dogsalonPositions.push(new kakao.maps.LatLng(
								resp[i].placeX, resp[i].placeY))
						contentDogsalon.push(resp[i]);
					} else if (resp[i].placeSort === "공원") {
						dogsalonPositions.push(new kakao.maps.LatLng(
								resp[i].placeX, resp[i].placeY))
						contentPark.push(resp[i]);
					}
				}
			}
		})

		var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png'; // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
		var cafemarkerImageSrc = './mapmarker/cafe.png'; // 카페의 마커이미지의 주소입니다.

		cafeMarkers = [], // 카페 마커 객체를 가지고 있을 배열입니다
		foodMarkers = [], // 음식점 마커 객체를 가지고 있을 배열입니다
		fieldMarkers = []; // 운동장 마커 객체를 가지고 있을 배열입니다
		dogsalonMarkers = []; // 미용 마커 객체를 가지고 있을 배열입니다
		parkMarkers = []; // 공원 마커 객체를 가지고 있을 배열입니다

		createCafeMarkers(); // 카페 마커를 생성하고 카페 마커 배열에 추가합니다
		createFoodMarkers(); // 음식점 마커를 생성하고 음식점 마커 배열에 추가합니다
		createFieldMarkers(); // 운동장 마커를 생성하고 운동장 마커 배열에 추가합니다
		createDogsalonMarkers(); // 미용 마커를 생성하고 운동장 마커 배열에 추가합니다
		createParkMarkers(); // 공원 마커를 생성하고 운동장 마커 배열에 추가합니다

		changeMarker('cafe'); // 지도에 카페 마커가 보이도록 설정합니다    

		// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
		function createMarkerImage(src, size, options) {
			var markerImage = new kakao.maps.MarkerImage(src, size, options);
			return markerImage;
		}

		// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
		function createMarker(position, image) {
			var marker = new kakao.maps.Marker({
				position : position,
				image : image
			});

			return marker;
		}

		// 카페 마커를 생성하고 카페 마커 배열에 추가하는 함수입니다
		function createCafeMarkers() {

			for (var i = 0; i < cafePositions.length; i++) {

				var imageSize = new kakao.maps.Size(40, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(0, 0),
					spriteSize : new kakao.maps.Size(20, 20)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(cafemarkerImageSrc,
						imageSize, imageOptions), marker = createMarker(
						cafePositions[i], markerImage);

				// 생성된 마커를 카페 마커 배열에 추가합니다
				//makeOverListener(map, marker, infowindow)
				cafeMarkers.push(marker);
				kakao.maps.event
						.addListener(
								marker,
								'click',
								function() {

									for (var i = 0; i < cafePositions.length; i++) {
										var a1 = this.getPosition().Ma
										var a2 = contentCafe[i].placeX
										if (a2.toFixed(7) === a1.toFixed(7)) {
											placeOriginNo = contentCafe[i].placeNo;
											content = '<div class="customoverlay">'
													+ '  <a class="edit" data-placeno=' + contentCafe[i].placeNo + ' target="_blank">'
													+ '    <span class="title " data-placeno=' + contentCafe[i].placeNo + ' >'
													+ contentCafe[i].placeName
													+ '</span>'
													+ '  </a>'
													+ '</div>';
										}
									}

									var position = this.getPosition();

									// 커스텀 오버레이를 생성합니다
									var customOverlay = new kakao.maps.CustomOverlay(
											{
												map : map,
												position : position,
												content : content,
												yAnchor : 1
											});

									//다른 마커 클릭시 오버레이 닫기
									if (clickedOverlay) {
										clickedOverlay.setMap(null);
									}
									customOverlay.setMap(map);
									clickedOverlay = customOverlay;

								});
			}
		}

		// 카페 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setCafeMarkers(map) {
			for (var i = 0; i < cafeMarkers.length; i++) {
				cafeMarkers[i].setMap(map);
			}
		}

		// 음식점 마커를 생성하고 음식점 마커 배열에 추가하는 함수입니다
		function createFoodMarkers() {
			for (var i = 0; i < foodPositions.length; i++) {

				var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(10, 36),
					spriteSize : new kakao.maps.Size(36, 98)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(foodPositions[i],
						markerImage);

				// 생성된 마커를 음식점 마커 배열에 추가합니다
				foodMarkers.push(marker);
				kakao.maps.event
						.addListener(
								marker,
								'click',
								function() {

									for (var i = 0; i < foodPositions.length; i++) {
										var a1 = this.getPosition().Ma
										var a2 = contentFood[i].placeX

										if (a2.toFixed(7) === a1.toFixed(7)) {
											placeOriginNo = contentCafe[i].placeNo;
											content = '<div class="customoverlay">'
													+ '  <a class="edit" data-placeno=' + contentFood[i].placeNo + ' target="_blank">'
													+ '    <span class="title " data-placeno=' + contentFood[i].placeNo + ' >'
													+ contentFood[i].placeName
													+ '</span>'
													+ '  </a>'
													+ '</div>';
										}
									}

									var position = this.getPosition();

									// 커스텀 오버레이를 생성합니다
									var customOverlay = new kakao.maps.CustomOverlay(
											{
												map : map,
												position : position,
												content : content,
												yAnchor : 1
											});

									//다른 마커 클릭시 오버레이 닫기
									if (clickedOverlay) {
										clickedOverlay.setMap(null);
									}
									customOverlay.setMap(map);
									clickedOverlay = customOverlay;

								});
			}
		}

		// 음식점 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setFoodMarkers(map) {
			for (var i = 0; i < foodMarkers.length; i++) {
				foodMarkers[i].setMap(map);
			}
		}

		// 운동장 마커를 생성하고 운동장 마커 배열에 추가하는 함수입니다
		function createFieldMarkers() {
			for (var i = 0; i < fieldPositions.length; i++) {

				var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(10, 72),
					spriteSize : new kakao.maps.Size(36, 98)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(fieldPositions[i],
						markerImage);

				// 생성된 마커를 운동장 마커 배열에 추가합니다
				fieldMarkers.push(marker);
				kakao.maps.event
						.addListener(
								marker,
								'click',
								function() {

									for (var i = 0; i < fieldPositions.length; i++) {
										var a1 = this.getPosition().Ma
										var a2 = contentField[i].placeX

										if (a2.toFixed(7) === a1.toFixed(7)) {
											placeOriginNo = contentCafe[i].placeNo;
											content = '<div class="customoverlay">'
													+ '  <a class="edit" data-placeno=' + contentField[i].placeNo + ' target="_blank">'
													+ '    <span class="title " data-placeno=' + contentField[i].placeNo + ' >'
													+ contentField[i].placeName
													+ '</span>'
													+ '  </a>'
													+ '</div>';
										}
									}

									var position = this.getPosition();

									// 커스텀 오버레이를 생성합니다
									var customOverlay = new kakao.maps.CustomOverlay(
											{
												map : map,
												position : position,
												content : content,
												yAnchor : 1
											});

									//다른 마커 클릭시 오버레이 닫기
									if (clickedOverlay) {
										clickedOverlay.setMap(null);
									}
									customOverlay.setMap(map);
									clickedOverlay = customOverlay;

								});
			}
		}

		// 운동장 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setFieldMarkers(map) {
			for (var i = 0; i < fieldMarkers.length; i++) {
				fieldMarkers[i].setMap(map);
			}
		}

		// 미용 마커를 생성하고 미용 마커 배열에 추가하는 함수입니다
		function createDogsalonMarkers() {
			for (var i = 0; i < dogsalonPositions.length; i++) {

				var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(10, 72),
					spriteSize : new kakao.maps.Size(36, 98)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						dogsalonPositions[i], markerImage);

				// 생성된 마커를 미용 마커 배열에 추가합니다
				dogsalonMarkers.push(marker);

				kakao.maps.event
						.addListener(
								marker,
								'click',
								function() {

									for (var i = 0; i < dogsalonPositions.length; i++) {
										var a1 = this.getPosition().Ma
										var a2 = contentDogsalon[i].placeX

										if (a2.toFixed(7) === a1.toFixed(7)) {
											placeOriginNo = contentCafe[i].placeNo;
											content = '<div class="customoverlay">'
													+ '  <a class="edit" data-placeno=' + contentDogsalon[i].placeNo + ' target="_blank">'
													+ '    <span class="title " data-placeno=' + contentDogsalon[i].placeNo + ' >'
													+ contentDogsalon[i].placeName
													+ '</span>'
													+ '  </a>'
													+ '</div>';
										}
									}

									var position = this.getPosition();

									// 커스텀 오버레이를 생성합니다
									var customOverlay = new kakao.maps.CustomOverlay(
											{
												map : map,
												position : position,
												content : content,
												yAnchor : 1
											});

									//다른 마커 클릭시 오버레이 닫기
									if (clickedOverlay) {
										clickedOverlay.setMap(null);
									}
									customOverlay.setMap(map);
									clickedOverlay = customOverlay;

								});
			}
		}

		// 미용 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setDogsalonMarkers(map) {
			for (var i = 0; i < dogsalonMarkers.length; i++) {
				dogsalonMarkers[i].setMap(map);
			}
		}

		// 공원 마커를 생성하고 공원 마커 배열에 추가하는 함수입니다
		function createParkMarkers() {
			for (var i = 0; i < parkPositions.length; i++) {

				var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(10, 72),
					spriteSize : new kakao.maps.Size(36, 98)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(parkPositions[i],
						markerImage);

				// 생성된 마커를 공원 마커 배열에 추가합니다
				parkMarkers.push(marker);

				kakao.maps.event
						.addListener(
								marker,
								'click',
								function() {

									for (var i = 0; i < parkPositions.length; i++) {
										var a1 = this.getPosition().Ma
										var a2 = contentPark[i].placeX

										if (a2.toFixed(7) === a1.toFixed(7)) {
											placeOriginNo = contentCafe[i].placeNo;
											content = '<div class="customoverlay">'
													+ '  <a class="edit" data-placeno=' + contentPark[i].placeNo + ' target="_blank">'
													+ '    <span class="title " data-placeno=' + contentPark[i].placeNo + ' >'
													+ contentPark[i].placeName
													+ '</span>'
													+ '  </a>'
													+ '</div>';
										}
									}

									var position = this.getPosition();

									// 커스텀 오버레이를 생성합니다
									var customOverlay = new kakao.maps.CustomOverlay(
											{
												map : map,
												position : position,
												content : content,
												yAnchor : 1
											});

									//다른 마커 클릭시 오버레이 닫기
									if (clickedOverlay) {
										clickedOverlay.setMap(null);
									}
									customOverlay.setMap(map);
									clickedOverlay = customOverlay;

								});
			}
		}

		// 공원 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setParkMarkers(map) {
			for (var i = 0; i < parkMarkers.length; i++) {
				parkMarkers[i].setMap(map);
			}
		}

		// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
		function changeMarker(type) {

			var cafeMenu = document.getElementById('cafeMenu');
			var foodMenu = document.getElementById('foodMenu');
			var fieldMenu = document.getElementById('fieldMenu');
			var dogsalonMenu = document.getElementById('dogsalonMenu');
			var parkMenu = document.getElementById('parkMenu');

			// 카페 카테고리가 클릭됐을 때
			if (type === 'cafe') {

				// 카페 카테고리를 선택된 스타일로 변경하고
				cafeMenu.className = 'menu_selected';

				// 음식점과 운동장과 미용 카테고리는 선택되지 않은 스타일로 바꿉니다
				foodMenu.className = '';
				fieldMenu.className = '';
				dogsalonMenu.className = '';
				parkMenu.className = '';

				// 카페 마커들만 지도에 표시하도록 설정합니다
				setCafeMarkers(map);
				setFoodMarkers(null);
				setFieldMarkers(null);
				setDogsalonMarkers(null);
				setParkMarkers(null);

			} else if (type === 'food') { // 음식점 카테고리가 클릭됐을 때

				// 음식점 카테고리를 선택된 스타일로 변경하고
				cafeMenu.className = '';
				foodMenu.className = 'menu_selected';
				fieldMenu.className = '';
				dogsalonMenu.className = '';
				parkMenu.className = '';

				// 음식점 마커들만 지도에 표시하도록 설정합니다
				setCafeMarkers(null);
				setFoodMarkers(map);
				setFieldMarkers(null);
				setDogsalonMarkers(null);
				setParkMarkers(null);

			} else if (type === 'field') { // 운동장 카테고리가 클릭됐을 때

				// 운동장 카테고리를 선택된 스타일로 변경하고
				cafeMenu.className = '';
				foodMenu.className = '';
				fieldMenu.className = 'menu_selected';
				dogsalonMenu.className = '';
				parkMenu.className = '';

				// 운동장 마커들만 지도에 표시하도록 설정합니다
				setCafeMarkers(null);
				setFoodMarkers(null);
				setFieldMarkers(map);
				setDogsalonMarkers(null);
				setParkMarkers(null);

			} else if (type === 'dogsalon') {

				// 미용 카테고리를 선택된 스타일로 변경하고
				cafeMenu.className = '';
				foodMenu.className = '';
				fieldMenu.className = '';
				dogsalonMenu.className = 'menu_selected';
				parkMenu.className = '';

				// 미용 마커들만 지도에 표시하도록 설정합니다
				setCafeMarkers(null);
				setFoodMarkers(null);
				setFieldMarkers(null);
				setDogsalonMarkers(map);
				setParkMarkers(null);
			} else if (type === 'park') {

				// 공원 카테고리를 선택된 스타일로 변경하고
				cafeMenu.className = '';
				foodMenu.className = '';
				fieldMenu.className = '';
				dogsalonMenu.className = '';
				parkMenu.className = 'menu_selected';

				// 공원 마커들만 지도에 표시하도록 설정합니다
				setCafeMarkers(null);
				setFoodMarkers(null);
				setFieldMarkers(null);
				setDogsalonMarkers(null);
				setParkMarkers(map);
			}
		}
	</script>
</body>

</html>