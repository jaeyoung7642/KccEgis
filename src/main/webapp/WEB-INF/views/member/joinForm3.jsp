<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
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
	var idcheck = false;
	var idduplicate = false;
	var pwdcheck = false;
	var emailduplicate = false;
	function idKeyup(str){
		idduplicate = false;
		var strVal = str.value;
		var inputField = document.getElementById('member_id');
		var replaceStr = strVal.replace(/[^a-zA-Z0-9]/g, ''); // 영문과 숫자만 남기고 다른 문자 제거
        inputField.value = replaceStr;
        if (replaceStr.length < 6) {
            $(inputField).parent().parent().find('.el_error').remove(); 
            $(inputField).parent().parent().append("<p class='el_error mt10'>형식에 맞지 않습니다.</p>");
            $("#duplicateIdBtn").attr("disabled",true);
            idcheck = false;
        } else if(replaceStr.length > 13){
        	$(inputField).parent().parent().find('.el_error').remove(); 
            $(inputField).parent().parent().append("<p class='el_error mt10'>형식에 맞지 않습니다.</p>");
            $("#duplicateIdBtn").attr("disabled",true);
            idcheck = false;
        }else{
        	 $(inputField).parent().parent().find('.el_error').remove();
        	 $("#duplicateIdBtn").attr("disabled",false);
        	 idcheck = true;
        }
	}
	function pwdKeyup(str){
		var strVal = str.value;
		var regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{6,12}$/;
		var inputField = document.getElementById('member_pwd');
		if (regex.test(strVal)) {
			$(inputField).parent().parent().find('.el_error').remove();
			pwdcheck = true;
		} else{
			$(inputField).parent().parent().find('.el_error').remove();
			$(inputField).parent().parent().append("<p class='el_error mt10'>형식에 맞지 않습니다.</p>");
            pwdcheck = false;
		}
	}
	function pwdKeyup2(str){
		var strVal = str.value;
		var inputField = document.getElementById('member_pwd2');
		var before = $('#member_pwd').val();
		if (strVal==before) {
			$(inputField).parent().parent().find('.el_error').remove();
			pwdcheck = true;
		} else{
			$(inputField).parent().parent().find('.el_error').remove();
			$(inputField).parent().parent().append("<p class='el_error mt10'>비밀번호가 일치하지 않습니다.</p>");
            pwdcheck = false;
		}
	}
	function duplicateId(){
		var member_id = $('#member_id').val();
		 $('#member_id2').val('');
		$.ajax({
   			type:'Get',
   			data : {
   				"member_id" : member_id
   			},
   			url: 'duplicateId',
   			success:function(result){
   				$(".txt_id").text(member_id);
   				if (result=='true') {
   			        $("#true_id").show(); 
   			        $("#false_id").hide();
   			     	$("#duplicateIdBtn2").attr("disabled",false);
   			    } else {
   			        $("#true_id").hide(); 
   			        $("#false_id").show();
   			     	$("#duplicateIdBtn2").attr("disabled",true);
   			    }
   	         },
   	         error:function(){
   	            alert("서버에 문제가 있습니다.");
   	         }
   		});//ajax
	}
	function duplicateId2(){
		var member_id = $('#member_id2').val();
		if (validateId(member_id)) {
			$.ajax({
	   			type:'Get',
	   			data : {
	   				"member_id" : member_id
	   			},
	   			url: 'duplicateId',
	   			success:function(result){
	   				$(".txt_id").text(member_id);
	   				console.log(result);
	   				if (result=='true') {
	   			        $("#true_id").show(); 
	   			        $("#false_id").hide(); 
	   			     	$("#duplicateIdBtn2").attr("disabled",false);
	   			    } else {
	   			        $("#true_id").hide(); 
	   			        $("#false_id").show(); 
	   			     	$("#duplicateIdBtn2").attr("disabled",true);
	   			    }
	   	         },
	   	         error:function(){
	   	            alert("서버에 문제가 있습니다.");
	   	         }
	   		});//ajax
		}else{
			alertPop('올바른 아이디 형식이 아닙니다.');
		}
	}
	function member_id_val(){
		$('#member_id').val($("#true_id").find(".txt_id").text());
		idduplicate = true;
	}
	function email_val(){
		var email = $("#true_email").find(".txt_email").text();
		const emails = email.split("@");
		$('#email_id').val(emails[0]);
		$('#email_domain').val(emails[1]);
		emailduplicate = true;
	}
	function emailChange(){
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
	function validateId(id) {
	    // 영문 소문자와 숫자 조합, 6자에서 12자 사이의 문자열 검증
	    var regex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,12}$/;
	    return regex.test(id);
	}
	function validateEmail(email) {
	    // 이메일 형식을 검증하는 정규 표현식
	    var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	    return regex.test(email);
	}
	function duplicateEmail(){
		var email = $('#email_id').val() + "@" + $("#email_domain").val();
		 $('#email_id2').val('');
		$.ajax({
   			type:'Get',
   			data : {
   				"email" : email
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
		var email = $('#email_id2').val();
		if (validateEmail(email)) {
			$.ajax({
	   			type:'Get',
	   			data : {
	   				"email" : email
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
		 	alert('올바른 이메일 형식이 아닙니다.');
		}
	}
	function joinCheck(){
		var form = $("#joinForm");
		if(!idcheck){
			alertPop("아이디를 확인해주세요.");
			return false;	
		}
		if(!idduplicate){
			alertPop("아이디 중복확인을 해주세요.");
			return false;
		}
		if(!pwdcheck){
			alertPop("비밀번호를 확인해주세요.");
			return false;
		}
		if($("#email_domain").val() == '' || $("#email_id").val() == ''){
			alertPop("이메일을 입력 해주세요.");
			return false;
		}
		if(!emailduplicate){
			alertPop("이메일 중복확인을 해주세요.");
			return false;
		}
		if($("#zipcode").val() == '' || $("#addr").val() == '' || $("#daddr").val() == ''){
			alertPop("주소를 입력해 주세요.");
			return false;
		}
		if($("#member_id").val() != '' && $("#member_pwd").val() != '' && $("#member_pwd2").val() != '' && $("#email_id").val() != ''
				&& $("#email_domain").val() != '' && $("#zipcode").val() != ''&& $("#addr").val() != ''&& $("#daddr").val() != ''){
			form.submit();
		}else{
			alertPop("필수항목을 입력해주세요.");
			return false;
		}
	}
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
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-W384F33H');</script></head>

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
					<!-- title -->
					<h3 class="page_title">회원가입</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
				</div>
			</div>
		
			<section class="section member_content">
				<div class="ly_inner sm">
					<nav class="tab_list type3">
						<a href="#" class="tab_link">1. 약관동의</a>
						<a href="#" class="tab_link">2. 본인인증</a>
						<a href="#" class="tab_link active">3. 정보입력</a>
						<a href="#" class="tab_link">4. 가입완료</a>
					</nav>
					<div class="bl_card agreement_card type2 m_full">
						<form action="join" id="joinForm">
							<div class="member_inner pmax615">
								<div class="frm_field">

									<div class="row">
										<input type="text" class="frm_input pmax370" aria-label="이름" readonly value="${name}" name="name">
									</div>
									<div class="row">
										<div class="frm_group gap10 pmax370 req">
											<input type="text" class="frm_input" name="member_id" id="member_id" aria-label="아이디" placeholder="아이디 입력" required onkeyup="idKeyup(this)">
											<button type="button" class="el_btn frm_btn blue openModal" id="duplicateIdBtn" data-target="#checkPopup" onclick="duplicateId()" disabled>중복 확인</button>
											<p class="el_desc_frm">영문과 숫자 조합 6~12자</p>
										</div>
									</div>
									<div class="row">
										<div class="frm_group gap10b m_column req">
											<input type="password" class="frm_input pmax370" name="member_pwd" id="member_pwd" aria-label="비밀번호" placeholder="비밀번호 입력" required onkeyup="pwdKeyup(this)">
											<p class="el_desc_frm">영문+숫자+특수문자 조합 6~12자</p>
										</div>
									</div>
									<div class="row">
										<div class="frm_group gap10b m_column req">
											<input type="password" class="frm_input pmax370" id="member_pwd2" aria-label="비밀번호 확인" placeholder="비밀번호 확인" required onkeyup="pwdKeyup2(this)">
										</div>
											<!-- 에러 메시지 -->
											<p class="el_error mt10" style="display: none;">비밀번호가 일치하지 않습니다.</p>
									</div>
									<div class="row">
										<div class="frm_group gap11 pmax370">
											<input type="text" class="frm_input" aria-label="휴대전화 앞자리" value="${fistNum}" readonly name="fistNum">
											<input type="text" class="frm_input" aria-label="휴대전화 중간자리" value="${middleNum }" readonly name="middleNum">
											<input type="text" class="frm_input" aria-label="휴대전화 뒷자리" value="${lastNum}" readonly name="lastNum">
										</div>
									</div>
									<div class="row">
										<div class="frm_group gap11 pmax370 req">
											<select class="frm_select" aria-label="태어난 해 선택" name="yyyy">
												<c:forEach var="i" begin="1945" end="2001">
									                <c:choose>
									                    <c:when test="${i == yyyy}">
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
									                    <c:when test="${i == mm}">
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
									                    <c:when test="${i == dd}">
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
												<input type="radio" aria-label="성별(남)" name="sex"  value="m" <c:if test="${gender=='1' }">checked</c:if> readonly>
												<span>남</span>
											</label>
											<label class="frm_radio type1">
												<input type="radio" aria-label="성별(여)" name="sex"  value="f" <c:if test="${gender=='0' }">checked</c:if> readonly>
												<span>여</span>
											</label>
										</div>
									</div>
									<div class="row">
										<div class="frm_email">
											<div class="col frm_group gap10b req">
												<input type="text" class="frm_input" id="email_id" name="email_id" aria-label="이메일 아이디" placeholder="이메일 입력"  required oninput="emailChange()">
												<span class="txt">@</span>
												<input type="text" class="frm_input email_input" id="email_domain" name="email_domain" aria-label="이메일 도메인" required oninput="emailChange()">
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
												<input type="checkbox" name="chk_email" <c:if test="${adYn=='Y' }">checked</c:if>>
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
											<div class="frm_group gap10b req">
												<input type="text" id="zipcode" name="zipcode" class="frm_input max116" aria-label="우편번호" placeholder="우편번호 입력"  required readonly>
												<button type="button" class="el_btn frm_btn gray" onclick="searchAddress()">우편번호 찾기</button>
											</div>
											<input type="text" id="addr" name="addr" class="frm_input pmax370" aria-label="주소" required readonly>
											<input type="text" id="daddr" name="daddr" class="frm_input pmax370" aria-label="상세주소" required placeholder="상세주소 입력">
										</div>
									</div>
									<div class="row">
										<div class="frm_group gap10">
											<input type="text" class="frm_input pmax370" aria-label="선호선수" required disabled id="player_info">
											<input type="hidden" id="player_no" name="player_no">
											<button type="button" class="el_btn frm_btn gray openModal" data-target="#playerPopup">선호선수 등록</button>
										</div>
										<p class="el_desc_frm mt10">선호선수는 마이페이지에서도 변경 가능합니다.</p>
									</div>

								</div>
							</div>
						
							<div class="member_footer type2 mt50-20">
								<div class="btn_area gap10b">
									<button type="button" class="el_btn frm_btn gray2 openModal" data-target="#rejectPopup">취소</button>
									<button type="button" class="el_btn frm_btn blue" onclick="joinCheck()">확인</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</section>

			<!-- 아이디 중복확인 팝업 -->
			<div id="checkPopup" tabindex="-1" class="modal md checkPopup" data-focus="modal">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_body ">
							<h4 class="modal_tit">아이디 중복확인</h4>
							
							<article class="mt30">
								<div class="message_box">
									<p id="true_id" style="display: none;"><strong class="txt_point txt_id"></strong>은(는) 사용가능한 아이디입니다.</p>
									<!-- 에러 메시지 -->
									<p id="false_id" class="error" style="display: none;"><strong class="txt_point txt_id"></strong>은(는) 사용불가능한 아이디입니다.</p>
								</div>
								<div class="btn_area mt20">
									<button type="button" class="el_btn frm_btn gray closeModal" id="duplicateIdBtn2" disabled onclick="member_id_val()">등록</button>
								</div>
							</article>

							<article class="mt30-26">
								<div class="message_box">
									<p>다른 아이디를 원하시면 다시 입력해주세요.</p>
									<input type="text" class="frm_input mt10" id="member_id2">
								</div>
								<div class="btn_area mt20">
									<button type="button" class="el_btn frm_btn blue" data-focus-next="modal" onclick="duplicateId2()">확인</button>
								</div>
							</article>
							
						</div>
					</div>
				</div>
			</div>
			<!-- 아이디 중복확인 팝업 -->

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
								<li class="item no_player" style="display: none;">
									<span class="no_post hmd">등록된 선수가 없습니다.</span>
								</li>
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
				    $(".no_player").hide();
				    var posText = $(this).find('span').text();
				    if(posText == '가드'){
				    	$(".g").show();
				    	$(".f").hide();
				    	$(".c").hide();
				    	if($(".g").length <1){
				    		$(".no_player").show();
				    	}
				    }
				    if(posText == '포워드'){
				    	$(".f").show();
				    	$(".g").hide();
				    	$(".c").hide();
				    	if($(".f").length <1){
				    		$(".no_player").show();
				    	}
				    }
				    if(posText == '센터'){
				    	$(".c").show();
				    	$(".g").hide();
				    	$(".f").hide();
				    	if($(".c").length <1){
				    		$(".no_player").show();
				    	}
				    }
				});
				function playerSelect(){
					$("#player_info").val($(".p_profile.type2.active").find(".player_text").text());
					$("#player_no").val($(".p_profile.type2.active").find(".player_no_text").text());
				}
			</script>
			<!-- 취소 컨펌 알럿 -->
			<div id="rejectPopup" tabindex="-1" class="alert modal conformPopup" data-focus="modal4">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_body">
							<p class="alert_msg md">현재까지 진행된 가입 정보는<br class="m_show"> 저장되지 않습니다.<br>
								회원가입을 취소하시겠습니까?</p>
							<div class="btn_area gap10b mt30-26">
								<button type="button" class="el_btn frm_btn gray2 closeModal">취소</button>
								<a href="loginForm" class="el_btn frm_btn blue" data-focus-next="modal4">확인</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 취소 컨펌 알럿 -->

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