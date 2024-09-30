<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>티켓팅 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/game.css"> <!-- 디렉토리  game only -->
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
		<main id="container" class="ly_container game">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>GAME</li>
						<li>티켓팅</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">GAME</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="scheduleList" class="swiper-slide snb_link"><span>경기일정/결과</span></a>
								<a href="teamRank" class="swiper-slide snb_link"><span>팀/선수 순위</span></a>
								<a href="teamRecord" class="swiper-slide snb_link"><span>시즌 기록실</span></a>
								<a href="ticket" class="swiper-slide snb_link current"><span>티켓팅</span></a> <!-- 해당페이지에 current 추가 -->
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- snb 3depth -->
			<div class="snb_3dth_area">
				<nav class="snb_3dth snb_list menu_slider">
					<div class="swiper-wrapper">
						<a href="ticket" class="swiper-slide snb_link"><span>티켓안내</span></a> 
						<a href="ticket_faq" class="swiper-slide snb_link current"><span>티켓FAQ</span></a> <!-- 해당페이지에 current 추가 -->
					</div>
				</nav>
			</div>

			<!-- 티켓예매 안내 -->
			<section class="section">
				<div class="ly_inner md">
					<div class="accordion ticket_faq">
						<!-- item -->
						<dl class="accordion_item">
							<dt class="header accordion_btn">
								<span class="txt">티켓예매하는 방법을 알고 싶어요!</span>
							</dt>
						
							<dd class="content accordion_cont">
								<div class="inner">
									<p> 티켓예매는 KBL WEB 및 KBL APP 을 통해서만 가능합니다.<br>
										KBL WEB : KBL 홈페이지 내 KCC이지스 예매 페이지에서 회원가입 및 로그인 후 예매 가능합니다.(링크 : <a href="https://egis.kbl.or.kr" target="_blank">https://egis.kbl.or.kr)</a><br>
										KBL APP : 회원가입 및 로그인 후 예매 가능합니다.
									</p>
								</div>
							</dd>
						</dl>
						<!-- //item --> 
						<!-- item -->
						<dl class="accordion_item">
							<dt class="header accordion_btn">
								<span class="txt">티켓예매 시간을 알고 싶습니다.</span>
							</dt>
						
							<dd class="content accordion_cont">
								<div class="inner">
									<p> 멤버십 회원 예매 : 경기 5일전 오전 11시<br>
									일반 회원 예매 : 경기 4일 전 오전 11시부터 경기당일 경기 시작 시까지 </p>
								</div>
							</dd>
						</dl>
						<!-- //item --> 
						<!-- item -->
						<dl class="accordion_item">
							<dt class="header accordion_btn">
								<span class="txt">전화 티켓예매 및 문의는 어디로 하면 되나요?</span>
							</dt>
						
							<dd class="content accordion_cont">
								<div class="inner">
									<p> 티켓 관련 전화 예매 및 문의는 KBL 티켓예매 콜센터에서 담당하고 있습니다.<br>
									고객센터 : 1588-7890<br>
									이용시간 : 10:00 ~ 19:00 (요일 구분 없음)<br>
									＊전화 연결 안 될 경우 membership@nhnlink.co.kr 메일을 통해 문의</p>
								</div>
							</dd>
						</dl>
						<!-- //item --> 
						<!-- item -->
						<dl class="accordion_item">
							<dt class="header accordion_btn">
								<span class="txt">티켓예매 결제수단은 어떻게 되나요?</span>
							</dt>
						
							<dd class="content accordion_cont">
								<div class="inner">
									<p> KBL WEB :신용카드, 계좌이체, 간편결제(PAYCO)<br>
									KBL APP :신용카드, 간편결제(PAYCO), 휴대폰결제(PAYCO)</p>
								</div>
							</dd>
						</dl>
						<!-- //item --> 
						<!-- item -->
						<dl class="accordion_item">
							<dt class="header accordion_btn">
								<span class="txt">티켓예매 확인 및 취소에 대해 알고 싶습니다.</span>
							</dt>
						
							<dd class="content accordion_cont">
								<div class="inner">
									<p> KBL WEB 또는 APP을 통해 확인 및 취소 할 수 있습니다.<br>
									취소 시 장당 1,000원의 수수료가 발생합니다.<br>
									신용카드 단일 결제 시에는 부분 취소가 가능합니다.<br>
									전화 취소 시 1588-7890(운영시간:10:00~19:00, 월~일)을 통해 가능합니다.</p>
								</div>
							</dd>
						</dl>
						<!-- //item --> 
					</div> 
				</div>
			</section>
			<!-- //티켓예매 안내 -->


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