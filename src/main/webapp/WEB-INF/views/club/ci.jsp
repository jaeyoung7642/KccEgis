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
						<a href="front" class="swiper-slide snb_link"><span>구단 프런트</span></a> 
						<a href="ci" class="swiper-slide snb_link current"><span>구단 CI</span></a> <!-- 해당페이지에 current 추가 -->
						<a href="busan_gym" class="swiper-slide snb_link"><span>구장안내</span></a> 
					</div>
				</nav>
			</div>

			<!-- 인사말 --> 
			<section class="section mt70">
				<div class="ly_inner md inner">
					<div class="club_ci_box"> 
						<div class="logo">
							<img src="/resources/common/images/common/logo.svg" alt="KCC EGIS 로고">
						</div>
						<div class="copy">
							<p class="txt_md">승리를 부르는 이름,</p>
							<p class="txt_lg">그 이름 무적함대 이지스 군단</p>
						</div>
					</div> 

					<div class="club_ci_desc">
						<dl class="el_desc_dl res"> 
							<dt>EGIS의 의미</dt>
							<dd>EGIS는 그리스 신화에 등장하는 벼락을 맞아도 부서지지 않는다는 방패입니다. 제우스가 그의 딸 아테나에게 선물했으며, 방패 혹은 갑옷으 로 걸칠 수 있는 구조로 되어 있습니다.</dd>
						</dl>
						<dl class="el_desc_dl res"> 
							<dt>EGIS의 구단명화</dt>
							<dd>국내 최강의 명문구단으로 군림했던 전통과 명예를 바탕으로 항상 최강의 전력을 유지하겠다는 구단의 의지를 상징화한 명칭이며, 이지스의 방패로 타구단의 도전을 강력하게 방어한다는 의미를 가지고 있습니다.</dd>
						</dl>
						<dl class="el_desc_dl res"> 
							<dt>EGIS의 심볼</dt>
							<dd>새롭게 발표된 구단 심볼 마크는 speedy하고 powerful한 팀 이미지를 상징적으로 디자인했으며, e와 s를 좌우대칭 시킴으로써 전체적으로 조화와 안정감을 더했습니다. 특히 시원한 blue tone의 색상을 사용함으로써 새롭게 출발하는 구단의 신선함을 팬들에게 강조했습니다.</dd>
						</dl>
					</div>
				</div>
			</section>

			<!-- 마스코트 --> 
			<section class="section mt70-40">
				<div class="ly_inner md inner">
					<div class="page_header">
						<h4 class="el_heading lv1">마스코트</h4> 
					</div>

					<div class="bl_club_card club_mascot">
						<dl class="el_desc_dl row">
							<dt>마스코트의 상징성</dt>
							<dd>이지스 방패를 갑옷으로 걸친 고대의 신 이미지를 표현하였으며,<br class="p_hide">
								자신감 있는 포즈를 통해 팀의 강한 힘과 역동성이 나타나도록 하였습니다.</dd>
						</dl>

						<ul class="mascot_list">
							<li class="item item1">
								<div class="img">
									<img src="/resources/common/images/img/club_mascot_01_2.jpg" alt="">
								</div>
								<p class="name">MASCOT</p>
							</li>
							<li class="item item2">
								<div class="img">
									<img src="/resources/common/images/img/club_mascot_02_2.jpg" alt="">
								</div>
								<p class="name">MASCOT EMBLEM</p>
							</li>
						</ul>
					</div>
				</div>
			</section>
			<!-- //마스코트 --> 

			<!-- 유니폼 --> 
			<section class="section mt70-40">
				<div class="ly_inner md inner">
					<div class="page_header">
						<h4 class="el_heading lv1">유니폼</h4> 
					</div>

					<div class="bl_club_card club_uniform">
						<!-- col -->
						<div class="col">
							<h5 class="tit">HOME</h5>
							<div class="uniform_list">
								<li class="item">
									<div class="el_img wear">
										<img src="/resources/common/images/img/club_uniform_home.jpg" alt="">
									</div>
								</li>
								<li class="item">
									<div class="el_img player">
										<img src="/resources/common/images/img/club_uniform_home_2.png" alt="">
									</div>
									<!--<div class="el_img player">
										<img src="/resources/common/images/img/club_uniform_home_2.webp" alt="">
									</div>-->
								</li>
							</div>
						</div>
						<!-- //col -->
						<!-- col -->
						<div class="col">
							<h5 class="tit">AWAY</h5>
							<div class="uniform_list">
								<li class="item">
									<div class="el_img wear">
										<img src="/resources/common/images/img/club_uniform_away.jpg" alt="">
									</div>
								</li>
								<li class="item">
								    <div class="el_img player">
										<img src="/resources/common/images/img/club_uniform_away_2.png" alt="">
									</div>
									<!--<div class="el_img player">
										<img src="/resources/common/images/img/club_uniform_away_2.webp" alt="">
									</div>-->
								</li>
							</div>
						</div>
						<!-- //col -->
					</div>
				</div>
			</section>
			<!-- //유니폼 --> 

			<!-- 유니폼 --> 
			<section class="section mt70-40">
				<div class="ly_inner md inner">
					<div class="page_header">
						<h4 class="el_heading lv1">캐치프레이즈</h4> 
					</div>

					<div class="club_slogan">
						<div class="slider club_slogan_slider" data-view="[1,1]" data-space="[50,50]">
							<div class="swiper-wrapper">
							    <!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_2425.jpg" alt="2024-2025시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2024-2025시즌</dt>
										<dd>
											<strong>AGAIN KCC</strong><br><br>
											지난 시즌의 KCC EGIS는 최강이라는 타이틀로 <br>
											팬들과 함께 기적을 이뤄냈습니다.<br><br> 
											2024-2025시즌에도 안주하지 않고 <br>
											다시 한번 정상을 향해 도전하겠다는 의미를 담았습니다.</dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_2324.jpg" alt="2023-2024시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2023-2024시즌</dt>
										<dd>
											<strong>最强(최강) KCC EGIS</strong><br><br>
											국가대표급 라인업을 구축한 KCC를 가장 잘 표현할 수 있는 단어 <br>
										    ‘最强(최강)’<br><br> 
											올 시즌은 최강의 라인업으로 우승을 차지하겠다는 <br>
											선수단의 패기와 구단의 의지를 강렬한 한 단어에 담았습니다.</dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_2223.jpg" alt="2022-2023시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2022-2023시즌</dt>
										<dd>
											<strong>압도하라 KCC EGIS!</strong><br><br>
											2022-2023 시즌 전주 KCC EGIS 프로농구단은<br>
											전 구단을 압도하는 강력한 구단으로 탈바꿈했습니다.<br><br>
											올 시즌 다시 정상을 차지할 KCC의 도전을 기대해 주십시오!</dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_2122.jpg" alt="2021-2022시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2021-2022시즌</dt>
										<dd>
											<strong>'WE ARE GREAT!'</strong><br><br>
											2021-2022 시즌 전주 KCC EGIS 프로농구단은 <br>
											그 어떤 시즌보다 모든 면에서 ‘GREAT!’<br><br>
											정규리그를 넘어 챔피언 결정전 우승까지 <br>
											거머쥘 명문 구단<br><br>
											KCC EGIS를 지켜봐주십시오!</dd>
									</dl>
								</div>
								<!-- //slide -->

								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_2021.jpg" alt="2020-2021시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2020-2021시즌</dt>
										<dd>
											<strong>'WE ARE STRONG'</strong><br><br>											
											2020-2021시즌 전주 KCC EGIS 프로농구단은 <br>조직력, 스피드, 파워, 모든 면에서 'STRONG'!<br><br>
											그 어떤 시즌보다 강력해진 최강의 구단을 지켜봐 주십시오!</dd>
									</dl>
								</div>
								<!-- //slide -->

								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_1920.jpg" alt="2019-2020시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2019-2020시즌</dt>
										<dd>
											<strong>'WE ARE THE ONE!'</strong><br><br>
											2019-2020시즌 전주 KCC EGIS프로농구단은<br>
											어떠한 변화, 위기에도 흔들리지 않고 오로지 ONE!<br><br>
											선수단과 팬들 모두 한 마음 한 뜻으로 뭉쳐 <br>
											최고의 구단으로 거듭날 것입니다!</dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_1819.jpg" alt="2018-2019시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2018-2019시즌</dt>
										<dd>
											<strong>'열정으로 정상까지'</strong><br><br>
											전주 KCC EGIS 프로농구단이 <br> 
											모든 구성원의 열정을 하나로 모아 <br> 
											가장 높은 곳 정상을 향해 팬 여러분과 함께 전진합니다!</dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_1718.jpg" alt="2017-2018시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2017-2018시즌</dt>
										<dd>
											<strong>KCC EGIS라는 이름으로 하나가 됩니다!<br> 'TOGETHER KCC'</strong><br><br> 
											KCC EGIS라는 이름으로 하나가 됩니다!<br> <br> 
											구단과 팬 모두가 함께 하나의 꿈에 도전합니다!<br><br>  
											2017-2018 시즌 TOGETHER KCC!<br> <br> 
											EGIS가 하나의 꿈을 위해 함께 도전합니다!</dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_1617.jpg" alt="2016-2017시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2016-2017시즌</dt>
										<dd>
											<strong>우리함께 KCC! ‘WITHUS KCC’</strong><br><br> 
											WITH US KCC! 우리함께 KCC!<br><br>
											팬들 곁에는 언제나 우리가!<br>
											우리 곁에는 언제나 팬들이!<br><br>
											새로운 역사를 만드는 찬란한 여정에 <br>
											영원히 '우리 함께' 할 것입니다.</dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_1516.jpg" alt="2015-2016시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2015-2016시즌</dt>
										<dd>
											<strong>기분 좋은 외침, 'BRAVO!!'가 코트를 가득 채웁니다.<br>‘BRAVO KCC!’</strong><br><br> 
											Best(최고), Ready(준비), Absolute(완벽한),<br> Victory of Ours(승리는 우리 것)!<br><br> 
											최고의 농구명가 KCC가 새 역사를 위한 준비를 완벽히 마쳤습니다.<br> 
											이제 승리는 우리의 것으로 만들겠습니다.<br> <br>
											V6 신화를 향한 도전! 기분좋은 외침,'브라보'가 코트를 가득 채웁니다.</dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_1415.jpg" alt="2014-2015시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2014-2015시즌</dt>
										<dd>
											<strong>최다우승의 역사 레전들의 우승을 향한 열정!!!!<br>‘BLUE LEGEND KCC 이지스!’</strong><br><br> 
											KCC 푸른전사들이 승리를 부른다.<br><br>
											리그를 평정할 블루 레전드들이 하나되어 돌아왔다.</dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_1314.jpg" alt="2013-2014시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2013-2014시즌</dt>
										<dd>
											<strong>블록버스터급 승리!<br>‘BLUEBUSTER KCC 이지스!’</strong><br><br> 
											‘블록버스터’는 원래 제2차 세계대전 중에 쓰인 폭탄의 이름이었다. <br>영국 공군이 사용한 5톤짜리 폭탄으로,
											한 구역을 송두리째 날려버릴 위력을 지녔다고 해서 블록버스터(Blockbuster) 라고 하였다. <br>
											현재는 미국 헐리우드에서 엄청난 대작으로 성공한 영화를 의미한다.<br>
											Bluebuster KCC 이지스!<br>
											2013-2014 시즌 KCC 이지스가 블록버스터같은 강력한 위력으로 <br>
											KCC 이지스의 승리의 함성으로 가득한<br>
											‘블록버스터 급 시즌으로 만들겠다’라는 강한 의지가 담겨있다.</dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_1213.jpg" alt="2012-2013시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2012-2013시즌</dt>
										<dd>
											<strong>경기,그 이상의 감동<br>‘스탠드 업! KCC, 드림 업! EGIS’</strong><br><br> 
											농구를 사랑하는 팬들의 마음 속에 경기,그 이상의 깊은 감동을 <br>드리기 위해 
											KCC 이지스의 Fair Play 정신과 Real Play 정신으로 "Stand up!"
											어떠한 역경에도 쓰러지지 않고 다시 일어나 뛰겠다는 불굴의 의지와 "Dream up!"  
											멈추지 않고 항상 새로운 곳을 향해 나아가는 끝없는 도전 정신으로
											올 시즌 팬들에게 리얼스포츠를 보여드리겠다는 굳은 의지를 상징합니다.<br>
											Stand up! KCC, Dream up! EGIS.<br> 
											올 시즌 KCC 이지스가 얼어있던 <br>
											여러분의 심장을 다시 한 번 뛰게 할 것입니다.</dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_1112.jpg" alt="2011-2012시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2011-2012시즌</dt>
										<dd>
											<strong>KCC EGIS의 새로운 도전!<br>'NEW CHALLENGE KCC!'</strong><br><br> 
											그 누구도 따라올 수 없는 5회 우승의 위대한 역사!<br><br>
											2011-2012시즌에는 그 위대한 역사를 뛰어넘어<br> 
											정규리그와 플레이오프 V6의 <br>
											통합우승이라는 새로운 도전을 향해 나아갈 것입니다. <br><br>
											그 결과는 한국 농구 역사에 길이길이 남을 <br>
											새로운 역사가 될 것입니다.</dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_1011.jpg" alt="2010-2011시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2010-2011시즌</dt>
										<dd>
											<strong>KCC 이지스, 2010~2011시즌, 또 한번의 돌풍을 일으킨다.<br>'BLUE SYNDROM'</strong><br><br> 
											자유와 희망을 상징하는 KCC 이지스 고유의 컬러 ‘BLUE’와 ‘Syndrom’이 만났습니다.<br>
											역동적인 스포츠인 ‘농구’의 속도감을 독일어에서 느껴지는 <br>
											강인함으로 표현하기 위하여 독일어를 차용한 ‘Syndrom’은 <br>
											그리스어 (Syn+Drom)에서 유래된 말로 ‘모두 함께 달린다’는 <br>
											의미를 내포합니다. <br>
											BLUE Syndrom은 2010~2011 시즌, 선수들, 코칭스텝, 그리고 팬들이 함께 KCC 이지스가 일으킬 또 한번의 승리의 돌풍을 의미하며,<br>
											이지스의 경기에서 느낄 수 있는 스피드와 박진감을 청아하게 빛나는 BLUE에 담아 또 한번의 전설로 만들어갑니다.</dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_0910.jpg" alt="2009-2010시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2009-2010시즌</dt>
										<dd>
											<strong>2009~2010 시즌 KCC 이지스의 승리를 위한 뜨거운 응원<br>‘Hi-Five KCC V5 이지스’</strong><br><br> 
											HI FIVE KCC V5 EGIS는 하늘에서 맞닿은 손과 손이 만들어내는 <br>
											힘찬 Hi-Five, 승리의 기쁨과 강한 열망을 나타냅니다. <br> 
											멋진 플레이 후 이어지는 HI FIVE는, KCC 이지스 팬들의 가슴을 <br> 벅차게 하는 소중한 선물이기도 합니다.<br> <br>
											또한 Hi-Five KCC는 농구코트 위에서 다섯 명의 선수들이(Five) 우승을 향해 높이 (High) 도약함을 중의적으로 표현하였습니다. <br>
											다섯 번째 우승을 향한 도약, 이제 KCC 이지스와 함께 합니다. </dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_0809.jpg" alt="2008-2009시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2008-2009시즌</dt>
										<dd>
											<strong>2008~2009 시즌 무한 에너지를 폭발시키다,<br>‘EXCITING ENERGY’</strong><br><br> 
											무적함대 KCC이지스의 폭발적인 에너지, 프로농구가 가지는 <br>
											아찔한 스피드, 열정을 담아 ‘림’을 향해 도약하는 선수들의 모습, <br>
											박진감 넘치는 플레이를 통해 KCC이지스만이 발산할 수 있는 <br>
											뜨거운 열기를 함께 합니다.<br> <br> 
											선수단과 팬들이 만들어가는 EXCITING ENERGY로, <br>
											KCC 이지스를 향해 열렬한 응원의 함성과 박수를 보내주세요.<br> 
											KCC이지스가 팬 여러분들과 함께 또 한번의 도약을 꿈꿉니다.  </dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_0708.jpg" alt="2007-2008시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2007-2008시즌</dt>
										<dd>
											<strong>점프! 승리가 있는 그곳! KCC가 점프합니다!<br> 'FLY HIGH KCC'</strong><br><br> 
											푸른 하늘! 푸른 기상!<br>
											푸른 KCC! KCC가 팬과 함께 하나가 되는 그곳. <br>
											우승을 향한 열정을 안고 승리를 위해 점프합니다!<br>
											더 빨리! 더 힘차게! 그리고 더 높이!<br>
											KCC를 향한 팬들의 크나큰 사랑과 끝없는 성원이 <br>
											KCC를 더욱 높게 뛰게 합니다.<br>
											정상을 향해 힘차게 도전하는 KCC! FLY HIGH! 팬들이 만들어준 날개를 달고 승리를 향해 끝없이 점프하는 KCC를 응원해 주십시오! </dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_0607.jpg" alt="2006-2007시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2006-2007시즌</dt>
										<dd>
											<strong>KCC가 사는 세상에는 오직 '농구'와 '승리'만이 존재합니다.<br>‘WELCOME TO KCC WORLD’</strong><br><br> 
											선수단의 승리를 향한 의지와 열정은 세월이 흐를수록 커져 <br>
											‘농구월드’를 KCC의 푸른 기상으로 가득 채웠습니다. <br>
											KCC를 향한 팬들의 뜨거운 함성. <br>
											그 속에서 KCC의 우승을 향한 불꽃 같은 집념이 피어 오릅니다.<br> 
											KCC를 향한 팬들의 우렁찬 응원. <br>
											그 속에서 KCC의 우승을 위한 땀방울이 비처럼 내리고 있습니다.<br> 
											Welcome to KCCWORLD! KCC가 만들어 가는 기적 같은 <br>
											승리의 현장에 오신 것을 환영합니다!<br> 
											어서오십시오! KCC의 농구월드에서 승리를 만끽하시기 바랍니다.</dd>
									</dl>
								</div>
								<!-- //slide -->
								<!-- slide -->
								<div class="swiper-slide item">
									<div class="el_img el_thumb rds2">
										<img src="/resources/common/images/img/club_slogan_0506.jpg" alt="2005-2006시즌 슬로건">
									</div> 
									<dl class="info el_desc_dl res"> 
										<dt>2005-2006시즌</dt>
										<dd>
											<strong>선수단과 구단, 팬이 모두가 하나가 되어 정상을 향해 도전하는 KCC<br>‘I LOVE KCC’</strong><br><br> 
											농구를 향한 사랑. 그 하나만으로 우리는<br>
											KCC라는 이름아래 하나일 수 있습니다!<br> 
											우승을 향한 KCC의 끝없는 집념과 KCC를 사랑하고 응원해주는 <br>
											팬들의 사랑은 끝이 없습니다. <br> 
											KCC 선수들의 혼신을 다하는 플레이에 팬들의 사랑이 스며듭니다. <br> 
											여섯번째 플레이어인 팬들의 ‘무한사랑’이 <br>
											KCC를 코트 위에서 춤추게 합니다.<br> 
											언제나 변함없는 모습으로 <br>
											KCC는 팬들의 성원에 최선을 다해 보답할 것입니다. </dd>
									</dl>
								</div>
								<!-- //slide -->
							</div>
							<div class="swiper-button-next type1"></div>
							<div class="swiper-button-prev type1"></div>
						</div>
					</div>
				</div>
			</section>
			<!-- //유니폼 --> 


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