<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
   <jsp:param value="관리자 메인" name="title"/>
</jsp:include>

<style>
	* {
		
	}
	
	.statistics-number {
		font-size: 24px;
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
	
	.img-admin-main-category {
		width : 3rem;
		aspect-ratio : 1/1;
		border-radius : 10px;
	}
	
	.strong-admin-main-category {
		font-size : 24px;
	}
	
	.div-admin-main-report-list-category {
		border-bottom : 2px black solid;
	}
	
	.report-detail:hover {
		background-color : #EAEAEA;
	}
	
	.div-admin-main-category {
		border : 1px solid #EAEAEA;
		border-radius : 10px;
	}
	
	.div-dang-area-list,
	.div-report-list {
		border : 1px solid #EAEAEA;
		border-radius : 10px;
		height : 26rem;
	}
</style>

<!--대시 보드 시작-->
<div class="container-fluid">

	<div class="row mt-5 mb-5">
		<div class="col-10 offset-1">
			<img src="${pageContext.request.contextPath}/images/img-admin-page-main.jpg" class="w-100 img-dang-admin-main">
		</div>
	</div>
    
    <div class="row mb-5">
    	<div class="col-10 offset-1">
			<div class="row">
				<div class = "col-3">
					<div class="col shadow cursor-pointer py-4 div-admin-main-category" onclick="location.href='${pageContext.request.contextPath}/admin/user_list'">
			            <div class="row px-3">
			                <div class="col-8 d-flex flex-column justify-content-center align-items-center">
			                    <strong class="statistics-font">주간 사용자 수</strong>
			                    <strong class="statistics-number">${recentLogin}</strong>
			                </div>
			                <div class="col-4 d-flex justify-content-center align-items-center">
			                    <img class="img-admin-main-category" src="${pageContext.request.contextPath}/images/admin-icon-growth-graph.png">
			                </div>
			            </div>
			        </div>
				</div>
				<div class = "col-3">
					<div class="col shadow cursor-pointer py-4 div-admin-main-category" onclick = "location.href='${pageContext.request.contextPath}/admin/dang_list'">
			            <div class="row px-3">
			                <div class="col-8 d-flex flex-column justify-content-center align-items-center">
			                    <strong class="statistics-font">주간 댕모임 개설 수</strong>
			                    <strong class="statistics-number">${recentDang}</strong>
			                </div>
			                <div class="col-4 d-flex justify-content-center align-items-center">
			                    <img class="img-admin-main-category" src="${pageContext.request.contextPath}/images/admin-icon-gathering.png">
			                </div>
			            </div>
			        </div>
				</div>
				<div class = "col-3">
					<div class="col shadow cursor-pointer py-4 div-admin-main-category" onclick = "location.href = '${pageContext.request.contextPath}/admin/report'">
			            <div class="row px-3">
			                <div class="col-8 d-flex flex-column justify-content-center align-items-center">
			                    <strong class="statistics-font">주간 신고 수</strong>
			                    <strong class="statistics-number">${recentReport}</strong>
			                </div>
			                <div class="col-4 d-flex justify-content-center align-items-center">
			                    <img class="img-admin-main-category" src="${pageContext.request.contextPath}/images/admin-icon-alarm.png">
			                </div>
			            </div>
			        </div>
				</div>
				<div class = "col-3">
					<div class="col shadow cursor-pointer py-4 div-admin-main-category" onclick = "location.href = '${pageContext.request.contextPath}/admin/user_list'">
			            <div class="row px-3">
			                <div class="col-8 d-flex flex-column justify-content-center align-items-center">
			                    <strong class="statistics-font text-center">주간 가입자 수</strong>
			                    <strong class="statistics-number text-center">${recentJoin}</strong>
			                </div>
			                <div class="col-4 d-flex justify-content-center align-items-center">
			                    <img class="img-admin-main-category" src="${pageContext.request.contextPath}/images/admin-icon-join.png">
			                </div>
			            </div>
			        </div>
				</div>
	    	 </div>
        </div>
    </div>
    <div class="row mb-5">	
        <div class="col-10 offset-1">
        	<div class="row d-flex justify-content-between">
        		<div class="col-6">
        			<div class = "col shadow py-4 px-4 div-dang-area-list">      
        				<div class = "row mb-5">
        					<div class = "col d-flex justify-content-center align-items-center">
  	 							<strong class=" strong-admin-main-category">지역별 이용현황</strong>
        					</div>
        				</div> 
        				<div class = "row">
        					<div class = "col d-flex justify-content-center align-items-center">
					            <canvas id="regionChart" class = "w-100 cursor-pointer"></canvas>        					
        					</div>
        				</div>		
        			</div>
		        </div>
		        <div class="col-6">
		        	<div class = "col shadow py-4 px-4 div-report-list">
		        		<div class = "row mb-3">	
		        			<div class = "col d-flex justify-content-center align-items-center">
			        			<strong class="strong-admin-main-category">최근 신고 목록</strong>	
		        			</div>	        		
		        		</div>
		        		<div class = "row">
		        			<div class = "col">
		        				<div class = "row py-2 div-admin-main-report-list-category">
		        					<div class = "col-4 text-center">
		        						<strong>댕모임명</strong>
		        					</div>
		        					<div class = "col-3 text-center">
		        						<strong>닉네임</strong>
		        					</div>
		        					<div class = "col-3 text-center">
		        						<strong>신고일자</strong>
		        					</div>
		        					<div class = "col-2 text-center">
		        						<strong>신고현황</strong>
		        					</div>
		        				</div>
		        				<c:forEach var="reportList" items="${reportList}">
		        				<div class = "row py-3 cursor-pointer report-detail" data-rno="${reportList.reportNo}">
		        					<div class = "col-4 text-center">
		        						<span>${reportList.dangName}</span>
		        					</div>
		        					<div class = "col-3 text-center">
		        						<span>${reportList.memberNick}</span>
		        					</div>
		        					<div class = "col-3 text-center">
		        						<span>${reportList.reportDate}</span>
		        					</div>
		        					<div class = "col-2 text-center">
		        						<span>${reportList.reportState}</span>
		        					</div>
		        				</div>
								</c:forEach>
		        				<c:if test="${reportList.size()==0}">
								<div class = "row">
									<div class = "col d-flex flex-column justify-content-center align-items-center py-3" style="height:200px;">신고 내역이 없습니다.</div>
								</div>
								</c:if>
		        			</div>
		        		</div>
		        	</div>
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
	
	Chart.defaults.global.defaultFontSize =16; 
	Chart.defaults.global.defaultFontColor ='black'; 
    $.ajax({//지역별 이용현황 조회 비동기통신
        url: "${pageContext.request.contextPath}/admin/group_list",
        method: "get",
        contentType: "application/json",
        success: function (resp) {
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
    	    		                precision: 2
    	    		            }
    	    		        }
    				        
    				}
   				 };

        	var ctx = document.getElementById('regionChart').getContext('2d');
        	var myChart= new Chart(ctx, {//차트 객체 생성
        		      type: 'pie',
        			  data: data
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