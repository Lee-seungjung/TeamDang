<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="댕댕이 정보 변경" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/mypage_menu.jsp"></jsp:include>

<style>
	
	* {
	    
	}
	
	.div-puppy-insert,
	.div-dropdown-change-puppy-info-menu {
	    cursor : pointer;
	}
	
	.i-puppy-insert {
	    font-size : 72px;
	}
	
	.div-puppy-info {
	    height : 33em;
	    border-radius: 15px;
	    border: 20px solid #EBEBEB;
	    box-shadow: 3px 3px 3px #E0E0E0;
	}
	
	.btn-dropdown-change-puppy-info {
	    border: none;
	    background-color: white;
	}
	
	.img-puppy-profile {
	    border-radius: 50%;
	    aspect-ratio: 1/1;
	}
	
	.i-puppy-gender-male {
	    color: #76BEFF;
	}
	
	.i-puppy-gender-female {
	    color: #F94888;
	}
	
	.div-puppy-info-menu {
	    border-radius: 5px;
	    border : 2px solid #EBEBEB;
	}
	
	.div-puppy-info-menu-category {
	    border-radius: 5px;
	    background-color: #76BEFF;
	    color: white;
	}
	
	.div-puppy-character-list {
	    height : 7em;
	    border-radius: 10px;
	    border : 2px solid #EBEBEB;
	}
	
	.span-puppy-character {
	    font-size : 16px;
	    color: #76BEFF;
	}
	
	/* --- 댕모임 목록 스타일 */
	
	.select-modal-insert-puppy-gender {
		color : rgba(117, 117, 117);
	}
	
	.select-modal-insert-puppy-gender-none {
		color : rgba(117, 117, 117);
	}
	
	.select-modal-insert-puppy-gender-male {
		color: #76BEFF; 
	}
	
	.select-modal-insert-puppy-gender-female {
		color: #F94888;
	}
	
	.div-modal-puppy-insert-info {
	    height : 44em;
	    border-radius: 15px;
	    border: 2px solid #EBEBEB;
	}
	
	.btn-modal-insert-puppy-close {
	    border : none;
	    background-color: white;
	    font-size: 24px;
	}
	
	input, 
	select, 
	.span-modal-insert-puppy-helper-text {
	    font-size : 16px;
	    border : none;
	}
	
	.label-modal-insert-puppy-profile,
	.label-modal-edit-puppy-profile {
	    border-radius: 50%;
	    aspect-ratio: 1/1;
	}
	
	.img-modal-insert-puppy-profile,
	.img-modal-edit-puppy-profile {
	    border-radius: 50%;
	    aspect-ratio: 1/1;
	}
	
	.input-modal-insert-puppy-profile,
	.input-modal-edit-puppy-profile {
	    display : none;
	}
	
	.input-modal-insert-puppy-age::-webkit-outer-spin-button,
	.input-modal-insert-puppy-age::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	}
	
	.btn-modal-insert-puppy-character,
	.btn-modal-edit-puppy-character {
	    font-size: 24px;
	}
	
	.div-puppy-info-menu-category-character-list {
	    height: 9em;
	}
	
	.span-modal-edit-puppy-character,
	.input-modal-edit-puppy-character {
	    font-size : 16px;
	    color: #76BEFF;
	}
	
	.btn-modal-edit-puppy-submit,
	.btn-modal-insert-puppy-submit {
	    background-color : #76BEFF;
	    color : white;
	    border: none;
	    border-radius : 5px;
	}
	
	.btn-modal-insert-puppy-cancel {
	    background-color : #787878;
	    color : white;
	    border: none;
	    border-radius : 5px;
	}
</style>

