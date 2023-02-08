<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="관심지역 설정" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/mypage_menu.jsp"></jsp:include>

<style>

	* {
		
	}

	.strong-mypage-title {
		font-size : 30px;
	}

	.interest-OUTLINE {
		stroke-linejoin: round;
		stroke: #F5F2FF;
		stroke-width: 2;
		fill :#17065B;
		}

	.interest-POINT {
	    stroke: black;
	    stroke-width: 1;
	    fill: #ffffff;
	}

	.interest-TEXT {
	    stroke: #ffffff;
	    stroke-width : 1;
	    stroke-linecap: round;
	    text-anchor: middle;
	    alignment-baseline: middle;
	    cursor: pointer;
	}
	
	.interest-area-selected {
	    fill : #4C28DD;
	}
	
	.div-dang-interest, 
	.btn-dang-interest-submit {
	    height: 2em;
	    border-radius: 5px;
	    color: white;
	}
	
	.div-dang-interest-active {
	    background-color: #76BEFF;
	}
	
	.div-dang-interest-inactive {
	    background-color: #E0E0E0;
	}
	
	.btn-dang-interest-submit {
	    border: none;
	    background-color: #F94888;
	}
	
	.span-dang-interest {
		white-space : nowrap;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	}
	
	.i-dang-interest-cancel {
	    position: absolute;
	    top: 50%;
	    left: 85%;
	    transform: translate(-50%, -50%);
	    cursor: pointer;
	    font-size : 10px;
	}
	
	
</style>

