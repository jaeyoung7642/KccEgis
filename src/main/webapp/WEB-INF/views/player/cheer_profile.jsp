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
	<meta property="og:description" content="부산KCC이지스 공식 웹사이트">
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


			<!-- 치어리더 상세페이지 -->
			<section class="section">
				<div class="ly_inner md">
					<div class="cheer_detail">
						<div class="photo">
							<div class="el_img">
								<img src="" alt="" id="cheerImg">
							</div>
						</div>
						<!-- info -->
						<div class="cheer_info">
							<h4 class="el_role">치어리더</h4>
							<p class="el_name">
								<span class="kor" data-text="name"></span>
							</p>
							<div class="profile_box_list">
								<dl>
									<dt>생일</dt>
									<dd data-text="birthday"></dd>
								</dl>
								<dl>
									<dt>별명</dt>
									<dd data-text="nickname"></dd>
								</dl>
								<dl>
									<dt>취미</dt>
									<dd data-text="hobby"></dd>
								</dl>
								<dl>
									<dt>시즌 각오</dt>
									<dd data-text="comment"></dd>
								</dl>
								<dl>
									<dt>경력사항</dt>
									<dd>
										<ul class="el_desc_list" id="cheerCareer">
										</ul>
									</dd>
								</dl>
							</div>
						</div>
						<!-- //info -->
					</div>
				</div>
			</section>
			<!-- //치어리더 상세페이지 -->

			<script>
				async function applyData() {
					let dataId = getParams('cheer_num') ? getParams('cheer_num') : '1' ; 
					const dataArray = await fetchData('/resources/common/assets/data/cheerleader.json'); // 이 파일 수정
					const data = dataArray.find(el => el.id === dataId);

					const { name, img, career } = data;

					$('[data-text]').each((_, el) => {
						const val = $(el).data('text');
						$(el).html(data[val].replace(/\n/g, '<br>'));
					})

					$('#cheerImg').attr({
						'src': '/resources/common/images/img/cheer/'+img,
						'alt': name + '사진'
					});

					career.forEach(val => {
						$('#cheerCareer').append('<li>'+val+'</li>');
					})
        }

				$(function() {
					applyData();
				});

			</script>

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