<div class = "container-fluid my-3">	
	<div class = "row">
		<div class = "col-8 offset-2 my-3 py-5">
			<div class = "row">
				<div class = "col d-flex justify-content-center align-items-center">				
					<a href = "mypage">댕댕이 정보 변경</a>
				</div>
			</div>
			<div class = "row">
				<div class = "col-4 px-4 pt-2 pb-3">
                    <div class = "row align-items-center div-puppy-info div-puppy-insert">
                        <div class = "col d-flex flex-column justify-content-center align-items-center">
                            <i class="fa-solid fa-plus my-1 i-puppy-insert"></i>
                            <span class = "my-1">댕댕이를 추가하려면</span>
                            <span class = "my-1">이곳을 클릭하세요</span>
                        </div>
                    </div>
                </div>
                
                <c:forEach var = "dangPuppyList" items = "${dangPuppyList}">
                <div class="col-4 px-4 pt-2 pb-3">
	                <div class="row div-puppy-info">
	                    <div class = "col">
	                        <div class = "row py-2">
	                            <div class="dropdown d-flex justify-content-end">
	                                <div class="fa-solid fa-ellipsis div-dropdown-change-puppy-info-menu" data-bs-toggle="dropdown"></div>
	                                <ul class="dropdown-menu">
	                                    <li><button class="dropdown-item btn-dropdown-edit-puppy-info" type="button">수정</button></li>
	                                    <li><button class="dropdown-item btn-dropdown-delete-puppy-info" type="button">삭제</button></li>
	                                </ul>
	                            </div>
	                            <%-- 댕댕이 정보 --%>
	                            <input type = "hidden" class = "input-puppy-no" value = "${dangPuppyList.dangPuppyInfoDto.puppyNo}">
	                            <input type = "hidden" class = "input-puppy-name" value = "${dangPuppyList.dangPuppyInfoDto.puppyName}">
	                            <input type = "hidden" class = "input-puppy-age" value = "${dangPuppyList.dangPuppyInfoDto.puppyAge}">
	                            <input type = "hidden" class = "input-puppy-gender" value = "${dangPuppyList.dangPuppyInfoDto.puppyGender}">
	                            <input type = "hidden" class = "input-puppy-attachment-no" value = "${dangPuppyList.dangPuppyInfoDto.attachmentNo}">
	                            <c:if test = "${dangPuppyList.dangPuppyCharacter.size() != 0}">
	                            <c:forEach var = "dangPuppyCharacter" items = "${dangPuppyList.dangPuppyCharacter}">					
								<input type = "hidden" class = "input-puppy-character" value = "${dangPuppyCharacter}">
								</c:forEach>
	                            </c:if>
	                        </div>
	                        <div class = "row mt-3 mb-4">
	                            <div class="offset-3 col-6 d-flex justify-content-center align-items-center">
	                                <c:choose>
									<c:when test = "${dangPuppyList.dangPuppyInfoDto.attachmentNo != null}">
									<img class = "w-100 img-puppy-profile" src = "${pageContext.request.contextPath}/rest_attachment/download/${dangPuppyList.dangPuppyInfoDto.attachmentNo}">
									</c:when>
									<c:otherwise>
									<img class = "w-100 img-puppy-profile" src = "${pageContext.request.contextPath}/images/mypage-mydang_edit_gray.png">
									</c:otherwise>
									</c:choose>
	                            </div>
	                        </div>
	                        <div class = "row my-3">
	                            <div class = "offset-2 col-8">
	                                <div class = "row div-puppy-info-menu">
	                                    <div class = "col-4 py-1 d-flex justify-content-center align-items-center div-puppy-info-menu-category">
	                                        <strong>이름</strong>
	                                    </div>
	                                    <div class = "col-8 py-1 d-flex align-items-center div-puppy-info-menu-content">
	                                        <span>${dangPuppyList.dangPuppyInfoDto.puppyName}</span>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class = "row my-3">
	                            <div class = "offset-2 col-8">
	                                <div class = "row div-puppy-info-menu">
	                                    <div class = "col-4 py-1 d-flex justify-content-center align-items-center div-puppy-info-menu-category">
	                                        <strong>나이</strong>
	                                    </div>
	                                    <div class = "col-8 py-1 d-flex align-items-center div-puppy-info-menu-content">
	                                        <span>${dangPuppyList.dangPuppyInfoDto.puppyAge}살</span>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class = "row my-3">
	                            <div class = "offset-2 col-8">
	                                <div class = "row div-puppy-info-menu">
	                                    <div class = "col-4 py-1 d-flex justify-content-center align-items-center div-puppy-info-menu-category">
	                                        <strong>성별</strong>
	                                    </div>
	                                    <div class = "col-8 py-1 d-flex align-items-center div-puppy-info-menu-content">
	                                        <c:choose>
			                                <c:when test = "${dangPuppyList.dangPuppyInfoDto.puppyGender == 'M'}">
			                                <span>남아</span>
		                                    <i class="fa-solid fa-mars ms-2 i-puppy-gender-male"></i>
			                                </c:when>
			                               	<c:otherwise>
			                           		<span>여아</span>
		                                    <i class="fa-solid fa-venus ms-2 i-puppy-gender-female"></i>
			                               	</c:otherwise>
			                                </c:choose>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class = "row my-2">
	                            <div class = "offset-2 col-8 py-2 px-3 d-flex flex-column div-puppy-character-list">
	                                <c:if test = "${dangPuppyList.dangPuppyCharacter.size() != 0}">
		                            <div class = "row">
		                                <c:forEach var = "dangPuppyCharacter" items = "${dangPuppyList.dangPuppyCharacter}">					
										<strong class = "span-puppy-character my-1">#${dangPuppyCharacter}</strong>
										</c:forEach>
		                            </div>
		                            </c:if>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            </c:forEach>
			</div>
		</div>
	</div>
