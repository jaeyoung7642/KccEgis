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
	<meta property="og:title" content="팀/선수 순위 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>팀/선수 순위 : KCC이지스 프로농구단</title>
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
	<script>
	function changeSeason(str) {
		location.href = 'teamRank?season_code='+str
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
		<main id="container" class="ly_container game">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>GAME</li>
						<li>팀/선수 순위</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">GAME</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="scheduleList" class="swiper-slide snb_link"><span>경기일정/결과</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="teamRank" class="swiper-slide snb_link current"><span>팀/선수 순위</span></a>
								<a href="teamRecord" class="swiper-slide snb_link"><span>시즌 기록실</span></a>
								<a href="ticket" class="swiper-slide snb_link"><span>티켓팅</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- snb 3depth -->
			<div class="snb_3dth_area">
				<nav class="snb_3dth snb_list menu_slider">
					<div class="swiper-wrapper">
						<a href="teamRank" class="swiper-slide snb_link current"><span>팀 순위</span></a> <!-- 해당페이지에 current 추가 -->
						<a href="playerRank" class="swiper-slide snb_link"><span>선수 순위</span></a>
					</div>
				</nav>
			</div>

			<!-- 팀 순위 -->
			<section class="section">
				<div class="ly_inner md">
					<div class="page_header m_col">
						<h4 class="el_heading lv1">팀 순위</h4>
						<form action="" class="forms">
							<div class="frm_group">
								<select class="frm_select max240 m155" aria-label="시즌 선택" name="season_code" onchange="changeSeason(this.value)">
									<c:forEach items="${selectSeasonList}" var="selectSeasonList" varStatus="status">
											<option value="${selectSeasonList.seasonCode}" <c:if test="${selectSeasonList.seasonCode eq season_code}">selected</c:if>>${selectSeasonList.seasonCodeNm}</option>
										</c:forEach>
								</select>
							</div>
						</form>
					</div>
			
					<div class="tbl type2 tblSwipe">
						<div class="fixed">
							<table summary="순위, 팀명 정보 제공">
								<caption>팀 순 안내 고정영역</caption>
								<colgroup>
									<col class="num">
									<col class="team">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">순위</th>
										<th scope="col">팀명</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty teamRankList}">
										<tr class="point">
										<td>1</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="/resources/common/images/game/team_logo/45/logo_60.png" alt="">
												</div>
												<span>부산 KCC</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>2</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="/resources/common/images/game/team_logo/45/logo_16.png" alt="">
												</div>
												<span>원주 DB</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>3</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="/resources/common/images/game/team_logo/45/logo_50.png" alt="">
												</div>
												<span>창원 LG</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>4</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="/resources/common/images/game/team_logo/45/logo_06.png" alt="">
												</div>
												<span>수원 KT</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>5</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="/resources/common/images/game/team_logo/45/logo_55.png" alt="">
												</div>
												<span>서울 SK</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>6</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="/resources/common/images/game/team_logo/45/logo_10.png" alt="">
												</div>
												<span>울산 현대모비스</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>7</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="/resources/common/images/game/team_logo/45/logo_64.png" alt="">
												</div>
												<span>대구 한국가스공사</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>8</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="/resources/common/images/game/team_logo/45/logo_66.png" alt="">
												</div>
												<span>고양 소노</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>9</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="/resources/common/images/game/team_logo/45/logo_70.png" alt="">
												</div>
												<span>안양 정관장</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>10 </td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="/resources/common/images/game/team_logo/45/logo_35.png" alt="">
												</div>
												<span>서울 삼성</span>
											</div>
										</td>
									</tr>
									</c:if>
									<c:if test="${not empty teamRankList}">
									<c:forEach items="${teamRankList}" var="teamRankList" varStatus="status">
									<tr <c:if test="${teamRankList.team_code == '60' }"> class="point" </c:if>>
										<td>${teamRankList.rank}</td>
										<td>
											<div class="team_name">
												<div class="el_logo sm p_hide">
													<img src="/resources/common/images/game/team_logo/${season_code}/logo_${teamRankList.team_code}.png" alt="">
												</div>
												<span>${teamRankList.team_name_1}</span>
											</div>
										</td>
									</tr>
									</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
						<div class="swipearea">
							<div class="inner">
								<table summary="승, 패, 승률, 승차, 연승, 연패, 최다연승, 최다연패, 정보 제공" style="--mmin: 500px;">
									<caption>팀 순 안내 스크롤영역</caption>
									<colgroup>
										<col width="11.22%">
										<col width="11.22%">
										<col>
										<col width="11.22%">
										<col width="11.22%">
										<col width="11.22%">
										<col width="14.58%">
										<col width="14.58%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">승</th>
											<th scope="col">패</th>
											<th scope="col">승률</th>
											<th scope="col">승차</th>
											<th scope="col">연승</th>
											<th scope="col">연패</th>
											<th scope="col">최다연승</th>
											<th scope="col">최다연패</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty teamRankList}">
										<tr class="point">
											<td>0</td>
											<td>0</td>
											<td>0.00</td>
											<td>0.0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>0</td>
											<td>0</td>
											<td>0.00</td>
											<td>0.0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>0</td>
											<td>0</td>
											<td>0.00</td>
											<td>0.0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>0</td>
											<td>0</td>
											<td>0.00</td>
											<td>0.0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>0</td>
											<td>0</td>
											<td>0.00</td>
											<td>0.0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>0</td>
											<td>0</td>
											<td>0.00</td>
											<td>0.0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>0</td>
											<td>0</td>
											<td>0.00</td>
											<td>0.0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>0</td>
											<td>0</td>
											<td>0.00</td>
											<td>0.0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>0</td>
											<td>0</td>
											<td>0.00</td>
											<td>0.0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>0</td>
											<td>0</td>
											<td>0.00</td>
											<td>0.0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										</c:if>
										<c:if test="${not empty teamRankList}">
										<c:forEach items="${teamRankList}" var="teamRankList" varStatus="status">
										<tr <c:if test="${teamRankList.team_code == '60' }"> class="point" </c:if>>
											<td>${teamRankList.t_win}</td>
											<td>${teamRankList.t_loss}</td>
											<td>${teamRankList.win_rate}</td>
											<td>${teamRankList.win_diff}</td>
											<td>${teamRankList.conti_win}</td>
											<td>${teamRankList.conti_loss}</td>
											<td>${teamRankList.max_conti_win}</td>
											<td>${teamRankList.max_conti_loss}</td>
										</tr>
										</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- //팀 순위 -->

			<!-- 부문별 팀 순위 -->
			<section class="section mt50">
				<div class="ly_inner md">

					<article class="bl_card t_ranking_content bg_logo">
						<div class="col logo_area">
							<div class="el_logo md m80">
								<img src="/resources/common/images/game/logo_60.svg" alt="">
							</div>
							<div class="season">
								<p class="year">${seasonCodeNm}</p>
								<p class="txt">SEASON</p>
							</div>
						</div>
						<div class="col rank_area">
							<ul class="bl_card_list col5">
								<c:if test="${empty teamCategoryRankList}">
									<li class="item">
										<div class="box box1">
											<p class="tit">득점</p>
											<p class="score">0</p>
										</div>
									</li>
									<li class="item">
										<div class="box box2">
											<p class="tit">리바운드</p>
											<p class="score">0</p>
										</div>
									</li>
									<li class="item">
										<div class="box box3">
											<p class="tit">어시스트</p>
											<p class="score">0</p>
										</div>
									</li>
									<li class="item">
										<div class="box box4">
											<p class="tit">스틸</p>
											<p class="score">0</p>
										</div>
									</li>
									<li class="item">
										<div class="box box5">
											<p class="tit">블록</p>
											<p class="score">0</p>
										</div>
									</li>
								</c:if>
								<c:if test="${not empty teamCategoryRankList}">
								<c:forEach items="${teamCategoryRankList}" var="teamCategoryRankList" varStatus="status">
									<li class="item">
										<div class="box box${status.index+1}">
											<p class="tit">${teamCategoryRankList.cate }</p>
											<p class="score">${teamCategoryRankList.category_data }</p>
										</div>
										<c:if test="${teamCategoryRankList.rn == '1'}">
										<span class="el_badge gold" data-raink="${teamCategoryRankList.rn }"></span>
										</c:if>
										<c:if test="${teamCategoryRankList.rn == '2'}">
										<span class="el_badge silver" data-raink="${teamCategoryRankList.rn }"></span>
										</c:if>
										<c:if test="${teamCategoryRankList.rn != '1' && teamCategoryRankList.rn != '2'}">
										<span class="el_badge bronze" data-raink="${teamCategoryRankList.rn }"></span>
										</c:if>
									</li>
								</c:forEach>
								</c:if>
							</ul>
						</div>
					</article>
				</div>
			</section>
			<!-- //부문별 팀 순위 -->
			
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