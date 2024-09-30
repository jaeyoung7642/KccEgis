<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원정보수정 : KCC이지스 프로농구단</title>
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
	var pwdcheck = false;
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
	function updateCheck(){
		var form = $("#updateForm");
		if(!pwdcheck){
			alertPop("비밀번호를 확인해주세요.");
			return false;
		}
		if($("#member_pwd").val() != '' && $("#member_pwd2").val() != '' && $("#member_pwd3").val() != ''){
			form.submit();
		}else{
			alertPop("비밀번호를 입력해주세요.");
			return false;
		}
	}
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
					<h3 class="page_title">비밀번호 변경</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
				</div>
			</div>
			<section class="section member_content">
				<div class="ly_inner xsm">
					<!-- 비밀번호 찾기 -->
					<article class="bl_card findaccount_card m_full space50">
						<div class="member_inner">
							<div class="member_header">
								<p class="mb_heading">비밀번호 변경</p>
							</div> 

							<form class="frm_field mt40" id="updateForm" action="pwdUpdate">
							<input type="hidden" name="num" id="num" value="${resultMap.num}">
								<div class="row">
										<div class="frm_group gap10b m_column">
											<input type="password" class="frm_input" name="member_pwd3" id="member_pwd3" aria-label="비밀번호" placeholder="기존 비밀번호 입력" required>
										</div>
									</div>
									<div class="row">
										<div class="frm_group gap10b m_column">
											<input type="password" class="frm_input" name="member_pwd" id="member_pwd" aria-label="비밀번호" placeholder="신규 비밀번호 입력" required onkeyup="pwdKeyup(this)">
										</div>
											<p class="el_desc_frm mt10">&nbsp;&nbsp;영문+숫자+특수문자 조합 6~12자</p>
									</div>
									<div class="row">
										<div class="frm_group gap10b m_column">
											<input type="password" class="frm_input" id="member_pwd2" aria-label="비밀번호 확인" placeholder="신규 비밀번호 확인" required onkeyup="pwdKeyup2(this)">
										</div>
										<!-- 에러 메시지 -->
										<p class="el_error mt10" style="display: none;">비밀번호가 일치하지 않습니다.</p>
									</div>
							</form>

							<div class="member_footer type2">
								<div class="btn_area">
									<a href="memberUpdateForm" class="el_btn frm_btn gray2">취소</a>
									<button type="button" class="el_btn frm_btn blue" onclick="updateCheck()">수정</button>
								</div>
							</div>
						</div>
					</article>
					<!-- //비밀번호 찾기 -->
				</div>
			</section>
			<a href="#wrap" class="el_btn gotoTop" aria-label="맨 위로 이동">
				<img src="/resources/common/images/common/ico_gotoTop.svg" alt="">
			</a>
		</main>
		<!-- //container -->

		<!-- footer -->
		<app-footer></app-footer>
		<!-- footer -->

	</div>
	<!-- Global site tag (gtag.js) - Google Analytics -->
		  <script src="https://www.googletagmanager.com/gtag/js?id=UA-180137319-1"></script>
		  <script>
		    window.dataLayer = window.dataLayer || [];
		    function gtag() { dataLayer.push(arguments); }
		    gtag('js', new Date());
		    gtag('config', 'UA-180137319-1');
		  </script>
</body>
</html>