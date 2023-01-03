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
	#chatDiv{
		overflow:scroll;
		overflow-x:hidden;
		border:1px solid gray;
		width:90%; height:500px;
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
			$("#chatDiv").scrollTop($("#chatDiv")[0].scrollHeight);

		};
		
		//2. 페이지를 벗어나면 웹소켓 연결을 제거
		$(window).on("beforeunload", function(){
			//웹소켓 연결 종료
			socket.close();
		});
		
		//3. 웹소켓으로 입력된 메세지를 전송
		$("#send-btn").click(function(){
			var text = $("#chat-input").val();
			console.log(text);
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
				var div = $("<div>").attr("class","text-end me-2");
				var formatTime = moment(data.chatDate).format('a h:mm'); //예)오후 2:24
				var time = $("<span>").text(formatTime);
				var text = $("<span>").text(data.chatContent);
				div.append(time).append(text);
				chatDiv.append(div);
			}else{
				var div = $("<div>").attr("class","text-start ms-2");
				var img = $("<img>").attr("src","#");
				var text = $("<span>").text(data.chatContent);
				var formatTime = moment(data.chatDate).format('a h:mm');
				var time = $("<span>").text(formatTime);
				div.append(img).append(text).append(time);
				chatDiv.append(div);
			}
		}
		
		
		
	});
</script>

<div class="row">	
	<div class="two" style="border:1px solid gray; width:50%; height:600px;">
		<h1>${history[0].roomNo}번방 테스트</h1>
		<div id="chatDiv">
		
			<!-- 기존 메세지 정적 생성 -->
			<c:forEach var="vo" items="${history}">
				<c:choose>
					<c:when test="${userNo==vo.userNo}">
						<div class="text-end me-2">
							<c:if test="${vo.chatStatus!=0}">
								<span>${vo.chatStatus}</span>
							</c:if>
							<span>
								<fmt:formatDate value="${vo.chatDate}" pattern="a h:mm"/>
							</span>
							<span>${vo.chatContent}</span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="text-start ms-2">
							<img src="#">프로필
							<span>${vo.chatContent}</span>
							<span>
								<fmt:formatDate value="${vo.chatDate}" pattern="a h:mm"/>
							</span>
							<c:if test="${vo.chatStatus!=0}">
								<span>${vo.chatStatus}</span>
							</c:if>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		
			<div class="new-chat" style="margin-right:10px;">
				<!-- 새 메세지 동적 생성 -->
			</div>
		</div>
		<input type="text" id="chat-input">
		<button class="btn btn-primary" id="send-btn" type="button">전송</button>
	</div>
	
	<!-- 방번호-->
	<input type="hidden" name="roomNo" value="${history[0].roomNo}">
	<input type="hidden" name="userNo" value="${userNo}">
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>