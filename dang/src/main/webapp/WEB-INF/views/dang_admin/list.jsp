<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>다양한 이미지 마커 표시하기</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
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

        .category,
        .category * {
            margin: 0;
            padding: 0;
            color: #000;
        }

        .category {
            position: absolute;
            overflow: hidden;
            top: 10px;
            left: 10px;
            width: 200px;
            height: 50px;
            z-index: 10;
            border: 1px solid black;
            font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
            font-size: 12px;
            text-align: center;
            background-color: #fff;
        }

        .category .menu_selected {
            background: #FF5F4A;
            color: #fff;
            border-left: 1px solid #915B2F;
            border-right: 1px solid #915B2F;
            margin: 0 -1px;
        }

        .category li {
            list-style: none;
            float: left;
            width: 50px;
            height: 45px;
            padding-top: 5px;
            cursor: pointer;
        }

        .category .ico_comm {
            display: block;
            margin: 0 auto 2px;
            width: 22px;
            height: 26px;
            background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;
        }

        .category .ico_coffee {
            background-position: -10px 0;
        }

        .category .ico_store {
            background-position: -10px -36px;
        }

        .category .ico_carpark {
            background-position: -10px -72px;
        }

        .category .ico_dogsalon {
            background-position: -10px -72px;
            background-image: url("./image/test1.jpg");
        }
    </style>
</head>

