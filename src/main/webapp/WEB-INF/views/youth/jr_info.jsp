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
	<meta property="og:title" content="JR.KCC소개 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>JR.KCC소개 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/youth.css"> <!-- 디렉토리  youth only -->
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
		<main id="container" class="ly_container youth">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>YOUTH</li>
						<li>JR.KCC 소개</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">YOUTH</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="jrInfo" class="swiper-slide snb_link current"><span>JR.KCC 소개</span></a>  <!-- 해당페이지에 current 추가 -->
								<a href="jrTeacher" class="swiper-slide snb_link"><span>강사진 소개</span></a> 
							</div> 
						</div>
					</div>
				</div>
			</div>

			<!-- KCC이지스 주니어 농구단 -->
			<section class="section jr_info_top">
				<div class="ly_inner md">
					<div class="el_img el_thumb rds2">
						<img src="/resources/common/images/img/jr_info_top.jpg" alt="">
					</div>
					<div class="txt_area">
						<h4 class="heading">
							<span class="logo"><img src="/resources/common/images/common/logo.svg" alt=""></span>
							<span class="txt">KCC이지스 주니어 농구단</span>
						</h4> 

						<div class="info_list">
							<dl class="info">
								<dt>운영시간</dt>
								<dd>평일(14시~22시) / 주말 (09시~22시)</dd>
							</dl>
							<dl class="info">
								<dt>모집대상</dt>
								<dd>유아, 초등, 중등, 고등학생</dd>
							</dl> 
							<dl class="info">
								<dt>상담문의</dt>
								<dd>1660-3141</dd>
							</dl>
						</div>
					</div>
				</div>
			</section>
			<!-- //KCC이지스 주니어 농구단 -->

			<!-- 유소년 농구 전문 프로그램 -->
			<section class="section jr_program mt100">
				<div class="ly_inner md">
					<h4 class="heading">KCC이지스의 체계적인 유소년<br class="p_show"> 농구 전문 프로그램</h4>
					<div class="slider jr_program_list" data-view="[3,3]" data-space="[25,25]">
						<div class="swiper-wrapper">
							<div class="swiper-slide item">
								<div class="el_img el_thumb rds">
									<img src="/resources/common/images/img/jr_program_01.jpg" alt="">
								</div>
								<p>“재미있는 농구를 잘할 수 있도록”<br>
									목표를 설정하고</p>
							</div>
							<div class="swiper-slide item">
								<div class="el_img el_thumb rds">
									<img src="/resources/common/images/img/jr_program_02.jpg" alt="">
								</div>
								<p>차별화된 커리큘럼으로<br>
									아이들의 건강한 성장을 유도하며</p>
							</div>
							<div class="swiper-slide item">
								<div class="el_img el_thumb rds">
									<img src="/resources/common/images/img/jr_program_03.jpg" alt="">
								</div>
								<p>재미있는 프로그램으로<br>
									즐거운 추억을 선사합니다.</p>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- //유소년 농구 전문 프로그램 -->

			<!-- 프로그램 -->
			<section class="section mt100">
				<div class="ly_inner md">
					<div class="page_header">
						<h4 class="el_heading lv1">프로그램</h4> 
					</div>

					<div class="tbl type5 no_head tblSwipe jr_program_tbl">
						<div class="fixed">
							<table>
								<caption>프로그램 안내 고정영역</caption>
								<colgroup>
									<col class="col1">
								</colgroup>
								<tbody>
									<tr>
										<td scope="row" class="dth1" id="pro1" style="height: calc(40px * 2)">시간</td>
									</tr>
									<tr>
										<td scope="row" class="dth1" id="pro2" style="height: calc(40px * 6)">모집대상</td>
									</tr>
									<tr>
										<td scope="row" class="dth1" id="pro3" style="height: calc(40px * 3)">프로그램</td>
									</tr>
									<tr>
										<td scope="row" class="dth1" id="pro4">상담문의</td>
									</tr>
									<tr>
										<td scope="row" class="dth1" id="pro5">주소</td>
									</tr>
								</tbody>
							</table>
						</div> 
						<div class="swipearea">
							<div class="inner">
								<table style="--mmin: 423px;">
									<caption>프로그램 안내 스크롤영역</caption>
									<colgroup>
										<col style="width: 25.8%;">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<td headers="pro1">평일</td>
											<td class="txt_lt">14시~22시</td>
										</tr>
										<tr>
											<td headers="pro1">주말</td>
											<td class="txt_lt">09~22시</td>
										</tr>
										<tr>
											<td headers="pro2">유아</td>
											<td class="txt_lt">6~7세</td>
										</tr>
										<tr>
											<td headers="pro2" rowspan="3">초등</td>
											<td class="txt_lt bd_lt">1~3학년</td>
										</tr>
										<tr>
											<td class="txt_lt bd_lt">4~5학년</td>
										</tr>
										<tr>
											<td class="txt_lt bd_lt">5~6학년</td>
										</tr>
										<tr>
											<td headers="pro2">중등</td>
											<td class="txt_lt">1~3학년</td>
										</tr>
										<tr>
											<td headers="pro2">고등</td>
											<td class="txt_lt">1~3학년</td>
										</tr>
										<tr>
											<td headers="pro3">R클래스</td>
											<td class="txt_lt">농구를 처음 접하고 재미와 흥미를 갖기위한 프로그램</td>
										</tr>
										<tr>
											<td headers="pro3">I클래스</td>
											<td class="txt_lt">농구는 팀 스포츠임을 배우는 중급 프로그램</td>
										</tr>
										<tr>
											<td headers="pro3">A클래스</td>
											<td class="txt_lt">대표팀으로 전국 대회를 참가하며 입상을 목표로 하는 <span class="txt_wrap">프로그램</span></td>
										</tr>
										<tr>
											<td headers="pro4" colspan="2">1660-3141</td>
										</tr>
										<tr>
											<td headers="pro5" colspan="2">부산 사직실내체육관내 보조체육관 B</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- //프로그램 -->

			<!-- 전국 지점 안내 -->
			<section class="section mt70-40">
				<div class="ly_inner md">
					<div class="page_header">
						<h4 class="el_heading lv1">전국 지점 안내</h4> 
					</div>

					<div class="tbl type5 tblSwipe jr_program_tbl">
						<div class="fixed">
							<table summary="지점명 정보 제공">
								<caption>전국 지점 안내 고정영역</caption>
								<colgroup>
									<col class="col1">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">지점명</th>
									</tr> 
								</thead>
								<tbody>
									<tr>
										<td scope="row" class="dth1" id="loc1">부산직영점</td>
									</tr>
									<tr>
										<td scope="row" class="dth1" id="loc2">전주지점</td>
									</tr>
									<tr>
										<td scope="row" class="dth1" id="loc3">부산 지점</td>
									</tr>
									<tr>
										<td scope="row" class="dth1" id="loc4">하남 지점</td>
									</tr>
									<tr>
										<td scope="row" class="dth1" id="loc5">남양주 지점</td>
									</tr>
									<tr>
										<td scope="row" class="dth1" id="loc6">청주 지점</td>
									</tr>
									<tr>
										<td scope="row" class="dth1" id="loc7">구리 지점</td>
									</tr>
									<tr>
										<td scope="row" class="dth1" id="loc8">김해 지점</td>
									</tr>
									<tr>
										<td scope="row" class="dth1" id="loc9">부천 지점</td>
									</tr>
									<tr>
										<td scope="row" class="dth1" id="loc10">인천 지점</td>
									</tr>
									<tr>
										<td scope="row" class="dth1" id="loc11">군산 지점</td>
									</tr>
								</tbody>
							</table>
						</div> 
						<div class="swipearea">
							<div class="inner">
								<table style="--mmin: 500px;">
									<caption>전국 지점 안내 스크롤영역</caption>
									<colgroup>
										<col width="44%">
										<col>
										<col width="19.33%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">주소</th>
											<th scope="col">연락처</th>
											<th scope="col">담당자</th>
										</tr> 
									</thead>
									<tbody>
										<tr>
											<td headers="loc1">사직 실내체육관 보조 체육관</td>
											<td>1660-3141</td>
											<td>백승혁</td>
										</tr>
										<tr>
											<td headers="loc2">전주시 덕진구 기린대로 868-72</td>
											<td>010-9256-1473</td>
											<td>정의한</td>
										</tr>
										<tr>
											<td headers="loc3">부산시 연제구 쌍미천로160 3,4층</td>
											<td>010-3835-6639, 051-868-0730</td>
											<td>김동현</td>
										</tr>
										<tr>
											<td headers="loc4">경기도 하남시 미사동로40번길61</td>
											<td>1670-2802</td>
											<td>김휘민</td>
										</tr>
										<tr>
											<td headers="loc5">남양주시 오남읍 양지로 319번길27-1</td>
											<td>010-4066-3444</td>
											<td>오재모</td>
										</tr>
										<tr>
											<td headers="loc6">청주시 청원구오동로39</td>
											<td>010-7418-6556</td>
											<td>김동우</td>
										</tr>
										<tr>
											<td headers="loc7">경기도 구리시 동구릉로247-11</td>
											<td>010-5315-5365</td>
											<td>이성환</td>
										</tr>
										<tr>
											<td headers="loc8">김해시 한림면 김해대로 1559번길8</td>
											<td>055-336-7474</td>
											<td>배인호</td>
										</tr>
										<tr>
											<td headers="loc9">부천시 오정로 211번길77 2층</td>
											<td>032-672-7953</td>
											<td>조의진</td>
										</tr>
										<tr>
											<td headers="loc10">인천시 남동구 고잔로58-14</td>
											<td>010-5338-8998</td>
											<td>배종원</td>
										</tr>
										<tr>
											<td headers="loc11">전북 군산시 삼수길70</td>
											<td>010-9594-6209</td>
											<td>이영구</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- //프로그램 -->

			<!-- Q&A -->
			<section class="section mt100">
				<div class="ly_inner md">
					<div class="page_header">
						<h4 class="el_heading lv1">KCC이지스 주니어 Q&A</h4> 
					</div>

					<div class="ticket_faq type2">
						<!-- item -->
						<dl class="accordion_item">
							<dt class="header on">
								<span class="txt">셔틀 운행은 되나요?</span>
							</dt>
						
							<dd class="content open">
								<div class="inner">
									<p>네. 아이들의 안전한 셔틀 및 차량 탑승 시간 조절을 위하여 팀 수업(8명 이상)시 우선 배정되며, 이외 지역별 수업 시 인원 모집 때 까지 대기하여 주셔야 합니다.</p>
								</div>
							</dd>
						</dl>
						<!-- //item --> 
						<!-- item -->
						<dl class="accordion_item">
							<dt class="header on">
								<span class="txt">클래스 구성은 어떻게 하나요?</span>
							</dt>
						
							<dd class="content open">
								<div class="inner">
									<p>비슷한 연령대 / 비슷한 사는 곳 / 비슷한 수준, 이 3가지로 나누어 구성합니다.<br>
										연령대는 최대 2살 차이까지 구성하며, 사는 곳은 셔틀 동선 및 추가 프로그램 시 원활한 운영을 위함입니다.</p>
								</div>
							</dd>
						</dl>
						<!-- //item --> 
					</div> 
				</div>
			</section>
			<!-- //Q&A --> 


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