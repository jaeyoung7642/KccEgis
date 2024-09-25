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
									<img src="/resources/common/images/img/cheer/cheer_01.png" alt="박승건 응원단장 사진">
								</div>
							</div>
							<!-- info -->
							<div class="cheer_info">
								<h4 class="el_role">응원단장</h4>
								<p class="el_name">
									<span class="kor">박승건</span>
								</p>

								<div class="profile_box_list">
									<dl>
										<dt>생일</dt>
										<dd>1996년 12월 3일</dd>
									</dl>
									<dl>
										<dt>별명</dt>
										<dd>거니</dd>
									</dl>
									<dl>
										<dt>취미</dt>
										<dd>여행</dd>
									</dl>
									<dl>
										<dt>시즌 각오</dt>
										<dd>최강 KCC의 부산에서의 첫 시즌!<br>
											우승을 향해 팬 여러분들과 함께 힘찬 응원 만들어보도록 하겠습니다!!<br>
											KCC 화이팅!!</dd>
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
									<img src="/resources/common/images/img/cheer/cheer_02.png" alt="김진완 장내 아나운서 사진">
								</div>
							</div>
							<!-- info -->
							<div class="cheer_info">
								<h4 class="el_role">장내 아나운서</h4>
								<p class="el_name">
									<span class="kor">김진완</span>
								</p>

								<div class="profile_box_list">
									<dl>
										<dt>생일</dt>
										<dd>1990년 11월 8일</dd>
									</dl>
									<dl>
										<dt>별명</dt>
										<dd>넘버텐</dd>
									</dl>
									<dl>
										<dt>취미</dt>
										<dd>독서, 작문</dd>
									</dl>
									<dl>
										<dt>시즌 각오</dt>
										<dd>이번 시즌,<br>
											우리에겐 오직 우승뿐이라는 생각으로 매 경기 팬분들께 더욱 즐거운
											<span class="txt_wrap">농구를</span> 선사하겠습니다!</dd>
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
									<img src="/resources/common/images/img/cheer/cheer_thumb_01.png" alt="홍채연 사진">
								</div>
								<div class="info">
									<spna class="name">홍채연</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=2" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thumb_01.png" alt="박세아 사진">
								</div>
								<div class="info">
									<spna class="name">박세아</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=3" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thumb_01.png" alt="신채원 사진">
								</div>
								<div class="info">
									<spna class="name">신채원</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=4" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thumb_01.png" alt="서유림 사진">
								</div>
								<div class="info">
									<spna class="name">서유림</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=5" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thumb_01.png" alt="이은지 사진">
								</div>
								<div class="info">
									<spna class="name">이은지</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=6" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thumb_01.png" alt="김가은 사진">
								</div>
								<div class="info">
									<spna class="name">김가은</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=7" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thumb_01.png" alt="허수미 사진">
								</div>
								<div class="info">
									<spna class="name">허수미</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=8" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thumb_01.png" alt="김유나 사진">
								</div>
								<div class="info">
									<spna class="name">김유나</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=9" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thumb_01.png" alt="김연정 사진">
								</div>
								<div class="info">
									<spna class="name">김연정</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=10" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thumb_01.png" alt="김수현 사진">
								</div>
								<div class="info">
									<spna class="name">김수현</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=11" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thumb_01.png" alt="강지유 사진">
								</div>
								<div class="info">
									<spna class="name">강지유</spna>
								</div>
							</a>
						</li>
						<li class="item">
							<a href="cheer_profile?cheer_num=12" class="box">
								<div class="el_img">
									<img src="/resources/common/images/img/cheer/cheer_thumb_01.png" alt="이지원 사진">
								</div>
								<div class="info">
									<spna class="name">이지원</spna>
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
</body>
</html>