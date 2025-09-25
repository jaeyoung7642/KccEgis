<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<meta property="og:title" content="구단소개 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>구단소개 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/club.css"> <!-- 디렉토리  club only -->
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
		<main id="container" class="ly_container club">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>CLUB</li>
						<li>구단소개</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">CLUB</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="front" class="swiper-slide snb_link current"><span>구단소개</span></a> 
								<a href="chistory" class="swiper-slide snb_link"><span>역사관</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="sponsor" class="swiper-slide snb_link"><span>스폰서</span></a>
								<a href="kccadList" class="swiper-slide snb_link"><span>KCC 광고</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- snb 3depth -->
			<div class="snb_3dth_area">
				<nav class="snb_3dth snb_list menu_slider">
					<div class="swiper-wrapper">
						<a href="front" class="swiper-slide snb_link current"><span>구단 프런트</span></a> <!-- 해당페이지에 current 추가 -->
						<a href="ci" class="swiper-slide snb_link"><span>구단 CI</span></a>
						<a href="busan_gym" class="swiper-slide snb_link"><span>구장안내</span></a> 
					</div>
				</nav>
			</div>

			<!-- 인사말 --> 
			<section class="section mt70">
				<div class="ly_inner md inner">
					<div class="front_greeting">
						<!-- 구단주 인사말 -->
						<article class="row">
							<div class="el_img el_thumb rds2">
								<img src="/resources/common/images/img/front_img_01@1_5x.jpg" alt="">
							</div>
							<div class="cont">
								<p class="txt_intro"><span class="point">부</span>산 KCC EGIS를 사랑해 주시는 팬 여러분, 안녕하십니까<br>
									부산 KCC EGIS 프로농구단 구단주 정재훈입니다</p>

								<p>지난 시즌 어려운 여건 속에서도<br>
								   변함없이 보내주신 성원에 깊은 감사를 드립니다.<br><br>
								   2025-2026시즌, 우리는 전환점 위에서<br>
								   더 강인한 모습과 끊임없는 도전 정신으로 보답해드리고자 합니다.<br><br>

									부산을 대표하는 프로스포츠 구단으로 책임과 긍지를 지니고,<br>
									팬 여러분과 늘 함께 호흡하는 구단으로 자리하겠습니다.<br><br>
									
									앞으로도 팬 여러분의 열정과 응원에 걸맞은 감동을 전하며,<br>
									항상 팬과 함께 성장하는 구단으로 남겠습니다.								
								</p>	

									<p>부산 KCC EGIS 프로농구단<br>
										구단주 <em class="name">정재훈</em></p>
							</div>
						</article>
						<!-- //구단주 인사말 -->

						<!-- 단장 인사말 -->
						<article class="row">
							<div class="el_img el_thumb rds2">
								<img src="/resources/common/images/img/front_img_02@1_5x.jpg" alt="">
							</div>
							<div class="cont">
								<p class="txt_intro"><span class="point">부</span>산 KCC EGIS 프로농구단을 사랑해주시는 팬 여러분 안녕하십니까!<br>
									부산 KCC EGIS 프로농구단 단장 최형길입니다.</p>

								<p>새로운 시즌의 문이 열렸습니다.<br>
								우리는 지난 시간의 땀과 노력을 바탕으로<br>
								다시 한 번 도전의 길에 나서고자 합니다.<br><br>

								올 시즌은 더욱 특별합니다.<br>
								새로운 리더십과 강인한 정신력, 끊임없는 열정으로 뭉친 선수들이<br>
								“JUST WIN”이라는 다짐 아래 하나가 되었습니다.<br><br>

								여러분의 응원과 사랑이 우리 선수단의 가장 큰 힘입니다.<br>
                                다가오는 가을부터 봄까지, 승리와 감동의 여정을 함께 해주시길 바랍니다.									
								</p>	

									<p>부산 KCC EGIS 프로농구단<br>
										단장 <em class="name">최형길</em></p>
							</div>
						</article>
						<!-- //단장 인사말 -->
					</div>
				</div>
			</section>
			<!-- //인사말 --> 


			<!-- 조직도 --> 
			<section class="section mt50 ">
				<div class="ly_inner md inner">
					<div class="front_org">
						<ul class="org_1dth_list">
							<li class="org_1dth">
								<div class="box box1">
									<span class="pos">구단주</span>
									<span class="name">정재훈</span>
								</div>
							</li>
							<li class="org_1dth">
								<div class="box box2">
									<span class="pos">단장</span>
									<span class="name">최형길</span>
								</div>
							</li>
							<li class="org_1dth line">
								<div class="box box3">
									<span class="pos">사무국장</span>
									<span class="name">조진호</span>
								</div>

								<div class="org_2dth_wrap">
									<ul class="org_2dth_list lt">
										<li class="org_2dth">
											<div class="box box1">
												<span class="pos">선임 팀장</span>
												<span class="name">송원진</span> 
											</div>
										</li>
										<li class="org_2dth">
											<div class="box">
												<span class="pos">운영 프로</span>
												<span class="name">오혜란</span>  
											</div>
										</li>
										<li class="org_2dth">
											<div class="box">
												<span class="pos">운영 프로</span>
												<span class="name">곽동기 </span>  
											</div>
										</li>
									</ul>
									
									<ul class="org_2dth_list rt">
										<li class="org_2dth">
											<div class="box box1">  
												<span class="pos">홍보 팀장</span>
												<span class="name">김 민</span> 
											</div>
										</li>
										<li class="org_2dth">
											<div class="box">
												<span class="pos">홍보/마케팅 프로</span>
												<span class="name">김건준</span>  
											</div>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</div> 
				</div>
			</section>
			<!-- //조직도 --> 


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