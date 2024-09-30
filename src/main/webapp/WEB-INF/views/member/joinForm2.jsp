<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%
	String baseUrl = request.getRequestURL().toString();
	String queryString = request.getQueryString();
	String currentUrl = baseUrl + (queryString != null ? "?" + queryString : "");
	%>
	<meta property="og:type" content="website">
	<meta property="og:url" content="<%= currentUrl %>">
	<meta property="og:title" content="회원가입 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 웹사이트">
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
            popupWindow.close();
            location.href="/joinForm3"
        }
    }
	function getQueryParam(name) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }

    window.onload = function() {
        // URL에서 'msg' 파라미터 읽기
        var msg = getQueryParam('msg') || '';

        // URL 디코딩
        msg = decodeURIComponent(msg).trim();

        // 콘솔에서 값 확인
        console.log('msg:', msg);

        // 메시지가 있을 경우 알림 표시
        if (msg !== '') {
        	alertPop(msg);
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
						<a href="#" class="tab_link active">2. 본인인증</a>
						<a href="#" class="tab_link">3. 정보입력</a>
						<a href="#" class="tab_link">4. 가입완료</a>
					</nav>
					<div class="bl_card agreement_card m_full txt_ct">
						<form name="form_chk" method="post">
							<div class="btn_area member_age_select mt18">
								<div class="frm_radio_age">
									<div class="box">
										<p class="tit">만 14세 <strong>이상</strong></p>
										<div class="icon">
											<span class="el_ico">
												<svg viewBox="0 0 100 100"><use href="#member_14over"></use></svg>
											</span>
										</div>
									</div>
								</div>
							</div>

							<p class="el_desc_lg mt40">※ 만 14세 이상부터 회원가입이 가능합니다.</p>

							<div class="member_footer type2 mt40">
								<div class="btn_area">
									<input type="hidden" name="m" value="service"/>
							        <input type="hidden" name="token_version_id" value="${token_version_id }"/>
							        <input type="hidden" name="enc_data" value="${enc_data }"/>
							        <input type="hidden" name="integrity_value" value="${integrity_value }"/>
									<a href="javascript:fnPopup();" class="el_btn frm_btn blue">인증하기</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</section>

			<!-- SVG 전체 사용-->
			<svg class="blind">
				<symbol id="member_14over">
					<path d="M61.5 61.3c-.4-.1-.9 0-1.2.3-.1 0-5 4.1-10.9 4-5.7-.1-10.3-3.9-10.3-3.9-.3-.3-.8-.4-1.2-.3-11.1 1.8-19.7 11.6-20.4 23 0 .4.1.8.4 1.1l.2.2c8.4 7.5 21.8 10.8 31.3 10.8 4.7 0 20.9-.8 32.2-10.9.3-.3.5-.8.5-1.2-.7-11.4-9.4-21.1-20.6-23.1zM49.4 93.5c-8.8 0-21-3-28.8-9.6.9-9.5 8-17.6 17.2-19.5 1.6 1.2 6 4.1 11.6 4.2 5.8.1 10.6-3 12.2-4.2 9.3 1.9 16.5 10 17.4 19.5-10.5 8.9-25.3 9.6-29.6 9.6zM30.7 35.1c-.1.2-.1.4-.1.7.5 12.4 9.3 22.1 20 22.1 10.9 0 20.1-10.6 20.1-23.2 0-.2-.1-.4-.1-.6.2-.4.4-.9.7-1.3.5-1 1.1-2 1.3-3 2.6-9.3.1-15.9-7.2-18.5-2.7-4.7-9.1-7.9-16-7.8-6.5.1-15 4-18.5 11.2-1.7 3.6-4.1 10.8-.6 19.7 0 .3.1.6.4.7zM33.4 16c3-6.1 10.3-9.4 15.9-9.5 6.1-.1 11.6 2.7 13.6 6.7.2.4.5.6.9.8 6.2 2 8.1 7 5.8 15.1v.1c-.1.6-.6 1.4-1 2.2v.1c-.4-.6-.8-1.3-1.2-2-1.1-1.9-2.4-4.1-4.7-5.8-.7-.5-1.6-.4-2.1.3s-.4 1.6.3 2.1c1.8 1.3 2.8 3.2 3.9 5 .9 1.5 1.7 2.9 2.9 3.9 0 10.9-7.8 20.1-17.1 20.1-9.2 0-16.6-8.5-17.1-19.2 0-.4-.2-.7-.4-.9 1.4-.8 2.3-1.8 3.2-2.5.7-.6 1.3-1.3 1.7-1.3 5.8-.6 18-4.8 22-8.8.6-.6.6-1.5 0-2.1-.6-.6-1.5-.6-2.1 0-3.5 3.5-15 7.4-20.2 8-1.4.1-2.4 1.1-3.5 2.1-.6.5-1.2 1.1-1.9 1.6-2.2-7.4-.3-13.1 1.1-16z" />
				</symbol>
				<symbol id="member_14under">
					<path d="M32.5 58.2C43 58.2 51.8 48 51.8 35.9c0-3.9-.8-7.4-2.3-10.6-.1-.2-.2-.3-.3-.4l.2-.2c4.1-4.4 4.8-12 1.8-19.1-.2-.3-.5-.6-.9-.8-.4-.1-.8-.1-1.2.1-3.4 1.7-6.8 2.7-10.3 3.2-3.9.6-6.8.2-9.3 0-3.1-.4-5.8-.7-9.3.9-7.5 3.4-9.7 11.7-9.7 11.7-2.1 7.9 1.2 14.7 2.8 17 .7 11.5 9 20.5 19.2 20.5zm0-3c-8.7 0-15.9-8.1-16.3-18.4 0-.3-.1-.6-.3-.8.2-.3.3-.6.3-.9-.1-1.9 1.1-4.9 2.3-7.8.9-2 2.1-3.9 3.7-5.5 4.3 4.5 9.9 7.2 15.8 7.3 3.3 0 6.4-.8 8.9-2.3 1.3 2.7 2 5.8 2 9.2-.1 10.4-7.6 19.2-16.4 19.2zM13.4 21.4c0-.1 1.9-7 8.1-9.7 1.5-.7 2.9-.9 4.3-.9 1.1 0 2.2.1 3.4.3 2.5.3 5.7.6 10 0 3.3-.5 6.6-1.4 9.7-2.8 1.9 5.5 1.3 11.2-1.7 14.4l-.1.1c-.1.1-.2.1-.2.2-2.1 2-5.3 3.2-8.9 3.1-5.4-.1-10.7-2.8-14.5-7.4-.3-.3-.6-.5-1-.5s-.8.1-1.1.3c-2.4 2.1-4.4 4.7-5.6 7.6-.8 1.9-1.6 3.8-2.1 5.5-.9-2.7-1.4-6.3-.3-10.2zM75.4 65.6c8.4 0 15.2-7.1 15.2-15.9 0-7.8 0-18.4-15.2-18.4S60.2 42 60.2 49.7c0 8.7 6.8 15.9 15.2 15.9zM63.2 48.8c.2.1.4.1.6.1h.2c5.9-.8 15.2-2.1 16.6-2.1.8 0 1.5-.7 1.5-1.5s-.7-1.5-1.5-1.5c-2.2 0-15.6 1.9-17.1 2.1-.1 0-.2 0-.3.1.3-6.4 1.9-11.8 12.1-11.8 12.2 0 12.2 7.5 12.2 15.4 0 7.1-5.5 12.9-12.2 12.9s-12.2-5.8-12.2-12.9c.1-.2.1-.5.1-.8zM20.6 62.8zM84.3 67.8c-.4-.1-.9 0-1.2.3 0 0-3.7 2.9-7.9 2.9h-.1c-4.2-.1-7.6-2.9-7.6-2.9-.3-.3-.8-.4-1.2-.3-2.9.5-5.5 1.7-7.8 3.4-3.6-5.1-9.1-8.8-15.4-9.9-.4-.1-.9 0-1.2.3l.9 1.2-.9-1.2c-.2.2-.5.4-.8.5-.5.4-1.3.9-2.3 1.3-2 1-4.5 1.9-7.3 1.9-2.7 0-5.2-1-7-1.9-.9-.5-1.6-.9-2.1-1.3-.2-.2-.5-.4-.7-.5-.3-.3-.8-.4-1.2-.3l.3 1.5.9-1.1c-.1.1-.3.4-.9 1.1l-.3-1.5C9.6 63.2 1.4 72.4.7 83.5l1.5.1-1.5-.1c0 .5.2.9.5 1.2 0 0 .1 0 .1.1 8.6 7.6 21.8 10.4 30 10.4 7.1 0 15.9-1.5 23.4-5.4 6.5 4 14.6 5.5 20.2 5.5 3.6 0 16-.6 24.7-8.4.3-.3.5-.8.5-1.2-.4-8.8-7.1-16.4-15.8-17.9zM2.2 83.6zm1.6-.7c.9-9.2 7.6-16.7 16.4-18.6.1.1.2.2.3.2.6.4 1.4 1 2.5 1.5 2.1 1.1 5 2.2 8.4 2.3 3.4 0 6.5-1.1 8.7-2.2 1.1-.6 2-1.1 2.6-1.5.1-.1.3-.2.4-.3 5.4 1.1 10 4.3 13 8.8-1.4 1.4-2.6 3-3.5 4.7L52 79c-.1.1-.1.3-.2.4-.1.3-.3.7-.4 1-.1.2-.2.5-.2.7l-.3.9c-.1.4-.2.8-.2 1.2 0 .2-.1.4-.1.5-.1.6-.2 1.1-.2 1.7V86.2c0 .1.1.1.1.2 0 0 0 .1.1.1.1.1.1.2.2.3.3.3.7.6 1 .8-6.7 3.1-14.3 4.4-20.6 4.4-7.5.2-19.5-2.4-27.4-9.1zM75 92.3c-5.9 0-13.9-1.8-19.7-5.8-.3-.2-.5-.4-.8-.6-.2-.1-.3-.3-.5-.4-.2-.1-.3-.2-.4-.4 0-.2 0-.4.1-.6 0-.2 0-.3.1-.5.1-.4.2-.8.2-1.1 0-.2.1-.3.1-.5.1-.4.2-.8.4-1.1.1-.3.2-.5.3-.8.1-.2.1-.3.2-.5.1-.3.3-.6.4-.9.1-.1.1-.2.2-.3.8-1.4 1.7-2.6 2.8-3.8l.2-.2c2.1-2 4.7-3.5 7.6-4.1 1.3 1 4.7 3.1 8.9 3.2 4.3.1 8-2.2 9.4-3.2 6.8 1.5 12 7.3 12.7 14.3-7.9 6.8-19 7.3-22.2 7.3z" />
				</symbol>
			</svg>

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