<div class = "container-fluid my-3">	
	<div class = "row mb-5">
		<div class = "col-6 offset-3">
			<div class = "row my-4">
                <div class = "col d-flex justify-content-center align-items-center">
                    <strong class = "strong-mypage-title">관심지역 설정</strong>
                </div>
            </div>
			<div class = "row my-4">
				<div class = "offset-3 col-6">
					<c:if test = "${interestAreaList != null}">
					<c:forEach var = "interestAreaList" items = "${interestAreaList}">
					<input type = "hidden" name = "interestArea" value = "${interestAreaList}">
					</c:forEach>
					</c:if>
                    <div class = "row my-2">
                        <div class = "col d-flex justify-content-center align-items-center">
                            <svg class = "w-100 h-100" style='background:white;overflow:visible' width="800" height="656" xmlns="http://www.w3.org/2000/svg" viewbox = "50 50 700 550">">
                                <g id = "interest-outline">
                                    <path id="CD-interest-11110" class="interest-OUTLINE"
                                        d="M 455 297 l 4 -2 1 0 1 0 3 -1 4 5 7 3 2 6 0 8 -11 2 -11 1 -8 0 -9 1 -8 1 -9 1 -9 -2 -10 -1 -9 1 -4 3 -2 3 -6 -6 -3 -4 -5 -6 -4 -5 -2 -5 5 -3 0 -6 0 -10 0 -9 1 -9 -3 -4 -2 0 -2 0 -1 -4 0 -9 -5 -9 1 -10 -1 -11 -1 -6 2 -6 5 -2 7 -3 10 -2 2 -1 3 0 1 0 4 -2 8 -1 3 6 4 1 3 8 3 10 1 6 3 5 0 9 0 7 -1 5 -6 3 -6 4 -1 5 6 4 5 3 5 4 9 1 10 0 4 4 3 4 5 10 1 3 z " />
                                    <path id="CD-interest-11140" class="interest-OUTLINE"
                                        d="M 477 316 l 0 9 5 5 -1 3 -4 5 -4 5 -5 4 -4 7 -3 4 -4 3 -4 10 -2 -1 -3 -7 -2 -5 -2 1 -1 0 -2 -1 -3 1 0 0 -3 1 -4 2 -5 -5 -6 -3 -10 -3 -4 -1 -3 -1 -2 2 -4 -1 -3 -1 -9 0 -2 2 -4 3 0 -7 1 -4 -2 -2 0 -1 6 -3 6 -4 -1 -2 -2 -5 2 -3 4 -3 9 -1 10 1 9 2 9 -1 8 -1 9 -1 8 0 11 -1 z " />
                                    <path id="CD-interest-11170" class="interest-OUTLINE"
                                        d="M 394 349 l 3 1 4 1 2 -2 3 1 4 1 10 3 6 3 5 5 4 -2 3 -1 0 0 3 -1 2 1 1 0 2 -1 2 5 3 7 2 1 5 9 6 2 2 9 -4 5 -4 5 -5 6 -3 4 -5 4 -5 5 -5 4 -5 3 -8 8 -5 8 -7 3 -7 -1 -10 -4 -3 -1 -6 -3 -6 -5 -5 -3 -6 -3 -9 -3 1 -5 0 -10 -2 -8 -6 -11 5 -2 4 -1 5 -4 5 -6 2 -5 3 -6 6 -5 0 -3 -2 -3 4 -3 2 -2 z " />
                                    <path id="CD-interest-11200" class="interest-OUTLINE"
                                        d="M 511 315 l 7 4 6 6 4 4 6 5 2 0 15 3 4 0 -5 20 -3 5 -5 12 -3 7 -10 20 -7 -4 -5 -3 -4 -4 -10 -3 -10 0 -7 0 -12 0 -8 4 -2 -9 -6 -2 -5 -9 4 -10 4 -3 3 -4 4 -7 5 -4 4 -5 4 -5 1 -3 -5 -5 0 -9 6 1 11 -1 5 -2 2 -1 6 0 z " />
                                    <path id="CD-interest-11215" class="interest-OUTLINE"
                                        d="M 605 315 l 1 1 -1 4 -1 7 -2 9 3 6 4 4 3 -3 9 -1 3 3 -4 10 -2 10 -2 5 -2 4 -4 5 -5 5 -5 4 -11 12 -3 3 -3 2 -8 5 -6 3 -5 1 -5 -1 -5 -1 -6 -2 -12 -5 -7 -4 13 -27 5 -12 3 -5 5 -20 3 -8 4 -5 4 -9 7 1 11 3 9 -3 4 -3 4 -2 z " />
                                    <path id="CD-interest-11230" class="interest-OUTLINE"
                                        d="M 554 245 l 2 10 -2 5 -3 6 2 9 1 6 3 9 3 6 2 3 1 11 3 5 -4 9 -4 5 -3 8 -4 0 -15 -3 -2 0 -6 -5 -4 -4 -6 -6 -7 -4 -4 -2 -6 0 -2 1 -5 2 -11 1 -6 -1 0 -8 -2 -6 6 -4 6 -5 4 -6 3 -4 4 -5 2 -3 6 -8 4 -2 8 -3 4 -5 7 -1 7 -2 4 -6 7 -2 z " />
                                    <path id="CD-interest-11260" class="interest-OUTLINE"
                                        d="M 621 218 l 5 3 1 6 0 10 2 8 -3 8 -3 5 0 3 3 4 -1 6 -4 2 -5 9 0 5 -4 6 -4 3 -4 5 -3 10 -4 2 -4 3 -9 3 -11 -3 -7 -1 -3 -5 -1 -11 -2 -3 -3 -6 -3 -9 -1 -6 -2 -9 3 -6 2 -5 -2 -10 0 -8 2 -11 6 -3 4 -1 9 -4 9 1 10 1 6 -2 9 -1 z " />
                                    <path id="CD-interest-11290" class="interest-OUTLINE"
                                        d="M 455 297 l -3 -2 -1 -3 -5 -10 -3 -4 -4 -4 -10 0 -9 -1 -5 -4 -5 -3 -6 -4 1 -5 6 -4 6 -3 1 -5 0 -7 0 -9 -3 -5 -1 -6 -3 -10 -3 -8 -4 -1 -3 -6 9 -5 4 -3 4 1 5 4 6 4 3 2 4 5 5 5 7 3 5 2 -1 3 0 0 0 2 1 3 5 6 9 3 4 3 5 3 8 -1 6 4 9 -4 4 -6 4 -4 4 -4 4 -6 4 -3 5 4 4 5 5 5 5 4 9 0 9 -2 -2 11 0 8 -7 1 -7 2 -4 6 -7 2 -7 1 -4 5 -8 3 -4 2 -6 8 -2 3 -4 5 -3 4 -4 6 -6 5 -6 4 -7 -3 -4 -5 -3 1 -1 0 -1 0 z " />
                                    <path id="CD-interest-11305" class="interest-OUTLINE"
                                        d="M 448 87 l 2 0 1 0 0 0 4 4 3 7 4 5 4 7 3 5 1 2 -2 4 -2 6 -2 9 -2 8 -1 5 0 4 2 4 5 3 3 0 2 -1 3 2 7 5 3 3 7 6 2 6 5 4 3 7 6 6 7 6 3 6 -4 3 -4 6 -4 4 -4 4 -4 6 -9 4 -6 -4 -8 1 -5 -3 -4 -3 -9 -3 -4 -6 -2 -3 0 -2 0 0 1 -3 -5 -2 -7 -3 -5 -5 -4 -5 -3 -2 -6 -4 -5 -4 -4 -1 3 -4 0 -6 -3 -4 1 -3 2 -3 -2 -4 -3 -7 -4 -9 4 -1 7 -7 4 -8 6 -4 2 -5 0 -13 -1 -7 2 -5 6 -5 7 -2 z " />
                                    <path id="CD-interest-11320" class="interest-OUTLINE"
                                        d="M 463 157 l -2 -4 0 -4 1 -5 2 -8 2 -9 2 -6 2 -4 -1 -2 -3 -5 -4 -7 -4 -5 -3 -7 -1 -9 0 -8 4 -11 8 -8 10 1 9 0 3 4 1 6 3 5 9 -1 4 -2 4 -1 4 4 5 0 5 13 0 9 -1 5 -4 12 0 8 3 9 2 9 3 10 1 9 2 7 -2 13 -3 -4 -2 -3 -2 3 -5 5 -1 6 -4 9 -1 7 -6 -6 -3 -7 -5 -4 -2 -6 -7 -6 -3 -3 -7 -5 -3 -2 -2 1 -3 0 z " />
                                    <path id="CD-interest-11350" class="interest-OUTLINE"
                                        d="M 619 183 l 1 7 -3 7 -6 5 -3 7 1 8 -9 1 -6 2 -10 -1 -9 -1 -9 4 -4 1 -6 3 -9 2 -9 0 -5 -4 -5 -5 -4 -5 -5 -4 -3 -6 -7 -6 1 -7 4 -9 1 -6 5 -5 2 -3 2 3 3 4 2 -13 -2 -7 -1 -9 -3 -10 -2 -9 -3 -9 0 -8 4 -12 1 -5 0 -9 6 -4 5 -2 4 -4 4 -6 6 0 3 1 4 0 5 -1 4 -2 7 -1 5 8 5 5 5 0 3 -1 5 4 -3 10 -2 7 -1 2 1 3 3 7 2 8 -2 11 -2 5 -3 4 0 4 2 6 1 6 0 10 3 5 7 0 5 -2 5 0 4 4 4 3 z " />
                                    <path id="CD-interest-11380" class="interest-OUTLINE"
                                        d="M 368 148 l 3 2 1 3 2 11 2 9 2 8 3 5 0 5 -3 3 -5 5 -7 3 -5 2 -2 6 1 6 1 11 -1 10 -7 6 -4 3 -4 7 0 7 -5 2 -9 4 -4 4 -3 5 -3 7 -5 4 -3 4 -8 -1 0 -3 -1 0 -3 -2 -3 2 -4 5 -4 5 -5 5 -1 5 -9 -8 -12 -9 -1 -2 -6 -6 -4 -5 6 -9 1 2 -2 5 2 5 8 0 9 -1 3 -6 1 -4 2 -5 -1 -9 2 -8 -2 -10 2 -10 4 -7 3 -4 2 -6 2 -9 -1 -10 5 -4 0 -1 -1 -5 1 -4 1 -4 0 -5 -5 -3 -5 -5 0 -1 1 1 5 3 6 4 11 -1 10 -3 3 -3 4 -2 9 -4 4 -5 3 -5 5 -2 6 -2 3 4 z " />
                                    <path id="CD-interest-11410" class="interest-OUTLINE"
                                        d="M 365 255 l 1 4 2 0 2 0 3 4 -1 9 0 9 0 10 0 6 -5 3 2 5 4 5 5 6 3 4 6 6 2 5 1 2 -6 4 -6 3 -3 3 -8 0 -10 1 -11 1 -7 2 -10 -4 -7 -6 -2 -10 -6 -3 -6 -2 -4 -2 -8 -4 -5 -5 -7 -5 1 -5 5 -5 4 -5 4 -5 3 -2 3 2 1 0 0 3 8 1 3 -4 5 -4 3 -7 3 -5 4 -4 9 -4 5 -2 0 -7 4 -7 4 -3 7 -6 5 9 z " />
                                    <path id="CD-interest-11440" class="interest-OUTLINE"
                                        d="M 263 289 l 12 9 9 8 7 5 5 5 8 4 4 2 6 2 6 3 2 10 7 6 10 4 7 -2 11 -1 10 -1 8 0 3 -3 0 1 2 2 -1 4 0 7 2 3 0 3 -6 5 -3 6 -2 5 -5 6 -5 4 -4 1 -5 2 -7 -4 -5 -4 -5 -3 -5 -2 -4 1 -4 2 -6 -4 -11 0 -12 0 -5 -2 -6 -7 -6 -6 -8 -4 -8 -4 -5 -4 -5 -3 -11 -7 -8 -5 -4 -2 -6 -4 -4 -4 -4 -3 -6 -6 -1 -3 8 -4 4 -2 4 -2 10 -2 10 -2 3 -2 0 -1 -1 -6 0 -5 4 -5 5 -4 4 5 6 6 z " />
                                    <path id="CD-interest-11470" class="interest-OUTLINE"
                                        d="M 240 363 l 8 -1 5 5 2 5 4 8 4 9 -2 3 2 2 0 2 -8 3 -5 4 -3 4 -2 12 0 4 -2 7 -4 6 -1 8 -2 6 -1 -1 -4 -2 -10 -2 -6 -2 -4 -5 -8 -1 -8 2 -4 4 -7 3 -4 3 -5 1 -3 -1 -4 -5 -4 -4 -4 -2 -3 -12 2 -9 1 -7 4 -5 0 -4 -4 -4 -4 -6 -2 -11 4 -7 3 -7 5 -2 1 6 5 5 2 6 3 9 3 7 3 4 12 1 7 -2 11 -1 7 -2 1 -8 0 -7 -1 -9 0 -10 2 -8 5 2 5 4 z " />
                                    <path id="CD-interest-11500" class="interest-OUTLINE"
                                        d="M 134 254 l 3 3 6 4 4 4 4 6 4 3 6 4 5 4 6 4 5 3 4 4 6 5 3 2 6 5 9 6 1 3 6 6 4 3 4 4 6 4 4 2 8 5 11 7 -4 8 3 9 -8 1 -8 -2 -5 -4 -5 -2 -2 8 0 10 1 9 0 7 -1 8 -7 2 -11 1 -7 2 -12 -1 -3 -4 -3 -7 -3 -9 -2 -6 -5 -5 -1 -6 -5 2 -3 7 -10 2 -9 -1 -7 -4 -3 -2 0 1 -9 5 -2 5 -6 2 -2 -6 -4 -5 -5 -4 -7 -2 -9 -2 -7 -4 -4 1 -1 -2 -2 -2 1 -1 -3 -2 -2 -7 8 -4 2 -5 6 -2 -1 -5 -2 -5 0 -3 2 1 0 1 5 -3 3 -3 -1 -2 2 -1 1 -5 8 -4 1 -1 1 1 2 -5 2 -6 1 3 1 2 2 -9 2 -4 2 2 1 -4 5 -5 0 -6 -3 -5 -1 -6 0 -5 3 -4 4 -6 4 2 z " />
                                    <path id="CD-interest-11530" class="interest-OUTLINE"
                                        d="M 245 419 l 6 7 4 4 5 2 4 4 4 9 -1 9 2 9 1 6 1 5 3 7 5 5 4 3 -3 5 -4 5 -10 1 -7 -3 -4 -5 -5 -4 -5 -3 -2 0 -2 1 -3 -5 -4 -2 3 -2 0 -1 -3 0 -3 2 -1 -5 -2 -6 -2 1 -1 1 1 1 -4 4 -5 3 -4 5 -4 4 -6 6 -9 2 -2 4 -1 10 -6 0 -8 -1 -5 -4 -4 0 -4 2 -9 0 -5 1 -8 1 2 -4 4 -5 2 -8 2 -5 3 -4 -2 -5 -3 -1 -8 -5 -1 -7 6 -3 4 -6 2 -4 2 -6 5 -6 4 2 4 4 4 5 3 1 5 -1 4 -3 7 -3 4 -4 8 -2 8 1 4 5 6 2 10 2 4 2 1 1 2 -6 1 -8 4 -6 2 -7 z " />
                                    <path id="CD-interest-11545" class="interest-OUTLINE"
                                        d="M 241 486 l 2 -1 2 0 5 3 5 4 4 5 7 3 10 -1 11 -1 6 1 3 10 -3 8 3 6 3 6 1 6 4 8 8 3 3 4 5 4 2 6 -7 7 -2 5 -3 6 -8 1 -5 4 -4 7 -9 -1 -4 -4 -3 -4 -2 -9 -3 -5 -2 -3 1 -3 -1 -3 -3 -4 -6 -3 -4 -6 -1 -9 -4 -4 -1 -4 2 -2 -2 -3 -3 -5 -4 -6 -2 -4 -4 -9 -3 -8 -1 -4 1 -2 z " />
                                    <path id="CD-interest-11560" class="interest-OUTLINE"
                                        d="M 249 345 l 5 3 5 4 8 4 8 4 6 6 6 7 5 2 12 0 11 0 6 4 4 -2 4 -1 5 2 5 3 5 4 7 4 6 11 2 8 0 10 -1 5 -11 2 -8 1 -9 1 -8 2 -2 5 -3 8 -2 3 -3 10 -2 8 -9 2 -3 1 -4 7 -4 5 -3 5 -4 6 -4 -3 -5 -5 -3 -7 -1 -5 -1 -6 -2 -9 1 -9 -4 -9 -4 -4 -5 -2 -4 -4 -6 -7 2 -12 3 -4 5 -4 8 -3 0 -2 -2 -2 2 -3 -4 -9 -4 -8 -2 -5 -5 -5 -3 -9 z " />
                                    <path id="CD-interest-11590" class="interest-OUTLINE"
                                        d="M 367 426 l 6 3 5 3 6 5 6 3 3 1 10 4 7 1 -3 4 0 0 4 5 2 8 -2 11 0 6 -1 11 0 8 0 9 -5 -2 -14 0 -3 -2 -5 -4 -6 -10 0 -11 -2 -6 -7 3 -3 1 -2 -2 -7 -3 -9 1 -7 0 -11 -2 -6 -1 -6 7 -6 1 -10 4 -4 3 -2 1 -12 3 4 -6 3 -5 4 -5 4 -7 3 -1 9 -2 2 -8 3 -10 2 -3 3 -8 2 -5 8 -2 9 -1 8 -1 11 -2 z " />
                                    <path id="CD-interest-11620" class="interest-OUTLINE"
                                        d="M 323 470 l 6 1 11 2 7 0 9 -1 7 3 2 2 3 -1 7 -3 2 6 0 11 6 10 5 4 3 2 14 0 5 2 2 8 4 6 3 4 0 11 1 5 -9 4 -7 2 -3 1 -5 4 -5 7 -8 5 -2 7 -1 5 -5 2 -9 2 -9 1 -10 2 -4 2 -2 0 -3 -5 -2 -6 -5 -4 -5 -7 -4 -4 -2 -6 -5 -4 -3 -4 -8 -3 -4 -8 -1 -6 -3 -6 -3 -6 3 -8 -3 -10 -6 -1 -11 1 4 -5 3 -5 12 -3 2 -1 4 -3 10 -4 6 -1 z " />
                                    <path id="CD-interest-11650" class="interest-OUTLINE"
                                        d="M 460 413 l 1 0 2 -3 6 9 1 6 0 1 3 9 5 15 5 13 6 17 7 10 6 -1 5 5 1 3 4 9 7 13 3 5 6 -2 4 0 6 -1 9 -2 8 -4 5 -3 2 -2 11 0 4 8 2 3 5 6 2 7 4 4 1 7 -5 8 -6 10 0 6 -6 4 -4 4 -5 0 -4 -1 -4 0 -2 6 -2 8 -1 4 -1 2 1 3 -4 0 -10 2 -9 0 -8 0 -7 -4 -4 -6 -5 -5 -4 -2 -5 -4 1 -5 2 -4 -1 -8 0 -5 -2 -4 2 -5 0 -1 -3 -4 -2 -9 -2 -6 -5 0 -2 7 -3 6 -6 4 -8 2 -4 1 -2 0 -6 -3 -3 -3 0 0 -1 -2 -3 -6 -2 -8 -8 -2 -5 3 1 3 0 1 -4 4 -6 3 -4 3 -1 -5 0 -11 -3 -4 -4 -6 -2 -8 0 -9 0 -8 1 -11 0 -6 2 -11 -2 -8 -4 -5 0 0 3 -4 7 -3 5 -8 8 -8 5 -3 5 -4 5 -5 5 -4 3 -4 z " />
                                    <path id="CD-interest-11680" class="interest-OUTLINE"
                                        d="M 503 387 l 10 3 4 4 5 3 7 4 7 4 12 5 0 10 0 4 1 13 1 6 1 10 6 2 7 1 6 2 3 2 12 4 5 2 5 3 6 3 5 4 5 5 3 6 3 5 3 5 4 7 2 2 5 10 3 4 4 5 -10 11 -2 6 -4 0 -3 -4 -9 -2 -4 0 0 2 -1 1 -3 3 -11 3 -1 -7 -4 -4 -2 -7 -5 -6 -2 -3 -4 -8 -11 0 -2 2 -5 3 -8 4 -9 2 -6 1 -4 0 -6 2 -3 -5 -7 -13 -4 -9 -1 -3 -5 -5 -6 1 -7 -10 -6 -17 -5 -13 -5 -15 -3 -9 0 -1 -1 -6 -6 -9 -2 3 -1 0 -7 -6 5 -6 4 -5 4 -5 8 -4 12 0 7 0 z " />
                                    <path id="CD-interest-11710" class="interest-OUTLINE"
                                        d="M 621 374 l 6 2 4 2 4 4 0 8 -2 5 -1 3 0 7 5 2 8 5 5 3 8 4 3 2 5 3 5 2 -4 3 0 6 -3 10 4 5 5 3 10 0 9 3 5 5 -1 4 -2 7 -3 9 -4 3 -5 4 -5 5 -2 6 -3 7 -5 5 -10 0 -6 0 0 8 -4 5 -6 -2 -2 -1 -1 4 -4 -5 -3 -4 -5 -10 -2 -2 -4 -7 -3 -5 -3 -5 -3 -6 -5 -5 -5 -4 -6 -3 -5 -3 -5 -2 -12 -4 -3 -2 -6 -2 -7 -1 -6 -2 -1 -10 -1 -6 -1 -13 0 -4 0 -10 6 2 5 1 5 1 5 -1 6 -3 8 -5 3 -2 3 -3 11 -12 5 -4 5 -5 4 -5 z " />
                                    <path id="CD-interest-11740" class="interest-OUTLINE"
                                        d="M 726 320 l 1 7 3 9 0 9 1 9 1 10 1 5 -1 -1 -5 -1 -3 0 -4 2 -11 0 -8 1 -5 6 -4 5 -4 6 -2 4 -1 8 -4 7 -3 2 1 1 -1 2 -6 7 -1 8 -5 -2 -5 -3 -3 -2 -8 -4 -5 -3 -8 -5 -5 -2 0 -7 1 -3 2 -5 0 -8 -4 -4 -4 -2 -6 -2 -7 0 2 -4 2 -5 2 -10 4 -10 1 -1 4 -6 7 -6 5 -3 6 -3 8 -3 4 -1 5 0 11 0 9 -4 7 -5 8 -6 11 -6 11 0 0 7 3 6 z " />
                                </g>
                                <g id = "interest-text">
                                    <text id="interest-11110" class="interest-TEXT" x="399" y="277">종로구</text>
                                    <text id="interest-11140" class="interest-TEXT" x="433" y="338">중구</text>
                                    <text id="interest-11170" class="interest-TEXT" x="407" y="395">용산구</text>
                                    <text id="interest-11200" class="interest-TEXT" x="505" y="356">성동구</text>
                                    <text id="interest-11215" class="interest-TEXT" x="577" y="365">광진구</text>
                                    <text id="interest-11230" class="interest-TEXT" x="528" y="294">동대문구</text>
                                    <text id="interest-11260" class="interest-TEXT" x="589" y="270">중랑구</text>
                                    <text id="interest-11290" class="interest-TEXT" x="466" y="258">성북구</text>
                                    <text id="interest-11305" class="interest-TEXT" x="459" y="181">강북구</text>
                                    <text id="interest-11320" class="interest-TEXT" x="494" y="125">도봉구</text>
                                    <text id="interest-11350" class="interest-TEXT" x="560" y="153">노원구</text>
                                    <text id="interest-11380" class="interest-TEXT" x="323" y="218">은평구</text>
                                    <text id="interest-11410" class="interest-TEXT" x="342" y="302">서대문구</text>
                                    <text id="interest-11440" class="interest-TEXT" x="293" y="339">마포구</text>
                                    <text id="interest-11470" class="interest-TEXT" x="209" y="421">양천구</text>
                                    <text id="interest-11500" class="interest-TEXT" x="156" y="334">강서구</text>
                                    <text id="interest-11530" class="interest-TEXT" x="199" y="470">구로구</text>
                                    <text id="interest-11545" class="interest-TEXT" x="279" y="537">금천구</text>
                                    <text id="interest-11560" class="interest-TEXT" x="295" y="413">영등포구</text>
                                    <text id="interest-11590" class="interest-TEXT" x="361" y="461">동작구</text>
                                    <text id="interest-11620" class="interest-TEXT" x="353" y="529">관악구</text>
                                    <text id="interest-11650" class="interest-TEXT" x="481" y="515">서초구</text>
                                    <text id="interest-11680" class="interest-TEXT" x="533" y="464">강남구</text>
                                    <text id="interest-11710" class="interest-TEXT" x="624" y="448">송파구</text>
                                    <text id="interest-11740" class="interest-TEXT" x="675" y="358">강동구</text>
                                </g>
                            </svg>
                        </div>
                    </div>
                    <div class = "row my-3 div-dang-interest-list">
                        <div class = "col-4">
                            <div class = "d-flex justify-content-center align-items-center div-dang-interest div-dang-interest-inactive">
                            
                            </div>
                        </div>
                        <div class = "col-4">
                            <div class = "d-flex justify-content-center align-items-center div-dang-interest div-dang-interest-inactive">
                                
                            </div>
                        </div>
                        <div class = "col-4">
                            <div class = "d-flex justify-content-center align-items-center div-dang-interest div-dang-interest-inactive">
                                
                            </div>
                        </div>
                    </div>
                    <div class = "row my-3">
                        <div class = "col d-flex">
                            <button class = "flex-fill btn-dang-interest-submit">관심지역 저장</button>
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
		
		$(".img-change-interest-area").attr("src", "/images/mypage-interest_area_pink.png")
		
		if($("[name=interestArea]").length != 0) {
			// 태그를 생성할 위치
			var target = $(".div-dang-interest-list");
			// 초기화
			target.empty();
			// 태그 생성
			var dangInterestLength = $("[name=interestArea]").length;
			// 등록된 관심지역이 3개인지 여부에 따라 다른 처리
			if(dangInterestLength >= 3) { // 관심지역이 3개 등록된 상태라면
				for(var i = 0 ; i < dangInterestLength ; i ++) { // 등록된 관심지역 태그 생성
					target
						.append(
							$("<div>").attr("class", "col-4")
								.append(
									$("<div>").attr("class", "position-relative div-dang-interest div-dang-interest-active")
										.append(
											$("<span>").attr("class", "span-dang-interest").text($("[name=interestArea]").eq(i).prop("value"))
										)
										.append(
											$("<i>").attr("class" , "fa-solid fa-xmark i-dang-interest-cancel")
										)		
								)
						)
				}
			} else { // 관심지역이 3개 미만으로 등록된 상태라면
				for(var i = 0 ; i < dangInterestLength ; i ++) { // 등록된 관심지역 태그 생성
					target
						.append(
							$("<div>").attr("class", "col-4")
								.append(
									$("<div>").attr("class", "position-relative div-dang-interest div-dang-interest-active")
										.append(
											$("<span>").attr("class", "span-dang-interest").text($("[name=interestArea]").eq(i).prop("value"))
										)
										.append(
											$("<i>").attr("class" , "fa-solid fa-xmark i-dang-interest-cancel")
										)		
								)
						)
				}
				for(var i = 0 ; i < 3 - dangInterestLength ; i ++) { // 미등록된 관심지역 태그 생성
					target
						.append(
							$("<div>").attr("class", "col-4")
								.append(
									$("<div>").attr("class", "div-dang-interest div-dang-interest-inactive")
								)
						)
				}
			}
			
			for(var i = 0 ; i < dangInterestLength ; i ++) {
				// 관심지역명으로 태그를 찾아 해당 태그의 id 저장
				var dangInterestId = $("text").filter(":contains("+$("[name=interestArea]").eq(i).prop("value")+")").prop("id");
				// 해당 관심지역 id를 가진 관심지역 영역 태그에 클래스를 부여하여 색 변경
				$("#CD-" + dangInterestId).addClass("interest-area-selected");
			}
		}
		
		// 관심지역 선택 - 관심지역 지역명 클릭 이벤트
		$(document).on("click", ".interest-TEXT", function(){
			// 만약 관심지역 3개가 등록된 상태라면 return
			if($(".div-dang-interest-active").length == 3) {
				return;
			}
			// 관심지역 등록할 지역 id
			var dangInterestInsertId = $(this).prop("id");
			// 클래스를 부여할 관심지역 영역 태그
			var dangInterestInsertPath = $("#CD-" + dangInterestInsertId);
			// 만약 이미 클래스가 부여된 태그라면(이미 선택된 관심지역이라면)
			if(dangInterestInsertPath.hasClass("interest-area-selected") == true) {
				return;
			}
			// 해당 관심지역 id로 관심지역 영역 태그에 클래스를 부여하여 색 변경
			dangInterestInsertPath.addClass("interest-area-selected");
			// 관심지역 등록할 지역명
			var dangInterestInsertName = $(this).text();
			// 가장 앞에 있는 관심지역 미등록 태그 위치
			var target = $(".div-dang-interest-inactive").eq(0).parent();
			// 삭제
			target.empty();
			// 태그를 생성할 위치
			//var target = $(".div-dang-interest-list");
			// 관심지역 등록 태그 생성
			target
				.append(
					$("<div>").attr("class", "position-relative div-dang-interest div-dang-interest-active")
						.append(
							$("<span>").attr("class", "span-dang-interest").text(dangInterestInsertName)
						)
						.append(
							$("<i>").attr("class" , "fa-solid fa-xmark i-dang-interest-cancel")
						)	
				)
		});
		
		// 관심지역 삭제 - 관심지역 X버튼 클릭 이벤트
		$(document).on("click", ".i-dang-interest-cancel", function(){
			// 관심지역 취소할 지역명
			var dangInterestCancelName = $(this).prev().text();
			// 관심지역명으로 태그를 찾아 해당 태그의 id 저장
			var dangInterestCancelId = $("text").filter(":contains("+dangInterestCancelName+")").prop("id");
			// 해당 관심지역 id로 관심지역 영역 태그에 클래스를 부여하여 색 변경
			$("#CD-" + dangInterestCancelId).removeClass("interest-area-selected");
			// 태그를 생성할 위치
			var targetAttach = $(this).parents(".div-dang-interest-list");
			var targetRemove = $(this).parent().parent();
			// 관심지역 미등록 태그 생성
			targetAttach
				.append(
					$("<div>").attr("class", "col-4")
						.append(
							$("<div>").attr("class", "div-dang-interest div-dang-interest-inactive")			
						)
				)
			// 초기화
			targetRemove.remove();
		});
		
		// 관심지역 저장 - 관심지역 관심지역 저장 버튼 클릭 이벤트
		$(document).on("click", ".btn-dang-interest-submit", function(){
			// 선택한 관심지역을 담기위한 배열
			var dangInterestArray = [];
			for(var i = 0 ; i < $(".span-dang-interest").length ; i ++) {
				dangInterestArray.push($(".span-dang-interest").eq(i).text());
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_user/change_interest",
				method : "post",
				data : {
					dangInterestArray : dangInterestArray
				},
				success : function() {
					alert("관심지역이 저장되었습니다!");
					location.href = "${pageContext.request.contextPath}/user/change_interest_area"
				}
			});
		});
	});
</script>