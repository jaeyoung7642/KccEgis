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
	<title>역사관 : KCC이지스 프로농구단</title>
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
	<script>
	function selectSeason(str){
		$.ajax({
   			type:'Get',
   			data : 'season_year=' + str,
   			url: 'selectSeasonReview',
   			success:function(result){
   	            $('#selectArea').html(result);
   	         	customSelect();
   	         var val = $('#selectArea').find('#changeSeason').val();
  	      		changeSeason2(val);
   	         },
   	         error:function(){
   	            alert('서버에 문제가 있습니다.');
   	         }
   		});//ajax
	}

	$(document).on('change','#changeSeason', function() {
		const val = $(this).val();
		changeSeason2(val);
	});

	function changeSeason2(val) {
		$('#changeReview').attr('data-include', 'season_'+val);
		$('#changePhoto').attr('data-include', 'photo_'+val);
		includeHtml();
		
		$.ajax({
   			type:'Get',
   			data : 'season_code=' + val,
   			url: 'selectSeasonRecord',
   			success:function(result){
   	            $('#recordArea').html(result);
   	         	customSelect();
   	         	swipeEvent();
   			},
   	         error:function(){
   	            alert('서버에 문제가 있습니다.');
   	         }
   		});//ajax
	}
	</script>
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
		<main id="container" class="ly_container club bg_dark">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>CLUB</li>
						<li>역사관</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">CLUB</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="front" class="swiper-slide snb_link"><span>구단소개</span></a> 
								<a href="chistory" class="swiper-slide snb_link current"><span>역사관</span></a> <!-- 해당페이지에 current 추가 -->
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
						<a href="chistory" class="swiper-slide snb_link"><span>구단 히스토리</span></a> 
						<a href="phistory" class="swiper-slide snb_link"><span>선수단 히스토리</span></a>
						<a href="seasonReview" class="swiper-slide snb_link current"><span>시즌 리뷰</span></a> <!-- 해당페이지에 current 추가 -->
					</div>
				</nav>
			</div>

			<!-- 검색 -->
			<section class="section mt70">
				<div class="ly_inner md">

					<div class="search_box type3 dark">
						<form action="" class="search_box_form">
							<div class="row">
								<div class="col shrink radios gmd">
									<label class="frm_radio type1 md">
										<input type="radio" name="reviewr_year" class="selectRadio" <c:if test="${season_year eq '1'}">checked</c:if> value="1" onchange="selectSeason(this.value)">
										<span>2001-10년</span>
									</label>
									<label class="frm_radio type1 md">
										<input type="radio" name="reviewr_year" <c:if test="${season_year eq '2'}">checked</c:if> value="2" onchange="selectSeason(this.value)">
										<span>2011-20년</span>
									</label>
									<label class="frm_radio type1 md">
										<input type="radio" name="reviewr_year" <c:if test="${season_year eq '3'}">checked</c:if> value="3" onchange="selectSeason(this.value)">
										<span>2021-현재</span>
									</label>
								</div>

								<div class="col grow pmax240" id="selectArea">
									<select class="frm_select group_input mdm" id="changeSeason" aria-label="시즌 선택">
										<c:forEach items="${seasonList}" var="seasonList" varStatus="status">
										<option value="${seasonList.seasonCode}" <c:if test="${seasonList.seasonCode eq season_code}">selected</c:if>>${seasonList.seasonCodeNm}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</form>
					</div>
				</div>
			</section>
			<!-- 검색 -->

			<!-- 시즌 리뷰 상단영역 -->
			<section class="section mt50">
				<div class="ly_inner md js-include" id="changeReview" data-include="season_${season_code}">
					<!-- 콘텐츠 영역 -->
				</div>
			</section>
			<!-- //시즌 리뷰 상단영역 -->
			
			<!-- 시즌 누적 기록 -->
			<section class="section mt100">
				<div class="ly_inner md">
					<div class="page_header">
						<h4 class="el_heading lv1">시즌 누적 기록</h4> 
					</div>

					<!-- 기록 테이블 -->
					<div class="tbl type2 td_md tblSwipe g_content" id="recordArea">
						<div class="fixed">
							<table summary="선수명, 경기수. 출전시간 정보 제공" style="--pwth: min(20.833vw * 1.6, 400px);">
								<caption>시즌 누적 기록 고정영역</caption>
								<colgroup>
									<col class="player">
									<col width="30%" class="p_hide">
									<col class="p_hide">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">선수명
											<div class="p_show">경기수 <span class="dash">/</span> 출전시간</div>
										</th>
										<th scope="col" class="p_hide">경기수</th>
										<th scope="col" class="p_hide">출전시간</th>
									</tr> 
								</thead>
								<tbody>
								<c:forEach items="${playerRecordList}" var="playerRecordList" varStatus="status">
									<tr>
										<td>
											<div class="td_group">
												<span class="name">NO.${playerRecordList.back_num} ${playerRecordList.kname}</span>
												<span class="p_show">${playerRecordList.game_count} <span class="dash">/</span> ${playerRecordList.play_min}’${playerRecordList.play_sec}’’</span>
											</div>
										</td>
										<td class="p_hide">${playerRecordList.game_count}</td>
										<td class="p_hide">${playerRecordList.play_min}’${playerRecordList.play_sec}’’</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="득점, 2점슛, 3점슛, 자유투, 리바운드, 어시스트, 스틸, 블록 정보 제공" style="--pmin: 850px; --mmin: 480px;">
									<caption>시즌 누적 기록 스크롤영역</caption>
									<colgroup>
										<col width="14%">
										<col width="12.3%">
										<col width="12.3%">
										<col width="12.3%">
										<col width="14%">
										<col width="14%">
										<col width="11.4%">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">득점</th>
											<th scope="col">2점슛</th>
											<th scope="col">3점슛</th>
											<th scope="col">자유투</th>
											<th scope="col">리바운드</th>
											<th scope="col">어시스트</th>
											<th scope="col">스틸</th>
											<th scope="col">블록</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${playerRecordList}" var="playerRecordList" varStatus="status">
										<tr>
											<td>${playerRecordList.score }</td>
											<td>${playerRecordList.fg }</td>
											<td>${playerRecordList.threep }</td>
											<td>${playerRecordList.ft }</td>
											<td>${playerRecordList.r_tot }</td>
											<td>${playerRecordList.a_s }</td>
											<td>${playerRecordList.s_t }</td>
											<td>${playerRecordList.b_s }</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- //기록 테이블 -->
				</div>
			</section>
			<!-- //시즌 누적 기록 -->

			<!-- 코칭스탭 및 선수 -->
			<section class="section mt100"> 
				<div class="ly_inner md">
					<div class="page_header">
						<h4 class="el_heading lv1">코칭스탭 및 선수</h4> 
					</div>

					<div class="js-include" id="changePhoto" data-include="photo_${season_code}">
						<!-- 사진 영역 -->
					</div>
				</div>
			</section> 
			<!-- //코칭스탭 및 선수 -->



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