</div>

<%-- 댕댕이 등록 Modal --%>
<!-- <%-- 댕댕이 등록 Modal --%> -->
<div class="modal fade" id="modalInsertPuppy" data-bs-backdrop="static" tabindex="-1" aria-modal="true" role="dialog"> 
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content div-modal-puppy-insert-info">
            <div class="container-fluid px-4 py-2">
                <div class = "row">
                    <div class = "col d-flex justify-content-end align-items-center">
                        <button type="button" class="fa-solid fa-xmark btn-modal-insert-puppy-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                </div>
                <div class = "row mt-3 mb-5">
                    <div class = "offset-3 col-6 d-flex justify-content-center align-items-center">
                        <label class = "label-modal-insert-puppy-profile w-100" for = "insertPuppyProfile">
                            <img class = "img-modal-insert-puppy-profile w-100" src = "${pageContext.request.contextPath}/images/mypage-mydang_edit_gray.png">
                            <input class = "input-modal-insert-puppy-profile" id = "insertPuppyProfile" type = "file" accept = ".png, .jpg">
                        </label>
                    </div>
                </div>
                <div class = "row my-4">
                    <div class = "offset-1 col-10">
                        <div class = "row div-puppy-info-menu">
                            <div class = "col-4 py-1 d-flex justify-content-center align-items-center div-puppy-info-menu-category">
                                <strong>이름</strong>
                            </div>
                            <input class = "col-8 py-1 d-flex align-items-center div-puppy-info-menu-content input-modal-insert-puppy-name" type = "text" maxlength="10" placeholder="이름(5자 이내)">
                        </div>
                    </div>
                </div>
                <div class = "row my-4">
                    <div class = "offset-1 col-10">
                        <div class = "row div-puppy-info-menu">
                            <div class = "col-4 py-1 d-flex justify-content-center align-items-center div-puppy-info-menu-category">
                                <strong>나이</strong>
                            </div>
                            <input class = "col-8 py-1 d-flex align-items-center div-puppy-info-menu-content input-modal-insert-puppy-age" type = "text" placeholder="나이">
                        </div>
                    </div>
                </div>
                <div class = "row my-4">
                    <div class = "offset-1 col-10">
                        <div class = "row div-puppy-info-menu">
                            <div class = "col-4 py-1 d-flex justify-content-center align-items-center div-puppy-info-menu-category">
                                <strong>성별</strong>
                            </div>
                            <select class = "col-8 py-1 d-flex align-items-center div-puppy-info-menu-content select-modal-insert-puppy-gender">
                                <option value = "" class = "select-modal-insert-puppy-gender-none">성별</option>
                                <option value = "M" class = "select-modal-insert-puppy-gender-male">남아</option>
                                <option value = "F" class = "select-modal-insert-puppy-gender-female">여아</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class = "row my-4">
                    <div class = "offset-1 col-10">
                        <div class = "row div-puppy-info-menu">
                            <div class = "col-4 d-flex flex-column justify-content-center align-items-center div-puppy-info-menu-category div-puppy-info-menu-category-character-list">
                                <strong>특이사항</strong>
                                <i class="fa-solid fa-square-plus mt-2 btn-insert-puppy-character btn-modal-insert-puppy-add-character"></i>
                            </div>
                            <div class = "col-8 py-2 d-flex flex-column div-puppy-info-menu-content div-modal-insert-puppy-character-list">
                            </div>
                        </div>
                    </div>
                </div>
                <div class = "row my-4">
                    <div class = "offset-1 col-10">
                        <div class = "row">
                            <div class = "col-6">
                                <button class="w-100 py-1 btn-modal-insert-puppy-cancel">취소</button>
                            </div>
                            <div class = "col-6">
                                <button class="w-100 py-1 btn-modal-insert-puppy-submit">저장</button>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
        </div>
    </div>
</div>

