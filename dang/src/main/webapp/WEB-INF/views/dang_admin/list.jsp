<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
   <jsp:param value="DangHome" name="title"/>
</jsp:include>

<style>
	
	/* 페이지네이션 */
	ul {
	    list-style: none;
	    margin:0px; 
	    padding:0px;
	}
	
	.ul-report-list-page-item {
		cursor : pointer;
		width : 2.5rem;
		height : 2rem;
		border : 1px solid #CEE3F2;
		color : #76BEFF;
	}
	
	.ul-report-list-page-item:hover {
		border : 2px solid #76BEFF;
		background-color : #F0F9FF;
	}
	
	.ul-report-list-page-item-selected {
		border : 2px solid #76BEFF;
		background-color : #76BEFF;
		color : white;
	}
	
	
	.overText {
            color: red;
    }
    
 	.strong-page-title {
		font-size : 30px;
	}

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
	width: 300px;
	height: 60px;
	z-index: 10;
	border-radius: 10px;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
	font-size: 12px;
	text-align: center;
	background-color: #fff;
}

.category .menu_selected {
	background: #76BEFF;
	color: #fff;
	margin: 0 -1px;
}

.category li {
	list-style: none;
	float: left;
	width: 60px;
	height: 60px;
	padding-top: 5px;
	cursor: pointer;
}

.category .ico_comm {
	display: block;
	margin: 0 auto 2px;
	width: 26px;
	height: 26px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png')
		no-repeat;
}

.category .ico_cafe {
	background-image: url("${pageContext.request.contextPath}/images/cafe-icon.png");
}

.category .ico_food {
	background-image: url("${pageContext.request.contextPath}/images/food-icon.png");
}

.category .ico_field {
	background-image: url("${pageContext.request.contextPath}/images/field-icon.png");
}

.category .ico_dogsalon {
	background-image: url("${pageContext.request.contextPath}/images/salon-icon.png");
}

