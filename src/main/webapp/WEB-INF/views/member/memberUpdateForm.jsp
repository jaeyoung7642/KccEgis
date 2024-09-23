<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>KCC EGIS</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />

	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/member.css"> <!-- 디렉토리  member only -->
	<script src="/resources/common/assets/js/jquery-3.6.0.min.js"></script>
	<script src="/resources/common/assets/js/jquery.scrollDetector.min.js" defer></script>
	<script src="/resources/common/assets/js/lenis.min.js" defer></script>
	<script src="/resources/common/assets/js/swiper-bundle.min.js" defer></script>
	<script src="/resources/common/assets/js/jquery.kinetic.min.js" defer></script>
	<script src="/resources/common/assets/js/common.js" defer></script> 
	<script src="/resources/common/assets/js/jquery.nice-select.min.js" defer></script> <!-- sub only -->
	<script src="/resources/common/assets/js/sub.js" defer></script> <!-- sub only -->
	<script src="/resources/common/assets/js/link.js" defer></script>
	<script src="/resources/common/assets/js/script.js" defer></script> <!-- 개발용 -->
	<script src="/resources/common/assets/js/gsap.min.js" defer></script> <!-- main only -->
	<script src="/resources/common/assets/js/ScrollTrigger.min.js" defer></script> <!-- main only -->
	<script>
	function getQueryParam(name) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }

    window.onload = function() {
        // URL에서 'msg' 파라미터 읽기
        var msg = getQueryParam('msg') || '';

        // URL 디코딩
        msg = decodeURIComponent(msg).trim();

        // 메시지가 있을 경우 알림 표시
        if (msg !== '') {
        	alertPop(msg);
        }
    }
	var emailduplicate = true;
	function email_val(){
		var email = $("#true_email").find(".txt_email").text();
		const emails = email.split("@");
		$('#email_id').val(emails[0]);
		$('#email_domain').val(emails[1]);
		emailduplicate = true;
	}
	function emailChange(){
		emailduplicate = false;
		var email_id = $("#email_id").val();
		var email_domain = $("#email_domain").val();
		var inputField = $("#email_id");
		if(email_id != '' && email_domain != ''){
			var email = email_id + "@" + email_domain
			if (validateEmail(email)) {
				$("#duplicateEmailBtn").attr("disabled",false);
				$(inputField).parent().parent().parent().find('.el_error').remove();
			}else{
				$(inputField).parent().parent().parent().find('.el_error').remove();
				$(inputField).parent().parent().parent().append("<p class='el_error mt10'>올바른 이메일 형식이 아닙니다.</p>");
			}
		}else{
			$("#duplicateEmailBtn").attr("disabled",true);
		}
		emailduplicate = false;
		
	}
	function validateEmail(email) {
	    // 이메일 형식을 검증하는 정규 표현식
	    var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	    return regex.test(email);
	}
	function duplicateEmail(){
		var num = $("#num").val();
		var email = $('#email_id').val() + "@" + $("#email_domain").val();
		 $('#email_id2').val('');
		$.ajax({
   			type:'Get',
   			data : {
   				"email" : email,
   				"num" : num
   			},
   			url: 'duplicateEmail',
   			success:function(result){
   				$(".txt_email").text(email);
   				if (result=='true') {
   			        $("#true_email").show(); 
   			        $("#false_email").hide();
   			     	$("#duplicateEmailBtn2").attr("disabled",false);
   			    } else {
   			        $("#true_email").hide(); 
   			        $("#false_email").show();
   			     	$("#duplicateEmailBtn2").attr("disabled",true);
   			    }
   	         },
   	         error:function(){
   	            alert("서버에 문제가 있습니다.");
   	         }
   		});//ajax
	}
	function duplicateEmail2(){
		var num = $("#num").val();
		var email = $('#email_id2').val();
		if (validateEmail(email)) {
			$.ajax({
	   			type:'Get',
	   			data : {
	   				"email" : email,
	   				"num" : num
	   			},
	   			url: 'duplicateEmail',
	   			success:function(result){
	   				$(".txt_email").text(email);
	   				if (result=='true') {
	   			        $("#true_email").show(); 
	   			        $("#false_email").hide();
	   			     	$("#duplicateEmailBtn2").attr("disabled",false);
	   			    } else {
	   			        $("#true_email").hide(); 
	   			        $("#false_email").show();
	   			     	$("#duplicateEmailBtn2").attr("disabled",true);
	   			    }
	   	         },
	   	         error:function(){
	   	            alert("서버에 문제가 있습니다.");
	   	         }
	   		});//ajax
		}else{
			alertPop('올바른 이메일 형식이 아닙니다.');
		}
	}
	function updateCheck(){
		var form = $("#updateForm");
		if($("#member_pwd").val() == ''){
			alertPop("비밀번호를 입력해주세요.");
			return false;
		}
		if(!emailduplicate){
			alertPop("이메일 중복확인을 해주세요.");
			return false;
		}
		if($("#member_id").val() != '' && $("#member_pwd").val() != '' && $("#email_id").val() != ''
				&& $("#email_domain").val() != '' && $("#zipcode").val() != ''&& $("#addr").val() != ''&& $("#daddr").val() != ''&& $("#player_no").val() != ''){
			form.submit();
		}else{
			alertPop("필수항목을 입력해주세요.");
			return false;
		}
	}
	window.name="Parent_window";
	var popupWindow = null;
	function fnPopup(){
		popupWindow = window.open('', 'popupChk', 'width=480, height=812, top=100, fullscreen=no, menubar=no, status=no, toolbar=no,titlebar=yes, location=no, scrollbar=no');
        document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
        document.form_chk.target = "popupChk";
        document.form_chk.submit();
    }
	function closePopup() {
        if (popupWindow) {
        	const name = popupWindow.document.getElementById('name').value;
            const di = popupWindow.document.getElementById('di').value;
            const gender = popupWindow.document.getElementById('gender').value;
            const birthdate = popupWindow.document.getElementById('birthdate').value;
            const mobileno = popupWindow.document.getElementById('mobileno').value;
			
            const fistNum = mobileno.substring(0, 3); // 010
            const middleNum = mobileno.substring(3, 7); // 0000
            const lastNum = mobileno.substring(7); // 0000
            
            $("#name").val(name);
            $("#di").val(di);
            $("#fistNum").val(fistNum);
            $("#middleNum").val(middleNum);
            $("#lastNum").val(lastNum);
        	popupWindow.close();
        }
    }
	</script>
