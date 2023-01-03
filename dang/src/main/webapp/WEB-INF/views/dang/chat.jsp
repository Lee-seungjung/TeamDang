<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="댕모임 대화" name="title"/>
</jsp:include>

	<!-- sockjs cdn -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
	<!-- moment cdn + 한글 언어팩-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
<style>
	.profile-box{
		height:400px;
	}
	.chat-box{
		overflow:scroll;
		overflow-x:hidden;
		background-color:#F1F4FF;
		width:100%; height:600px;
	}
	.chat-box::-webkit-scrollbar {
	    width: 5px;
	 }
	  .chat-box::-webkit-scrollbar-thumb {
	  	height:30%;
	    background-color: #B0CBFF;
	    border-radius: 0.3rem;
	 }
	  .chat-box::-webkit-scrollbar-track {
	    background-color: #F1F4FF;
	    border-radius: 0.3rem;
	 }
	 .chat-submit{
	 	width:100%;
	 	background-color:#F1F4FF;
	 	height:50px;
	 }
	 #chat-input{
	 	width:70%;
	 	height:40px;
	 	display:inline-block;
	 	border:none;
	 }
	 #chat-input:focus{
	 	border:none;
	 }
	 #send-btn{
	 	width:15%;
	 	display:inline-block;
	 }
	 .message{
	 	border:1px solid #B0CBFF;
	 	border-radius: 0.7rem;
	 	background-color:#B0CBFF;
	 	color:white;
	 	padding:5px;
	 }
	 table>tbody>tr>td{
	 	padding:5px;
	 }
	 .progress {
	 	background-color: #F1F4FF;
	 	height: 0.5rem;
	 }
	 .progress-bar{
	 	background-color: #6C7AEF;
	 }
</style>
<script>
	$(function(){
		//1. 시작하자마자 웹소켓 연결을 생성
		//2. 나가기 전에 웹소켓 연결을 제거
		//3. 전송버튼을 누르면 웹소켓으로 입력된 메세지를 전송
		
		//전역변수 방번호
		var roomNo = $("[name=roomNo]").val();
		
		//1. 웹소켓 연결 생성
		var uri = "${pageContext.request.contextPath}/ws/chat";
		
		//- 접속 시 생성하는 객체가 WebSocket이 아니라 SockJS로 바뀐다
		socket = new SockJS(uri);
		
		//(+추가) 웹소켓이 연결되었는지 종료되었는지 어떻게 아나?
		// - 웹소켓 객체가 기본 제공하는 4가지 이벤트를 설정해서 처리
		socket.onopen = function(){
			//접속하자마자 서버로 입장메세지를 보냄
			console.log("open");
			var data = {
					type :1,
					room : roomNo
			};
			socket.send(JSON.stringify(data)); 		
		};
		
		socket.onclose = function(){
			console.log("close");
		};
		
		socket.onerror = function(){

		};
		socket.onmessage = function(e){
			//수신된 e.data는 JSON 문자열
			var data = JSON.parse(e.data);
			console.log(data);
			
			//메세지 찍어주기 - 함수로 처리
			newChatList(data);
			
			//스크롤 하단으로 이동
			$(".chat-box").scrollTop($(".chat-box")[0].scrollHeight);

		};
		
		//2. 페이지를 벗어나면 웹소켓 연결을 제거
		$(window).on("beforeunload", function(){
			//웹소켓 연결 종료
			socket.close();
		});
		
		//3. 웹소켓으로 입력된 메세지를 전송
		$("#send-btn").click(function(){
			var text = $("#chat-input").val();
			if(text.length == 0) return; //채팅 쓴거 없으면 return
			
			//JSON으로 변환해서 전송
			//- JSON.stringify(객체) : 객체를 문자열로
			//- JSON.parse(문자열) : 문자열을 객체로
			
			var data = {
				type : 2,
				room : roomNo,
				chatContent : text
			};
			socket.send(JSON.stringify(data));
			$("#chat-input").val("");  //텍스트 창 비우기
			
		});
		
		//4 엔터키 이벤트
		$("#chat-input").on("keyup",function(key){
	        if(key.keyCode==13) {            
		        $("#send-btn").click();
	        }
	    });
		
		//새로운 채팅 화면에 표시
		function newChatList(data){
			var userNo = $("[name=userNo]").val();
			var chatUserNo = data.userNo;
			var chatDiv = $(".new-chat");
			
			if(userNo==chatUserNo){
				var div = $("<div>").attr("class","text-end  mb-3");
				var formatTime = moment(data.chatDate).format('a h:mm'); //예)오후 2:24
				var time = $("<span>").attr("style","font-size:10px;").text(formatTime);
				var text = $("<span>").attr("class","message").text(data.chatContent);
				div.append(time).append(text);
				chatDiv.append(div);
			}else{
				var div = $("<div>").attr("class","text-start ms-2");
				var table = $("<table>").attr("class","mb-2");
				var tbody = $("<tbody>");
				var tr1 = $("<tr>");
				var td1 = $("<td>").attr("rowspan","2");
				var img = $("<img>").attr("src","#").attr("class","img-circle").attr("width","45").attr("height","45");
				td1.append(img);
				var td2 = $("<td>");
				var nick = $("<span>").text(data.memberNick);
				td2.append(nick);
				var td3 = $("<td>").attr("rowspan","2");
				tr1.append(td1).append(td2).append(td3);
				
				var tr2 = $("<tr>");
				var td4 = $("<td>");
				var text = $("<span>").attr("class","message").text(data.chatContent);
				var formatTime = moment(data.chatDate).format('a h:mm');
				var time = $("<span>").attr("style","font-size:10px;").text(formatTime);
				td4.append(text).append(time);
				tr2.append(td4);
				
				tbody.append(tr1).append(tr2);
				table.append(tbody);
				div.append(table);
				chatDiv.append(div);
			}
		}
		
		
		
	});
