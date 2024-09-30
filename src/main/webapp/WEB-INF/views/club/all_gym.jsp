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
	<meta property="og:description" content="부산KCC이지스 공식 웹사이트">
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efc7a1d4a70457b7315171ffe99e9599&libraries=services"></script>
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
								<a href="front" class="swiper-slide snb_link current"><span>구단소개</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="chistory" class="swiper-slide snb_link"><span>역사관</span></a>
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
						<a href="ci" class="swiper-slide snb_link"><span>구단 CI</span></a>
						<a href="busan_gym" class="swiper-slide snb_link current"><span>구장안내</span></a> <!-- 해당페이지에 current 추가 -->
					</div>
				</nav>
			</div>


			<!-- 전국구장안내 -->  
			<section class="section mt0 pt70">
				<div class="ly_inner md inner tabs">
					<!-- snb 4depth -->
					<div class="snb_4dth_area">
						<nav class="snb_4dth">
							<a href="busan_gym" class="snb_link">부산사직체육관</a> 
							<a href="yongin_gym" class="snb_link">용인연습체육관</a> 
							<a href="all_gym" class="snb_link current">전국구장안내</a> 
						</nav> 
					</div>

					<!-- 구단 선택 -->
					<div class="all_gym_control mt70-40">
						<div class="gym_select p_show" data-value="team1">
							<select class="frm_select" aria-label="구단 선택">
								<option value="team1" selected>서울 삼성썬더스</option>
								<option value="team2">서울 SK나이츠</option>
								<option value="team3">안양 정관장레드부스터스</option>
								<option value="team4">대구 한국가스공사페가수스</option>
								<option value="team5">원주 DB프로미</option>
								<option value="team6">창원 LG세이커스</option>
								<option value="team7">고양 소노스카이거너스</option>
								<option value="team8">울산 현대모비스피버스</option>
								<option value="team9">수원 KT소닉붐</option>
							</select>
						</div>

						<nav class="tab_list p_hide">
							<button type="button" class="tab_link gym_tab  active " role="tab" aria-controls="team1" id="tab1" aria-label="서울 삼성 썬더스">
								<img src="/resources/common/images/game/logo_35.svg" alt="">
							</button>
							<button type="button" class="tab_link gym_tab" role="tab" aria-controls="team2" id="tab2"  aria-label="서울 SK 나이츠">
								<img src="/resources/common/images/game/logo_55.svg" alt="">
							</button>
							<button type="button" class="tab_link gym_tab" role="tab" aria-controls="team3" id="tab3"  aria-label="안양 정관장 레드부스터스">
								<img src="/resources/common/images/game/logo_70.svg" alt="">
							</button>
							<button type="button" class="tab_link gym_tab" role="tab" aria-controls="team4" id="tab4"  aria-label="대구 한국가스공사 페가수스">
								<img src="/resources/common/images/game/logo_64.svg" alt="">
							</button>
							<button type="button" class="tab_link gym_tab" role="tab" aria-controls="team5" id="tab5"  aria-label="원주 DB 프로미">
								<img src="/resources/common/images/game/logo_16.svg" alt=""> 
							</button>
							<button type="button" class="tab_link gym_tab" role="tab" aria-controls="team6" id="tab6"  aria-label="창원 LG 세이커스">
								<img src="/resources/common/images/game/logo_50.svg" alt="">
							</button>
							<button type="button" class="tab_link gym_tab" role="tab" aria-controls="team7" id="tab7"  aria-label="고양 소노 스카이거너스">
								<img src="/resources/common/images/game/logo_66.svg" alt="">
							</button>
							<button type="button" class="tab_link gym_tab" role="tab" aria-controls="team8" id="tab8"  aria-label="울산 현대모비스 피버스">
								<img src="/resources/common/images/game/logo_10.svg" alt="">
							</button>
							<button type="button" class="tab_link gym_tab" role="tab" aria-controls="team9" id="tab9"  aria-label="수원 KT 소닉붐">
								<img src="/resources/common/images/game/logo_06.svg" alt="">
							</button>
						</nav>
					</div>
					<!-- //구단 선택 -->

					<div class="tab_panels mt70-20">
						<!-- 서울 삼성 썬더스 -->
						<article id="team1" class="tab_panel" role="tabpanel">
							<div class="page_header">
								<h4 class="el_heading lv1"><span class="w_md">서울 삼성썬더스</span> 잠실실내체육관</h4> 
							</div>

							<div class="el_map">
								<div class="map" data-lenis-prevent-wheel></div>
							</div>

							<div class="map_address type2">
								<dl>
									<dt>주소</dt>
									<dd>서울특별시 송파구 올림픽로 25(잠실동 10)</dd>
								</dl>
								<dl>
									<dt>연락처</dt>
									<dd>02)2240-8733,8876</dd>
								</dl>
							</div>

							<div class="traffic_info type2 mt70-40">
								<table>
									<caption>지하철 이용 시 안내</caption>
									<colgroup>
										<col class="col1">
										<col class="col2">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">자가용</th>
											<td>
												<ul class="el_desc_list">
													<li>영동대교 → 영동IC → 삼성역 직진 → 삼성역 사거리 좌회전 → 삼성교 →종합운동장 남문</li>
													<li>올림픽도로 → 청담1교 → 종합운동장 방향으로 우회전 → 종합운동장 동문</li>
													<li>잠실대교 → 잠실IC → 잠실역 직진 → 잠실역사거리 우회전 → 신천역 → 종합운동장사거리 → 종합운동장 남문</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">지하철</th>
											<td>
												<ul class="el_desc_list">
													<li>2호선 : 종합운동장역 6, 7번 출구에서 도보로 500m / 8번 출구에서 도보로 800m</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">버스</th>
											<td>
												<ul class="el_desc_list">
													<li>간선 : 301, 333, 341, 350, 351, 360, 362, N13</li>
													<li>지선 : 2415, 3217, 3314, 3322, 3411, 3412, 3414, 3417, 3422, 4318, 4319</li>
													<li>직행 : 1100, 1700, 2000, 2000-1, 6900, 7007, 9303</li>
													<li>일반 : 11-3, 917</li>
													<li>급행 : 8001</li>
													<li>공항 : 6006, 6001-1</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

						</article>
						<!-- //서울 삼성 썬더스 -->

						<!-- 서울 SK 나이츠 -->
						<article id="team2" class="tab_panel" role="tabpanel">
							<div class="page_header">
								<h4 class="el_heading lv1"><span class="w_md">서울 SK나이츠</span> 잠실학생체육관</h4> 
							</div>

							<div class="el_map">
								<div class="map" data-lenis-prevent-wheel></div>
							</div>

							<div class="map_address type2">
								<dl>
									<dt>주소</dt>
									<dd>서울특별시 송파구 올림픽로 25</dd>
								</dl>
								<dl>
									<dt>연락처</dt>
									<dd>02)422-2285, 02)423-9181</dd>
								</dl>
							</div>

							<div class="traffic_info type2 mt70-40">
								<table>
									<caption>지하철 이용 시 안내</caption>
									<colgroup>
										<col class="col1">
										<col class="col2">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">자가용</th>
											<td>
												<ul class="el_desc_list">
													<li>영동대교 영동IC → 삼성역 직진 → 삼성역 사거리 좌회전 → 삼성교 → 종합운동장 남문</li>
													<li>올림픽대교 청담 1교 → 종합운동장 방향으로 우회전 → 종합운동장 동문</li>
													<li>잠실대교 잠실 IC → 잠실역 직진 → 잠실역사거리 우회전 → 신천역 → 종합운동장 사거리 → 종합운동장 남문</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">지하철</th>
											<td>
												<ul class="el_desc_list">
													<li>2호선 : 종합운동장역 하차 8번 출구</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">버스</th>
											<td>
												<ul class="el_desc_list">
													<li>지선 : 2225, 3217, 3218, 3314, 3411, 3412, 3414, 3415, 3417, 3422</li>
													<li>간선 : 301, 341, 360, 362, 363, 730</li>
													<li>순환 : 410</li>
													<li>공항 : 6000</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						
						</article>
						<!-- //서울 SK 나이츠 -->

						<!-- 안양 정관장 레드부스터스 -->
						<article id="team3" class="tab_panel" role="tabpanel">
							<div class="page_header">
								<h4 class="el_heading lv1"><span class="w_md">안양 정관장레드부스터스</span> 안양 정관장 아레나</h4> 
							</div>
							
							<div class="el_map">
								<div class="map" data-lenis-prevent-wheel></div>
							</div>

							<div class="map_address type2">
								<dl>
									<dt>주소</dt>
									<dd>경기 안양시 동안구 평촌대로 389</dd>
								</dl>
								<dl>
									<dt>연락처</dt>
									<dd>031)478-6600</dd>
								</dl>
							</div>

							<div class="traffic_info type2 mt70-40">
								<table>
									<caption>지하철 이용 시 안내</caption>
									<colgroup>
										<col class="col1">
										<col class="col2">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">자가용</th>
											<td>
												<ul class="el_desc_list">
													<li>경부고속도로 → 외곽순환고속도로(일산방향) → 평촌IC → 인덕원역 좌회전 → 안양 정관장 아레나</li>
													<li>경부고속도로 → 영동고속도로(인천방향) → 북수원IC → 1번 국도 → 비산사거리 우회전 → 안양 정관장 아레나 </li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">지하철</th>
											<td>
												<ul class="el_desc_list">
													<li>범계역 : 3번 출구에서 60, 마을버스 5, 5-5 </li>
													<li>인덕원역 : 3번 출구에서 8, 8-1, 9, 703(종합운동장 입구),103, 103-1(종합운동장 입구)</li>
													<li>사당역 : 4번 또는 5번 출구에서 비산동 방면 11-1, 11-2, 908 </li>
													<li>양재역 : 7번 출구 스포타임 앞 정류장에서 11-3, 1917</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">버스</th>
											<td>
												<ul class="el_desc_list">
													<li>서울방면 : 11, 11-1, 11-2, 550, 9, 9-3, 917, 908, 913</li>
													<li>평촌방면 : 51, 60</li>
													<li>비산, 관양동 방면 : 8, 11-2, 8-1, 11-3</li>
													<li>산본동 방면 : 19-1, 60, 908, 51, 103, 103-1은 정문앞 하차</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</article>
						<!-- //안양 정관장 레드부스터스-->

						<!-- 대구 한국가스공사 페가수스 -->
						<article id="team4" class="tab_panel" role="tabpanel">
							<div class="page_header">
								<h4 class="el_heading lv1"><span class="w_md">대구 한국가스공사페가수스</span>  대구체육관</h4> 
							</div>
							
							<div class="el_map">
								<div class="map" data-lenis-prevent-wheel></div>
							</div>

							<div class="map_address type2">
								<dl>
									<dt>주소</dt>
									<dd>대구 북구 대구체육관로 39</dd>
								</dl>
								<!-- <dl>
									<dt>연락처</dt>
									<dd>031)389-5227</dd>
								</dl> -->
							</div>

							<div class="traffic_info type2 mt70-40">
								<table>
									<caption>지하철 이용 시 안내</caption>
									<colgroup>
										<col class="col1">
										<col class="col2">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">버스</th>
											<td>
												<ul class="el_desc_list">
													<li>실내체육관 앞 : 101-1, 303-1, 836</li>
													<li>실내체육관 건너 : 101, 303, 836</li>
													<li>산격청구맨션 앞 : 순환2-1, 300, 303, 323-1, 403, 623, 706, 719</li>
													<li>산격청구맨션 건너 : 순환2, 300, 303, 323-1, 403, 623, 706, 719</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</article>
						<!-- //대구 한국가스공사 페가수스 -->

						<!-- 원주 DB 프로미 -->
						<article id="team5" class="tab_panel" role="tabpanel">
							<div class="page_header">
								<h4 class="el_heading lv1"><span class="w_md">원주 DB프로미</span> 원주종합체육관</h4>
							</div>

							<div class="el_map">
								<div class="map" data-lenis-prevent-wheel></div>
							</div>

							<div class="map_address type2">
								<dl>
									<dt>주소</dt>
									<dd>강원특별자치도 원주시 서원대로 281 원주종합체육관</dd>
								</dl>
								<dl>
									<dt>연락처</dt>
									<dd>02)3011-3176, 033)764-3015</dd>
								</dl>
							</div>

							<div class="traffic_info type2 mt70-40">
								<table>
									<caption>지하철 이용 시 안내</caption>
									<colgroup>
										<col class="col1">
										<col class="col2">
									</colgroup>
									<tbody>
									    <tr>
											<th scope="row">자가용</th>
											<td>
												<ul class="el_desc_list">
													<li>서울 : 경부고속도로 → 신갈IC → 영동고속도로 → 남원주IC(만종IC) → 원주 중부고속도로 → 호법분기점 → 영동고속도로 → 남원주IC(만종IC) → 원주</li>
													<li>인천 : 제2경인고속도로 → 서창IC → 영동고속도로 → 남원주IC(만종IC) → 원주</li>
													<li>부산 : 경부고속도로 → 서대구(금호IC) → 중앙고속도로 → 남원주IC(만종IC) → 원주</li>
													<li>마산 : 구마고속도로 → 목포 → 88올림픽고속도로 → 서대구(금호IC) → 중앙고속도로 → 남원주(만종IC) → 원주</li>
													<li>광주 : 88올림픽고속도로 → 서대구(금호IC) → 중앙고속도로 → 남원주(만종IC) → 원주</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">버스</th>
											<td>
												<ul class="el_desc_list">
													<li>강원도 시내버스 : 2-1, 16, 18, 41-2, 59, 100</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</article>
						<!-- //원주 DB 프로미 -->

						<!-- 창원 LG 세이커스 -->
						<article id="team6" class="tab_panel" role="tabpanel">
							<div class="page_header">
								<h4 class="el_heading lv1"><span class="w_md">창원 LG세이커스</span> 창원체육관</h4> 
							</div>
							
							<div class="el_map">
								<div class="map" data-lenis-prevent-wheel></div>
							</div>

							<div class="map_address type2">
								<dl>
									<dt>주소</dt>
									<dd>경남 창원 성산구 원이대로 450(창원체육관)</dd>
								</dl>
								<dl>
									<dt>연락처</dt>
									<dd>055)713-3000~1</dd>
								</dl>
							</div>

							<div class="traffic_info type2 mt70-40">
								<table>
									<caption>지하철 이용 시 안내</caption>
									<colgroup>
										<col class="col1">
										<col class="col2">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">자가용</th>
											<td>
												<ul class="el_desc_list">
													<li>익산포항고속도로 → 통영대전중부고속도로(장수분기점) → 남해고속도로(진주분기점) → 남해제1고속도로지선(신안분기점) → 동마산IC → 소계광장 → 삼동교차로 좌회전 → 창원실내체육관</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">버스</th>
											<td>
												<ul class="el_desc_list">
													<li>좌석버스 : 703, 704, 710, 751</li>
													<li>일반버스 : 102, 103, 109, 111, 113, 116, 212, 213, 216, 151, 10, 11, 12, 13, 30, 31, 34, 35</li>													
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</article>
						<!-- //창원 LG 세이커스 -->

						<!-- 고양 소노 스카이거너스 -->
						<article id="team7" class="tab_panel" role="tabpanel">
							<div class="page_header">
								<h4 class="el_heading lv1"><span class="w_md">고양 소노스카이거너스</span> 고양 소노 아레나</h4>  
							</div>

							<div class="el_map">
								<div class="map" data-lenis-prevent-wheel></div>
							</div>

							<div class="map_address type2">
								<dl>
									<dt>주소</dt>
									<dd>경기도 고양시 일산서구 중앙로 1601(대화동) 고양 소노 아레나</dd>
								</dl>
								<dl>
									<dt>연락처</dt>
									<dd>031)913-0898</dd>
								</dl>
							</div>

							<div class="traffic_info type2 mt70-40">
								<table>
									<caption>지하철 이용 시 안내</caption>
									<colgroup>
										<col class="col1">
										<col class="col2">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">자가용</th>
											<td>
												<ul class="el_desc_list">
													<li>경부고속도로 → 외곽순환고속도로(일산방향) → 평촌IC → 인덕원역 좌회전 → 안양실내체육관</li>
													<li>경부고속도로 → 영동고속도로(인천방향) → 북수원IC → 1번 국도 → 비산사거리 우회전 → 안양실내체육관 </li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">지하철</th>
											<td>
												<ul class="el_desc_list">
													<li>3호선 : 대화역 2번 또는 3번 출구에서 도보 14분</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">버스</th>
											<td>
												<ul class="el_desc_list">
													<li>일반 : 10, 33-1, 56, 66, 67, 70, 70-1, 75, 80, 88A, 88B, 92, 92-1, 97, 150, 600, 900, 999, 2000, 760</li>
													<li>시외 : 200, 1000, 1001, 1500, 3300, 8109, 8407, 9700, 9701, 9707, 9714, M7106, M7731</li>
													<li>마을버스 : 039, 056, 057, 059, 062, 082A, 090, 091, N002, N007</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
					
						</article>
						<!-- //고양 소노 스카이거너스 -->

						<!-- 울산 현대모비스 피버스 -->
						<article id="team8" class="tab_panel" role="tabpanel">
							<div class="page_header">
								<h4 class="el_heading lv1"><span class="w_md">울산 현대모비스피버스</span> 울산동천체육관</h4> 
							</div>
							
							<div class="el_map">
								<div class="map" data-lenis-prevent-wheel></div>
							</div>

							<div class="map_address type2">
								<dl>
									<dt>주소</dt>
									<dd>울산광역시 중구 염포로 85 (남외동)</dd>
								</dl>
								<dl>
									<dt>연락처</dt>
									<dd>052)297-0171</dd>
								</dl>
							</div>

							<div class="traffic_info type2 mt70-40">
								<table>
									<caption>지하철 이용 시 안내</caption>
									<colgroup>
										<col class="col1">
										<col class="col2">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">자가용</th>
											<td>
												<ul class="el_desc_list">
													<li>익산포항고속도로 → 통영대전중부고속도로(장수분기점) → 남해고속도로(진주분기점) → 중앙고속도로(대전분기점) → 중앙고속도로지선(대동분기점) → 울산고속도로(언양분기점) → 신복로터리 좌회전 → 반구사거리 좌회전 → 울산동천체육관</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">버스</th>
											<td>
												<ul class="el_desc_list">
													<li>좌석버스 : 1124</li>
                                                    <li>일반버스 : 101, 103, 104, 106, 107, 113, 114, 116, 117, 127, 441</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">택시</th>
											<td>
												<ul class="el_desc_list">
													<li>고속(시외)버스 터미널, 울산역 : 택시 이용시 10여분 소요</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</article>
						<!-- //울산 현대모비스 피버스 -->

						<!-- 수원 KT 소닉붐 -->
						<article id="team9" class="tab_panel" role="tabpanel">
							<div class="page_header">
								<h4 class="el_heading lv1"><span class="w_md">수원 KT소닉붐</span> KT 소닉붐 아레나</h4>
							</div>

							<div class="el_map">
								<div class="map" data-lenis-prevent-wheel></div>
							</div>

							<div class="map_address type2">
								<dl>
									<dt>주소</dt>
									<dd>경기 수원시 권선구 서수원로 577번길 171</dd>
								</dl>
								<dl>
									<dt>연락처</dt>
									<dd>031)278-0010</dd>
								</dl>
							</div>

							<div class="traffic_info type2 mt70-40">
								<table>
									<caption>지하철 이용 시 안내</caption>
									<colgroup>
										<col class="col1">
										<col class="col2">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">자가용</th>
											<td>
												<ul class="el_desc_list">
													<li>북수원IC 이용 시 : 경수대로 → 서부로 → 서수원로577번길 호매실IC 이용 시 : 호매실로 → 칠보로 → 금곡로102번길 → 서수원로577번길</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">버스</th>
											<td>
												<ul class="el_desc_list">
													<li>수원역 하차 시 : 13-4, 9, 13 (가온마을4단지, 서수원칠보체육관 하차) </li>
													<li>화서역 하차 시 : 19 (가온마을4단지, 서수원칠보체육관 하차)</li>
													<li>성대역 하차 시 : 62-1, 99, 7800, 7790 (가온마을4단지, 서수원칠보체육관 하차)</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</article>
						<!-- //수원 KT 소닉붐 -->
					</div>
					
			</section>
			<!-- //전국구장안내 --> 

			<script>
				const $tabBtn = $('.gym_tab');
				const $gymSelector = $('.gym_select .frm_select');
				let gymVal = 'team1';

				const addrData = {
					team1: '서울 송파구 올림픽로 25',
					team2: '서울 송파구 잠실동 10-3',
					team3: '경기 안양시 동안구 비산동 1023',
					team4: '대구 북구 산격동 1427-1',
					team5: '강원특별자치도 원주시 서원대로 281',
					team6: '경남 창원시 성산구 중앙동 1',
					team7: '경기 고양시 일산서구 중앙로 1601',
					team8: '울산 중구 남외동 673',
					team9: '경기 수원시 권선구 서수원로577번길 171'
				};
				funMapView(gymVal);
				

				const breakpoint = (e) => {
					if (e.currentTarget.matches) { // pc
						tabChange();
					} else { // mobile

						if (gymVal !== $gymSelector.val()) {
							$gymSelector.val(gymVal);
							$gymSelector.niceSelect('update');
						}	

						selectControl();
					}
				};

				const match = window.matchMedia('(min-width: 1025px)');
		
				$(match).on('change', breakpoint).change();

				// 셀렉트로 탭 변경
				function selectControl() {
					$gymSelector.on('change', function() {
						let val = $(this).val();

						if (gymVal !== val) {
							gymVal = val;
							$('.gym_select').attr('data-value', val);

							setTimeout(() => {
								$(`[aria-controls="${val}"]`).trigger('click');
								funMapView(val);
							}, 100);
						}
					});
				}

				// 탭 값 바꾸기
				function tabChange () {
					$tabBtn.on('click', function() {
						let val = $(this).attr('aria-controls');

						if (gymVal !== val) {
							gymVal = val;
							$('.gym_select').attr('data-value', val);

							setTimeout(() => {
								funMapView(val);
							}, 100);
						}
					});
				}

				// 카카오맵
				function funMapView(val){
					const address = addrData[val];
					$('.map').empty();
					const mapContainer = $('#'+val+ ' .map'), // 지도를 표시할 div
					mapOption = {
						center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level: 3 // 지도의 확대 레벨
					};

					// 지도를 생성합니다
					const map = new daum.maps.Map(mapContainer[0], mapOption);

					// 주소-좌표 변환 객체를 생성합니다
					const geocoder = new daum.maps.services.Geocoder();

					// 주소로 좌표를 검색합니다
					geocoder.addressSearch(address, function(result, status) {
						// 정상적으로 검색이 완료됐으면
						if (status === daum.maps.services.Status.OK) {
							let coords = new daum.maps.LatLng(result[0].y, result[0].x);

							// 주소로 좌표를 정확히 불러오지 못해서 추가
							if (val === 'team3') {
								coords = new daum.maps.LatLng(37.40519, 126.9484);
							} else if (val === 'team7') {
								coords = new daum.maps.LatLng(37.67468, 126.7420);
							}

							// 결과값으로 받은 위치를 마커로 표시합니다
							const marker = new daum.maps.Marker({
								map: map,
								position: coords
							});

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							$(window).on('resize', () => { // 반응형처리
								map.setCenter(coords);
							}).trigger('resize');
							
						}
					});
				}
						
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