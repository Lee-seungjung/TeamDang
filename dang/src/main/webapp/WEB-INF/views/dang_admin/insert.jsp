<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

    <title>Document</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- Bootswatch CDN -->
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/cosmo/bootstrap.min.css">

    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />


    <style>
        .editor {
            min-height: 250px;
            border: 1px solid black;
            padding: 1em;
            font-size: 16px;
        }
        .accent{
            color : red;
            font-size: 13px;
        }
    </style>
</head>

<body>
    <div class="container-fluid mb-5">
        
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <h4>등록될 장소의 행정구역을 적어주세요:) <i class="accent">(필수)</i></h4>
            </div>
        </div>
        
        <div class="row mt-1">
            <div class="col-md-10 offset-md-1">
                <div class="form-floating">
                    <input type="text" name="placeArea" class="form-control rounded" placeholder="행정구역(구)">
                    <label>행정구역(구)</label>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <h4>등록될  장소의 좌표를 지정해 주세요:) <i class="accent">(필수)</i></h4>
            </div>
        </div>
        
        <div class="row mt-1">
            <div class="col-md-5 offset-md-1">
                <div class="form-floating">
                    <input type="text" name="placeX" class="form-control rounded" placeholder="위도">
                    <label>위도</label>
                </div>
            </div>
            <div class="col-md-5 offset">
                <div class="form-floating">
                    <input type="text" name="placeY" class="form-control rounded" placeholder="경도">
                    <label>경도</label>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <h4>등록될 장소의 카테고리를 선택해 주세요:) <i class="accent">(필수)</i></h4>
            </div>
        </div>
        <div class="row mt-1">
            <div class="col-md-10 offset-md-1">
                <div class="form-floating">
                    <input type="text" name="placeSort" class="form-control rounded" placeholder="카테고리">
                    <label>카테고리</label>
                </div>
            </div>
        </div>
        
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <h4>등록될 장소의 이름을 적어 주세요:) <i class="accent">(필수)</i></h4>
            </div>
        </div>
        <div class="row mt-1">
            <div class="col-md-10 offset-md-1">
                <div class="form-floating">
                    <input type="text" name="placeName" class="form-control rounded" placeholder="장소이름">
                    <label>장소이름</label>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <h4>등록될 장소의 정보를 적어 주세요:) <i class="accent">(필수)</i></h4>
            </div>
        </div>
        <div class="row mt-1">
            <div class="col-md-10 offset-md-1">
                <div class="form-floating">
                    <textarea name="placeInfo" class="form-control col-sm-5" rows="50"></textarea>
                    <label>(최대 500자 까지 가능합니다.)</label>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <h4>등록될 장소의 현주소를 적어 주세요:) <i class="accent">(필수)</i></h4>
            </div>
        </div>
        <div class="row mt-1">
            <div class="col-md-10 offset-md-1">
                <div class="form-floating">
                    <input type="text" name="placeAddress" class="form-control rounded" placeholder="현주소">
                    <label>현주소</label>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <h4>등록될 장소의 운영시간을 적어 주세요:) <i class="accent">(필수)</i></h4>
            </div>
        </div>
        <div class="row mt-1">
            <div class="col-md-10 offset-md-1">
                <div class="form-floating">
                    <input type="text" name="placeOperation" class="form-control rounded" placeholder="운영시간">
                    <label>운영시간</label>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <h4>등록될 장소의 휴무일을 적어 주세요:) <i class="accent">(필수)</i></h4>
            </div>
        </div>
        <div class="row mt-1">
            <div class="col-md-10 offset-md-1">
                <div class="form-floating">
                    <input type="text" name="placeOff" class="form-control rounded" placeholder="휴무일">
                    <label>휴무일</label>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <h4>등록될 장소의 전화번호를 적어 주세요:) <i class="accent">(필수)</i></h4>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <div class="form-floating">
                    <input type="text" name="placeTel" class="form-control rounded" placeholder="전화번호">
                    <label>전화번호</label>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <h4>등록될 장소의 홈페이지 주소를 적어 주세요:) <i class="accent">(필수)</i></h4>
            </div>
        </div>
        <div class="row mt-1">
            <div class="col-md-10 offset-md-1">
                <div class="form-floating">
                    <input type="text" name="placeUrl" class="form-control rounded" placeholder="정보URL">
                    <label>홈페이지 주소</label>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <h4>등록될 장소의 동반가능한 댕댕이 크기 적어 주세요:) <i class="accent">(필수)</i></h4>
            </div>
        </div>
        <div class="row mt-1">
            <div class="col-md-10 offset-md-1">
                <div class="form-floating">
                    <input type="text" name="dangSize" class="form-control rounded" placeholder="댕댕이 크기">
                    <label>댕댕이 크기</label>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <label for="formFileSm" class="form-label">이미지 사진을 올려주세요 :)</label>
                <input class="form-control form-control-sm file-input" id="formFileSm"  accept=".jpg, .png, .gif" type="file">
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <div>미리보기</div>
                <img src="" class="change-img" width="100" height="100">
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <button type="button" class="btn btn-primary insert-btn">등록</button><br>
            </div>
        </div>
        
       

        <input type="hidden" name="dangNo">
        <!--댕모임 첨부파일 댕모임 번호-->
        <input type="hidden" name="attachmentNo">
        <!--댕모임 첨부파일 첨부파일 번호-->

        
        <div id="map" style="width:1000px;height:350px;"></div>

    </div>






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
                    attachmentNo: attachmentNo,
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