<body>
    <div id="mapwrap">
        <!-- 지도가 표시될 div -->
        <div id="map" style="width:100%;height:350px;"></div>
        <!-- 지도 위에 표시될 마커 카테고리 -->
        <div class="category">
            <ul>
                <li id="coffeeMenu" onclick="changeMarker('coffee')">
                    <span class="ico_comm ico_coffee"></span>
                    커피숍
                </li>
                <li id="storeMenu" onclick="changeMarker('store')">
                    <span class="ico_comm ico_store"></span>
                    편의점
                </li>
                <li id="carparkMenu" onclick="changeMarker('carpark')">
                    <span class="ico_comm ico_carpark"></span>
                    주차장
                </li>
                <li id="dogsalonMenu" onclick="changeMarker('dogsalon')">
                    <span class="ico_comm ico_dogsalon"></span>
                    미용
                </li>
            </ul>
        </div>
    </div>


    <div class="modal fade" id="edit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <span class="span-placeaddress"></span><br>
                    <span class="span-placearea"></span><br>
                    <span class="span-placeinfo"></span><br>
                    <span class="span-placename"></span><br>
                    <span class="span-placeoff"></span><br>
                    <span class="span-placeoperation"></span><br>
                    <span class="span-placesort"></span><br>
                    <span class="span-placetel"></span><br>
                    <span class="span-placeurl"></span><br>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary">상세보기</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b9a95746698992180eedc27d9eef265"></script>
    <script>

        var placeNoInfo;
        var placeContents = [];

        $(document).on("click", ".edit", function (e) {
            e.stopPropagation();//전파 중지
            $("#edit").modal("show");

            var name = $(this).data("placename");
            $(".span-placename").text(name);

            placeNoInfo = $(this).data("placeno");
            console.log("sss : " + placeNoInfo);

            $.ajax({
                url: "http://localhost:8888/rest_place/place_one/" + placeNoInfo,
                method: "get",
                async: false,
                contentType: "application/json",
                success: function (resp) {
                    $(".span-placeaddress").text(resp.placeAddress);
                    $(".span-placearea").text(resp.placeArea);
                    $(".span-placeinfo").text(resp.placeInfo);
                    $(".span-placename").text(resp.placeName);
                    $(".span-placeoff").text(resp.placeOff);
                    $(".span-placeoperation").text(resp.placeOperation);
                    $(".span-placesort").text(resp.placeSort);
                    $(".span-placetel").text(resp.placeTel);
                    $(".span-placeurl").text(resp.placeUrl);
                }
            })

            // console.log(placeContents);

        });






        var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
            mapOption = {
                center: new kakao.maps.LatLng(37.498004414546934, 127.02770621963765), // 지도의 중심좌표 
                level: 9 // 지도의 확대 레벨 
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 커피숍 마커가 표시될 좌표 배열입니다
        var coffeePositions = [

        ];

        // 편의점 마커가 표시될 좌표 배열입니다
        var storePositions = [

        ];

        // 주차장 마커가 표시될 좌표 배열입니다
        var carparkPositions = [

        ];

        // 
        var contentCafe = [];


        $.ajax({
            url: "http://localhost:8888/rest_place/place_list",
            method: "get",
            async: false,
            contentType: "application/json",
            success: function (resp) {
                console.log(resp)
                for (var i = 0; i < resp.length; i++) {
                    if (resp[i].placeSort === "카페") {
                        coffeePositions.push(new kakao.maps.LatLng(resp[i].placeX, resp[i].placeY))
                        contentCafe.push(resp[i]);
                    }
                    else if (resp[i].placeSort === "음식점") {
                        storePositions.push(new kakao.maps.LatLng(resp[i].placeX, resp[i].placeY))
                    }
                }
            }
        })


        var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
        coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
            storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
            carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다


        createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
        createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
        createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

        changeMarker('coffee'); // 지도에 커피숍 마커가 보이도록 설정합니다    


        // 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
        function createMarkerImage(src, size, options) {
            var markerImage = new kakao.maps.MarkerImage(src, size, options);
            return markerImage;
        }

        // 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
        function createMarker(position, image) {
            var marker = new kakao.maps.Marker({
                position: position,
                image: image
            });

            return marker;
        }
        // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
        function createCoffeeMarkers() {

            for (var i = 0; i < coffeePositions.length; i++) {

                var imageSize = new kakao.maps.Size(22, 26),
                    imageOptions = {
                        spriteOrigin: new kakao.maps.Point(10, 0),
                        spriteSize: new kakao.maps.Size(36, 98)
                    };

                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),
                    marker = createMarker(coffeePositions[i], markerImage);

                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="padding:5px;" class="edit" data-placeno=' + contentCafe[i].placeNo + '  data-placename= ' + contentCafe[i].placeName + ' >'
                        + contentCafe[i].placeName
                        + '</div>',// 인포윈도우에 표시할 내용
                    removable: true
                });

                // 생성된 마커를 커피숍 마커 배열에 추가합니다
                coffeeMarkers.push(marker);
                kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
            }
        }


        // 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setCoffeeMarkers(map) {
            for (var i = 0; i < coffeeMarkers.length; i++) {
                coffeeMarkers[i].setMap(map);
            }
        }

        // 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
        function createStoreMarkers() {
            for (var i = 0; i < storePositions.length; i++) {

                var imageSize = new kakao.maps.Size(22, 26),
                    imageOptions = {
                        spriteOrigin: new kakao.maps.Point(10, 36),
                        spriteSize: new kakao.maps.Size(36, 98)
                    };

                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),
                    marker = createMarker(storePositions[i], markerImage);

                // 생성된 마커를 편의점 마커 배열에 추가합니다
                storeMarkers.push(marker);
            }
        }

        // 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setStoreMarkers(map) {
            for (var i = 0; i < storeMarkers.length; i++) {
                storeMarkers[i].setMap(map);
            }
        }

        // 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
        function createCarparkMarkers() {
            for (var i = 0; i < carparkPositions.length; i++) {

                var imageSize = new kakao.maps.Size(22, 26),
                    imageOptions = {
                        spriteOrigin: new kakao.maps.Point(10, 72),
                        spriteSize: new kakao.maps.Size(36, 98)
                    };

                // 마커이미지와 마커를 생성합니다
                var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),
                    marker = createMarker(carparkPositions[i], markerImage);

                // 생성된 마커를 주차장 마커 배열에 추가합니다
                carparkMarkers.push(marker);
            }
        }

        // 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
        function setCarparkMarkers(map) {
            for (var i = 0; i < carparkMarkers.length; i++) {
                carparkMarkers[i].setMap(map);
            }
        }

        // 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
        function changeMarker(type) {

            var coffeeMenu = document.getElementById('coffeeMenu');
            var storeMenu = document.getElementById('storeMenu');
            var carparkMenu = document.getElementById('carparkMenu');

            // 커피숍 카테고리가 클릭됐을 때
            if (type === 'coffee') {

                // 커피숍 카테고리를 선택된 스타일로 변경하고
                coffeeMenu.className = 'menu_selected';

                // 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
                storeMenu.className = '';
                carparkMenu.className = '';

                // 커피숍 마커들만 지도에 표시하도록 설정합니다
                setCoffeeMarkers(map);
                setStoreMarkers(null);
                setCarparkMarkers(null);

            } else if (type === 'store') { // 편의점 카테고리가 클릭됐을 때

                // 편의점 카테고리를 선택된 스타일로 변경하고
                coffeeMenu.className = '';
                storeMenu.className = 'menu_selected';
                carparkMenu.className = '';

                // 편의점 마커들만 지도에 표시하도록 설정합니다
                setCoffeeMarkers(null);
                setStoreMarkers(map);
                setCarparkMarkers(null);

            } else if (type === 'carpark') { // 주차장 카테고리가 클릭됐을 때

                // 주차장 카테고리를 선택된 스타일로 변경하고
                coffeeMenu.className = '';
                storeMenu.className = '';
                carparkMenu.className = 'menu_selected';

                // 주차장 마커들만 지도에 표시하도록 설정합니다
                setCoffeeMarkers(null);
                setStoreMarkers(null);
                setCarparkMarkers(map);
            }
        }

        // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
        function makeOverListener(map, marker, infowindow) {
            return function () {
                infowindow.open(map, marker);
            };
        }

        // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
        function makeOutListener(infowindow) {
            return function () {
                infowindow.close();
            };
        }


    </script>
</body>

</html>