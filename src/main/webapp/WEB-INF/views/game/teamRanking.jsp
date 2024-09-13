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
	<title>KCC EGIS</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />

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
								<c:forEach items="${teamCategoryRankList}" var="teamCategoryRankList" varStatus="status">
									<li class="item">
										<div class="box box1">
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

</body>
</html>