.category .ico_park {
	background-image: url("${pageContext.request.contextPath}/images/park-icon.png");
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

.border1 {
	border: 1px solid #F2F2F2;
}

.input1{
	border : 2px solid #F781D8;
	height: 50px;
}

.box1{
	border : 2px solid #F781D8;
	height: 50px;
	border-radius: 5px;
	background: white;
}

.modal-place-body{
	border-radius: 0.3rem;
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    margin: 15px;
    height: 150px;
	}
    .body1{
        width: 33%;
        position: relative;
    }
    .body2{
        width: 67%;
        padding: 10px;
    }
    .span-placeoperation{
        font-size: 14px;
    }
    .span-placetel{
        color: #76BEFF;
        font-size: 15px;
    }
    .place-img{
        width:150px;
        height:150px;
        border-radius: 0.3em;
    }
    .span-placearea{
        border-radius: 0.4em;
        background-color: #FF8888;
        color: white;
        position: absolute;
        font-size: 13px;
        top: 3px;
        left: 4px;
    }
    .span-placesort{
        font-size: 14px;
        color: gray;
    }
    .span-placename{
        font-weight: bolder;
    }
    .span-placeaddress{
        font-size: 14px;
        word-spacing: 1px;
        letter-spacing: -1px;
    }
    .span-placeoff{
	    border-radius: 3px;
	    background-color: #F1F1F0;
	    color: #5A5A5A;
	    font-size: 13px;
    }
    
    
    .btn-place-delete{
    background-color: #F94888;
    color: white;
    }
    .fa-square-phone{
    color: #C2C4C6;
    font-size: 18px;
    margin-right: 7px;
    }
    .span-placeurl{
    display: none;
    }
    .invalid-money{
      font-size: 0.875em;
	  color: red;
    }
    .modal-header .btn-close{
    	margin:-0.5rem -0.5rem 4.5rem auto;
    }
    .nick-font{
    	font-size:20px;
    	font-weight:bolder;
    	letter-spacing:0.7px;
    }
    .modal-profile-btn{
    	font-size:16px;
    	text-align:center;
    }
    .modal-profile-report-btn{
    	text-align:center;
    	padding:5px 10px;
    }
    .modal-profile-siren{
    	width:22px;
    	height:22px;
    	margin-bottom:3px;
    }
    .fn:focus{
    	box-shadow: none;
    }
    .profile-info-img{
    	 width:130px;
    	 height:130px;
    	 margin-left:100%;
    	 margin-top:50%;
    }
    .profile-info-owner{
    	 width:30px;
    	 height:30px;
    	 margin-left:750%;
    	 margin-top:215%;
    	 display:none;
    }
    
    table {
	  background-color: skyblue;
	  border-collapse: collapse;
	  border-radius: 10px;
	  border-style: hidden;
	}
</style>

	<div class="container-fluid mb-5">
		
		<div class="row mt-3 mb-3">
			<div class="col-lg-1 offset-md-2 text-lg-start text-center">
			</div>
			<div class="col-lg-2 offset-md-2 text-lg-start text-center">
				<strong class = "strong-page-title">댕모임 조회</strong>
			</div>
			<div class="col-lg-2 offset-md-2 text-lg-start  me-3">
				<button type="button" class="btn btn-primary text-center" data-bs-toggle="modal" data-bs-target="#exampleModal">
				  장소 등록
				</button>
			</div>
		</div>
		
		<div class="row mt-2">
			<div class="col-md-8 offset-md-2">
				<div id="mapwrap">
					<!-- 지도가 표시될 div -->
					<div id="map1" style="width: 100%; height: 400px;"></div>
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
		
		<div class="row mt-3">
			<div class="col-md-8 offset-md-2">
			<c:forEach var="placeList" items="${placeList}">
				<table class="table">
				  <tbody class="mt-3">
				  	
				    <tr class="mt-3">
				      <th width="150px" scope="row"><img width="150px" height="150px" src="http://localhost:8888/rest_attachment/download/1000"></th>
				      <td>
				      	<div class="row mt-3">
				      		<div class="col fw-bold">${placeList.placeName}</div>
				      	</div>
				      	<div class="row mt-1">
				      		<div class="col" style="font-size: 11px">${placeList.placeAddress}</div>
				      	</div>
				      	<div class="row mt-4">
				      		<div class="col" style="font-size: 11px">${placeList.placeTel}</div>
				      	</div>
				      	<div class="row mt-1">
				      		<div class="col" style="font-size: 11px">${placeList.dangSize}까지 가능</div>
				      	</div>
				      </td>
				      <td class="text-end mt-2 fw-bold">
					      <div class="row mt-3  me-1">
					      		<div class="col fw-bold">${placeList.placeSort}</div>
					      </div>
				      </td>
				    </tr>
				 
				  </tbody>
				 
				</table>
				    </c:forEach>
			</div>
		</div>
		
		
		
		<%-- 검색창 --%>
		<div class="row mt-3">
			<div class="col-md-8 offset-md-2 text-center">
				<p style="font-weight: bold">서울시 곳곳의 댕댕이 동반장소를 검색해주세요 :)</p>
			</div>
		</div>
		
		<form action = "place_list" method = "get">
		<div class="row mt-3">
			<div class="col-3">
				<!-- <select class="form-select" name = "type" required>
					<option value = "place_name">제목</option>
					<option value = "place_info">내용</option>
				</select> -->
			</div>
			<div class="col-6">
				<input class="w-100 input1 form-control rounded" type="text" name = "keyword" placeholder = "검색어" value = "${placeListRequestDto.keyword}" required>
			</div>
			<div class="col-3">
				<button  class="w-100 box1" type = "submit">검색</button
			></div>
		</div>
		</form>
		
		
	<div class="row mt-3 text-center">
			<%-- 페이지 네비게이터 --%>
			<ul class="pagination text-center">
				<c:choose>
					<c:when test = "${placeListRequestDto.isFirst()}">
						<li class="page-item">
							<a class="page-link" href = "">&laquo;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href = "place_list?p=${placeListRequestDto.firstBlock()}&${placeListRequestDto.parameter()}">&laquo;</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test = "${placeListRequestDto.hasPrev()}">
						<li class="page-item">
							<a class="page-link" href = "place_list?p=${placeListRequestDto.prevBlock()}&${placeListRequestDto.parameter()}">&lt;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href = "">&lt;</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<c:forEach var = "i" begin = "${placeListRequestDto.startBlock()}" end = "${placeListRequestDto.endBlock()}" step = "1">
					<li class="page-item">
						<a class="page-link" href = "place_list?p=${i}&${placeListRequestDto.parameter()}">${i}</a>
					</li>
				</c:forEach>
				
				<c:choose>
					<c:when test = "${placeListRequestDto.hasNext()}">
						<li class="page-item">
							<a class="page-link" href = "place_list?p=${placeListRequestDto.nextBlock()}&${placeListRequestDto.parameter()}">&gt;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href = "">&gt;</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test = "${placeListRequestDto.isLast()}">
						<li class="page-item">
							<a class="page-link" href = "">&raquo;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href = "place_list?p=${placeListRequestDto.lastBlock()}&${placeListRequestDto.parameter()}">&raquo;</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
			</div>
		</div>
		
		<!-- <div class="row mt-3">
			<div class="col-md-8 offset-md-2 text-center">
				<p style="font-weight: bold">서울시 곳곳의 댕댕이 동반장소를 검색해주세요 :)</p>
			</div>
			<div class="col-md-6 offset-md-3 text-center">
				<div class="row">
					<div class="col-10">
						<input class="w-100 input1 form-control rounded" type="text" name="placeName" value="" placeholder="장소명을 검색해주세요 :)">	
					</div>
					<div class="col-2 m-0">
						<button type="button" class="w-100 box1" onclick="getSearchList()">검색</button>
					</div>
				</div>
				
				
			</div>
		</div> -->
		
		<!-- <div class="row mt-3 ">
			<div class="col-md-8 offset-md-2" >
				<div class="row  firstLine" >
					
				</div>
			</div>
		</div> -->




	<div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-place-body">
                    <div class="body-flex body1">
                        <span class="span-placearea px-2"></span>
                    <img src=""  class="place-img origin-img">
                </div>
                <div class="body-flex body2">
                    <span class="span-placename"></span>
                     <span  class="span-placesort"></span><br>
                    <span class="span-placeaddress"></span><br>
                    <span class="span-placeoff px-2"></span>
                    <span class="span-placeoperation"></span><br>
                    <i class="fa-solid fa-square-phone"> </i><span class="span-placetel"></span><br>
                    <span  class="span-placeurl"></span>
                    </div>
                </div>
                <div class="modal-footer pt-0">
                    <button type="button" class="btn btn-secondary " onclick="detailMove()">상세보기</button>
                    <button type="button" class="btn btn-place-delete" onclick="deleteMarker()">장소삭제하기</button>
                    <button type="button" class="btn btn-warning btn-placeinfoModal" data-bs-target="#editPlace" data-bs-toggle="modal" >장소수정하기</button>                
                </div>
            </div>
        </div>
    </div>
    
    <!-- 장소마커 수정을 위한 모달 -->
