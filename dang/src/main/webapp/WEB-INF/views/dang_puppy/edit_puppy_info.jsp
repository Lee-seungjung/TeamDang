<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="댕댕이 정보 변경" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/mypage_menu.jsp"></jsp:include>

<style>
	* {
		
	}
	
	.div-puppy-insert {
	    cursor : pointer;
	}
	
	.div-puppy-info {
		border : 0.5px #F4F4F4 solid;
	    border-radius: 15px;
	    height : 15em;
	}
	
	.img-puppy-profile {
	    border-radius: 50%;
	    aspect-ratio: 1/1;
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
				<div class = "col-4 px-3 py-1">
                    <div class = "row align-items-center shadow-sm div-puppy-info div-puppy-insert">
                        <div class = "col d-flex justify-content-center align-items-center">
                            <i class="fa-solid fa-plus"></i>
                        </div>
                    </div>
                </div>
				<div class = "col-4 px-4 py-2">
					ㅎㅇ	
				</div>
				<div class = "col-4 px-4 py-2">
					ㅎㅇ
				</div>
			</div>
		</div>
	</div>
</div>

<%-- 댕댕이 등록 Modal --%>
<div class="modal fade" id="modalInsertPuppy" data-bs-backdrop="static" tabindex="-1" aria-hidden="true"> 
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class = "container-fluid">
                <div class = "row">
                    <div class = "col p-2">
                        <div class = "row">
                            <div class = "col d-flex justify-content-end align-items-center">
                                <button type="button" class="fa-solid fa-xmark btn-modal-insert-puppy-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                        </div>
                        <div class = "row my-3">
                            <div class = "offset-1 col-4 p-3 my-3">
                                <label class = "label-puppy-profile" for = "puppyProfile">
                                    <img class = "img-puppy-profile w-100" src = "/css/image/image-blackcow.jpg">
                                    <input class = "input-puppy-profile" id = "puppyProfile" type = "file" accept = ".png, .jpg">
                                </label>
                            </div>
                            <div class = "ms-5 col-5 pt-3 align-items-center">
                                <div class = "row">
                                    <div class = "col">
                                        <input class = "w-100 input-puppy-name" type = "text" maxlength="10" placeholder="이름(10자 이내)">
                                    </div>
                                </div>
                                <div class = "row my-3">
                                    <div class = "col-6">
                                        <input class = "w-75 input-puppy-age" type = "text" placeholder="나이">
                                        <span>살</span>
                                    </div>
                                    <div class = "col-6">
                                        <select class = "w-100 select-puppy-gender">
                                            <option value = "">성별</option>
                                            <option value = "M">남아</option>
                                            <option value = "F">여아</option>
                                        </select>
                                    </div>
                                </div>
                                <div class = "row">
                                    <div class = "col d-flex align-items-center">
                                        <span>특이사항</span>
                                        <i class="fa-solid fa-square-plus ms-1 btn-insert-puppy-character btn-add-puppy-character"></i>
                                    </div>
                                </div>
                                <div class = "row">
                                    <div class = "col div-puppy-character-list">
                                        <!--
                                        <div class = "d-flex flex-row justify-content-center align-items-center div-puppy-character">
                                            <input class = "w-100 my-2 input-puppy-character" maxlength="10" placeholder="특이사항(10자 이내)">
                                            <i class="fa-solid fa-square-check ms-1 btn-insert-puppy-character btn-submit-puppy-character"></i>
                                            <i class="fa-solid fa-square-xmark ms-1 btn-insert-puppy-character btn-cancel-puppy-character"></i>
                                        </div>
                                        -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class = "row my-3">
                            <div class = "col-10 offset-1 d-flex justify-content-center align-items-center">
                                <button class = "py-2 px-3 btn-modal-enter-submit">저장</button>
                            </div>
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
		// 댕댕이 정보 변경 버튼 색 변경
		$(".div-mypage-edit-puppy-info").css("background-color", "#F94888");
		
		// 댕댕이 등록 Modal
		$(".div-puppy-insert").click(function(){
			$("#modalInsertPuppy").modal("show");
		});
	});
	
</script>