</script>

<div class="container px-4 mt-4">
	<div class="row gx-4">
	
		<!-- 프로필 박스 -->
		<div class="col-3">
			<div class="p-3 profile-box border rounded-3">
				<div class="profile-wrap text-center">
					<img src="#" width="80" height="80" class="img-circle mb-3">
					<p>닉네임</p>
					<p>짧은소개..?</p>
					
					<p>활동 점수</p>
					<div class="progress">	
						<div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<p>뼈다귀 등급</p>
					
					<p>프로필 편집</p>
				</div>
			</div>
			
			<!-- 출석 체크 -->
			<div class="p-3 border rounded-3 text-center">
				<span>출석 체크</span>
			</div>
			
		</div>
		
		
		<!-- 채팅 박스 -->
		<div class="col-7">
			<div class="chat-box p-3 rounded-3">
				<!-- 기존 메세지 생성 -->
				<c:forEach var="vo" items="${history}">
					<c:choose>
						<c:when test="${userNo==vo.userNo}">
							<div class="text-end me-2 mb-3">
								<c:if test="${vo.chatStatus!=0}">
									<span>${vo.chatStatus}</span>
								</c:if>
								<span style="font-size:10px;">
									<fmt:formatDate value="${vo.chatDate}" pattern="a h:mm"/>
								</span>
								<span class="message">${vo.chatContent}</span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="text-start ms-2">
								<table class="mb-2">
									<tbody>
										<tr>
											<td rowspan="2">
												<img src="#" class="img-circle" width="45" height="45">
											</td>
											<td><span>${vo.memberNick}</span></td>
											<td rowspan="2"></td>
										</tr>
										<tr>
											<td>
												<span class="message">${vo.chatContent}</span>
												<span style="font-size:10px;">
													<fmt:formatDate value="${vo.chatDate}" pattern="a h:mm"/>
												</span>
												<c:if test="${vo.chatStatus!=0}">
													<span>${vo.chatStatus}</span>
												</c:if>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 새 메세지 생성 -->
				<div class="new-chat" style="margin-right:10px;"></div>
			</div>
			
			<div class="chat-submit text-center">
				<input type="text" id="chat-input" class="me-1">
				<button class="btn btn-primary ms-1" id="send-btn" type="button">전송</button>
			</div>
		</div>
		
		<!-- 방번호, 회원번호-->
		<input type="hidden" name="roomNo" value="${history[0].roomNo}">
		<input type="hidden" name="userNo" value="${userNo}">
		
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>