<div class="modal fade" id="editPlace" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
        <h3 class="modal-title text-center mt-2">장소 수정하기</h3>
      <div class="modal-body">
        <form>
        <div class="row mt-2">
            <div class="col-md-10 offset-md-1">
                <p>수정할 장소의 행정구역을 적어주세요:) <i class="accent">(필수)</i></p>
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
                <p>수정할  장소의 좌표를 지정해 주세요:) <i class="accent">(필수)</i></p>
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
                <p>수정할 장소의 카테고리를 선택해 주세요:) <i class="accent">(필수)</i></p>
            </div>
        </div>
        <div class="row mt-1">
            <div class="col-md-10 offset-md-1">
                <div class="form-floating">
                    <select class="form-select" name="placeSort">
                    	<option value="카페">카페
                    	<option value="음식점">음식점
                    	<option value="놀이터">놀이터
                    	<option value="미용">미용
                    	<option value="공원">공원
		            </select>
                    <label>카테고리</label>
                </div>
            </div>
        </div>
        
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <p>수정할 장소의 이름을 적어 주세요:) <i class="accent">(필수)</i></p>
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
                <p>수정할 장소의 정보를 적어 주세요:) <i class="accent">(필수)</i></p>
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
                <p>수정할 장소의 현주소를 적어 주세요:) <i class="accent">(필수)</i></p>
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
                <p>수정할 장소의 운영시간을 적어 주세요:) <i class="accent">(필수)</i></p>
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
                <p>수정할 장소의 휴무일을 적어 주세요:) <i class="accent">(필수)</i></p>
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
                <p>수정할 장소의 전화번호를 적어 주세요:) <i class="accent">(필수)</i></p>
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
                <p>수정할 장소의 홈페이지 주소를 적어 주세요:) <i class="accent">(필수)</i></p>
            </div>
        </div>
        <div class="row mt-1">
            <div class="col-md-10 offset-md-1">
                <div class="form-floating">
                    <input type="text" value="" name="placeUrl" class="form-control rounded" placeholder="정보URL">
                    <label>홈페이지 주소</label>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <p>수정할 장소의 동반가능한 댕댕이 크기 적어 주세요:) <i class="accent">(필수)</i></p>
            </div>
        </div>
        <div class="row mt-1">
            <div class="col-md-10 offset-md-1">
                <div class="form-floating">
                    <select class="form-select" name="dangSize">
                    	<option value="소형견">소형견
                    	<option value="중형견">중형견
                    	<option value="대형견">대형견
		            </select>
                    <label>댕댕이 크기</label>
                </div>
            </div>
        </div>
		</form>
      </div>
      
      
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="editMarker()">수정하기</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="closeEdit()">닫기</button>
      </div>
    </div>
  </div>
