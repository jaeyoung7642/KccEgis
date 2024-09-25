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
								<p class="txt_intro"><span class="point">안</span>녕하십니까, 부산 KCC EGIS를 사랑해 주시는 팬 여러분.<br>
									부산 KCC EGIS 프로농구단 구단주 정재훈입니다</p>

								<p>부산에서의 첫 시즌을 성공적으로 마칠 수 있었던 것에 대해<br>
								   진심으로 감사드립니다.<br>
								   매 경기 진심을 다해 보내주신 열화와 같은 성원 덕분에<br>
								   우리는 우승이라는 성과를 이뤄낼 수 있었습니다.<br><br>

									이번 시즌 더욱 강력해진 선수단과 함께<br>
									새로운 도전에 나설 준비가 되어 있습니다.<br>
									새로운 곳에서 다시금 정상에 오르고자 합니다.<br>
									팬 여러분의 목소리가 얼마나 값진 것인지를 알기에,<br  class="xp_hide">
									<span class="txt_wrap">우리 선수들은</span> 각자의 역할을 충실히 수행하며 <br>
									정상이라는 목표를 향해 나아갈 것입니다.<br><br>
									
									부산 KCC EGIS의 성공은<br>
									팬 여러분과 함께 만들어가는 여정입니다. <br>
									앞으로도 많은 응원과 지지를 부탁드리며, <br>
									다시 한번, 우승의 영광을 함께 나누기 위해 정진하겠습니다.<br>
									감사합니다.</p>	

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
								<p class="txt_intro"><span class="point">안</span>녕하십니까, 부산 KCC EGIS를 사랑해 주시는 팬 여러분!<br>
									부산 KCC EGIS 프로농구단 단장 최형길입니다.</p>

								<p>지난 시즌 동안 보내주신 뜨거운 성원에 진심으로 감사드립니다.<br>
									<span class="txt_wrap">여러분의</span> 응원 덕분에 우리는 '최강'이라는 이름으로<br>
									우승이라는 놀라운 성과를 이루어 냈습니다.<br>
									보내주신 사랑과 관심은 선수들에게 큰 힘이 되었고, <br>
									그 결과 팀이 더욱 성장할 수 있었습니다.<br><br>

									이번 시즌의 캐치프레이즈인 'AGAIN KCC'는<br>
									우리가 다시 한번 정상에 오르겠다는 굳은 의지를 담고 있습니다.<br>
									디펜딩 챔피언으로서 더욱 강력한 팀워크를 바탕으로<br>
									다시 한번 우승을 향한 도전에 나서겠습니다.<br>
									팬 여러분의 기대에 부응하기 위해 최선을 다할 것을 약속드립니다.<br><br>

									KCC EGIS를 향한 변함없는 사랑과 관심에 다시 한번 감사드리며,<br>
									여러분의 열렬한 응원 속에 우승의 영광을 또다시 차지할 수 있도록<br>
									최선을 다하겠습니다.<br><br>
									
									감사합니다.</p>	

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
												<span class="pos">운영 팀장</span>
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
												<span class="pos">홍보/마케팅 팀장</span>
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
</body>
</html>