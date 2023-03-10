<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="댕모임 가입" name="title"/>
</jsp:include>

<style>

	* {
	
	}
	
	input, select {
		border-radius : 10px;
		border : 1px solid #76BEFF;
	}
	
	input:focus, select:focus {
		outline : 2px solid #76BEFF;
	}
	
	.img-dang-join-logo {
		width : 3rem;
	}
	
	.strong-page-title {
		font-size : 36px;
	}
	
	.div-row-input-dang-user-join {
		height : 9rem;
	}
	
	.div-row-input-dang-user-join-gender-select {
		height : 16rem;
	}
	
	.div-row-input-dang-user-join-email-send {
		height : 14rem;
	}
	
	.div-row-input-dang-user-join-check-term {
		height : 12rem;
	}
	
	.span-dang-join-main-text {
		font-size : 20px;
	}
	
	.input-check-gender {
		display: none;
	}
	
	.img-user-gender {
		border-radius: 50%;
		padding: 5px;
	}
	
	.gender-selected {
		border: 5px solid black;
		padding: 1px;
	}
	
	.label-open-modal-condition,
	.label-open-modal-privacy {
		cursor : pointer;
	}
	
	.span-dang-term-check-required {
		color : red;
	}
	
	.btn-dang-send-email {
		border-radius : 5px;
		border : none;
		background-color : #787878;
		color : white;
	}
	
	.btn-dang-send-email:disabled {
		opacity : 0.5;
	}
	
	.btn-submit-join {
		border-radius : 5px;
		border : none;
		background-color : #76BEFF;
		color : white;
	}
	
	.btn-modal-close {
		border : none;
		background-color : white;
	}
	
	.btn-agree-condition,
	.btn-agree-privacy {
		border : none;
		border-radius : 10px;
		background-color : #76BEFF;
		color : white;
	}
	
	.btn-cancel-condition,
	.btn-cancel-privacy {
		border : none;
		border-radius : 10px;
		background-color : #787878;
		color : white;
	}
	
	/* 전화번호 입력창 */
	.select-user-tel-first {
		width : 20%;
	}
	
	.strong-user-tel-minus {
		width : 5%;
		font-size : 24px;
	}
	
	.input-user-tel-second,
	.input-user-tel-third {
		width : 35%;
	}
	
</style>

