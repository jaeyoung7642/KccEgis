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
	<title>KCC EGIS</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />

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
</head>
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

			<!-- 부산사직체육관 --> 
			<section class="section busan_gym_top mt0 pt70">
				<div class="ly_inner md inner">
					<!-- snb 4depth -->
					<div class="snb_4dth_area">
						<nav class="snb_4dth">
							<a href="busan_gym" class="snb_link current">부산사직체육관</a> 
							<a href="yongin_gym" class="snb_link">용인연습체육관</a> 
							<a href="all_gym" class="snb_link">전국구장안내</a> 
						</nav>
					</div>

					<div class="row desc">
						<h4 class="tit">BUSAN SAJIK GYMNASIUM</h4>
						<p class="txt_md">부산광역시 동래구 사직로55-32에 위치한 부산 KCC 이지스의 홈구장은 약 14,000석 규모의 체육관으로<br class="p_hide">
						지역문화 발전에 이바지하고 최상의 경기 운영을 가능케 하는 명문 구단의 산실입니다.</p>
					</div>

					<div class="row info">
						<div class="info_list">
							<dl class="type1">
								<dt>총면적</dt>
								<dd>25,901㎡</dd>
							</dl>
							<dl class="type1">
								<dt>경기장 면적</dt>
								<dd>2,184㎡</dd>
							</dl>
							<dl class="type1">
								<dt>총면적</dt>
								<dd>14,000석</dd>
							</dl>
							<dl class="type2">
								<dt>LED</dt>
								<dd>전광판 2개</dd>
							</dl>
							<dl class="type2">
								<dt>TEL</dt>
								<dd>051-505-6008</dd>
							</dl>
							<dl class="type2">
								<dt>FAX</dt>
								<dd>051-505-6009</dd>
							</dl>
						</div>
					</div>

					<div class="row slide_clamp">
						<div class="slider type3 busan_gym_slider">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<figure class="el_thumb rds2 el_img">
										<img src="/resources/common/images/img/busan_gym_img_01.jpg" alt="부산사직체육관 사진1">
									</figure>
								</div>
								<div class="swiper-slide">
									<figure class="el_thumb rds2 el_img">
										<img src="/resources/common/images/img/busan_gym_img_02.jpg" alt="부산사직체육관 사진2">
									</figure>
								</div>
								<div class="swiper-slide">
									<figure class="el_thumb rds2 el_img">
										<img src="/resources/common/images/img/busan_gym_img_04.jpg" alt="부산사직체육관 사진3">
									</figure>
								</div>
								<div class="swiper-slide">
									<figure class="el_thumb rds2 el_img">
										<img src="/resources/common/images/img/busan_gym_img_03.jpg" alt="부산사직체육관 사진4">
									</figure>
								</div>
							</div>
							<div class="swiper-button-next type2 p_hide"></div>
							<div class="swiper-button-prev type2 p_hide "></div>
						</div>
					</div>
				</div>
			</section>
			<!-- //부산사직체육관 --> 

			<!-- 오시는 길 --> 
			<section class="section busan_gym_location mt100">
				<div class="ly_inner md">
					<!-- 찾아오시는 길 -->
					<article>
						<div class="page_header">
							<h4 class="el_heading lv1">찾아오시는 길</h4> 
						</div>

						<div class="el_map">
							<div class="map" id="map" data-lenis-prevent-wheel></div>
						</div>

						<div class="map_address type1">
							<p><span class="el_ico"><img src="/resources/common/images/common/ico_location.svg" alt=""></span>
							부산광역시 동래구 사직로 55-32 실내 체육관</p>
						</div>
					</article>
					<!-- //찾아오시는 길 -->
	
					<script>
						function funMapView(){
							const address = '부산 동래구 사직로 55-32';
	
							document.getElementById('map').innerHTML="";
							const mapContainer = document.getElementById('map'), // 지도를 표시할 div
							mapOption = {
								center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								level: 3 // 지도의 확대 레벨
							};
	
							// 지도를 생성합니다
							const map = new daum.maps.Map(mapContainer, mapOption);
	
							// 주소-좌표 변환 객체를 생성합니다
							const geocoder = new daum.maps.services.Geocoder();
	
							// 주소로 좌표를 검색합니다
							geocoder.addressSearch(address, function(result, status) {
								// 정상적으로 검색이 완료됐으면
								if (status === daum.maps.services.Status.OK) {
									const coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
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
	
						funMapView();
					</script>

					<!-- 교통편 -->
					<article class="mt70-40">
						<div class="page_header">
							<h4 class="el_heading lv1">교통편</h4>  
						</div>

						<div class="traffic_info type1">
							<div class="col">
								<div class="el_ico">
									<img src="/resources/common/images/img/club_trans_subway.svg" alt="">
								</div>
								<table>
									<caption>지하철 이용 시 안내</caption>
									<colgroup>
										<col class="col1">
										<col class="col2">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">1호선</th>
											<td>사직역1번 출구</td>
										</tr>
										<tr>
											<th scope="row">3호선</th>
											<td>종합운동장역 9번 출구 </td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col">
								<div class="el_ico">
									<img src="/resources/common/images/img/club_trans_bus.png" alt="">
								</div>
								<table>
									<caption>버스 이용 시 안내</caption>
									<colgroup>
										<col class="col1">
										<col class="col2">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">버스</th>
											<td>10-1, 12, 19, 44, 50, 57, 80-1, 111-2, 131, 189-1, 1002</td>
										</tr>
										<tr>
											<th scope="row">마을버스</th>
											<td>동래구10번, 부산진17번</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</article>
					<!-- //교통편 -->


					<!-- 출발지역에 따른 안내 -->
					<article class="mt70-40">
						<div class="page_header">
							<h4 class="el_heading lv1">출발지역에 따른 안내</h4> 
						</div>
						<div class="tbl type5 tblSwipe g_content traffic_tbl1">
							<div class="fixed">
								<table summary="지역, 교통수단 정보 제공">
									<caption>출발지역에 따른 안내 고정영역</caption>
									<colgroup>
										<col class="area">
										<col class="traf">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">지역</th>
											<th scope="col">교통수단</th>
										</tr> 
									</thead>
									<tbody>
										<tr>
											<td class="dth1" rowspan="4" id="area1">서울</td>
											<td class="dth1" id="area1-1" style="height: calc(40px * 4);">고속버스</td>
										</tr>
										<tr>
											<td class="dth1" id="area1-2">KTX</td>
										</tr>
										<tr>
											<td class="dth1" id="area1-3">SRT</td>
										</tr>
										<tr>
											<td class="dth1" id="area1-4">철도</td>
										</tr>
										<tr>
											<td class="dth1" rowspan="3" id="area2">대전</td>
											<td class="dth1" id="area2-1">KTX</td>
										</tr>
										<tr>
											<td class="dth1" id="area2-2">SRT</td>
										</tr>
										<tr>
											<td class="dth1" id="area2-3">철도</td>
										</tr>
										<tr>
											<td class="dth1" rowspan="3" id="area3">광주</td>
											<td class="dth1" id="area3-1" style="height: calc(40px * 2);">고속버스</td>
										</tr>
										<tr>
											<td class="dth1" id="area3-2">KTX</td>
										</tr>
										<tr>
											<td class="dth1" id="area3-3">철도</td>
										</tr>
										<tr>
											<td class="dth1" rowspan="2" id="area4">강원</td>
											<td class="dth1" id="area4-1" style="height: calc(40px * 2);">시외버스</td>
										</tr>
										<tr>
											<td class="dth1" id="area4-2">철도</td>
										</tr>
										<tr>
											<td class="dth1" rowspan="4" id="area5">대구</td>
											<td class="dth1" id="area5-1">고속버스</td>
										</tr>
										<tr>
											<td class="dth1" id="area5-2" style="height: calc(40px * 2);">KTX</td>
										</tr>
										<tr>
											<td class="dth1" id="area5-3" style="height: calc(40px * 2);">SRT</td>
										</tr>
										<tr>
											<td class="dth1" id="area5-4">철도</td>
										</tr>
										<tr>
											<td class="dth1" id="area6">제주</td>
											<td class="dth1" id="area6-1">비행기</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="swipearea">
								<div class="inner">
									<table summary="출발지, 도착지, 거리, 소요시간 정보 제공" style="--pmin: 880px; --mmin: 650px;">
										<caption>출발지역에 따른 안내 스크롤영역</caption>
										<colgroup>
											<col width="32.693%">
											<col width="32.693%">
											<col width="15.385%">
											<col>
										</colgroup>
										<thead>
											<tr>
												<th scope="col">출발지</th>
												<th scope="col">도착지</th>
												<th scope="col">거리</th>
												<th scope="col">소요시간</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="dth2" rowspan="2" headers="area1 area1-1">서울경부 고속버스 터미널
													<a href="http://www.exterminal.co.kr/" class="el_btn viewmore" target="_blank" rel="noreferrer"><span class="blind">바로가기(새창열림)</span></a>
												</td>
												<td class="dth3">부산종합버스터미널</td>
												<td>380.4km</td>
												<td>4h</td>
											</tr>
											<tr>
												<td class="dth3">서부산(사상) 고속버스 터미널</td>
												<td>387.5km</td>
												<td>4h 20m</td>
											</tr>
											<tr>
												<td class="dth2" rowspan="2" headers="area1 area1-1">동서울 터미널
													<a href="https://www.ti21.co.kr/" class="el_btn viewmore" target="_blank" rel="noreferrer"><span class="blind">바로가기(새창열림)</span></a>
												</td>
												<td class="dth3">부산종합버스터미널</td>
												<td>386.6km</td>
												<td>4h 15m</td>
											</tr>
											<tr>
												<td class="dth3">서부산(사상) 고속버스 터미널</td>
												<td>390.1km</td>
												<td>4h 15m</td>
											</tr>
											<tr>
												<td class="dth2" headers="area1 area1-2">서울역</td>
												<td class="dth3" rowspan="3">부산역</td>
												<td></td>
												<td>2h 45m</td>
											</tr>
											<tr>
												<td class="dth2" headers="area1 area1-3">수서역</td>
												<td></td>
												<td>2h 35m</td>
											</tr>
											<tr>
												<td class="dth2" headers="area1 area1-4">서울역</td>
												<td></td>
												<td>5h 30m</td>
											</tr>
											<tr>
												<td class="dth2" headers="area2 area2-1">대전역</td>
												<td class="dth3" rowspan="3">부산역</td>
												<td></td>
												<td>1h 30m</td>
											</tr>
											<tr>
												<td class="dth2" headers="area2 area2-2">대전역</td>
												<td></td>
												<td>1h 40m</td>
											</tr>
											<tr>
												<td class="dth2" headers="area2 area2-3">대전역</td>
												<td></td>
												<td>3h 40m</td>
											</tr>
											<tr>
												<td class="dth2" headers="area3 area3-1">광주(유·스퀘어) 고속버스 터미널
													<a href="https://www.kobus.co.kr/" class="el_btn viewmore" target="_blank" rel="noreferrer"><span class="blind">바로가기(새창열림)</span></a>
												</td>
												<td class="dth3">부산종합버스터미널</td>
												<td>269.3km</td>
												<td>3h</td>
											</tr>
											<tr>
												<td class="dth2" headers="area3 area3-1">광주(유·스퀘어) 고속버스 터미널
													<a href="https://www.kobus.co.kr/" class="el_btn viewmore" target="_blank" rel="noreferrer"><span class="blind">바로가기(새창열림)</span></a>
												</td>
												<td class="dth3">서부산(사상) 고속버스 터미널</td>
												<td>249.7km</td>
												<td>3h</td>
											</tr>
											<tr>
												<td class="dth2" headers="area3 area3-2">광주송정역 → 오송역 환승</td>
												<td class="dth3">오송역 → 부산역</td>
												<td></td>
												<td>3h 30m</td>
											</tr>
											<tr>
												<td class="dth2" headers="area3 area3-3">광주송정역 → 신탄진 환승</td>
												<td class="dth3">신탄진 → 부산역</td>
												<td></td>
												<td>6h 10m</td>
											</tr>
											<tr>
												<td class="dth2" headers="area4 area4-1">원주버스터미널
													<a href="https://txbus.t-money.co.kr/otck/trmlInfEnty.do" class="el_btn viewmore" target="_blank" rel="noreferrer"><span class="blind">바로가기(새창열림)</span></a>
												</td>
												<td class="dth3">부산종합버스터미널</td>
												<td></td>
												<td>3h 40m</td>
											</tr>
											<tr>
												<td class="dth2" headers="area4 area4-1">홍천터미널
													<a href="https://txbus.t-money.co.kr/otck/trmlInfEnty.do" class="el_btn viewmore" target="_blank" rel="noreferrer"><span class="blind">바로가기(새창열림)</span></a>
												</td>
												<td class="dth3">부산종합버스터미널</td>
												<td></td>
												<td>4h 20m</td>
											</tr>
											<tr>
												<td class="dth2" headers="area4 area4-2">원주역 → 신경주역 환승</td>
												<td class="dth3">신경주역 → 부산역</td>
												<td></td>
												<td>3h 50m</td>
											</tr>
											<tr>
												<td class="dth2" headers="area5 area5-1">동대구 고속버스 터미널
													<a href="https://www.kobus.co.kr/" class="el_btn viewmore" target="_blank" rel="noreferrer"><span class="blind">바로가기(새창열림)</span></a>
												</td>
												<td class="dth3">부산종합버스터미널</td>
												<td>101.5km</td>
												<td>1h 10m</td>
											</tr>
											<tr>
												<td class="dth2" headers="area5 area5-2">동대구</td>
												<td class="dth3" rowspan="5">부산역</td>
												<td></td>
												<td>50m</td>
											</tr>
											<tr>
												<td class="dth2" headers="area5 area5-2">서대구</td>
												<td></td>
												<td>1h</td>
											</tr>
											<tr>
												<td class="dth2" headers="area5 area5-3">동대구</td>
												<td></td>
												<td>50m</td>
											</tr>
											<tr>
												<td class="dth2" headers="area5 area5-3">서대구</td>
												<td></td>
												<td>1h</td>
											</tr>
											<tr>
												<td class="dth2" headers="area5 area5-4">동대구</td>
												<td></td>
												<td>1h 40m</td>
											</tr>
											<tr>
												<td class="dth2" headers="area6 area6-1">제주국제공항</td>
												<td class="dth3">김해국제공항</td>
												<td></td>
												<td>1h</td>
											</tr>
										</tbody>
									</table> 
								</div>
							</div>
						</div>
					</article>
					<!-- //출발지역에 따른 안내 -->

					<!-- 도착 후 안내 -->
					<article class="mt70-40">
						<div class="page_header">
							<h4 class="el_heading lv1">도착 후 안내</h4> 
						</div>

						<div class="tbl type5 tblSwipe g_content traffic_tbl2">
							<div class="fixed">
								<table summary="지역 정보 제공">
									<caption>도착 후 안내 고정영역</caption>
									<colgroup>
										<col class="area">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">지역</th>
										</tr> 
									</thead>
									<tbody>
										<tr class="h60">
											<td class="dth1" id="areab1">부산종합버스<br class="p_show">터미널</td>
										</tr>
										<tr class="h60">
											<td class="dth1" id="areab2">서부산(사상)<br class="p_show"> 고속버스 터미널</td>
										</tr>
										<tr class="h80">
											<td class="dth1" id="areab3">부산역</td>
										</tr>
										<tr class="h60">
											<td class="dth1" id="areab4">김해공항</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="swipearea">
								<div class="inner">
									<table summary="거리, 소요시간, 택시요금, 지하철, 시내버스 정보 제공" style="--pmin: 1000px; --mmin: 50rem;">
										<caption>도착 후 안내 스크롤영역</caption>
										<colgroup>
											<col class="col1">
											<col class="col2">
											<col class="col3">
											<col class="col4">
											<col>
										</colgroup>
										<thead>
											<tr>
												<th scope="col">거리</th>
												<th scope="col">소요시간</th>
												<th scope="col">택시요금</th>
												<th scope="col">지하철</th>
												<th scope="col">시내버스</th>
											</tr>
										</thead>
										<tbody>
											<tr class="h60">
												<td headers="areab1">13km</td>
												<td>약 40분</td>
												<td>약 22,000원</td>
												<td class="dth2">1호선 노포역 → 연산역 →<br>
													(3호선 환승)연산역 → 종합운동장역</td>
												<td class="dth3">50, 80, 12 → 189,1002(심야)</td>
											</tr>
											<tr class="h60">
												<td headers="areab2">15km</td>
												<td>약 30분</td>
												<td>약 21,000원</td>
												<td class="dth2">2호선 사상역 → 덕천역 →<br>
													(3호선 환승)덕천역 → 종합운동장역</td>
												<td class="dth3">110, 33, 33-1, 160 → 46,169 → 111</td>
											</tr>
											<tr class="h80">
												<td headers="areab3">12km</td>
												<td>약 30분</td>
												<td>약 17,000원</td>
												<td class="dth2">1호선 부산역 → 연산역 →<br>
													(3호선 환승)연산역 → 종합운동장역</td>
												<td class="dth3">81 → 10, 210<br>
													81 → 부산진구17<br>
													103 → 부산진구17</td>
											</tr>
											<tr class="h60">
												<td headers="areab4">18km</td>
												<td>약 30분</td>
												<td>약 25,000원</td>
												<td class="dth2">부산김해공항역 → 대저역 →<br>
													(3호선 환승)대저역 → 종합운동장역</td>
												<td class="dth3">307 → 33-1<br>
													강서구13 → 33-1</td>
											</tr>
										</tbody>
									</table> 
								</div>
							</div>
						</div>
					</article>
					<!-- //도착 후 안내 -->

					<!-- 개인차량 이용 안내 -->
					<article class="mt70-40">
						<div class="page_header">
							<h4 class="el_heading lv1">개인차량 이용 안내</h4> 
						</div>

						<div class="tbl type5 tblSwipe g_content traffic_tbl3">
							<div class="fixed">
								<table summary="지역 정보 제공">
									<caption>개인차량 이용 안내 고정영역</caption>
									<colgroup>
										<col class="area">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">지역</th>
										</tr> 
									</thead>
									<tbody>
										<tr>
											<td class="dth1" id="areac1">중부내륙고속도로</td>
										</tr>
										<tr class="h60">
											<td class="dth1" id="areac2">경부고속도로</td>
										</tr>
										<tr class="h60">
											<td class="dth1" id="areac3">서해안고속도로</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="swipearea">
								<div class="inner">
									<table summary="거리, 내용 정보 제공" style="--mwth: 100%; --mmin: 32.308rem;">
										<caption>개인차량 이용 안내 스크롤영역</caption>
										<colgroup>
											<col class="col1">
											<col>
										</colgroup>
										<thead>
											<tr>
												<th scope="col">거리</th>
												<th scope="col">내용</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td headers="areac1">15km (대동 T.G 부터)</td>
												<td class="dth3 txt_lt">중앙고속도로(삼락-대동) → 남해고속도로 → 만덕대로</td>
											</tr>
											<tr class="h60">
												<td headers="areac2">12km (부산 T.G 부터)</td>
												<td class="dth3 txt_lt">경부고속도로 → 중앙대로 → 우장춘로<br>
													경부고속도로 → 금정로 → 중앙대로</td>
											</tr>
											<tr class="h60">
												<td headers="areac3">13km</td>
												<td class="dth3 txt_lt">중앙대로 → 여고로<br>
													중앙대로 → 번영로 → 충렬대로</td>
											</tr>
										</tbody>
									</table> 
								</div>
							</div>
						</div>
					</article>
					<!-- //개인차량 이용 안내 -->
				</div>
			</section>
			<!-- //오시는 길 --> 


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