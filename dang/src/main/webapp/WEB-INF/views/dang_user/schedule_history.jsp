<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="참여일정 조회" name="title"/>
</jsp:include>

<style>

    * {
        border: 1px gray dotted;
    }


	
</style>

<jsp:include page="/WEB-INF/views/template/mypage_menu.jsp"></jsp:include>

<div class = "container-fluid my-3">	
	<div class = "row">
		<div class = "col-8 offset-2 my-3">
			<div class = "row">
                <div class = "col d-flex justify-content-center align-items-center">
                    <strong class = "Title schedule-history">최근1개월 참여일정 조회</strong> 
                              <select class = "col-2 py-1 d-flex align-items-center div-puppy-info-menu-content select-modal-insert-puppy-gender">
                                <option value = "" class = "">선택</option>
                                <option value = "" class = "">목욕댕모임</option>
                                <option value = "" class = "">산책댕모임</option>
                            </select>
                                <select class = "col-2 py-1 d-flex align-items-center div-puppy-info-menu-content select-modal-insert-puppy-gender">
                                <option value = "" class = "">1개월</option>
                                <option value = "" class = "">3개월</option>
                                <option value = "" class = "">6개월</option>
                            </select>
                </div>
            </div>
			<div class = "row">
				<div class = "offset-1 col-10">
					<div class = "row list-title">

					 	<div class= "col-3">
					 	 	<span>댕모임명</span>
					 	</div>					
					 	<div class= "col-2">
					 	 	<span>참여일자</span>
					 	</div>
					 	<div class= "col-3">
					 	 	<span>일정제목</span>
					 	</div>
					 	<div class= "col-2">
					 		<span>장소</span>
					 	</div>
					 	<div class= "col-2">
					 		<span>참여회비</span>
					 	</div>		
				 				 						 						 	
					</div>
					<div class="row list-content">
					
					 	<div class= "col-3">
					 	 	<span>목욕댕모임</span>
					 	</div>
					 	<div class= "col-2">
					 	 	<span>23.02.02</span>
					 	</div>
					 	<div class= "col-3">
					 	 	<span>복순아 목욕가자</span>
					 	</div>
					 	<div class= "col-2">
					 		<span>신촌 댕목욕탕</span>
					 	</div>
					 	<div class= "col-2">
					 		<span>3만원</span>
					 	</div>	
					
					</div>
					
				</div>
			</div>
			<div class = "row mt-5">
				<div class = "offset-2 col-8 d-flex justify-content-center align-items-center">
						      <select class = "col-3 py-1 d-flex align-items-center div-puppy-info-menu-content select-modal-insert-puppy-gender">
                                <option value = "" class = "">선택</option>
                                <option value = "" class = "">모임명</option>
                                <option value = "" class = "">일정명</option>
                            </select>                       
                            <input class="col-6" placeholder="검색어를 입력하세요" >
                            <button class="col-3">검색</button>
				</div>
			</div>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">

</script>