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
	    background-color: #B0CBFF;
	 }
	  .chat-box::-webkit-scrollbar-track {
	    background-color: #F1F4FF;
	 }
</style>
<script>
	$(function(){
		
		
	});
</script>
<!-- 프로필 박스 -->
<div class="container px-4 mt-4">
	<div class="row gx-4">
		<div class="col-3">
			<div class="p-3 profile-box border rounded-3">프로필 박스</div>
		</div>
		<div class="col-7">
			<div class="chat-box p-3 rounded-3">채팅 박스</div>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>