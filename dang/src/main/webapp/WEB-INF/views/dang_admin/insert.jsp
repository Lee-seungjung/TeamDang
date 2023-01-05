<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

    <title>Document</title>

</head>

<body>
    <label>행정구역(구)
        <input type="text" name="placeArea"><br><br>
    </label>
    <label>위도
        <input type="text" name="placeX"><br><br>
    </label>
    <label>경도
        <input type="text" name="placeY"><br><br>
    </label>
    <label>카테고리
        <input type="text" name="placeSort"><br><br>
    </label>
    <label>장소이름
        <input type="text" name="placeName"><br><br>
    </label>
    <label>장소정보
        <input type="text" name="placeInfo"><br><br>
    </label>
    <label>장소주소
        <input type="text" name="placeAddress"><br><br>
    </label>
    <label>운영시간
        <input type="text" name="placeOperation"><br><br>
    </label>
    <label>휴무일
        <input type="text" name="placeOff"><br><br>
    </label>
    <label>전화번호
        <input type="text" name="placeTel"><br><br>
    </label>
    <label>가게정보주소
        <input type="text" name="placeUrl"><br><br>
        <button type="button" class="btn btn-positive insert-btn">등록</button>
    </label>

    <div id="map" style="width:1000px;height:350px;"></div>





    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b9a95746698992180eedc27d9eef265"></script>
    <script type="text/javascript">
        $(function () {

            //버튼클릭시 실행
            $(".insert-btn").click(function () {
                var placeArea = $("[name=placeArea]").val();
                var placeX = $("[name=placeX]").val();
                var placeY = $("[name=placeY]").val();
                var placeSort = $("[name=placeSort]").val();
                var placeName = $("[name=placeName]").val();
                var placeInfo = $("[name=placeInfo]").val();
                var placeAddress = $("[name=placeAddress]").val();
                var placeOperation = $("[name=placeOperation]").val();
                var placeOff = $("[name=placeOff]").val();
                var placeTel = $("[name=placeTel]").val();
                var placeUrl = $("[name=placeUrl]").val();

                //검사
                placeInsert(placeArea, placeX, placeY, placeSort, placeName,
                    placeInfo, placeAddress, placeOperation, placeOff,
                    placeTel, placeUrl
                );

                // $("[name=placeArea]").val("");
                // $("[name=placeX]").val("");
                // $("[name=placeY]").val("");
                // $("[name=placeSort]").val("");
                // $("[name=placeName]").val("");
                // $("[name=placeInfo]").val("");
                // $("[name=placeAddress]").val("");
                // $("[name=placeOperation]").val("");
                // $("[name=placeOff]").val("");
                // $("[name=placeTel]").val("");
                // $("[name=placeUrl]").val("");
            });

            //장소등록을 하기위한 함수
            function placeInsert(
                placeArea, placeX, placeY, placeSort, placeName,
                placeInfo, placeAddress, placeOperation, placeOff,
                placeTel, placeUrl
            ) {
                var data = {
                    placeArea: placeArea,
                    placeX: placeX,
                    placeY: placeY,
                    placeSort: placeSort,
                    placeName: placeName,
                    placeInfo: placeInfo,
                    placeAddress: placeAddress,
                    placeOperation: placeOperation,
                    placeOff: placeOff,
                    placeTel: placeTel,
                    placeUrl: placeUrl,
                };

                $.ajax({
                    url: "http://localhost:8888/rest_place/place_insert",
                    method: "post",
                    contentType: "application/json",
                    data: JSON.stringify(data),
                    success: function () {
                        console.log("등록성공");
                        
                    }
                });
            }

        });

        $.ajax({
            url: "http://localhost:8888/rest_place/place_list",
            method: "get",
            contentType: "application/json",
            success: function (resp) {
                console.log(resp);
            }
        });

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(37.554614, 126.970730), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 마커가 표시될 위치입니다 
        var markerPosition = new kakao.maps.LatLng(37.554614, 126.970730);

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);  
    </script>
</body>

</html>