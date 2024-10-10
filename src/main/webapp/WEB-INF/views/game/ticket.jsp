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
	<%
	String baseUrl = request.getRequestURL().toString();
	String queryString = request.getQueryString();
	String currentUrl = baseUrl + (queryString != null ? "?" + queryString : "");
	%>
	<meta property="og:type" content="website">
	<meta property="og:url" content="<%= currentUrl %>">
	<meta property="og:title" content="티켓팅 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
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
						<a href="ticket" class="swiper-slide snb_link current"><span>티켓안내</span></a> 
						<a href="ticket_faq" class="swiper-slide snb_link"><span>티켓FAQ</span></a> <!-- 해당페이지에 current 추가 -->
					</div>
				</nav>
			</div>

			<!-- 티켓예매 안내 -->
			<section class="section">
				<div class="ly_inner md">
					<div class="page_header">
						<h4 class="el_heading lv1">24-25시즌 티켓예매 안내</h4> 
					</div>

					<!-- 티켓예매 안내 테이블 -->
					<article class="tbl type5 tblSwipe ticket_tbl1">
						<div class="fixed">
							<table summary="구분 정보 제공">
								<caption>티켓예매 안내 고정영역</caption>
								<colgroup>
									<col class="floor">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="rds_lt">구분</th>
									</tr> 
								</thead>
								<tbody>
									<tr>
										<td class="dth1 bd_rt" id="floor1" style="height: calc(40px * 3)">1층</td>
										<td></td>
									</tr>
									<tr>
										<td class="dth1" id="floor2" style="height: calc(40px * 6)">2층</td>
									</tr>
									<tr>
										<td class="dth1" id="floor3" style="height: calc(40px * 2)">3, 4층</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="좌석, 주중, 주말/공휴일, 비고 정보 제공" style="--pmin: 900px; --mmin: 550px;">
									<caption>티켓예매 안내 스크롤영역</caption>
									<colgroup>
										<col class="col1">
										<col class="col1">
										<col class="col1">
										<col class="col1">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" colspan="2">좌석</th>
											<th scope="col">주중/EASL(3경기)</th>
											<th scope="col">주말/공휴일</th>
											<th scope="col">비고</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td scope="row" headers="floor1" colspan="2" class="dth1">F석</td>
											<td class="dth2 txt_rt">45,000원</td>
											<td class="dth3 txt_rt">50,000원</td>
											<td class="txt_lt"></td>
										</tr>
										<tr>
											<td scope="row" headers="floor1" colspan="2" class="dth1">익사이팅 1~4</td>
											<td class="dth2 txt_rt">30,000원</td>
											<td class="dth3 txt_rt">33,000원</td>
											<td class="txt_lt"></td>
										</tr>
										<tr>
											<td scope="row" headers="floor1" colspan="2" class="dth1">익사이팅 5~6</td>
											<td class="dth2 txt_rt">25,000원</td>
											<td class="dth3 txt_rt">28,000원</td>
											<td class="txt_lt"></td>
										</tr>
										<tr>
											<td scope="row" headers="floor2" colspan="2" class="dth1">커플석(2인 기준)</td>
											<td class="dth2 txt_rt">45,000원</td>
											<td class="dth3 txt_rt">50,000원</td>
											<td class="txt_lt"></td>
										</tr>
										<tr>
											<td scope="row" headers="floor2" colspan="2" class="dth1">A석</td>
											<td class="dth2 txt_rt">20,000원</td>
											<td class="dth3 txt_rt">22,000원</td>
											<td class="txt_lt"></td>
										</tr>	
										<tr>
											<td scope="row" headers="floor2" rowspan="2" class="dth1">일반석(응원석)</td>
											<td scope="row" class="dth1">성인</td>
											<td class="dth2 txt_rt">13,000원</td>
											<td class="dth3 txt_rt">13,000원</td>
											<td class="txt_lt"></td>
										</tr>
										<tr>
											<td scope="row" class="dth1 bd_lt">청소년</td>
											<td class="dth2 txt_rt">11,000원</td>
											<td class="dth3 txt_rt">11,000원</td>
											<td class="txt_lt">청소년 할인 적용</td>
										</tr>
										<tr>
											<td scope="row" headers="floor2" rowspan="2" class="dth1">일반석</td>
											<td scope="row" class="dth1">성인</td>
											<td class="dth2 txt_rt">12,000원</td>
											<td class="dth3 txt_rt">12,000원</td>
											<td class="txt_lt"></td>
										</tr>
										<tr>
											<td scope="row" class="dth1 bd_lt">청소년</td>
											<td class="dth2 txt_rt">10,000원</td>
											<td class="dth3 txt_rt">10,000원</td>
											<td class="txt_lt">청소년 할인 적용</td>
										</tr>
										<tr>
											<td scope="row" headers="floor3" rowspan="2" class="dth1">일반석</td>
											<td scope="row" class="dth1">성인</td>
											<td class="dth2 txt_rt">10,000원</td>
											<td class="dth3 txt_rt">10,000원</td>
											<td class="txt_lt"></td>
										</tr>
										<tr>
											<td scope="row" class="dth1 bd_lt">청소년</td>
											<td class="dth2 txt_rt">8,000원</td>
											<td class="dth3 txt_rt">8,000원</td>
											<td class="txt_lt">청소년 할인 적용</td>
										</tr>
								</table> 
							</div>
						</div>
					</article>
					<!-- //티켓예매 안내 테이블 -->

					<article class="ticket_notice mt50">
						<div class="page_header">
							<h4 class="el_heading lv1">예매시 유의사항</h4> 
						</div>

						<ul class="el_desc_list no_mg txt_black">
							<li>경로우대(만65세 이상), 장애인 복지카드 50%할인 / 1인 1매(일반석에 한함)</li>
							<li>청소년은 36개월 이상부터 초,중,고 학생에 한함(학생증 제시 요망)</li>
							<li>36개월 이하의 경우 좌석을 점유 할 경우 티켓 구매 필수</li>
							<li>문화누리카드40%(일반석에 한함)</li> 
							<li>예매 시 전석1,000원 할인</li>
						</ul>

						<div class="btns p_hide">
							<a href="TICKET" target="_blank" rel="noreferrer" aria-label="(새창열림)" class="el_btn ccl ccl2 siteLink">
								티켓<br> 예매하기 <span class="el_ico ico_ticket_w"></span>
							</a>
						</div>
					</article>
					
				</div>
			</section>
			<!-- //티켓예매 안내 -->

			<!-- 예매처 안내 -->
			<section class="section mt50">
				<div class="ly_inner md">
					<div class="page_header">
						<h4 class="el_heading lv1">예매처 안내</h4> 
					</div>

					<div class="tbl type5 ticket_tbl2">
						<table>
							<colgroup>
								<col class="col1">
								<col class="col1">
								<col class="col1">
								<col class="p_hide">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">예매방법</th>
									<th scope="col">내용</th>
									<th scope="col">운영시간</th>
									<th scope="col" class="p_hide">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr class="h50">
									<td scope="row" class="dth1 txt_lt">온라인</td>
									<td class="txt_lt"><a href="TICKET" target="_blank" rel="noreferrer" aria-label="(새창열림)" class="siteLink">https://egis.kbl.or.kr</a></td>
									<td class="txt_lt bd_rt">24시간 운영</td>
									<td rowspan="3" class="txt_lt rds_rt no_bd_lt p_hide">
										<ul class="el_desc_list mg txt_black">
											<!--<li>멤버십 회원 예매는 5일 전 오전 11시,<br class="xm_hide"> 
												일반 회원 예매는 경기 4일 전 오전 11시부터 경기 당일 경기 시작 시까지 입장권 
												<span class="txt_wrap">예매 시</span> <span class="txt_wrap">1,000원 할인</span>(전  좌석 동일 적용)</li>-->
											<li>경기 시작 2시간 전까지 취소 가능</li>
										</ul>
									</td>
								</tr>
								<tr class="h50">
									<td scope="row" class="dth1 txt_lt">모바일<br class="xm_show"> 어플리케이션</td>
									<td class="txt_lt">KBL 앱</td>
									<td class="txt_lt">24시간 운영</td>
								</tr>
								<tr class="h50">
									<td scope="row" class="dth1 p_rds_lt txt_lt">콜센터(전화)</td>
									<td class="txt_lt">1588-7890</td>
									<td class="txt_lt no_rds">10:00 - 19:00(요일 구분 없음)</td>
								</tr>
								<tr class="t_show h50">
									<td colspan="3" class="txt_lt">
										<ul class="el_desc_list mg txt_black">
											<!--<li>멤버십 회원 예매는 5일 전 오전 11시,<br class="xm_hide"> 
												일반 회원 예매는 경기 4일 전 오전 11시부터 경기 당일 경기 시작 시까지 입장권 
												<span class="txt_wrap">예매 시</span> <span class="txt_wrap">1,000원 할인</span>(전  좌석 동일 적용)</li>-->
											<li>경기 시작 2시간 전까지 취소 가능</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div class="btn_area mt30 p_show">
					<a href="TICKET" target="_blank" rel="noreferrer" aria-label="(새창열림)" class="el_btn btn1 plg blue siteLink">
						<span class="el_ico ico_ticket_w"></span> 티켓예매
					</a>
				</div>
			</section>
			<!-- //예매처 안내 -->


			<!-- 좌석배치도 -->
			<section class="section mt50">
				<div class="ly_inner md">
					<div class="page_header">
						<h4 class="el_heading lv1">부산사직실내체육관 좌석배치도</h4> 
					</div>

					<div class="ticket_seatmap">
						<div class="info">
							<!-- row -->
							<div class="row">
								<div class="floor">
									<span class="el_ccl">1F</span>
								</div>
								<ul class="info_list type1">
									<li class="item">
										<span class="box c1"></span>
										플로어석
									</li>
									<li class="item">
										<span class="box c2"></span>
										익사이팅존 1~4
									</li>
									<li class="item">
										<span class="box c2"></span>
										익사이팅존 5~6
									</li>
								</ul>
							</div>
							<!-- //row -->
							<!-- row -->
							<div class="row">
								<div class="floor">
									<span class="el_ccl">2F</span>
								</div>
								<ul class="info_list type2">
									<li class="item">
										<span class="box c3"></span>
										A석
									</li>
									<!--<li class="item">
										<span class="box c4"></span>
										VIP석
									</li>-->
									<li class="item">
										<span class="box c5"></span>
										커플석(2인)
									</li>
									<li class="item">
										<span class="box c6"></span>
										기자석
									</li>
									<li class="item">
										<span class="box c8"></span>
										일반석
									</li>
									<li class="item">
										<span class="box c7"></span>
										일반석(응원석)
									</li>
								</ul>
							</div>
							<!-- //row -->
							<!-- row -->
							<div class="row">
								<div class="floor">
									<span class="el_ccl">3F</span>
									<span class="el_ccl">4F</span>
								</div>
								<ul class="info_list type1">
									<li class="item">
										<span class="box c8"></span>
										일반석(비지정석)
									</li>
								</ul>
							</div>
							<!-- //row -->
						</div>
						<div class="seatmap el_img">
							<!--<img src="/resources/common/images/img/ticket_seatmap.webp" alt="부산사직실내체육관 좌석배치도 이미지">-->
							<img src="/resources/common/images/img/seat_2425_2.png" alt="부산사직실내체육관 좌석배치도 이미지">
						</div>
					</div>

				</div>
			</section>
			<!-- // 좌석배치도 -->


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
