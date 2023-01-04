<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

    <!-- Bootstrap CSS -->
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    
    <link rel="stylesheet" type="text/css" 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="댕모임 일정" name="title"/>
</jsp:include>
<style>
.layout {
	max-width: 1100px;
	margin: 30px auto;
	padding: 50px;
	display: flex;
	flex-wrap: wrap;
	flex-wrap: wrap gap: 1em;
/*	background-color: lightgray;*/
}

.calendar-box{
	width : 1100px;
	height : 450px;
	background-color: white;
	display: flex;
	flex-direction: row;
	gap: 1em;
	justify-content: center;
}

.calendar{
	width: 650px;
	height : 450px;
}

.calendar-info{
	width: 350px;
	height : 450px;
	background-color: #FAFAFA;
	text-align: center;
}


.more-info{
	width : 1100px;
	height : 400px;
	background-color: white;
	display: flex;
	flex-direction: row;
	gap: 1em;
	justify-content: center;
}

.add-schedule{
	width : 1000px;
	height : 400px;
	text-align: center;
	margin: 60px 10px;

}

.add-btn{
 width: 140px;
 color: white;
 font-size: 18px;
 font-weight: bold;
 height: 50px;
 margin: 20px;
 background-color: 76BEFF;
}

.upcoming{
 font-size: 24px;
 font-weight: bold;
}
       

    </style>
    <meta charset='utf-8' />


    <script>

    </script>
</head>

<body>
<div class="layout">
		<div class="calendar-box ">
						<div class="monthly-calendar row">					
        <div id='calendar' class="calendar"></div>
        </div>
        <div class="modal fade" id="modal01" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- 모달 헤더 : 제목 영역 -->
                    <div class="modal-header">
                        <h5 class="modal-title">댕모임 일정 등록</h5>

                        <!-- x 버튼 -->
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <!-- 모달 바디 : 사용자에게 알려줄 내용 영역 -->
                    <div class="modal-body">
                        <label>댕모임 제목</label>
						<input class="form-control modal-content">
                        <label>댕모임 시작일</label>
                        <input class="modal-date form-control" type="date">
                         <label>댕모임 종료일</label>
                        <input class="modal-date form-control" type="date">
<%--                          <label>댕모임 시작</label>
                        <div class="dang-start">
                        <select class="form-control modal-time-select">
								<option value="">----선택----</option>
								<c:forEach var="i" begin="00" step="1" end="23">
									<option value="${i}">${i}:00</option>
								</c:forEach>
                        </select>                  
                        </div>
                        <label>댕모임 종료</label>
                        <div class="dang-end">
                        <select class="form-control modal-time-select">
								<option value="">----선택----</option>
								<c:forEach var="i" begin="00" step="1" end="23">
									<option value="${i}">${i}:00</option>
								</c:forEach>
                        </select>                  
                        </div> --%>
                        <label>모임 장소</label>
                        <input class="form-control modal-place">
                        <label>모임 내용</label>
                        <textarea style="resize: none;" class="form-control symptom-modal-textarea" rows="5"></textarea>
                        <label>참여 인원 수</label>
                         <div class="row">
						<select name="DangHead">
								<option value="">인원 수</option>
								<c:forEach var="i" begin="2" step="1" end="10">
									<option value="${i}">${i}명</option>
								</c:forEach>
							</select>                
                        </div>
                    </div>
                    <!-- 모달 푸터 : 버튼들이 위치한 영역 -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary btn-reservation">등록</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modal02" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- 모달 헤더 : 제목 영역 -->
                    <div class="modal-header">
                        <h5 class="modal-title">일정 확인</h5>

                        <!-- x 버튼 -->
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <!-- 모달 바디 : 사용자에게 알려줄 내용 영역 -->
                    <div class="modal-body">
                        <label>댕모임 제목</label>
                        <input id="" class="form-control bg-light mb-3" type="text" readonly>
                        <label>댕모임 시작일</label>
                        <input id="" class="form-control bg-light mb-3" type="text" readonly>
                        <label>댕모임 종료일</label>
                        <input id="" class="form-control bg-light mb-3" type="text" readonly>
                        <label>모임장소</label>
                        <input id="" class="form-control bg-light mb-3" type="text" readonly>
                         <label>모임인원</label>
                        <input id="" class="form-control bg-light mb-3" type="text" readonly>
                        <label>참여 인원 수</label>
                        <input id="" class="form-control bg-light mb-3" type="text" readonly>
                        
                    </div>
                    <!-- 모달 푸터 : 버튼들이 위치한 영역 -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger btn-reservation-delete">삭제</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
            			<div class="calendar-info">
            			<div><span class="upcoming">다가오는 댕모임</span><i class="fa-solid fa-paw"></i></div>
            			<div id=""></div>
			</div>	

			
		</div>
								<div class = "more-info">
					<div class="add-schedule">
						<h2>댕모임 멤버들과 함께 하고 싶은 일정이 있나요?</h2>
						<button class="btn add-btn" type="button"> 일정 추가하기</button>
				</div>	
    </div>
		

    
    
    </div>
</body>
</html>