<%-- 
<div class="modal fade" id="modalInsertPuppy" data-bs-backdrop="static" tabindex="-1" aria-modal="true" role="dialog"> 
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content div-modal-puppy-info">
            <div class="container-fluid px-3 py-1">
                <div class="row">
                    <div class="col-5 pt-5 px-3 d-flex flex-column justify-content-start align-items-center">
                        <label class = "label-modal-insert-puppy-profile w-100" for = "insertPuppyProfile">
                            <img class = "img-modal-insert-puppy-profile w-100" src = "${pageContext.request.contextPath}/images/mypage-mydang_edit_gray.png">
                            <input class = "input-modal-insert-puppy-profile" id = "insertPuppyProfile" type = "file" accept = ".png, .jpg">
                        </label>
                        <button class="mt-5 w-100 btn-modal-insert-puppy-submit">저장</button>
                    </div>
                    <div class="col-7 pt-4">
                        <div class="row my-2">
                            <div class="col-5 d-flex justify-content-center align-items-center">
                                <strong>이름</strong>
                            </div>
                            <div class="col-7 div-modal-insert-puppy-name">
                                <input class = "w-100 input-modal-insert-puppy-name" type = "text" maxlength="10" placeholder="이름(5자 이내)">
                            </div>
                        </div>
                        <div class="row my-2">
                            <div class="col-5 d-flex justify-content-center align-items-center">
                                <strong>나이</strong>
                            </div>
                            <div class="col-7 div-modal-insert-puppy-age">
                                <input class = "w-50 input-modal-insert-puppy-age" type = "text" placeholder="나이">
                            </div>
                        </div>
                        <div class="row my-2">
                            <div class="col-5 d-flex justify-content-center align-items-center">
                                <strong>성별</strong>
                            </div>
                            <div class="col-7">
                                <select class = "w-100 select-modal-insert-puppy-gender">
                                    <option value = "">성별</option>
                                    <option value = "M">남아</option>
                                    <option value = "F">여아</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-6 d-flex justify-content-center align-items-center">
                                <span class="span-modal-insert-puppy-helper-text">특이사항</span>
                                <i class="fa-solid fa-square-plus ms-1 btn-insert-puppy-character btn-modal-insert-puppy-add-character"></i>
                            </div>
                        </div>
                        <div class="row ms-2">
                            <div class="col div-modal-insert-puppy-character-list">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> --%>

