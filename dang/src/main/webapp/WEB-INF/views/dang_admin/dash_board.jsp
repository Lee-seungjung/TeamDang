<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
   <jsp:param value="관리자 메인" name="title"/>
</jsp:include>

<style>
	.statistics-number {
		font-size: 23px;
		font-weight: bold;
	}
	
	.statistics-font {
	    font-size: 12px;
	    font-weight: bold;
	}
	
	.img-dang-admin-main {
		aspect-ratio : 11/3;
		border-radius : 10px;
	}
	
	a{
		text-decoration: none;
		color: black;
	}
	
	th, td {
  		text-align: center;
	}
</style>

<!--대시 보드 시작-->
<div class="container-fluid">

	<div class="row ">
		<div class="col-10 offset-1">
			<div class="row mt-2 justify-content-center">
				<img src="${pageContext.request.contextPath}/images/img-admin-page-main.jpg" class="img-fluid img-dang-admin-main">
			</div>
		</div>
	</div>

    <div class="row mt-4 offset-md-1"></div>
    
    <div class="row mt-4 mb-5">
    	<div class="col-10 offset-1">
	    	 <div class="row justify-content-center">
	    	 	<div class="col-2 shadow">
		    		<a href="${pageContext.request.contextPath}/admin/user_list">
			            <div class="row">
			                <div class="col-7 mt-3">
			                    <p class="statistics-font">주간 사용자 수</p>
			                    <p class="statistics-number ms-2">${recentLogin}</p>
			                </div>
			                <div class="col">
			                    <img class="mt-3" src="${pageContext.request.contextPath}/images/admim-icon-growth-graph.png" width="100%;"
			                        height="70%;">
			                </div>
			            </div>
		        	</a>
		        </div>
		        <div class="col-2 offset-1 shadow">
		        	<a href="${pageContext.request.contextPath}/admin/dang_list">
			            <div class="row">
			                <div class="col-7 mt-3">
			                    <p class="statistics-font">주간 댕모임 개설 수</p>
			                    <p class="statistics-number ms-2">${recentDang}</p>
			                </div>
			                <div class="col">
			                    <img class="mt-3" src="${pageContext.request.contextPath}/images/admim-icon-gathering.png" width="100%;" height="70%;">
			                </div>
			            </div>
		            </a>
		        </div>
		        <div class="col-2 offset-1 shadow">
		        	<a href="${pageContext.request.contextPath}/admin/report">
			            <div class="row">
			                <div class="col-7 mt-3">
			                    <p class="statistics-font">주간 신고 수</p>
			                    <p class="statistics-number ms-2">${recentReport}</p>
			                </div>
			                <div class="col">
			                    <img class="mt-3" src="${pageContext.request.contextPath}/images/admin-icon-alarm.png" width="100%;" height="70%;">
			                </div>
			            </div>
		            </a>
		        </div>
		        <div class="col-2 offset-1 shadow">
		        	<a href="${pageContext.request.contextPath}/admin/user_list">
			            <div class="row">
			                <div class="col-7 mt-3">
			                    <p class="statistics-font">7일간 가입자 수</p>
			                    <p class="statistics-number ms-2">${recentJoin}</p>
			                </div>
			                <div class="col">
			                    <img class="mt-3" src="${pageContext.request.contextPath}/images/admim-icon-user-profile.png" width="100%;"
			                        height="70%;">
			                </div>
			            </div>
			         </a>
		        </div>
	    	 </div>
        </div>
    </div>
    <div class="row mt-4 mb-5">	
        <div class="col-10 offset-1">
        	<div class="row justify-content-center">
        		<div class="col-5 shadow">
		        	<h5 class="mt-3 mb-3 text-center">지역별 이용현황</h5>
		            <canvas id="regionChart" width="300" height="186"></canvas>
		        </div>
		        <div class="col-5 offset-1 shadow">
			  		<h5 class="mt-3 mb-3 text-center">신고 목록</h5>
			  		
				   	<table class="table table-hover">
						<thead>
							<tr>
								<th>댕모임명</th>
								<th>닉네임</th>
								<th>신고일짜</th>
								<th>신고현황</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${reportList.size()==0}">
								<tr>
									<td colspan="4">신고 내역이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="reportList" items="${reportList}">
							<tr data-rno="${reportList.reportNo}" class="cursor-pointer report-detail">
								<td >${reportList.dangName}</td>
								<td>${reportList.memberNick}</td>
								<td>${reportList.reportDate}</td>
								<td>${reportList.reportState}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
		        </div>
        	</div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>

<script>

$(function(){
	
	var labelList = new Array();//상단에 라벨을 담는 배열
	var valueList = new Array();//지역별 갯수를 담는 배열
	var colorList = new Array();//색깔을 지정해주기위한 배열
	    
    $.ajax({//지역별 이용현황 조회 비동기통신
        url: "${pageContext.request.contextPath}/admin/group_list",
        method: "get",
        contentType: "application/json",
        success: function (resp) {
        	console.log(resp);
        	//List 반복문
        	for(var i = 0; i<resp.length; i++) {
        		labelList.push(resp[i].dangArea);//라벨배열에 밀어넣기
        		valueList.push(resp[i].cnt);//밸류배열에 밀어넣기
        		colorList.push(colorize());//색상배열에 밀어넣기
        	}

        	var data = {
    				labels: labelList,//라벨
    				datasets: [{
    						backgroundColor: colorList,
    						data : valueList
    				}],
    				options : {
    						title : {
    						display : true,
    						text: 'regionChart'
    						},
    						scales: {
    				            yAxes: [{
    				                ticks: {
    				                    beginAtZero: true
    				                }
    				            }]
    				        },
    				        events: ['click'],
    				        plugins: {
    	    		            labels: {
    	    		                render: valueList,
    	    		                fontColor: 'black',
    	    		                fontSize: 16,
    	    		                precision: 2
    	    		            }
    	    		        }
    				        
    				}	
   				 };

        	var ctx = document.getElementById('regionChart').getContext('2d');
        	var myChart= new Chart(ctx, {//차트 객체 생성
        		      type: 'pie',
        			  data: data,
        	});

        	
        	// 클릭 이벤트 리스너
        	myChart.canvas.addEventListener('click', function(event) {
        	    var activePoints = myChart.getElementsAtEvent(event);
        	    if (activePoints[0]) {
        	        var chartData = activePoints[0]['_chart'].config.data;
        	        var index = activePoints[0]['_index'];
        	        var dangArea = chartData.labels[index];
        	        console.log("지역 = " + index);
        	        location.href = "${pageContext.request.contextPath}/admin/dang_list?dangArea=" + dangArea;
        	    }
        	});
        	
        
        }
    });
    //색상 rgb를 랜덤으로 생성하는 함수
    function colorize() {
    	var r = Math.floor(Math.random()*200);
    	var g = Math.floor(Math.random()*200);
    	var b = Math.floor(Math.random()*200);
    	var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.7)';
    	return color;
    }
    
    //신고 상세로 이동
    $(".report-detail").click(function(){
    	var reportNo = $(this).data("rno");
    	location.href="${pageContext.request.contextPath}/admin/report_detail?reportNo="+reportNo;
    });
    
});

</script>