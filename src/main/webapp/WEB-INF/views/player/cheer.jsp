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
	<meta property="og:title" content="응원단 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>응원단 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/player.css"> 
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
		<main id="container" class="ly_container player">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>PLAYER</li>
						<li>응원단</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">PLAYER</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="coachList" class="swiper-slide snb_link"><span>코칭스탭</span></a>  <!-- 해당페이지에 current 추가 -->
								<a href="playerList" class="swiper-slide snb_link"><span>선수</span></a>
								<a href="cheer" class="swiper-slide snb_link current"><span>응원단</span></a>
								<a href="cheer_song" class="swiper-slide snb_link"><span>응원가</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 응원단 -->
			<section class="section">
				<div class="ly_inner md">
					<div class="cheer_list type1">
						<!-- 응원단장 -->
						<article class="cheer_item">
							<div class="photo">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_01.png" alt="신대권 응원단장 사진">
								</div>
							</div>
							<!-- info -->
							<div class="cheer_info">
								<h4 class="el_role">응원단장</h4>
								<p class="el_name">
									<span class="kor">신대권</span>
								</p>

								<div class="profile_box_list">
									<dl>
										<dt>생일</dt>
										<dd>12월 14일</dd>
									</dl>
									<dl>
										<dt>별명</dt>
										<dd>대껌</dd>
									</dl>
									<dl>
										<dt>취미</dt>
										<dd>여행</dd>
									</dl>
									<dl>
										<dt>MBTI</dt>
										<dd>ENFP</dd>
									</dl>
									<dl>
										<dt>시즌 각오</dt>
										<dd>열정적인 부산 팬들과 오직 승리만을 위해 <br> 힘찬 응원으로 함께 하겠습니다! JUST WIN! KCC!</dd>
									</dl>
								</div>
							</div>
							<!-- //info -->
						</article>
						<!-- //응원단장 -->
						<!-- 장내 아나운서 -->
						<article class="cheer_item">
							<div class="photo">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_03.png" alt="손동혁 장내 아나운서 사진">
								</div>
							</div>
							<!-- info -->
							<div class="cheer_info">
								<h4 class="el_role">장내 아나운서</h4>
								<p class="el_name">
									<span class="kor">손동혁</span>
								</p>

								<div class="profile_box_list">
									<dl>
										<dt>생일</dt>
										<dd>12월 2일</dd>
									</dl>
									<dl>
										<dt>별명</dt>
										<dd>MC쏜</dd>
									</dl>
									<dl>
										<dt>취미</dt>
										<dd>운동</dd>
									</dl>
									<dl>
										<dt>MBTI</dt>
										<dd>ESFP</dd>
									</dl>
									<dl>
										<dt>시즌 각오</dt>
										<dd>늘 겸손하게 감사하게 성실하게 <br> 부산KCC의 승리를 위해 목소리를 높이겠습니다.</dd>
									</dl>
								</div>
							</div>
							<!-- //info -->
						</article>
						<!-- //장내 아나운서 -->
					</div>
				</div>
			</section>
			<!-- //응원단-->

			<!-- 치어리더 -->
			<section class="section mt100 ">
				<div class="ly_inner md">
					<div class="page_header mb40">
						<h4 class="el_heading lv1">CHEER LEADER</h4>
					</div>

					<ul class="cheer_list type2 bl_grid_list cols4b">
						<li class="item">
							<a href="cheer_profile?cheer_num=1" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thum_01.png" alt="김수현 사진">
								</div>
								<div class="info">
									<spna class="name">김수현</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=2" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thum_02.png" alt="감서윤 사진">
								</div>
								<div class="info">
									<spna class="name">감서윤</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=3" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thum_03.png" alt="홍재연 사진">
								</div>
								<div class="info">
									<spna class="name">홍재연</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=4" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thum_04.png" alt="김가은 사진">
								</div>
								<div class="info">
									<spna class="name">김가은</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=5" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thum_05.png" alt="김민지 사진">
								</div>
								<div class="info">
									<spna class="name">김민지</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=6" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thum_06.png" alt="서여진 사진">
								</div>
								<div class="info">
									<spna class="name">서여진</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=7" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thum_07.png" alt="염경미 사진">
								</div>
								<div class="info">
									<spna class="name">염경미</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=8" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thum_08.png" alt="강지유 사진">
								</div>
								<div class="info">
									<spna class="name">강지유</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=9" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer//cheer_thum_09.png" alt="김유나 사진">
								</div>
								<div class="info">
									<spna class="name">김유나</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=10" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thum_10.png" alt="김가영 사진">
								</div>
								<div class="info">
									<spna class="name">김가영</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=11" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thum_11.png" alt="김연정 사진">
								</div>
								<div class="info">
									<spna class="name">김연정</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=12" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thum_12.png" alt="우리경 사진">
								</div>
								<div class="info">
									<spna class="name">우리경</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=13" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thum_13.png" alt="윤채원 사진">
								</div>
								<div class="info">
									<spna class="name">윤채원</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=14" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thum_14.png" alt="임채린 사진">
								</div>
								<div class="info">
									<spna class="name">임채린</spna>
								</div>
							</a>
						</li>
					</ul>
				</div>
			</section>
			<!-- //치어리더 -->

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