<%-- 댕댕이 수정 Modal --%>
<div class="modal fade" id="modalEditPuppy" data-bs-backdrop="static" tabindex="-1" aria-hidden="true"> 
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content div-modal-puppy-info">
            <div class="container-fluid px-3 py-1">
                <div class="row">
                	<input class = "input-modal-edit-puppy-no" type = "hidden">
                    <div class="col-5 pt-4 px-3 d-flex flex-column justify-content-start align-items-center">
                        <label class = "label-modal-edit-puppy-profile" for = "editPuppyProfile">
                            <img class = "img-modal-edit-puppy-profile w-100" src = "${pageContext.request.contextPath}/images/mypage-mydang_edit_gray.png">
                            <input class = "input-modal-edit-puppy-profile" id = "editPuppyProfile" type = "file" accept = ".png, .jpg">
                        </label>
                        <button class = "mt-5 w-100 btn-modal-edit-puppy-submit">저장</button>
                    </div>
                    <div class="col-7 pt-4">
                        <div class="row my-2">
                            <div class="col-5 d-flex justify-content-center align-items-center">
                                <strong>이름</strong>
                            </div>
                            <div class="col-7 div-modal-edit-puppy-name">
                                <input class = "w-100 input-modal-edit-puppy-name" type = "text" maxlength="10" placeholder="이름(5자 이내)">
                            </div>
                        </div>
                        <div class="row my-2">
                            <div class="col-5 d-flex justify-content-center align-items-center">
                                <strong>나이</strong>
                            </div>
                            <div class="col-7 div-modal-edit-puppy-age">
                                <input class = "w-50 input-modal-edit-puppy-age" type = "text" placeholder="나이">살
                            </div>
                        </div>
                        <div class="row my-2">
                            <div class="col-5 d-flex justify-content-center align-items-center">
                                <strong>성별</strong>
                            </div>
                            <div class="col-7">
                                <select class = "w-100 select-modal-edit-puppy-gender">
                                    <option value = "">성별</option>
                                    <option value = "M">남아</option>
                                    <option value = "F">여아</option>
                                </select>
                            </div>
                        </div>
                        <div class = "row my-3 ms-3">
                            <div class = "col d-flex flex-column div-modal-edit-puppy-character-list"></div> <%-- 댕댕이 특이사항 --%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">

	$(function(){
		
		// 마이페이지 메뉴 색 변경
		$(".img-change-puppy-info").attr("src", "${pageContext.request.contextPath}/images/mypage-mydang_edit_pink.png");

		// 댕댕이 등록 Modal
		$(".div-puppy-insert").click(function(){
			$("#modalInsertPuppy").modal("show");
		});
		
		// 업로드하려는 댕댕이 프로필 사진 미리보기
		$(".input-modal-insert-puppy-profile").change(function(){
			if(this.files.length > 0) {
				var formData = new FormData();
				formData.append("attachment", this.files[0]);
				$.ajax({
					url : "${pageContext.request.contextPath}/rest_attachment/upload",
					method : "post",
					data : formData,
					processData:false,
                    contentType:false,
                    success : function(resp) {
                    	$(".img-modal-insert-puppy-profile").prop("src", resp);
                    }
				});
			}
		});
		
		// 댕댕이 이름
		$(document).on("input", ".input-modal-insert-puppy-name", function(){
			var insertPuppyName = $(this).val();
			if(insertPuppyName == "") {
				puppyInsertValid.checkPuppyName = false;
				return;
			}
			puppyInsertValid.checkPuppyName = true;
		});
		
		// 댕댕이 나이
		$(document).on("input", ".input-modal-insert-puppy-age", function(){
			var inputPuppyAge = $(this).val();
			var regexp = /^\d{1,2}$/;
			if(!regexp.test(inputPuppyAge)) {
				$(this).val(inputPuppyAge.substring(0, inputPuppyAge.length - 1));
				puppyInsertValid.checkPuppyAge = false;
				return
			} 
			puppyInsertValid.checkPuppyAge = true;
		});
		
		// 댕댕이 성별
		$(document).on("change", ".select-modal-insert-puppy-gender", function(){
			var selectPuppyGender = $(this).val();
			$(this).removeClass("select-modal-insert-puppy-gender-male select-modal-insert-puppy-gender-female");
			if(selectPuppyGender == "") {
				puppyInsertValid.checkPuppyGender = false;
				return;
			}
			if($(this).val() == "M") {
				$(this).addClass("select-modal-insert-puppy-gender-male");
			} else {
				$(this).addClass("select-modal-insert-puppy-gender-female");
			}
			puppyInsertValid.checkPuppyGender = true;
		});
		
		// 댕댕이 등록 Modal에서 특이사항 +버튼
		$(".btn-modal-insert-puppy-add-character").click(function(){
            if($(".div-modal-insert-puppy-character").length == 3) {
                return;
            }

            $(".div-modal-insert-puppy-character-list").append(
                $("<div>").attr("class", "d-flex flex-row justify-content-center align-items-center my-2 div-modal-insert-puppy-character")
                    .append(
                        $("<input>").attr("class", "w-100 input-modal-insert-puppy-character").attr("maxlength", 10).attr("placeholder", "특이사항(5자 이내)")
                    )
                    .append(
                        $("<i>").attr("class", "fa-solid fa-square-check ms-1 btn-modal-insert-puppy-character btn-modal-insert-puppy-character-submit")      
                    )
                    .append(
                        $("<i>").attr("class", "fa-solid fa-square-xmark ms-1 btn-modal-insert-puppy-character btn-modal-insert-puppy-character-delete")            
                    )
            )
        });

		// 댕댕이 등록 Modal에서 특이사항 x버튼
        $(document).on("click", ".btn-modal-insert-puppy-character-delete", function(){
            $(this).parent().remove();
        });
		
		// 댕댕이 등록 Modal에서 특이사항 체크 버튼
		$(document).on("click", ".btn-modal-insert-puppy-character-submit", function(){
			var characterContent = $(this).prev().val();
			if(characterContent == "") {
				return;
			}
			$(this).prev().attr("disabled", true);
			$(this).attr("class", "fa-solid fa-square-pen ms-1 btn-modal-insert-puppy-character btn-modal-insert-puppy-character-edit");
		});
		
		// 댕댕이 등록 Modal에서 특이사항 수정 버튼
		$(document).on("click", ".btn-modal-insert-puppy-character-edit", function(){
			$(this).prev().attr("disabled", false);
			$(this).attr("class", "fa-solid fa-square-check ms-1 btn-modal-insert-puppy-character btn-modal-insert-puppy-character-submit");
		});
		
		// 댕댕이 등록 Modal에서 저장 버튼
		$(document).on("click", ".btn-modal-insert-puppy-submit", function(){
			// - 댕댕이 특이사항에서 모두 체크 버튼을 눌렀는지 확인
			if($(".btn-modal-insert-submit-puppy-character").length >= 1) {
				puppyInsertValid.checkPuppyCharacter = false;
				return;
			} else {
				puppyInsertValid.checkPuppyCharacter = true;
			}
			
			if(puppyInsertValid.isAllValid() == false) {
				return;
			}
			
			// 전송할 데이터 객체
			var formData = new FormData();
			
			// 필수입력 정보
			formData.append("puppyName", $(".input-modal-insert-puppy-name").val());
			formData.append("puppyAge", $(".input-modal-insert-puppy-age").val());
			formData.append("puppyGender", $(".select-modal-insert-puppy-gender").val());
			
			// 선택사항 정보
			// - 댕댕이 사진
			if($(".input-modal-insert-puppy-profile").get(0).files[0] != null) {
				formData.append("puppyImg", $(".input-modal-insert-puppy-profile").get(0).files[0]);
			}
			
			// - 댕댕이 특이사항
			if($(".btn-modal-insert-puppy-character-edit").length != 0) {
				var puppyCharacterListInsert = [];
				for(var i = 0 ; i < $(".input-modal-insert-puppy-character").length ; i ++) {
					puppyCharacterListInsert.push($(".input-modal-insert-puppy-character").eq(i).val());
				}
				formData.append("puppyCharacter", puppyCharacterListInsert);
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_puppy/insert",
				method : "post",
				data : formData,
				enctype:"multipart/form-data",
				processData:false,
				contentType: false,
				success : function(resp){
					console.log(resp);
					console.log("성공");
					alert("댕댕이가 등록되었습니다!");
					clearInsertPuppyModal();
					$("#modalInsertPuppy").modal("hide");
				}
			});
		});
		
		// 댕댕이 등록 유효성 검사
        var puppyInsertValid = {
   			checkPuppyName : false,
   			checkPuppyAge : false,
   			checkPuppyGender : false,
   			checkPuppyCharacter : false,
   			// 판정 결과 반환
   			isAllValid : function() {
   				return this.checkPuppyName && this.checkPuppyAge && this.checkPuppyGender && this.checkPuppyCharacter;
   			}
   		};
		
		function clearInsertPuppyModal() {
			// 첨부파일 초기화
			$(".input-modal-insert-puppy-profile").val("");
			$(".img-modal-insert-puppy-profile").attr("src", "${pageContext.request.contextPath}/images/mypage-mydang_edit_gray.png"); // 링크 초기화 필요
			// 댕댕이명 초기화
			$(".input-modal-insert-puppy-name").val("");
			// 댕댕이 나이 초기화
			$(".input-modal-insert-puppy-age").val("");
			// 댕댕이 성별 초기화
			$($(".select-modal-insert-puppy-gender").get(0), ":option:eq(0)").prop("selected", true);
			// 댕댕이 특이사항 초기화
			$(".div-modal-insert-puppy-character-list").empty();
		}
		
		// 댕댕이 수정 Modal
		$(document).on("click", ".btn-dropdown-edit-puppy-info", function(){
			// 기준점
			var norm = $(this).parents(".dropdown");
			// 댕댕이 번호 설정
			$(".input-modal-edit-puppy-no").val(norm.nextAll(".input-puppy-no").val());
			// 댕댕이 이름 설정
			$(".input-modal-edit-puppy-name").val(norm.nextAll(".input-puppy-name").val());
			// 댕댕이 나이 설정
			$(".input-modal-edit-puppy-age").val(norm.nextAll(".input-puppy-age").val());
			// 댕댕이 성별 설정
			var puppyGenderSelected = norm.nextAll(".input-puppy-gender").val();
			$(".select-modal-edit-puppy-gender").val(puppyGenderSelected).prop("selected", true);
			// 댕댕이 프로필 첨부파일 설정
			var puppyAttachmentNo = norm.nextAll(".input-puppy-attachment-no").val();
			$(".img-modal-edit-puppy-profile").attr("src", "${pageContext.request.contextPath}/rest_attachment/download/" + puppyAttachmentNo);
			// 댕댕이 특이사항 설정
			if(norm.nextAll(".input-puppy-character").length != 0) {
				for(var i = 0 ; i < norm.nextAll(".input-puppy-character").length ; i ++) {
					$(".div-modal-edit-puppy-character-list").append(
						$("<div>").attr("class", "d-flex flex-row justify-content-center align-items-center")
							.append(
								$("<span>").attr("class", "w-100 my-1 count-modal-edit-puppy-character span-modal-edit-puppy-character").text("#" + norm.nextAll(".input-puppy-character").eq(i).val())	
							)
							.append(
								$("<i>").attr("class", "fa-solid fa-square-pen ms-1 btn-modal-edit-puppy-character btn-modal-edit-puppy-edit-character")		
							)
							.append(
								$("<i>").attr("class", "fa-solid fa-square-xmark ms-1 btn-modal-edit-puppy-character btn-modal-edit-puppy-delete-character")		
							)
					)
				}
				
				if(norm.nextAll(".input-puppy-character").length < 3) {
					$(".div-modal-edit-puppy-character-list").append(
						$("<div>").attr("class", "d-flex flex-row justify-content-center align-items-center")
							.append(
								$("<label>").attr("class", "w-100 my-1 d-flex justify-content-center align-items-center label-modal-add-puppy-character btn-modal-edit-puppy-add-character")
									.append(
										$("<i>").attr("class", "fa-solid fa-square-plus btn-modal-edit-puppy-character btn-modal-edit-puppy-add-character")		
									)
							)
					)
				}
			} else {
				$(".div-modal-edit-puppy-character-list").append(
						$("<div>").attr("class", "d-flex flex-row justify-content-center align-items-center")
							.append(
								$("<label>").attr("class", "w-100 my-1 d-flex justify-content-center align-items-center label-modal-add-puppy-character btn-modal-edit-puppy-add-character")
									.append(
										$("<i>").attr("class", "fa-solid fa-square-plus btn-modal-edit-puppy-character btn-modal-edit-puppy-add-character")		
									)
							)
					)
			}
			$("#modalEditPuppy").modal("show");
		});
		
		// 댕댕이 수정 Modal 내 프로필 사진 첨부시 미리보기
		$(".input-modal-edit-puppy-profile").change(function(){
			if(this.files.length > 0) {
				var formData = new FormData();
				formData.append("attachment", this.files[0]);
				$.ajax({
					url : "${pageContext.request.contextPath}/rest_attachment/upload",
					method : "post",
					data : formData,
					processData:false,
                    contentType:false,
                    success : function(resp) {
                    	$(".img-modal-edit-puppy-profile").prop("src", resp);
                    }
				});
			}
		});
		
		// 댕댕이 수정 Modal 수정 아이콘
		$(document).on("click", ".btn-modal-edit-puppy-edit-character", function(){
			// 수정할 댕댕이 특이사항
			var puppyCharacter = $(this).prev().text();
			var puppyCharacterContent = puppyCharacter.substring(1, puppyCharacter.length);
			console.log(puppyCharacter);
			console.log(puppyCharacterContent);
			// 타겟
			var target = $(this).parent();
			target
				.before(
					$("<div>").attr("class" , "d-flex flex-row justify-content-center align-items-center")
						.append(
							$("<input>").attr("class", "w-100 my-1 py-0 count-modal-edit-puppy-character input-modal-edit-puppy-character").attr("maxlength", 10).attr("placeholder", "특이사항(10자 이내)").val(puppyCharacterContent)
						)
						.append(
							$("<i>").attr("class", "fa-solid fa-square-check ms-1 btn-modal-edit-puppy-character btn-modal-edit-puppy-submit-character")	
						)
						.append(
							$("<i>").attr("class", "fa-solid fa-square-xmark ms-1 btn-modal-edit-puppy-character btn-modal-edit-puppy-delete-character")		
						)
				);
			target.remove();
		});
		
		// 댕댕이 수정 Modal v버튼
		$(document).on("click", ".btn-modal-edit-puppy-submit-character", function(){
			var target = $(this).prev();
			var puppyContentEdit = target.val();
			if(puppyContentEdit == "") {
				return;
			}
			target.remove();
			$(this).before(
				$("<span>").attr("class", "w-100 my-1 count-modal-edit-puppy-character span-modal-edit-puppy-character").text("#"+puppyContentEdit)
			)
			$(this).attr("class", "fa-solid fa-square-pen ms-1 btn-modal-edit-puppy-character btn-modal-edit-puppy-edit-character");
		});
		
		// 댕댕이 수정 Modal x버튼
		$(document).on("click", ".btn-modal-edit-puppy-delete-character", function(){
			$(this).parent().remove();
			if($(".btn-modal-edit-puppy-add-character").length >= 1) {
				return;
			}
			$(".div-modal-edit-puppy-character-list")
				.append(
					$("<div>").attr("class", "d-flex flex-row justify-content-center align-items-center")
					.append(
						$("<label>").attr("class", "w-100 my-1 d-flex justify-content-center align-items-center label-modal-add-puppy-character btn-modal-edit-puppy-add-character")
							.append(
								$("<i>").attr("class", "fa-solid fa-square-plus btn-modal-edit-puppy-character btn-modal-edit-puppy-add-character")		
							)
					)
				);
		});
		
		// 댕댕이 수정 Modal +버튼
		$(document).on("click", ".btn-modal-edit-puppy-add-character", function(e){
			// label과 동시 클릭 방지
			e.stopPropagation();
			// +버튼 영역 앞에 태그 생성
			var target = $(this).parent().parent();
			target
				.before(
					$("<div>").attr("class", "d-flex flex-row justify-content-center align-items-center")
						.append(
							$("<input>").attr("class", "w-100 my-1 py-0 count-modal-edit-puppy-character input-modal-edit-puppy-character").attr("maxlength", 10).attr("placeholder", "특이사항(10자 이내)")		
						)
						.append(
							$("<i>").attr("class", "fa-solid fa-square-check ms-1 btn-modal-edit-puppy-character btn-modal-edit-puppy-submit-character")		
						)
						.append(
							$("<i>").attr("class", "fa-solid fa-square-xmark ms-1 btn-modal-edit-puppy-character btn-modal-edit-puppy-delete-character")		
						)
				)
			// input과 span이 3개 이상일 때 +버튼 삭제
			if($(".count-modal-edit-puppy-character").length >= 3) {
				target.remove();
			}
		});
		
		// 댕댕이 수정 Modal 댕댕이 이름
		$(document).on("input", ".input-modal-edit-puppy-name", function(){
			if($(this).val() == "") {
				puppyEditValid.checkPuppyName = false;
				return;
			}
			puppyEditValid.checkPuppyName = true;
		});
		
		// 댕댕이 수정 Modal 댕댕이 나이
		$(document).on("input", ".input-modal-edit-puppy-age", function(){
			if($(this).val() == "") {
				puppyEditValid.checkPuppyAge = false;
				return;
			}
			puppyEditValid.checkPuppyAge = true;
		});
		
		// 댕댕이 수정 Modal 댕댕이 성별
		$(document).on("change", ".select-modal-edit-puppy-gender", function(){
			if($(".select-modal-edit-puppy-gender").val() == "") {
				puppyEditValid.checkPuppyGender = false;
			}
			puppyEditValid.checkPuppyGender = true;
		});
		
		// 댕댕이 수정 유효성 검사
        var puppyEditValid = {
   			checkPuppyName : true,
   			checkPuppyAge : true,
   			checkPuppyGender : true,
   			checkPuppyCharacter : true,
   			// 판정 결과 반환
   			isAllValid : function() {
   				return this.checkPuppyName && this.checkPuppyAge && this.checkPuppyGender && this.checkPuppyCharacter;
   			}
   		};
		
		// 댕댕이 수정 Modal의 저장 버튼
		$(document).on("click", ".btn-modal-edit-puppy-submit", function(){
			// 댕댕이 정보 Modal에 v버튼이 존재할 경우 return
			if($(".btn-modal-edit-puppy-submit-character").length >= 1) {
				puppyEditValid.checkPuppyCharacter = false;
				return;
			}
			puppyEditValid.checkPuppyCharacter = true;
			
			// 댕댕이 수정 유효성 검사를 통과하지 못하면 return
			if(puppyEditValid.isAllValid() == false) {
				return;
			}
			// 전송할 데이터 객체
			var formData = new FormData();
			// - 필수 입력 정보
			formData.append("puppyNo", $(".input-modal-edit-puppy-no").val());
			formData.append("puppyName", $(".input-modal-edit-puppy-name").val());
			formData.append("puppyAge", $(".input-modal-edit-puppy-age").val());
			formData.append("puppyGender", $(".select-modal-edit-puppy-gender").val());
			
			// - 댕댕이 특이사항
			if($(".span-modal-edit-puppy-character").length >= 1) {				
				var puppyCharacterListEdit = [];
				for(var i = 0 ; i < $(".span-modal-edit-puppy-character").length ; i ++) {
					var puppyCharacterContentOriginal = $(".span-modal-edit-puppy-character").eq(i).text();
					var puppyCharacterContent = puppyCharacterContentOriginal.substring(1, puppyCharacterContentOriginal.length);
					puppyCharacterListEdit.push(puppyCharacterContent);
				}
				formData.append("puppyCharacter", puppyCharacterListEdit);
			}
			
			// - 댕댕이 사진
			if($(".input-modal-edit-puppy-profile").get(0).files[0] != null) {
				formData.append("puppyImg", $(".input-modal-edit-puppy-profile").get(0).files[0]);
			}
			
			// 비동기 처리
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_puppy/edit",
				method : "put",
				data : formData,
				enctype:"multipart/form-data",
				processData:false,
				contentType: false,
				success : function(resp){
					console.log(resp);
					console.log("성공");
					alert("댕댕이 정보 수정이 완료되었습니다!");
					$("#modalEditPuppy").modal("hide");
				}
			});
		});
		
		// 댕댕이 수정 Modal 초기화
		function clearEditPuppyModal() {
			$(".input-modal-edit-puppy-profile").val("");
			$(".input-modal-edit-puppy-name").val("");
			$(".select-modal-edit-puppy-gender").val("").prop("selected", true);
			$(".div-modal-edit-puppy-character-list").empty();
		}
		
		$(document).keydown(function(event){
			if(event.keycode == 27 || event.which == 27) {
				// 등록 Modal 초기화
				clearInsertPuppyModal()
				// 수정 Modal 초기화
				clearEditPuppyModal();
			}
		});
	});
	
</script>