</div>

	<!-- 등록하기 모달 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		        <h3 class="modal-title text-center mt-2">장소 등록하기</h3>
		      <div class="modal-body">
		         
		        <div class="row mt-4">
		            <div class="col-md-10 offset-md-1">
		                <p>등록될 장소의 행정구역을 적어주세요:) <i class="accent">(필수)</i></p>
		            </div>
		        </div>
		        
		        <div class="row mt-1">
		            <div class="col-md-10 offset-md-1">
		                <div class="form-floating">
		                    <input type="text" name="placeArea1" class="form-control rounded" placeholder="행정구역(구)">
		                    <label>행정구역(구)</label>
		                </div>
		            </div>
		        </div>
		
		        <div class="row mt-4">
		            <div class="col-md-10 offset-md-1">
		                <p>등록될  장소의 좌표를 지정해 주세요:) <i class="accent">(필수)</i></p>
		            </div>
		        </div>
		        
		        <div class="row mt-1">
		            <div class="col-md-5 offset-md-1">
		                <div class="form-floating">
		                    <input type="text" name="placeX1" class="form-control rounded" placeholder="위도">
		                    <label>위도</label>
		                </div>
		            </div>
		            <div class="col-md-5 offset">
		                <div class="form-floating">
		                    <input type="text" name="placeY1" class="form-control rounded" placeholder="경도">
		                    <label>경도</label>
		                </div>
		            </div>
		        </div>
		
		        <div class="row mt-4">
		            <div class="col-md-10 offset-md-1">
		                <p>등록될 장소의 카테고리를 선택해 주세요:) <i class="accent">(필수)</i></p>
		            </div>
		        </div>
		        <div class="row mt-1">
		            <div class="col-md-10 offset-md-1">
		                <div class="form-floating">
		                    <select class="form-select" name="placeSort1">
		                    	<option value="카페">카페
		                    	<option value="음식점">음식점
		                    	<option value="놀이터">놀이터
		                    	<option value="미용">미용
		                    	<option value="공원">공원
		                    </select>
		                    <label>카테고리</label>
		                </div>
		            </div>
		        </div>
		        
		        <div class="row mt-4">
		            <div class="col-md-10 offset-md-1">
		                <p>등록될 장소의 이름을 적어 주세요:) <i class="accent">(필수)</i></p>
		            </div>
		        </div>
		        <div class="row mt-1">
		            <div class="col-md-10 offset-md-1">
		                <div class="form-floating">
		                    <input type="text" name="placeName1" class="form-control rounded" placeholder="장소이름">
		                    <label>장소이름</label>
		                </div>
		            </div>
		        </div>
		
		        <div class="row mt-4">
		            <div class="col-md-10 offset-md-1">
		                <p>등록될 장소의 정보를 적어 주세요:) <i class="accent">(필수)</i></p>
		            </div>
		        </div>
		        <div class="row mt-1">
		            <div class="col-md-10 offset-md-1">
		                <div class="form-floating">
		                    <textarea name="placeInfo1" class="form-control col-sm-5" rows="50"></textarea>
		                    <label>(최대 500자 까지 가능합니다.)</label>
		                </div>
		            </div>
		        </div>
		        <div class="row mt-4">
		            <div class="col-md-10 offset-md-1">
		                <p>등록될 장소의 현주소를 적어 주세요:) <i class="accent">(필수)</i></p>
		            </div>
		        </div>
		        <div class="row mt-1">
		            <div class="col-md-10 offset-md-1">
		                <div class="form-floating">
		                    <input type="text" name="placeAddress1" class="form-control rounded" placeholder="현주소">
		                    <label>현주소</label>
		                </div>
		            </div>
		        </div>
		        <div class="row mt-4">
		            <div class="col-md-10 offset-md-1">
		                <p>등록될 장소의 운영시간을 적어 주세요:) <i class="accent">(필수)</i></p>
		            </div>
		        </div>
		        <div class="row mt-1">
		            <div class="col-md-10 offset-md-1">
		                <div class="form-floating">
		                    <input type="text" name="placeOperation1" class="form-control rounded" placeholder="운영시간">
		                    <label>운영시간</label>
		                </div>
		            </div>
		        </div>
		        <div class="row mt-4">
		            <div class="col-md-10 offset-md-1">
		                <p>등록될 장소의 휴무일을 적어 주세요:) <i class="accent">(필수)</i></p>
		            </div>
		        </div>
		        <div class="row mt-1">
		            <div class="col-md-10 offset-md-1">
		                <div class="form-floating">
		                    <input type="text" name="placeOff1" class="form-control rounded" placeholder="휴무일">
		                    <label>휴무일</label>
		                </div>
		            </div>
		        </div>
		        <div class="row mt-4">
		            <div class="col-md-10 offset-md-1">
		                <p>등록될 장소의 전화번호를 적어 주세요:) <i class="accent">(필수)</i></p>
		            </div>
		        </div>
		        <div class="row mt-4">
		            <div class="col-md-10 offset-md-1">
		                <div class="form-floating">
		                    <input type="text" name="placeTel1" class="form-control rounded" placeholder="전화번호">
		                    <label>전화번호</label>
		                </div>
		            </div>
		        </div>
		        <div class="row mt-4">
		            <div class="col-md-10 offset-md-1">
		                <p>등록될 장소의 홈페이지 주소를 적어 주세요:) <i class="accent">(필수)</i></p>
		            </div>
		        </div>
		        <div class="row mt-1">
		            <div class="col-md-10 offset-md-1">
		                <div class="form-floating">
		                    <input type="text" name="placeUrl1" class="form-control rounded" placeholder="정보URL">
		                    <label>홈페이지 주소</label>
		                </div>
		            </div>
		        </div>
		        <div class="row mt-4">
		            <div class="col-md-10 offset-md-1">
		                <p>등록될 장소의 동반가능한 댕댕이 크기 적어 주세요:) <i class="accent">(필수)</i></p>
		            </div>
		        </div>
		        <div class="row mt-1">
		            <div class="col-md-10 offset-md-1">
		                <div class="form-floating">
		                    <select class="form-select" name="dangSize1">
		                    	<option value="소형견">소형견
		                    	<option value="중형견">중형견
		                    	<option value="대형견">대형견
		                    </select>
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
		                
		            </div>
		        </div>
		        <input type="hidden" name="dangNo1">
		        <!--댕모임 첨부파일 댕모임 번호-->
		        <input type="hidden" name="attachmentNo1">
		        <!--댕모임 첨부파일 첨부파일 번호-->
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary insertClose" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary insert-btn">등록</button><br>
		      </div>
		    </div>
		  </div>
		</div>
		
		

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b9a95746698992180eedc27d9eef265"></script>
	<script>
	
	 function closeEdit() {
		$('#editPlace').modal('hide')
	} 
	 
 	$('#editPlace').on('hidden.bs.modal', function (e) {
 		 $(this).find('form')[0].reset()
	});
	
	//닫기 모달 클릭시 초기화
	$('.modal').on('hidden.bs.modal', function (e) {
		  $("[name=placeArea1]").val("");
	      $("[name=placeX1]").val("");
	      $("[name=placeY1]").val("");
	      $("[name=placeSort1]").val("");
	      $("[name=placeName1]").val("");
	      $("[name=placeInfo1]").val("");
	      $("[name=placeAddress1]").val("");
	      $("[name=placeOperation1]").val("");
	      $("[name=placeOff1]").val("");
	      $("[name=placeTel1]").val("");
	      $("[name=placeUrl1]").val("");
	      $("[name=dangSize1]").val("");
	      $("[name=attachmentNo1]").val("");
	})


	$("[name=placeInfo1]").on("input",function(){
		var textLength = $(this).val().length;
		var value = $(this).val();
		//상태메시지 글자수 표시
		$(".length").text(textLength);
		$(this).removeClass("is-valid is-invalid");
		if(textLength==500){
			$(".length").css("color","red").text(500);
			$(this).addClass("is-valid");
		}else if(textLength>500){
			$(this).val(value.substring(0,500));	
			$(".length").css("color","red").text(500);
			$(this).addClass("is-invalid");
		}else if(textLength>0){
			$(".length").css("color","#495057");
			$(this).addClass("is-valid");
		}
	});
	$("[name=placeInfo]").on("input",function(){
		var textLength = $(this).val().length;
		var value = $(this).val();
		//상태메시지 글자수 표시
		$(".length").text(textLength);
		$(this).removeClass("is-valid is-invalid");
		if(textLength==500){
			$(".length").css("color","red").text(500);
			$(this).addClass("is-valid");
		}else if(textLength>500){
			$(this).val(value.substring(0,500));	
			$(".length").css("color","red").text(500);
			$(this).addClass("is-invalid");
		}else if(textLength>0){
			$(".length").css("color","#495057");
			$(this).addClass("is-valid");
		}
	});

    //버튼클릭시 실행
    $(".insert-btn").click(function () {
        var placeArea = $("[name=placeArea1]").val();
        var placeX = $("[name=placeX1]").val();
        var placeY = $("[name=placeY1]").val();
        var placeSort = $("[name=placeSort1]").val();
        var placeName = $("[name=placeName1]").val();
        var placeInfo = $("[name=placeInfo1]").val().replace(/\n/g, "<br />");
        var placeAddress = $("[name=placeAddress1]").val();
        var placeOperation = $("[name=placeOperation1]").val();
        var placeOff = $("[name=placeOff1]").val();
        var placeTel = $("[name=placeTel1]").val();
        var placeUrl = $("[name=placeUrl1]").val();
        var dangSize = $("[name=dangSize1]").val();
        var attachmentNo = $("[name=attachmentNo1]").val();
		console.log(placeX=="");
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
		if(confirm("정말 등록하시겠습니까?")==true){
			$.ajax({
                url: "http://localhost:8888/rest_place/place_insert",
                method: "post",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function () {
                    location.href="${pageContext.request.contextPath}/admin/place_list"
					
                }
            });
		}else{
			 return;
		}
        
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
                    $("[name=attachmentNo1]").val(newAttachmentNo); //name=attachmentNo input태그에 값 넣기

                }
            });
        }
    });

	
	
	function editMarker() {
		var placeNo = placeNoInfo;
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
		var dangSize = $("[name=dangSize]").val();
		
		
		var data = {
				placeNo : placeNo,
				placeArea:placeArea,
				placeX : placeX,
				placeY : placeY,
				placeSort : placeSort,
				placeName : placeName,
				placeInfo : placeInfo,
				placeAddress : placeAddress,
				placeOperation : placeOperation,
				placeOff : placeOff,
				placeTel : placeTel,
				placeUrl : placeUrl,
				dangSize : dangSize
			};
			console.log(placeSort);
			 $.ajax({
				url:"${pageContext.request.contextPath}/rest_place/update",
				method:"put",
				contentType:"application/json",
				data:JSON.stringify(data),
				success:function(){
					location.href = "http://localhost:8888/admin/place_list";
				}
			});  
	}
	
	//장소 마커를 삭제하는 함수
	function deleteMarker(){
		if(confirm("정말삭제하시겠습니까?")==true){
			$.ajax({
				url : "http://localhost:8888/rest_place/detail/"+placeNoInfo,
				method : "delete",
				async : false,
				contentType : "application/json",
				success : function(resp) {
					location.href = "http://localhost:8888/admin/place_list";
				}
			})
		}else{
			return;
		}
		
			
	};
	// 장소검색시 실행되는 함수
	function getSearchList(){
		var keyword = $("[name=placeName]").val();
		$.ajax({
			url : "http://localhost:8888/rest_place/place_search?placeName="
				+ keyword,
		method : "get",
		async : false,
		contentType : "application/json",
		success : function(resp) {
			//console.log(resp);
			var firstline=$(".firstLine");
			firstline.empty();
			
				for(i=0;i<resp.length;i++){
					style="background-color : #F2F2F2" 
					//console.log(resp[i].placeSort);
					var col1 = $("<div>").attr("class","col-2 mt-5 border1").attr("style", "background-color : #F2F2F2; border-radius: 20px 0px 0px 20px;");
					var img1 = $("<img>").attr("src","http://localhost:8888/rest_attachment/download/"+resp[i].attachmentNo).attr("style","width:150px; height:150px;");
					col1.append(img1);
					var col8 = $("<div>").attr("class","col-8 mt-5 border1").attr("style", "background-color : #F2F2F2;");
					var p1= $("<p>").attr("class","mb-3 mt-2").text(resp[i].placeName);
					var p2= $("<p>").attr("class","m-1").text(resp[i].placeAddress).attr("style","font-size : 9px;");
					var p3= $("<p>").attr("class","m-0").text( resp[i].dangSize+"까지 가능").attr("style","font-size : 9px;");
					col8.append(p1).append(p2).append(p3);
					var col2 = $("<div>").attr("class","col-2 text-end mt-5 border1 ").attr("style", "background-color : #F2F2F2; border-radius: 0px 20px 20px 0px;");
					var span1 = $("<span>").text( resp[i].placeSort+" ").attr("class","mt-3").attr("style","font-size : 9px; color: #F781D8;");
					col2.append(span1);
					var i1 = $("<i>");
					if(resp[i].placeSort=="카페"){
						i1.attr("class","fa-solid fa-mug-saucer mt-2").attr("style","font-size : 9px; color: #F781D8;");
					} else if(resp[i].placeSort=='음식점'){
						i1.attr("class","fa-solid fa-utensils mt-2").attr("style","font-size : 9px; color: #F781D8;");
					}else if(resp[i].placeSort=='미용'){
						i1.attr("class","fa-solid fa-scissors mt-2").attr("style","font-size : 9px; color: #F781D8;");
					}else if(resp[i].placeSort=='운동장'){
						i1.attr("class","fa-solid fa-person-running mt-2").attr("style","font-size : 9px; color: #F781D8;");
					}else if(resp[i].placeSort=='공원'){
						i1.attr("class","fa-thin fa-trees mt-2").attr("style","font-size : 9px; color: #F781D8;");
					}
					col2.append(i1);
					firstline.append(col1).append(col8).append(col2);
				}
			}
		})
	}
	
		
		var placeNoInfo; //장소번호를 가져오는 변수
		var placeContents = []; // 장소번호를 가져와 내용을 담는 변수
		var placeOriginNo; // 클릭한 마커의 데이터장소번호를 뽑아내는 변수
		
		
		function detailMove() {
			location.href = "http://localhost:8888/place/detail/"+placeNoInfo;
		}
		$(document).on("click",".infoModal",function(e) {
			
			$("#infoModal").modal("show");//모달 실행

			placeNoInfo = $(this).data("placeno");

			
			
			//비동기통신 시작
			$.ajax({
				url : "http://localhost:8888/rest_place/place_one/"+ placeNoInfo,
				method : "get",
				async : false,
				contentType : "application/json",
				success : function(resp) {
					//클릭한 마커의 해당하는 placeNo를 data속성 추가
					$(".span-placeaddress").text(resp.placeAddress);
					$(".span-placearea").text(resp.placeArea);
					$(".span-placeinfo").html(resp.placeInfo);
					$(".span-placename").text(resp.placeName);
					$(".span-placeoff").text(resp.placeOff);
					$(".span-placeoperation").text(resp.placeOperation);
					$(".span-placesort").text(resp.placeSort);
					$(".span-placetel").text(resp.placeTel);
					$(".span-placeurl").text(resp.placeUrl);
					$(".origin-img").attr("src","http://localhost:8888/rest_attachment/download/"+ resp.attachmentNo);
					//수정 input태그에 값 밀어넣기
					$('input[name=placeArea]').attr('value',resp.placeArea);
					$('input[name=placeX]').attr('value',resp.placeX);
					$('input[name=placeY]').attr('value',resp.placeY);
					$('input[name=placeSort]').attr('value',resp.placeSort);
					$('input[name=placeName]').attr('value',resp.placeName);
					$('textarea[name=placeInfo]').text(resp.placeInfo);
					$('input[name=placeAddress]').attr('value',resp.placeAddress);
					$('input[name=placeOperation]').attr('value',resp.placeOperation);
					$('input[name=placeOff]').attr('value',resp.placeOff);
					$('input[name=placeTel]').attr('value',resp.placeTel);
					$('input[name=placeUrl]').attr('value',resp.placeUrl);
					$('input[name=dangSize]').attr('value',resp.dangSize);
				}
			})
		});
		

		/* function restPlaceList() {
			//비동기통신 시작
			$.ajax({
				url : "http://localhost:8888/rest_place/place_one/"+ placeNoInfo,
				method : "get",
				async : false,
				contentType : "application/json",
				success : function(resp) {
					  $("[name=placeArea]").val("");
				      $("[name=placeX]").val("");
				      $("[name=placeY]").val("");
				      $("[name=placeSort]").val("");
				      $("[name=placeName]").val("");
				      $("[name=placeInfo]").val("");
				      $("[name=placeAddress]").val("");
				      $("[name=placeOperation]").val("");
				      $("[name=placeOff]").val("");
				      $("[name=placeTel]").val("");
				      $("[name=placeUrl]").val("");
				      $("[name=dangSize]").val("");
				      $("[name=attachmentNo]").val("");
					//수정 input태그에 값 밀어넣기
					$('input[name=placeArea]').attr('value',resp.placeArea);
					$('input[name=placeX]').attr('value',resp.placeX);
					$('input[name=placeY]').attr('value',resp.placeY);
					$('input[name=placeSort]').attr('value',resp.placeSort);
					$('input[name=placeName]').attr('value',resp.placeName);
					$('textarea[name=placeInfo]').text(resp.placeInfo);
					$('input[name=placeAddress]').attr('value',resp.placeAddress);
					$('input[name=placeOperation]').attr('value',resp.placeOperation);
					$('input[name=placeOff]').attr('value',resp.placeOff);
					$('input[name=placeTel]').attr('value',resp.placeTel);
					$('input[name=placeUrl]').attr('value',resp.placeUrl);
					$('input[name=dangSize]').attr('value',resp.dangSize);
					console.log(resp.placeArea)
				}
			})
		}; */
		
		var mapContainer1 = document.getElementById('map1'), // 지도를 표시할 div  
		mapOption1 = {
			center : new kakao.maps.LatLng(37.498004414546934,
					127.02770621963765), // 지도의 중심좌표 
			level : 9
		// 지도의 확대 레벨 
		};

		var map1 = new kakao.maps.Map(mapContainer1, mapOption1); // 지도를 생성합니다

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
		

		kakao.maps.event.addListener(map1,'zoom_changed',function(){
		    chkArea(); // 함수 호출
		});

		kakao.maps.event.addListener(map1,'dragend',function(){
		    chkArea(); // 함수 호출
		});

		chkArea(); // 함수 실행

		// 해당영역에 영역 범위 좌표값을 부를 계산 변수 저장과 ajax호출 함수
		function chkArea(){

		    var bounds = map1.getBounds(); //지도의 영역을 반환한다.
		    var sw = bounds.getSouthWest(); //영역의 남서쪽 좌표를 반환한다.
		    var ne = bounds.getNorthEast(); //영역의 북동쪽 좌표를 반환한다.

		    lat1=sw.La;//영역의 남서쪽 좌표를 저장
		    lng1=sw.Ma;//영역의 남서쪽 좌표를 저장
		    lat2=ne.La;//영역의 북동쪽 좌표를 저장
		    lng2=ne.Ma;//영역의 북동쪽 좌표를 저장

		
		$.ajax({
			url: "http://localhost:8888/rest_place/place_list_area?lat1="+lat1+"&lng1="+lng1+"&lat2="+lat2+"&lng2="+lng2,//저장된 변수를 파라미터로 넘김
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
						parkPositions.push(new kakao.maps.LatLng(
								resp[i].placeX, resp[i].placeY))
						contentPark.push(resp[i]);
					}
				}
			}
		})
		};
		var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png'; // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
		var cafemarkerImageSrc = "${pageContext.request.contextPath}/images/cafe-icon.png"; // 카페의 마커이미지의 주소입니다.
		var foodmarkerImageSrc = "${pageContext.request.contextPath}/images/food-icon.png"; // 카페의 마커이미지의 주소입니다.
		var fieldmarkerImageSrc = "${pageContext.request.contextPath}/images/field-icon.png"; // 카페의 마커이미지의 주소입니다.
		var dogsalonmarkerImageSrc = "${pageContext.request.contextPath}/images/salon-icon.png"; // 카페의 마커이미지의 주소입니다.
		var parkmarkerImageSrc = "${pageContext.request.contextPath}/images/park-icon.png"; // 카페의 마커이미지의 주소입니다.

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
										var thisPosition = this.getPosition().Ma
										var thisPostionX = contentCafe[i].placeX
										if (thisPostionX.toFixed(7) === thisPosition.toFixed(7)) {
											placeOriginNo = contentCafe[i].placeNo;
											content = '<div class="customoverlay">'
													+ '  <a class="infoModal" data-placeno=' + contentCafe[i].placeNo + ' target="_blank">'
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
												map : map1,
												position : position,
												content : content,
												yAnchor : 1
											});

									//다른 마커 클릭시 오버레이 닫기
									if (clickedOverlay) {
										clickedOverlay.setMap(null);
									}
									customOverlay.setMap(map1);
									clickedOverlay = customOverlay;
									
									

								});
			}
		}
		

		// 카페 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setCafeMarkers(map1) {
			for (var i = 0; i < cafeMarkers.length; i++) {
				cafeMarkers[i].setMap(map1);
			}
		}

		// 음식점 마커를 생성하고 음식점 마커 배열에 추가하는 함수입니다
		function createFoodMarkers() {
			for (var i = 0; i < foodPositions.length; i++) {

				var imageSize = new kakao.maps.Size(40, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(0, 0),
					spriteSize : new kakao.maps.Size(20, 20)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(foodmarkerImageSrc, imageSize,
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
										var thisPosition = this.getPosition().Ma
										var thisPostionX = contentFood[i].placeX

										if (thisPostionX.toFixed(7) === thisPosition.toFixed(7)) {
											placeOriginNo = contentFood[i].placeNo;
											content = '<div class="customoverlay">'
													+ '  <a class="infoModal" data-placeno=' + contentFood[i].placeNo + ' target="_blank">'
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
												map : map1,
												position : position,
												content : content,
												yAnchor : 1
											});

									//다른 마커 클릭시 오버레이 닫기
									if (clickedOverlay) {
										clickedOverlay.setMap(null);
									}
									customOverlay.setMap(map1);
									clickedOverlay = customOverlay;

								});
			}
		}

		// 음식점 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setFoodMarkers(map1) {
			for (var i = 0; i < foodMarkers.length; i++) {
				foodMarkers[i].setMap(map1);
			}
		}

		// 운동장 마커를 생성하고 운동장 마커 배열에 추가하는 함수입니다
		function createFieldMarkers() {
			for (var i = 0; i < fieldPositions.length; i++) {

				var imageSize = new kakao.maps.Size(40, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(0, 0),
					spriteSize : new kakao.maps.Size(20, 20)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(fieldmarkerImageSrc, imageSize,
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
										var thisPosition = this.getPosition().Ma
										var thisPostionX = contentField[i].placeX

										if (thisPostionX.toFixed(7) === thisPosition.toFixed(7)) {
											placeOriginNo = contentField[i].placeNo;
											content = '<div class="customoverlay">'
													+ '  <a class="infoModal" data-placeno=' + contentField[i].placeNo + ' target="_blank">'
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
												map : map1,
												position : position,
												content : content,
												yAnchor : 1
											});

									//다른 마커 클릭시 오버레이 닫기
									if (clickedOverlay) {
										clickedOverlay.setMap(null);
									}
									customOverlay.setMap(map1);
									clickedOverlay = customOverlay;

								});
			}
		}

		// 운동장 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setFieldMarkers(map1) {
			for (var i = 0; i < fieldMarkers.length; i++) {
				fieldMarkers[i].setMap(map1);
			}
		}

		// 미용 마커를 생성하고 미용 마커 배열에 추가하는 함수입니다
		function createDogsalonMarkers() {
			for (var i = 0; i < dogsalonPositions.length; i++) {

				var imageSize = new kakao.maps.Size(40, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(0, 0),
					spriteSize : new kakao.maps.Size(20, 20)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(dogsalonmarkerImageSrc, imageSize,
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
										var thisPosition = this.getPosition().Ma
										var thisPostionX = contentDogsalon[i].placeX

										if (thisPostionX.toFixed(7) === thisPosition.toFixed(7)) {
											placeOriginNo = contentDogsalon[i].placeNo;
											content = '<div class="customoverlay">'
													+ '  <a class="infoModal" data-placeno=' + contentDogsalon[i].placeNo + ' target="_blank">'
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
												map : map1,
												position : position,
												content : content,
												yAnchor : 1
											});

									//다른 마커 클릭시 오버레이 닫기
									if (clickedOverlay) {
										clickedOverlay.setMap(null);
									}
									customOverlay.setMap(map1);
									clickedOverlay = customOverlay;

								});
			}
		}

		// 미용 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setDogsalonMarkers(map1) {
			for (var i = 0; i < dogsalonMarkers.length; i++) {
				dogsalonMarkers[i].setMap(map1);
			}
		}
		console.log(dogsalonPositions);
		// 공원 마커를 생성하고 공원 마커 배열에 추가하는 함수입니다
		function createParkMarkers() {
			for (var i = 0; i < parkPositions.length; i++) {

				var imageSize = new kakao.maps.Size(40, 26), imageOptions = {
					spriteOrigin : new kakao.maps.Point(0, 0),
					spriteSize : new kakao.maps.Size(20, 20)
				};
				
				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(parkmarkerImageSrc, imageSize,
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
										var thisPosition = this.getPosition().Ma
										var thisPostionX = contentPark[i].placeX

										if (thisPostionX.toFixed(7) === thisPosition.toFixed(7)) {
											placeOriginNo = contentPark[i].placeNo;
											content = '<div class="customoverlay">'
													+ '  <a class="infoModal" data-placeno=' + contentPark[i].placeNo + ' target="_blank">'
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
												map : map1,
												position : position,
												content : content,
												yAnchor : 1
											});

									//다른 마커 클릭시 오버레이 닫기
									if (clickedOverlay) {
										clickedOverlay.setMap(null);
									}
									customOverlay.setMap(map1);
									clickedOverlay = customOverlay;

								});
			}
		}

		// 공원 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setParkMarkers(map1) {
			for (var i = 0; i < parkMarkers.length; i++) {
				parkMarkers[i].setMap(map1);
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
				setCafeMarkers(map1);
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
				setFoodMarkers(map1);
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
				setFieldMarkers(map1);
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
				setDogsalonMarkers(map1);
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
				setParkMarkers(map1);
			}
			
			
		}
	</script>
