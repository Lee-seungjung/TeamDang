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

    <style>
        .editor {
            min-height: 250px;
            border: 1px solid black;
            padding: 1em;
            font-size: 16px;
        }
    </style>
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
        <textarea type="text" name="placeInfo" rows="20" cols="40"></textarea><br><br>
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
    </label>
    <label> 댕댕이 크기
        <input type="text" name="dangSize"><br><br>
    </label>
    <label>첨부파일
        <input type="file" class="file-input" accept=".jpg, .png, .gif">
    </label><br><br>
    <label>미리보기
        <div>
            <img src="" class="change-img" width="100" height="100">
        </div>
    </label><br><br>

    <input type="hidden" name="dangNo">
    <!--댕모임 첨부파일 댕모임 번호-->
    <input type="hidden" name="attachmentNo">
    <!--댕모임 첨부파일 첨부파일 번호-->

    <button type="button" class="btn btn-positive insert-btn">등록</button><br>
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
                var placeInfo = $("[name=placeInfo]").val().replace(/\n/g, "<br />");
                var placeAddress = $("[name=placeAddress]").val();
                var placeOperation = $("[name=placeOperation]").val();
                var placeOff = $("[name=placeOff]").val();
                var placeTel = $("[name=placeTel]").val();
                var placeUrl = $("[name=placeUrl]").val();
                var dangSize = $("[name=dangSize]").val();
                var attachmentNo = $("[name=attachmentNo]").val();

                //검사
                placeInsert(placeArea, placeX, placeY, placeSort, placeName,
                    placeInfo, placeAddress, placeOperation, placeOff,
                    placeTel, placeUrl, dangSize, attachmentNo
                );


            });

            //장소등록을 하기위한 함수
            function placeInsert(
                placeArea, placeX, placeY, placeSort, placeName,
                placeInfo, placeAddress, placeOperation, placeOff,
                placeTel, placeUrl, dangSize, attachmentNo
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
                    dangSize: dangSize,
                    attachmentNo : attachmentNo,
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


            $(".file-input").change(function () {
                var value = $(this).val();

                if (this.files.length > 0) {

                    var formData = new FormData();
                    formData.append("attachment", this.files[0]);


                    $.ajax({
                        url: "http://localhost:8888/rest_attachment/upload",
                        method: "post",
                        data: formData,
                        //jquery에서는 multipart 요청을 위해 다음 설정 2가지를 반드시 작성해야한다
                        processData: false,
                        contentType: false,
                        success: function (resp) {
                            console.log(resp);
                            $(".change-img").attr("src", resp); //프로필 미리보기
                            //원래 페이지 프로필 정보 변경
                            var check = resp.lastIndexOf("/"); //경로에서 /위치 찾기
                            var newAttachmentNo = resp.substr(check + 1); //attachmentNo 꺼내기
                            console.log(newAttachmentNo);
                            $("[name=attachmentNo]").val(newAttachmentNo); //name=attachmentNo input태그에 값 넣기

                        }
                    });
                }
            });
        });




    </script>
</body>

</html>