<form class = "container-fluid my-3">
	<div class = "row">
		<div class = "col-6 offset-3">
			<div class = "row">
				<div class = "offset-2 col-8">
					<div class = "row my-3">
						<div class = "col d-flex justify-content-center align-items-center">
							<img class = "img-dang-join-logo me-2" src = "${pageContext.request.contextPath}/images/logo2.png">
							<strong class = "strong-page-title">회원가입</strong>
						</div>
					</div>
					<div class = "row div-row-input-dang-user-join">
						<div class = "col d-flex flex-column py-2">
							<div class = "row">
								<div class = "col">								
									<strong class = "span-dang-join-main-text">아이디</strong>
								</div>
							</div>
							<div class = "row my-3">
								<div class = "col">								
									<input class = "w-100 p-2" id = "userId" type = "text" autocomplete = "false" placeholder = "아이디(영문 소문자, 숫자를 포함한 8~20자)" maxlength = "20">
								</div>
							</div>
							<div class = "row">
								<div class = "col">								
									<span class = "span-check span-check-invalid check-id check-id-empty">ID를 입력해주세요.</span>
									<span class = "span-check span-check-valid check-id check-id-valid">사용할 수 있는 아이디입니다.</span>
									<span class = "span-check span-check-invalid check-id check-id-already">이미 사용 중인 아이디입니다.</span>
									<span class = "span-check span-check-invalid check-id check-id-invalid">영문 소문자, 숫자를 반드시 포함된 8~20자가 되어야 합니다.</span>
								</div>
							</div>
						</div>
					</div>
					<div class = "row div-row-input-dang-user-join">
						<div class = "col d-flex flex-column py-2">
							<div class = "row">
								<div class = "col">								
									<strong class = "span-dang-join-main-text">비밀번호</strong>
								</div>
							</div>
							<div class = "row my-3">
								<div class = "col">								
									<input class = "w-100 p-2" id = "userPw" type = "password" autocomplete = "false" placeholder = "영문 대/소문자, 숫자, 특수문자(!@#$)를 반드시 포함한 8~16자"  maxlength = "16">
								</div>
							</div>
							<div class = "row">
								<div class = "col">								
									<span class = "span-check span-check-invalid check-pw check-pw-empty">비밀번호를 입력해주세요.</span>
									<span class = "span-check span-check-valid check-pw check-pw-valid">사용할 수 있는 비밀번호입니다.</span>
									<span class = "span-check span-check-invalid check-pw check-pw-invalid">영문 대/소문자, 숫자, 특수문자(!@#$)를 반드시 포함한 8~16자가 되어야 합니다.</span>
								</div>
							</div>
						</div>
					</div>
					<div class = "row div-row-input-dang-user-join">
						<div class = "col d-flex flex-column py-2">
							<div class = "row">
								<div class = "col">								
									<strong class = "span-dang-join-main-text">비밀번호 확인</strong>
								</div>
							</div>
							<div class = "row my-3">	
								<div class = "col">								
									<input class = "w-100 p-2" id = "userPwck" type = "password" autocomplete = "false" placeholder = "입력한 비밀번호와 같은 비밀번호"  maxlength = "16">
								</div>						
							</div>
							<div class = "row">
								<div class = "col">								
									<span class = "span-check span-check-invalid check-pwck check-pwck-empty">비밀번호를 한번 더 입력해주세요.</span>
									<span class = "span-check span-check-valid check-pwck check-pwck-valid">비밀번호가 일치합니다.</span>
									<span class = "span-check span-check-invalid check-pwck check-pwck-different">비밀번호가 일치하지 않습니다.</span>
									<span class = "span-check span-check-invalid check-pwck check-pwck-invalid">영문 대/소문자, 숫자, 특수문자(!@#$)를 반드시 포함한 8~16자가 되어야 합니다.</span>
								</div>
							</div>
						</div>
					</div>
					<div class = "row div-row-input-dang-user-join">
						<div class = "col d-flex flex-column py-2">
							<div class = "row">	
								<div class = "col">								
									<strong class = "span-dang-join-main-text">닉네임</strong>
								</div>						
							</div>
							<div class = "row my-3">
								<div class = "col">								
									<input class = "w-100 p-2" id = "userNick" type = "text" autocomplete = "false" placeholder = "한글, 영문 대/소문자, 숫자를 포함한 2~6자" maxlength = "6">
								</div>
							</div>
							<div class = "row">	
								<div class = "col">								
									<span class = "span-check span-check-invalid check-nick check-nick-empty">닉네임을 입력해주세요.</span>
									<span class = "span-check span-check-invalid check-nick check-nick-invalid">한글, 영문 대/소문자, 숫자를 포함한 2~6자리가 되어야 합니다.</span>
									<span class = "span-check span-check-valid check-nick check-nick-valid">멋진 닉네임이네요!</span>
								</div>						
							</div>
						</div>
					</div>
					<div class = "row div-row-input-dang-user-join">
						<div class = "col d-flex flex-column py-2">
							<div class = "row">
								<div class = "col">
									<strong class = "span-dang-join-main-text">전화번호</strong>								
								</div>
							</div>
							<div class = "row my-3">
								<div class = "col d-flex justify-content-center align-items-center">
									<select class = "p-2 select-user-tel-first">
										<option value = "">선택</option>
										<option value = "010">010</option>
										<option value = "011">011</option>
										<option value = "016">016</option>
										<option value = "017">017</option>
										<option value = "018">018</option>
										<option value = "019">019</option>
									</select>
									<strong class = "strong-user-tel-minus text-center">-</strong>
									<input class = "p-2 input-user-tel input-user-tel-second" type = "text" autocomplete = "false" maxlength = "4">
									<strong class = "strong-user-tel-minus text-center">-</strong>
									<input class = "p-2 input-user-tel input-user-tel-third" type = "text" autocomplete = "false" maxlength = "4">
								</div>
							</div>
							<div class = "row">
								<div class = "col">
									<span class = "span-check span-check-valid check-tel check-tel-valid">올바른 형태의 전화번호 입니다.</span>
									<span class = "span-check span-check-invalid check-tel check-tel-invalid">올바른 형태의 전화번호를 입력해 주세요.</span>			
								</div>
							</div>
						</div>
					</div>
					<div class = "row div-row-input-dang-user-join-gender-select">
						<div class = "col d-flex flex-column py-2">
							<div class = row>
								<div class = "col">								
									<strong class = "span-dang-join-main-text">성별</strong>
								</div>
							</div>
							<div class = "row">
								<label class = "col-4 offset-1" for = "checkGenderMan">
									<input type = "checkbox" class = "input-check-gender" id = "checkGenderMan" value = "M">
									<img class = "w-100 img-user-gender" src = "${pageContext.request.contextPath}/images/icon-man.png">
								</label>
								<label class = "col-4 offset-2" for = "checkGenderWoman">
									<input type = "checkbox" class = "input-check-gender" id = "checkGenderWoman" value = "F">
									<img class = "img-fluid img-user-gender" src = "${pageContext.request.contextPath}/images/icon-woman.png">
								</label>
							</div>
							<div class = "row">
								<span class = "span-check span-check-invalid check-gender check-gender-non-selected">성별을 선택해 주세요.</span>
							</div>
						</div>
					</div>
					<div class = "row div-row-input-dang-user-join-email-send">
						<div class = "col d-flex flex-column py-2">
							<div class = "row">
								<div class = "col">								
									<strong class = "span-dang-join-main-text">이메일</strong>
								</div>
							</div>
							<div class = "row my-3">
								<div class = "col-9">
									<input class = "w-100 p-2" id = "userEmail" type = "text" placeholder = "이메일">
								</div>
								<div class = "col-3">
									<button id = "sendEmail" class = "w-100 p-2 btn-dang-send-email" type = "button">전송</button>
								</div>
							</div>
							<div class = "row mb-3">
								<div class = "col">
									<input class = "w-100 p-2" id = "userCert" type = "text" placeholder = "인증번호(6자리)" maxlength = "6">
								</div>
							</div>
							<div class = "row">
								<div class = "col">
									<span class = "span-check span-check-invalid check-cert check-cert-email-empty">이메일을 입력해 주세요.</span>
									<span class = "span-check span-check-invalid check-cert check-cert-email-invalid">올바른 이메일 형식이 아닙니다.</span>
									<span class = "span-check span-check-invalid check-cert check-cert-already">이미 가입한 이메일입니다.</span>
									<span class = "span-check span-check-valid check-cert check-cert-send">인증번호를 발송했습니다.<br>인증번호가 오지 않으면 입력한 정보가 정확한지 확인하여 주세요.</span>
									<span class = "span-check span-check-valid check-cert check-cert-valid">인증 완료!</span>
									<span class = "span-check span-check-invalid check-cert check-cert-invalid">인증번호를 다시 확인해주세요.</span>
								</div>
							</div>
						</div>
					</div>
					<div class = "row div-row-input-dang-user-join-check-term">
						<div class = "col d-flex flex-column py-2">
							<div class = "row">
								<div class = "col">
									<strong class = "span-dang-join-main-text">이용약관</strong>
								</div>
							</div>
							<div class = "row my-2">
								<div class = "col d-flex flex-row">
									<input type = "checkbox" id = "checkAll">			
									<span class = "ms-1">전체 동의</span>
								</div>
							</div>
							<div class = "row mb-2">
								<div class = "col d-flex flex-row">
									<input type = "checkbox" class = "check-term" id = "checkCondition">
									<label class = "label-open-modal-condition ms-1">
										<span>이용약관</span>
										<span class = "span-dang-term-check-required">(필수)</span>
									</label>
								</div>
							</div>
							<div class = "row mb-2">
								<div class = "col d-flex flex-row">
									<input type = "checkbox" class = "check-term" id = "checkPrivacy">
									<label class = "label-open-modal-privacy ms-1">
										<span>개인정보수집 및 이용동의</span>
										<span class = "span-dang-term-check-required">(필수)</span>
									</label>
								</div>
							</div>
							<div class = "row">
								<div class = "col">
									<span class = "span-check span-check-invalid check-term check-term-invalid">필수 약관에 동의해 주세요.</span>
								</div>
							</div>
						</div>
					</div>
					<div class = "row my-3">
						<div class = "col-6 offset-3">						
							<button type = "submit" class = "w-100 p-2 btn-submit-join">가입</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

<!-- 이용약관 모달 -->
<div class="modal fade" id="modalCondition" tabindex="-1">
    <div class="modal-dialog modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">이용약관</h5>
                <button type="button" class="btn-modal-close fa-solid fa-xmark" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" style="overflow-y: scroll;">
                <div style="line-height: 18px;">제1조(목적)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">본 회원약관은&nbsp;댕모임(이하 '갑'라 한다)이 운영하는 인터넷관련 서비스(이하 '서비스'라 한다)를 이용함에 있어 관리자와
                    이용자(이하 '회원'라 한다)의 권리, 의무 및 책임사항을 규정함을 목적으로 한다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제2조 (약관의 효력)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.본 약관은 '갑'에 회원 가입 시 회원들에게 통지함으로써 효력을 발생합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.'갑'은 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.
                </div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">3.약관의 변경사항 및 내용은 '갑'의 홈페이지에 게시하는 방법으로 공시합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제3조 (약관 이외의 준칙)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">이 약관에 명시되지 않은 사항이 전기 통신 기본법, 전기통신 사업법, 기타 관련 법령에 규정되어 있는 경우 그 규정에 따릅니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제4조 (이용계약의 체결)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">회원 가입 시 회원 약관 밑에 있는 동의버튼을 누르면 약관에 동의하여 이 계약이 체결된 것으로 간주한다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제5조 (용어의 정의)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">이 약관에서 사용하는 용어의 정의는 다음과 같습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.회원: '갑'과 서비스 이용에 관한 계약을 체결한 자</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.아이디(ID): 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 '갑'이 승인하는 문자와 숫자의 조합</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">3.비밀번호: 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제6조 (이용신청)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.회원 가입은 온라인으로 가입신청 양식에 기록하여 '갑'에 제출함으로써 이용신청을 할 수 있습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.가입희망 회원은 반드시 자신의 본명 및 주민등록번호로 이용신청을 하여야 하며, 1개의 ID만 신청을 할 수 있습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제7조 (회원가입의 승낙)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">'갑'의 회원 가입 신청 양식에 가입 희망 회원이 인터넷으로 제6조와 같이 신청하면 '갑'은 바로 가입을 승인하여 서비스를 이용할 수
                    있다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제8조(회원가입 신청거절 및 강제 탈퇴)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1. '갑'은 타인의 명의나 주민등록번호를 도용하여 회원가입신청을 할 경우 회원가입신청을 거절할 수 있다.</div>
                <div style="line-height: 18px;">2. 회원가입신청이 승인이 된 후에도 허위사실의 기재가 발각되거나 '갑'의 명예를 회손시키거나 음란물이나 불건전한 내용을 게재할 경우
                    회원의 자격을 강제 탈퇴시킬 수 있다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제9조 (서비스 제공의 중지)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">'갑'은 다음 각 호의 1에 해당하는 경우 서비스의 제공을 중지할 수 있습니다</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.설비의 보수 등을 위하여 부득이한 경우&nbsp;</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지하는 경우&nbsp;</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">3.기타 '갑'이 서비스를 제공할 수 없는 사유가 발생한 경우.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제10조 ('갑'의 의무)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1. '갑'은 &nbsp;계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다하여야 합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.'갑'은 항상 회원의 신용정보를 포함한 개인신상정보의 보안에 대하여 관리에 만전을 기함으로서 회원의 정보보안에 최선을 다하여야 합니다.
                    &nbsp;&nbsp;</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제11조 (개인정보보호)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.'갑'은 이용자의 정보수집시 서비스의 제공에 필요한 최소한의 정보를 수집합니다.&nbsp;</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나 &nbsp;제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 '갑'이
                    집니다. 다만, 다음의 경우에는 예외로 합니다.&nbsp;</div>
                <div style="line-height: 18px;">&nbsp;①통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우 &nbsp;
                </div>
                <div style="line-height: 18px;">&nbsp;②전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우</div>
                <div style="line-height: 18px;">&nbsp;③범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우</div>
                <div style="line-height: 18px;">&nbsp;④기타 관계법령에서 정한 절차에 따른 요청이 있는 경우</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">3.회원은 언제든지 '갑'이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 '갑'은 이에 대해 지체없이
                    처리합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제12조 (회원의 의무)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항 등 '갑'이 통지하는 사항을 준수하여야 하며, 기타 '갑'의 업무에 방해되는
                    행위를 하여서는 안됩니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.회원은 '갑'의 사전 승낙 없이 서비스를 이용하여 어떠한 영리 행위도 할 수 없습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">3.회원은 서비스를 이용하여 얻은 정보를 '갑'의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판,방송 기타의 방법으로 사용하거나 이를
                    타인에게 제공할 수 없습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">4.회원은 이용신청서의 기재내용 중 변경된 내용이 있는 경우 서비스를 통하여 그 내용을 '갑'에게 통지하여야 합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">5.회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다.&nbsp;</div>
                <div style="line-height: 18px;">&nbsp; ①다른 회원의 아이디(ID)를 부정 사용하는 행위&nbsp;</div>
                <div style="line-height: 18px;">&nbsp; ②범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위&nbsp;</div>
                <div style="line-height: 18px;">&nbsp; ③선량한 풍속, 기타 사회질서를 해하는 행위</div>
                <div style="line-height: 18px;">&nbsp; ④타인의 명예를 훼손하거나 모욕하는 행위 &nbsp;</div>
                <div style="line-height: 18px;">&nbsp; ⑤타인의 지적재산권 등의 권리를 침해하는 행위&nbsp;</div>
                <div style="line-height: 18px;">&nbsp; ⑥해킹행위 또는 컴퓨터바이러스의 유포행위 &nbsp;</div>
                <div style="line-height: 18px;">&nbsp; ⑦타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송 또는 타 사이트를 링크하는 행위 &nbsp;</div>
                <div style="line-height: 18px;">&nbsp; ⑧서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위</div>
                <div style="line-height: 18px;">&nbsp; ⑨기타 관계법령에 위배되는 행위 &nbsp;</div>
                <div style="line-height: 18px;">&nbsp; ⑩게시판 등 커뮤니티를 통한 상업적 광고홍보 또는 상거래 행위</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제13조 (게시물 또는 내용물의 삭제)&nbsp;</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">'갑'은 서비스의 게시물 또는 내용물이 제12조의 규정에 위반되거나 '갑' 소정의 게시기간을 초과하는 경우 사전 통지나 동의 없이 이를
                    삭제할 수 있습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제14조 (게시물에 대한 권리·의무)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 회원에게 있습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제15조 (양도금지)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">회원이 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제16조 (계약해지 및 이용제한)&nbsp;</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.회원이 이용계약을 해지하고자 하는 때에는 본인이 서비스 또는 전자 우편을 통하여 해지하고자 하는 날의 1일전까지 (단, 해지일이 법정
                    공휴일인 경우 공휴일 개시 2일전까지)이를 '갑'에게 신청하여야 합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.'갑'은 해지 및 탈퇴를 한 회원이 다시 이용신청을 하는 경우 일정기간 그 승낙을 제한할 수 있습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제17조 (면책·배상)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.'갑'은 회원이 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고,
                    &nbsp;회원은 자기의 책임아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사 선택, 기타서비스 이용과 관련하여 어떠한 불이익이 발생
                    하더라도 이에 대한 모든 책임은 회원에게 있습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.'갑'은 제12조의 규정에 위반하여 회원간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 등과 관련하여 어떠한 책임도 부담하지
                    아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.&nbsp;</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">3.회원 아이디(ID)와 비밀번호의 관리 및 이용상의 부주의로 인하여 발생 되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임은 모두
                    회원에게 있습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">4.회원이 제12조, 기타 이 약관의 규정을 위반함으로 인하여 '갑'이 회원 또는 제3자에 대하여 책임을 부담하게 되고, 이로써 '갑'에게
                    손해가 발생하게 되는 경우, 이 약관을 위반한 회원은 '갑'에게 &nbsp;발생하는 모든 손해를 배상하여야 하며, 동 손해로부터 '갑'을 면책시켜야 합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제18조 (분쟁의 해결)&nbsp;</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.'갑'과 회원은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.1항의 규정에도 불구하고 분쟁으로 인하여 소송이 제기될 경우 소송은 '갑'의 소재지를 관할하는 법원의 관할로 합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">부 &nbsp;칙</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제 1 조 (시행일) 이 약관은 2023년 1월 1일부터 시행한다. &nbsp; &nbsp; &nbsp;</div>
            </div>
           <div class = "row my-3 px-4">
           		<div class = "offset-8 col-2">
					<button type="button" class="btn-agree-condition py-1 w-100">동의</button>
           		</div>
           		<div class = "col-2">
					<button type="button" class="btn-cancel-condition py-1 w-100" data-bs-dismiss="modal" aria-label="Close">취소</button>
           		</div>
           	</div>
        </div>
    </div>
</div>

<!-- 개인정보동의 모달 -->
<div class="modal fade" id="modalPrivacy" tabindex="-1">
    <div class="modal-dialog modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">개인정보수집 및 이용동의</h5>
                <button type="button" class="btn-modal-close fa-solid fa-xmark" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" style="overflow-y: scroll;">
                <div style="line-height: 18px;">제1조(목적)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">본 회원약관은&nbsp;댕모임(이하 '갑'라 한다)이 운영하는 인터넷관련 서비스(이하 '서비스'라 한다)를 이용함에 있어 관리자와
                    이용자(이하 '회원'라 한다)의 권리, 의무 및 책임사항을 규정함을 목적으로 한다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제2조 (약관의 효력)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.본 약관은 '갑'에 회원 가입 시 회원들에게 통지함으로써 효력을 발생합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.'갑'은 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.
                </div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">3.약관의 변경사항 및 내용은 '갑'의 홈페이지에 게시하는 방법으로 공시합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제3조 (약관 이외의 준칙)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">이 약관에 명시되지 않은 사항이 전기 통신 기본법, 전기통신 사업법, 기타 관련 법령에 규정되어 있는 경우 그 규정에 따릅니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제4조 (이용계약의 체결)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">회원 가입 시 회원 약관 밑에 있는 동의버튼을 누르면 약관에 동의하여 이 계약이 체결된 것으로 간주한다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제5조 (용어의 정의)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">이 약관에서 사용하는 용어의 정의는 다음과 같습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.회원: '갑'과 서비스 이용에 관한 계약을 체결한 자</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.아이디(ID): 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 '갑'이 승인하는 문자와 숫자의 조합</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">3.비밀번호: 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제6조 (이용신청)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.회원 가입은 온라인으로 가입신청 양식에 기록하여 '갑'에 제출함으로써 이용신청을 할 수 있습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.가입희망 회원은 반드시 자신의 본명 및 주민등록번호로 이용신청을 하여야 하며, 1개의 ID만 신청을 할 수 있습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제7조 (회원가입의 승낙)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">'갑'의 회원 가입 신청 양식에 가입 희망 회원이 인터넷으로 제6조와 같이 신청하면 '갑'은 바로 가입을 승인하여 서비스를 이용할 수
                    있다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제8조(회원가입 신청거절 및 강제 탈퇴)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1. '갑'은 타인의 명의나 주민등록번호를 도용하여 회원가입신청을 할 경우 회원가입신청을 거절할 수 있다.</div>
                <div style="line-height: 18px;">2. 회원가입신청이 승인이 된 후에도 허위사실의 기재가 발각되거나 '갑'의 명예를 회손시키거나 음란물이나 불건전한 내용을 게재할 경우
                    회원의 자격을 강제 탈퇴시킬 수 있다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제9조 (서비스 제공의 중지)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">'갑'은 다음 각 호의 1에 해당하는 경우 서비스의 제공을 중지할 수 있습니다</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.설비의 보수 등을 위하여 부득이한 경우&nbsp;</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지하는 경우&nbsp;</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">3.기타 '갑'이 서비스를 제공할 수 없는 사유가 발생한 경우.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제10조 ('갑'의 의무)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1. '갑'은 &nbsp;계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다하여야 합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.'갑'은 항상 회원의 신용정보를 포함한 개인신상정보의 보안에 대하여 관리에 만전을 기함으로서 회원의 정보보안에 최선을 다하여야 합니다.
                    &nbsp;&nbsp;</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제11조 (개인정보보호)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.'갑'은 이용자의 정보수집시 서비스의 제공에 필요한 최소한의 정보를 수집합니다.&nbsp;</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나 &nbsp;제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 '갑'이
                    집니다. 다만, 다음의 경우에는 예외로 합니다.&nbsp;</div>
                <div style="line-height: 18px;">&nbsp;①통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우 &nbsp;
                </div>
                <div style="line-height: 18px;">&nbsp;②전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우</div>
                <div style="line-height: 18px;">&nbsp;③범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우</div>
                <div style="line-height: 18px;">&nbsp;④기타 관계법령에서 정한 절차에 따른 요청이 있는 경우</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">3.회원은 언제든지 '갑'이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 '갑'은 이에 대해 지체없이
                    처리합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제12조 (회원의 의무)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항 등 '갑'이 통지하는 사항을 준수하여야 하며, 기타 '갑'의 업무에 방해되는
                    행위를 하여서는 안됩니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.회원은 '갑'의 사전 승낙 없이 서비스를 이용하여 어떠한 영리 행위도 할 수 없습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">3.회원은 서비스를 이용하여 얻은 정보를 '갑'의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판,방송 기타의 방법으로 사용하거나 이를
                    타인에게 제공할 수 없습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">4.회원은 이용신청서의 기재내용 중 변경된 내용이 있는 경우 서비스를 통하여 그 내용을 '갑'에게 통지하여야 합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">5.회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다.&nbsp;</div>
                <div style="line-height: 18px;">&nbsp; ①다른 회원의 아이디(ID)를 부정 사용하는 행위&nbsp;</div>
                <div style="line-height: 18px;">&nbsp; ②범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위&nbsp;</div>
                <div style="line-height: 18px;">&nbsp; ③선량한 풍속, 기타 사회질서를 해하는 행위</div>
                <div style="line-height: 18px;">&nbsp; ④타인의 명예를 훼손하거나 모욕하는 행위 &nbsp;</div>
                <div style="line-height: 18px;">&nbsp; ⑤타인의 지적재산권 등의 권리를 침해하는 행위&nbsp;</div>
                <div style="line-height: 18px;">&nbsp; ⑥해킹행위 또는 컴퓨터바이러스의 유포행위 &nbsp;</div>
                <div style="line-height: 18px;">&nbsp; ⑦타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송 또는 타 사이트를 링크하는 행위 &nbsp;</div>
                <div style="line-height: 18px;">&nbsp; ⑧서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위</div>
                <div style="line-height: 18px;">&nbsp; ⑨기타 관계법령에 위배되는 행위 &nbsp;</div>
                <div style="line-height: 18px;">&nbsp; ⑩게시판 등 커뮤니티를 통한 상업적 광고홍보 또는 상거래 행위</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제13조 (게시물 또는 내용물의 삭제)&nbsp;</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">'갑'은 서비스의 게시물 또는 내용물이 제12조의 규정에 위반되거나 '갑' 소정의 게시기간을 초과하는 경우 사전 통지나 동의 없이 이를
                    삭제할 수 있습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제14조 (게시물에 대한 권리·의무)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 회원에게 있습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제15조 (양도금지)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">회원이 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제16조 (계약해지 및 이용제한)&nbsp;</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.회원이 이용계약을 해지하고자 하는 때에는 본인이 서비스 또는 전자 우편을 통하여 해지하고자 하는 날의 1일전까지 (단, 해지일이 법정
                    공휴일인 경우 공휴일 개시 2일전까지)이를 '갑'에게 신청하여야 합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.'갑'은 해지 및 탈퇴를 한 회원이 다시 이용신청을 하는 경우 일정기간 그 승낙을 제한할 수 있습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제17조 (면책·배상)</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.'갑'은 회원이 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고,
                    &nbsp;회원은 자기의 책임아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사 선택, 기타서비스 이용과 관련하여 어떠한 불이익이 발생
                    하더라도 이에 대한 모든 책임은 회원에게 있습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.'갑'은 제12조의 규정에 위반하여 회원간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 등과 관련하여 어떠한 책임도 부담하지
                    아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.&nbsp;</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">3.회원 아이디(ID)와 비밀번호의 관리 및 이용상의 부주의로 인하여 발생 되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임은 모두
                    회원에게 있습니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">4.회원이 제12조, 기타 이 약관의 규정을 위반함으로 인하여 '갑'이 회원 또는 제3자에 대하여 책임을 부담하게 되고, 이로써 '갑'에게
                    손해가 발생하게 되는 경우, 이 약관을 위반한 회원은 '갑'에게 &nbsp;발생하는 모든 손해를 배상하여야 하며, 동 손해로부터 '갑'을 면책시켜야 합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제18조 (분쟁의 해결)&nbsp;</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">1.'갑'과 회원은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">2.1항의 규정에도 불구하고 분쟁으로 인하여 소송이 제기될 경우 소송은 '갑'의 소재지를 관할하는 법원의 관할로 합니다.</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">부 &nbsp;칙</div>
                <div style="line-height: 18px;"><br></div>
                <div style="line-height: 18px;">제 1 조 (시행일) 이 약관은 2023년 1월 1일부터 시행한다. &nbsp; &nbsp; &nbsp;</div>
            </div>
            <div class = "row my-3 px-4">
           		<div class = "offset-8 col-2">
					<button type="button" class="btn-agree-privacy py-1 w-100">동의</button>
           		</div>
           		<div class = "col-2">
					<button type="button" class="btn-cancel-privacy py-1 w-100" data-bs-dismiss="modal" aria-label="Close">취소</button>
           		</div>
           	</div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">

	$(function(){
		
		// 초기 인증메일 전송 버튼 비활성화
		
		// 기본적으로 Helper Text는 숨김 처리
		$(".span-check").hide();
		
		// ID 검사
		$("#userId").blur(function(){
			// 초기화
			$(".check-id").hide();
			// 검사할 ID 입력창의 값
			var inputId = $(this).val();
			// 아무 값도 입력되지 않았을 때
			if(inputId == "") {
				formValidCheck.checkId = false;
				$(".check-id-empty").show();
				return;
			}
			// 정규표현식 : 영문 소문자, 숫자를 포함한 8~20자리
			var regexp = /^[a-z0-9]{8,20}$/;
			// 정규표현식 만족 여부에 따라 다른 처리
			if(!regexp.test(inputId)) { // 정규표현식을 만족하지 않을 경우
				formValidCheck.checkId = false;
				$(".check-id-invalid").show();
				return;
			}
			// 비동기 ID 조회
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_user/check_id?userId=" + inputId,
				method : "get",
				success : function(resp){
					// checkId의 값의 변화가 console에 바로 반영되지 않는 이유가 뭐지?
					formValidCheck.checkId = resp;
					console.log("resp = " + resp);
					console.log(formValidCheck.checkId);
					console.log("isAllValid() = " + formValidCheck.isAllValid());
					if(resp) {
						$(".check-id-valid").show();
					} else {
						$(".check-id-already").show();
					}
				}
			});	
		});
		
		// PW 검사
		$("#userPw").blur(function(){
			// 초기화
			$(".check-pw").hide();
			// 검사할 PW 입력창의 값
			var inputPw = $(this).val();
			// 아무 값도 입력하지 않았을 때
			if(inputPw == "") {
				formValidCheck.checkPw = false;
				$(".check-pw-empty").show();
				return;
			} 
			// 정규표현식 : 영문 대문자, 소문자, 숫자, 특수문자(!@#$)를 반드시 포함하는 8~16자리
			var regexp = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$]{8,16}$/;
			// 정규표현식 여부에 따라 서로 다른 처리
			if(regexp.test(inputPw)) { // 정규표현식을 만족한다면
				formValidCheck.checkPw = true;
				console.log(formValidCheck.checkPw);
				console.log("isAllValid() = " + formValidCheck.isAllValid());
				$(".check-pw-valid").show();
				
				// 비밀번호 입력창의 값을 비밀번호 확인 입력창의 값보다 나중에 입력한 경우
				// ex) 비밀번호 입력창은 정규표현식에 맞지 않게 입력하고 비밀번호 확인 입력창의 값은 정규표현식의 입력창을 맞게 입력한 상태에서 다시 비밀번호 입력창의 값을 정규표현식에 맞게 입력한 경우
				// PWCK 입력창의 값
				var inputPwck = $("#userPwck").val();
				// PW 입력창의 값과 PWCK 입력창의 값이 다르면
				if(inputPwck == inputPw) {
					formValidCheck.checkPwck = true;
					console.log(formValidCheck.checkPwck);
					console.log("isAllValid() = " + formValidCheck.isAllValid());
					$(".check-pwck-valid").show();
				}
			} else { // 정규표현식을 만족하지 않을 경우
				formValidCheck.checkPw = false;
				$(".check-pw-invalid").show();
			}
		});
		
		// PWCK 검사
		$("#userPwck").blur(function(){
			// 초기화
			$(".check-pwck").hide();
			// PW 입력창의 값
			var inputPw = $("#userPw").val();
			// PW 입력창이 올바르지 않을 경우
			if(!formValidCheck.checkPw) {
				formValidCheck.checkPwck = false;
				$(".check-pwck").hide();
				return;
			}
			// PWCK 입력창의 값
			var inputPwck = $(this).val();
			// 아무 값도 입력하지 않았을 때
			if(inputPwck == "") {
				formValidCheck.checkPwck = false;
				$(".check-pwck-empty").show();
				return;
			} 
			// 정규표현식 : 영문 대문자, 소문자, 숫자, 특수문자(!@#$)를 반드시 포함하는 8~16자리
			var regexp = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$]{8,16}$/;
			if(!regexp.test(inputPwck)) {
				formValidCheck.checkPwck = false;
				$(".check-pwck-invalid").show();
				return
			} 
			// PW 입력창의 값과 PWCK 입력창의 값이 다르면
			if(inputPwck != inputPw) {
				formValidCheck.checkPwck = false;
				$(".check-pwck-different").show();
				return;
			} else {
				formValidCheck.checkPwck = true;
				console.log(formValidCheck.checkPwck);
				console.log("isAllValid() = " + formValidCheck.isAllValid());
				$(".check-pwck-valid").show();
			}
		});
		
		// 닉네임 입력 - 6글자로 제한
		$(document).on("input", "#userNick", function(){
			var inputUserNick = document.querySelector("#userNick");
			var textUserNick = inputUserNick.value;
			var size = textUserNick.length;
			while(size > 6) {
				inputUserNick.value = inputUserNick.value.substring(0, size - 1);
				size --;
			}
		});
		
		// 닉네임 입력 유효성
		$("#userNick").blur(function(){
			// 초기화
			$(".check-nick").hide();
			// 입력창의 값
			var inputNick = $(this).val();
			console.log(inputNick);
			// 닉네임 입력창의 값이 비어있을 떼
			if(inputNick == "") {
				formValidCheck.checkNick = false;
				$(".check-nick-empty").show();
				return;
			} 
			// 정규 표현식
			var regexp = /^[가-힣A-Za-z0-9]{2,6}$/;
			if(regexp.test(inputNick)) { // 정규 표현식을 만족하면
				formValidCheck.checkNick = true;
				console.log(formValidCheck.checkNick);
				console.log("isAllValid() = " + formValidCheck.isAllValid());
				$(".check-nick-valid").show();	
			} else { // 정규 표현식을 만족하지 않으면
				formValidCheck.checkNick = false;
				$(".check-nick-invalid").show();	
			}
		});
		

		// 전화번호
		// - 앞자리 선택
		$(".select-user-tel-first").on("change", function(){
			// 초기화
			$(".check-tel").hide();
			if($(this).val() == "") {
				console.log("전화번호 입력 안함1")
				$(".input-user-tel-second").val("");
				$(".input-user-tel-third").val("");
				formValidCheck.checkTel = true;
			} else {
				console.log("전화번호 입력해야함")
				formValidCheck.checkTel = false;
			}
		});
		
		// - 뒷자리 입력
		$(".input-user-tel").blur(function(){
			// 초기화
			$(".check-tel").hide();
			// 앞 자릿수를 선택했다면 (전화번호를 입력하려는 상황이라면)
			if($(".select-user-tel-first").val() != "") {
				var userTel = $(".select-user-tel-first").val() + "-" + $(".input-user-tel-second").val() + "-" + $(".input-user-tel-third").val();
				console.log(userTel)
				var regexp = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
				if(regexp.test(userTel) != true) {
					$(".check-tel-invalid").show();
					console.log("탈락")
					formValidCheck.checkTel = false;
					return;
				}	
				$(".check-tel-valid").show();
				console.log("유효한 전화번호")
				formValidCheck.checkTel = true;
			} else {
				console.log("전화번호 입력안함2")
				formValidCheck.checkTel = true;
			}
		});
		
		// 성별 선택
		$(".input-check-gender").click(function(){
			// 성별 미선택 helper text 숨김
			$(".check-gender").hide();
			// 이미지 태그
			var target = $(this).next();
			// 성별 선택 갯수
			var countChecked = $(".input-check-gender:checked").length;
			// 1개만 선택하도록
			if(countChecked > 1) {
				$(".input-check-gender").prop("checked", false);
				$(".img-user-gender").removeClass("gender-selected");
				$(this).prop("checked", true);
				target.addClass("gender-selected");
			}
			// 선택한 성별의 테두리 변경
			if($(this).is(":checked")) {
				formValidCheck.checkGender = true;
				console.log(formValidCheck.checkGender);
				console.log("isAllValid() = " + formValidCheck.isAllValid());
				target.addClass("gender-selected");
			} else {
				formValidCheck.checkGender = false;
				target.removeClass("gender-selected");
			}
		});
		
		// 이메일 입력창
		$("#userEmail").blur(function(){
			// 초기화
			$(".check-cert").hide();
			// 이메일 입력창의 값
			var inputEmail = $("#userEmail").val();
			// 이메일을 입력하지 않았다면 return
			if(inputEmail == "") {
				$(".check-cert-email-empty").show();
				return;
			}
			var regexp = /^[A-Za-z0-9]{6,30}@[0-9a-z]{4,252}.[a-z]{2,3}$/
			if(regexp.test(inputEmail) == false) {
				$(".check-cert-email-invalid").show();
				return;
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_user/check_email?userEmail=" + inputEmail,
				method : "get",
				success : function(resp){
					console.log(resp);
					if(resp) {
						$("#sendEmail").prop("disabled", true);
						formValidCheck.checkEmail = false;
						console.log(formValidCheck.checkEmail);
						console.log("isAllValid() = " + formValidCheck.isAllValid());
						// 인증메일 발송 메시지
						$(".check-cert-already").show();
						return;
					} 
					$("#sendEmail").prop("disabled", false);
				}
			}); 
		});
		
		var certSerial;
		
		// Email 인증
		$("#sendEmail").click(function(){
			// 초기화
			$(".check-cert").hide();
			// 이메일 입력창의 값
			var inputEmail = $("#userEmail").val();
			// 이메일을 입력하지 않았다면 return
			if(inputEmail == "") {
				$(".check-cert-email-empty").show();
				return;
			}
			var regexp = /^[A-Za-z0-9]{6,30}@[0-9a-z]{4,252}.[a-z]{2,3}$/
			if(regexp.test(inputEmail) == false) {
				$(".check-cert-email-invalid").show();
				return;
			}
			// 전송 버튼
			var btn = $(this);
			// 이메일 발송 처리 중 중복 발송을 방지하기 위해 비활성화
			btn.attr("disabled", true);
			// 해당 이메일로 인증번호 발송
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_user/send_email?userEmail=" + inputEmail,
				method : "get",
				success : function(resp){
					// 이메일 발송이 완료되면 인증 버튼 다시 활성화
					btn.attr("disabled", false);
					// 초기화
					$(".check-cert").hide();
					// 인증메일 발송 메시지
					$(".check-cert-send").show();
					// 반환한 인증번호
					certSerial = resp;
				}
			}); 
		});
		
		// 인증번호 입력창 blur 시
		$("#userCert").blur(function(){
			// 초기화
			$(".check-cert").hide();
			if($("#userCert").val() == certSerial) {
				formValidCheck.checkEmail = true;
				console.log(formValidCheck.checkEmail);
				console.log("isAllValid() = " + formValidCheck.isAllValid());
				$(".check-cert-valid").show();
				// 이메일 입력창 잠금
				$("#userEmail").attr("disabled", true);
				// 이메일 인증번호 입력창 잠금
				$("#userCert").attr("disabled", true);
			} else {
				formValidCheck.checkEmail = false;
				$(".check-cert-invalid").show();
				console.log(formValidCheck.checkEmail);
				console.log("isAllValid() = " + formValidCheck.isAllValid());
			}
		});
		
		// 이용약관 이벤트
        // 1) Modal 열기
        $(".label-open-modal-condition").click(function(){
            $("#modalCondition").modal("show");
        });
        // 2) 동의를 누를 때 체크박스에 체크가 되도록
        $(".btn-agree-condition").click(function(){
            $("#checkCondition").prop("checked", true);
            $("#modalCondition").modal("hide");
            isAllChecked();
        });
        
        // 개인정보수집 약관 이벤트
        // 1) Modal 열기
        $(".label-open-modal-privacy").click(function(){
            $("#modalPrivacy").modal("show");
        });
        // 2) 동의를 누를 때 체크박스에 체크가 되도록
        $(".btn-agree-privacy").click(function(){
            $("#checkPrivacy").prop("checked", true);
            $("#modalPrivacy").modal("hide");
            isAllChecked();
        });
        
        // 체크박스 개별 전체체크
        $(".check-term").click(function(){
        	isAllChecked();	
        });
        
        // 약관 전체 동의 이벤트
        $("#checkAll").click(function(){
        	// 전체 선택 체크박스의 상태
        	var checkAll = $(this).prop("checked");
        	// 각각의 체크박스 상태가 전체 선택 체크박스의 상태와 같게 되도록
        	$(".check-term").prop("checked", checkAll);
        	isAllChecked();
        });
        
        function isAllChecked() {
        	var checkTermCount = $(".check-term:checked").length;
        	if(checkTermCount >= 2) {
        		$("#checkAll").prop("checked", true);
        		formValidCheck.checkTerm = true;
				console.log(formValidCheck.checkTerm);
				console.log("isAllValid() = " + formValidCheck.isAllValid());
        	} else {
        		$("#checkAll").prop("checked", false);
        		formValidCheck.checkTerm = false;
				console.log(formValidCheck.checkTerm);
				console.log("isAllValid() = " + formValidCheck.isAllValid());
        	}
        }
		
		// form 전송
		$(".btn-submit-join").click(function(e){
			// 기본 이벤트 차단 (form 전송)
			e.preventDefault();
			
			// Helper Text 초기화
			$(".span-check").hide();
			
			// 아이디 입력
			if($("#userId").val() == "") {
				$(".check-id-empty").show();
			}
			
			// 비밀번호 입력
			if($("#userPw").val() == "") {
				$(".check-pw-empty").show();
			} else {
				if($("#userPwck").val() == "") {
					$(".check-pwck-empty").show();
				}
			}
			
			// 닉네임 입력
			if($("#userNick").val() == "") {
				$(".check-nick-empty").show();
			}
			
			// 전화번호
			if($(".select-user-tel-first").val() != "") {
				if($(".input-user-tel-second").val() == "" || $(".input-user-tel-third").val() == "") {
					$(".check-tel-invalid").show();
				}
			}
			
			// 이메일 인증
			if($("#userEmail").val() == "") {
				$(".check-cert-email-empty").show();
			} else {
				if($("#userCert").val() == "") {
					$(".check-cert-invalid").show();
				}
			}
			
			// 성별 선택 검사
			if($(".gender-selected").length < 1) {
				$(".check-gender-non-selected").show();
			}
			
			// 약관 동의
			if($(".check-term:checked").length < 2) {
				$(".check-term-invalid").show();
			}
			
			// 회원 가입 유효성 검사
			if(formValidCheck.isAllValid() == false) {
/* 				console.log("아이디 "+formValidCheck.checkId);
				console.log("비번 "+formValidCheck.checkPw);
				console.log("비번확인 "+formValidCheck.checkPwck);
				console.log("닉넴 "+formValidCheck.checkNick);
				console.log("전화 "+formValidCheck.checkTel);
				console.log("성별 "+formValidCheck.checkGender);
				console.log("메일 "+formValidCheck.checkEmail);
				console.log("약관 "+formValidCheck.checkTerm); */
				return;
			}
			var form = $("<form>").attr("action", "join").attr("method", "post");
			form
			.append($("<input>").attr("name", "userId").attr("value", $("#userId").val()))
			.append($("<input>").attr("name", "userPw").attr("value", $("#userPw").val()))
			.append($("<input>").attr("name", "userNick").attr("value", $("#userNick").val()))
			.append($("<input>").attr("name", "userGender").attr("value", $(".input-check-gender:checked").val()))
			.append($("<input>").attr("name", "userEmail").attr("value", $("#userEmail").val()));

			var userTel = $(".select-user-tel-first").val() + "-" + $(".input-user-tel-second").val() + "-" + $(".input-user-tel-third").val();
			form
			.append($("<input>").attr("name", "userTel").attr("value", userTel));
			
			$("body").append(form);
			form.submit();
		})
		
		// 회원가입 유효성 판정
		var formValidCheck = {
			// 회원가입 단계별 판정
			checkId : false,
			checkPw : false,
			checkPwck : false,
			checkNick : false,
			checkTel : true, // 전화번호는 null이 가능하므로 초기에 true로 설정
			checkGender : false,
			checkEmail : false,
			checkTerm : false,
			// 판정 결과 반환
			isAllValid : function() {
				return this.checkId && this.checkPw && this.checkPwck && this.checkNick && this.checkTel && this.checkGender && this.checkEmail && this.checkTerm;
			}
		};
	});
	
</script>