</head>
<body class="page-sub">
	<div id="wrap">
		<!-- skip navigation -->
		<nav id="accessibility">
			<p class="blind">콘텐츠 바로가기</p>
			<ul>
				<li><a href="#nav">메뉴 바로가기</a></li>
				<li><a href="#con">본문 바로가기</a></li>
			</ul>
		</nav>

		<!-- header -->
		<app-header></app-header>
		<!-- //header -->

		<!-- container -->
		<main id="container" class="ly_container member m_white">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<div class="mypage_header">
						<div class="member">
							<span class="el_ico"><img src="/resources/common/images/img/mypage_top_img.svg" alt=""></span>
							<p class="name"><strong>${loginUserMap.name }</strong>님 안녕하세요!</p>
						</div>
						<!-- 가장 최근 예정 홈경기 일정 출력 -->
						<div class="info">
							<p>다가오는 홈 경기는 <strong>2024년 10월 19일(토) 14:00</strong> 입니다.</p>
						</div>
						<div class="btns">
							<a href="#" class="el_btn btn_mb2">
								<span class="el_ico ico_ticket_line_w"></span> 티켓팅
							</a> <!-- 티켓 안내 페이지로 연결 -->
							<a href="scheduleList?ha=2" class="el_btn btn_mb2">
								<span class="el_ico ico_calendar2_w"></span> 전체 홈 경기일정
							</a> <!-- 경기 일정 목록 페이지 (기획서 확인) -->
						</div>
					</div>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="mypage" class="swiper-slide snb_link"><span>마이페이지</span></a> 
								<a href="memberUpdateForm" class="swiper-slide snb_link current"><span>회원정보수정</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<section class="section member_content">
				<div class="ly_inner sm">
					<div class="bl_card agreement_card type2 m_full">
						<form id="updateForm" action="memberUpdate">
							<div class="member_header">
								<p class="mb_heading">회원정보수정</p>
							</div> 
							<input type="hidden" name="num" id="num" value="${resultMap.num}">
							<input type="hidden" class="frm_input pmax370" readonly id="di" name="di">
							<div class="member_inner pmax615 mt50-20">
								<div class="frm_field">
									<div class="row">
										<input type="text" class="frm_input pmax370" aria-label="이름" readonly id="name" value="${resultMap.name}" name="name">
									</div>
									<div class="row">
										<input type="text" class="frm_input pmax370" name="member_id" id="member_id" aria-label="아이디" value="${resultMap.member_id}" placeholder="아이디 입력" readonly>
									</div>
									<div class="row">
										<div class="frm_group gap11">
										<div class="frm_group gap11 pmax370">
											<input type="password" class="frm_input" name="member_pwd" id="member_pwd" aria-label="비밀번호" placeholder="비밀번호 확인" required>
										</div>
											<a href="changePwdForm?num=${resultMap.num}" class="el_btn frm_btn gray">비밀번호 변경</a>
										</div>
									</div>
									<div class="row">
										<div class="frm_group gap11">
											<div class="frm_group gap11 pmax370">
												<input type="text" class="frm_input" aria-label="휴대전화 앞자리" id="fistNum" value="${resultMap.fistNum}" readonly name="fistNum">
											<input type="text" class="frm_input" aria-label="휴대전화 중간자리" id="middleNum" value="${resultMap.middleNum }" readonly name="middleNum">
											<input type="text" class="frm_input" aria-label="휴대전화 뒷자리" id="lastNum" value="${resultMap.lastNum}" readonly name="lastNum">
											</div>
											<button type="button" class="el_btn frm_btn gray" onclick="javascript:fnPopup()">휴대폰 인증</button>
										</div>
									</div>
									<div class="row">
										<div class="frm_group gap11 pmax370">
											<select class="frm_select" aria-label="태어난 해 선택" name="yyyy">
												<c:forEach var="i" begin="1945" end="2001">
									                <c:choose>
									                    <c:when test="${i == resultMap.yyyy}">
									                        <option value="${i}" selected>${i}</option>
									                    </c:when>
									                    <c:otherwise>
									                        <option value="${i}">${i}</option>
									                    </c:otherwise>
									                </c:choose>
									            </c:forEach>
											</select>
											<select class="frm_select" aria-label="태어난 달 선택" name="mm">
												<c:forEach var="i" begin="1" end="12">
									                <c:choose>
									                    <c:when test="${i == resultMap.mm}">
									                    	<c:if test="${i<10}">
										                        <option value="0${i}" selected>0${i}</option>
									                    	</c:if>
									                    	<c:if test="${i>9}">
										                        <option value="${i}" selected>${i}</option>
									                    	</c:if>
									                    </c:when>
									                    <c:otherwise>
									                        <c:if test="${i<10}">
										                        <option value="0${i}">0${i}</option>
									                    	</c:if>
									                    	<c:if test="${i>9}">
										                        <option value="${i}">${i}</option>
									                    	</c:if>
									                    </c:otherwise>
									                </c:choose>
									            </c:forEach>
											</select>
											<select class="frm_select" aria-label="태어난 일 선택" name="dd">
												<c:forEach var="i" begin="1" end="31">
									                <c:choose>
									                    <c:when test="${i == resultMap.dd}">
									                    	<c:if test="${i<10}">
										                        <option value="0${i}" selected>0${i}</option>
									                    	</c:if>
									                    	<c:if test="${i>9}">
										                        <option value="${i}" selected>${i}</option>
									                    	</c:if>
									                    </c:when>
									                    <c:otherwise>
									                        <c:if test="${i<10}">
										                        <option value="0${i}">0${i}</option>
									                    	</c:if>
									                    	<c:if test="${i>9}">
										                        <option value="${i}">${i}</option>
									                    	</c:if>
									                    </c:otherwise>
									                </c:choose>
									            </c:forEach>
											</select>
										</div>
									</div>
									<div class="row mg6">
										<div class="frm_group g_radio">
											<label class="frm_radio type1">
												<input type="radio" aria-label="성별(남)" name="sex"  value="m" <c:if test="${resultMap.sex =='m' }">checked</c:if> readonly>
												<span>남</span>
											</label>
											<label class="frm_radio type1">
												<input type="radio" aria-label="성별(여)" name="sex"  value="f" <c:if test="${resultMap.sex =='f' }">checked</c:if> readonly>
												<span>여</span>
											</label>
										</div>
									</div>
									<div class="row">
										<div class="frm_email">
											<div class="col frm_group gap10b">
												<input type="text" class="frm_input" id="email_id" name="email_id" value="${resultMap.email_id}" aria-label="이메일 아이디" placeholder="이메일 입력"  required oninput="emailChange()">
												<span class="txt">@</span>
												<input type="text" class="frm_input email_input" id="email_domain" value="${resultMap.email_domain}" name="email_domain" aria-label="이메일 도메인" required oninput="emailChange()">
											</div>
											<div class="col frm_group gap10">
												<select class="frm_select email_select" aria-label="이메일 도메인 선택">
													<option value="">직접입력</option>
													<option value="1">naver.com</option>
													<option value="2">gmali.com</option>
													<option value="3">daum.net</option>
													<option value="4">hanmail.net</option>
													<option value="5">nate.com</option>
													<option value="6">paran.com</option>
													<option value="7">yahoo.com</option>
												</select>
												<button type="button" class="el_btn frm_btn blue openModal" id="duplicateEmailBtn" data-target="#checkPopup2" onclick="duplicateEmail()" disabled>중복 확인</button>
											</div>
										</div>
									</div>
									<div class="row mg6">
										<div class="frm_group g_radio">
											<label class="frm_checkbox type1">
												<input type="checkbox" name="chk_email" <c:if test="${resultMap.chk_email=='Y' }">checked</c:if>>
												<span>이메일 수신</span>
											</label>
										</div>
									</div>
									<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
									<script>
								        function searchAddress() {
								            new daum.Postcode({
								                oncomplete: function(data) {
								                    // 주소 데이터를 처리하는 코드
								                    document.getElementById('zipcode').value = data.zonecode;
								                    document.getElementById('addr').value = data.address;
								                }
								            }).open();
								        }
								    </script>
									<div class="row">
										<div class="frm_address">
											<div class="frm_group gap10b">
												<input type="text" id="zipcode" name="zipcode" class="frm_input max116" aria-label="우편번호" placeholder="우편번호 입력"  required readonly value="${resultMap.zipcode}">
												<button type="button" class="el_btn frm_btn gray" onclick="searchAddress()">우편번호 찾기</button>
											</div>
											<input type="text" id="addr" name="addr" class="frm_input pmax370" aria-label="주소" required readonly value="${resultMap.addr}">
											<input type="text" id="daddr" name="daddr" class="frm_input pmax370" aria-label="상세주소" required placeholder="상세주소 입력" value="${resultMap.daddr}">
										</div>
									</div>
									<div class="row">
										<div class="frm_group gap10">
											<input type="text" class="frm_input pmax370" aria-label="선호선수" required disabled id="player_info" value="${resultMap.player_info}">
											<input type="hidden" id="player_no" name="player_no" value="${resultMap.player_no}">
											<button type="button" class="el_btn frm_btn gray openModal" data-target="#playerPopup">선호선수 등록</button>
										</div>
									</div>
								</div>
							</div>
						
							<div class="member_footer type2 mt50-20">
								<div class="btn_area gap10b mo_lt">
									<a href="mypage" class="el_btn frm_btn gray2">취소</a>
									<button type="button" class="el_btn frm_btn blue" onclick="updateCheck()">수정</button>

									<a href="memberDeleteForm?num=${resultMap.num}" class="el_btn goto dark float">회원 탈퇴</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</section>

			<script>
				// email input
				$(document).on('change', '.email_select', function() {
					const selectText = $(this).find('option').filter(':checked').text();
					const $input =$(this).parents('.frm_email').find('.email_input');
					
					if (selectText === '직접입력') {
						$input.val('').attr('readonly', false);
					} else {
						$input.val(selectText).attr('readonly', true);
					}
					emailChange();
				});
			</script>
			<!-- 이메일 중복확인 팝업 -->
			<div id="checkPopup2" tabindex="-1" class="modal md checkPopup" data-focus="modal2">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_body ">
							<h4 class="modal_tit">이메일 중복확인</h4>
							
							<article class="mt30">
								<div class="message_box">
									<p id="true_email" style="display: none;"><strong class="txt_point txt_email"></strong>은(는) 사용가능한 이메일입니다.</p>
									<!-- 에러 메시지 -->
									<p id="false_email" class="error"><strong class="txt_point txt_email"></strong>은(는) 사용불가능한 이메일입니다.</p>
								</div>
								<div class="btn_area mt20">
									<button type="button" class="el_btn frm_btn gray closeModal" id="duplicateEmailBtn2" disabled onclick="email_val()">등록</button>
								</div>
							</article>

							<article class="mt30-26">
								<div class="message_box">
									<p>다른 이메일을 원하시면 다시 입력해주세요.</p>
									<input type="text" class="frm_input mt10" id="email_id2">
								</div>
								<div class="btn_area mt20">
									<button type="button" class="el_btn frm_btn blue" data-focus-next="modal2" onclick="duplicateEmail2()">확인</button>
								</div>
							</article>
							
						</div>
					</div>
				</div>
			</div>
			<!-- 이메일 중복확인 팝업 -->

			<!-- 선호선수 선택 팝업 -->
			<div id="playerPopup" tabindex="-1" class="modal type2 md playerPopup" data-focus="modal3">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_header">
							<nav class="modal_tabs">
								<a href="#" class="tab_link active"><span>가드</span></a>
								<a href="#" class="tab_link"><span>포워드</span></a>
								<a href="#" class="tab_link"><span>센터</span></a>
							</nav>

							<button type="button" class="el_btn close closeModal"></button>
						</div>
						
						<div class="modal_body" data-lenis-prevent>
							<ul class="player_list cols3">
								<c:forEach items="${playerList}" var="playerList" varStatus="status">
								<li class="item ${playerList.pl_pos_code}" <c:if test="${playerList.pl_pos_code != 'g'}">style="display: none;"</c:if>>
									<a href="#" class="p_profile type2" data-player="${playerList.num}">
										<div class="photo el_img">
											<img src="/resources/common/images/upload/player/${playerList.pl_webdetail}" alt="">
										</div>
										<p class="name">${playerList.pl_name}</p>
										<p class="player_text" style="display: none;">NO.${playerList.pl_back} ${playerList.pl_pos_nm} ${playerList.pl_name}</p>
										<p class="player_no_text" style="display: none;">${playerList.pl_no}</p>
									</a>
								</li>
								</c:forEach>
							</ul>
						</div>

						<div class="modal_footer"> 
							<div class="btn_area gap10">
								<button type="button" class="el_btn frm_btn blue closeModal" data-focus-next="modal3" onclick="playerSelect()">확인</button> 
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- 선호선수 선택 팝업 -->

			<script>
				let plaerVal = null;

				$(document).on('click', '.p_profile', function() {
					const value = $(this).data('player');

					plaerVal = value;
					selectPlayer();
				});

				$(document).on('click', '.p_reset', function() {
					plaerVal = null;
					selectPlayer();
				});


				function selectPlayer() {
					$('.p_profile').each((_, item) => {
						const val = $(item).data('player');

						$(item).toggleClass('active', plaerVal === val);
					});
				}
				$(document).on('click', '.modal_tabs a', function() {
					$(this).siblings('a').removeClass('active');
				    $(this).addClass('active');
				    var posText = $(this).find('span').text();
				    if(posText == '가드'){
				    	$(".g").show();
				    	$(".f").hide();
				    	$(".c").hide();
				    }
				    if(posText == '포워드'){
				    	$(".f").show();
				    	$(".g").hide();
				    	$(".c").hide();
				    }
				    if(posText == '센터'){
				    	$(".c").show();
				    	$(".g").hide();
				    	$(".f").hide();
				    }
				});
				function playerSelect(){
					$("#player_info").val($(".p_profile.type2.active").find(".player_text").text());
					$("#player_no").val($(".p_profile.type2.active").find(".player_no_text").text());
				}
			</script>
			<form name="form_chk" method="post">
				<input type="hidden" name="m" value="service"/>
		        <input type="hidden" name="token_version_id" value="${token_version_id }"/>
		        <input type="hidden" name="enc_data" value="${enc_data }"/>
		        <input type="hidden" name="integrity_value" value="${integrity_value }"/>
			</form>

			<a href="#wrap" class="el_btn gotoTop" aria-label="맨 위로 이동">
				<img src="/resources/common/images/common/ico_gotoTop.svg" alt="">
			</a>
		</main>
		<!-- //container -->

		<!-- footer -->
		<app-footer></app-footer>
		<!-- footer -->

	</div>
</body>
</html>