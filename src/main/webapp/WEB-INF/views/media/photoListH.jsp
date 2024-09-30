<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<meta property="og:title" content="사진 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 웹사이트">
	<title>사진 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
	<link rel="stylesheet" href="/resources/common/assets/css/swiper-bundle.css">
	<link rel="stylesheet" href="/resources/common/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/assets/css/sub.css"> <!-- sub only -->
	<link rel="stylesheet" href="/resources/common/assets/css/board.css"> <!-- 디렉토리 media/fan only -->
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
	function getQueryParam(name) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }

    window.onload = function() {
        // URL에서 'msg' 파라미터 읽기
        var msg = getQueryParam('msg') || '';

        // URL 디코딩
        msg = decodeURIComponent(msg).trim();

        // 콘솔에서 값 확인
        console.log('msg:', msg);

        // 메시지가 있을 경우 알림 표시
        if (msg !== '') {
        	alertPop(msg);
        }
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
		<main id="container" class="ly_container media">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>MEDIA</li>
						<li>사진</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">MEDIA</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="newsList" class="swiper-slide snb_link"><span>뉴스</span></a>  
								<a href="movieListH" class="swiper-slide snb_link"><span>영상</span></a>
								<a href="photoListH" class="swiper-slide snb_link current"><span>사진</span></a> <!-- 해당페이지에 current 추가 -->
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- snb 3depth -->
			<div class="snb_3dth_area">
				<nav class="snb_3dth snb_list menu_slider">
					<div class="swiper-wrapper">
						<a href="photoListH" class="swiper-slide snb_link current"><span>경기 사진</span></a> <!-- 해당페이지에 current 추가 -->
						<a href="photoListE" class="swiper-slide snb_link"><span>이벤트 사진</span></a>
					</div>
				</nav>
			</div>

			<section class="section">
				<div class="ly_inner md">

					<!-- 검색 -->
					<article class="search_box type2 mb0">
						<form action="photoListH" class="search_box_form grid">
							<input type="hidden" name="part" value="${part}">
							<input type="hidden" name="otype" value="${otype}">
							<div class="row row1">
								<div class="col grow col_date frm_date_wrap">
									<span class="frm_date">
										<input type="text" class="frm_input mdm date" aria-label="시작 일" placeholder="기간 설정" name="sdate" id="sdate" value="${sdate}" readonly>
									</span>
									<span class="txt"><span>-</span></span>
									<span class="frm_date rt">
										<input type="text" class="frm_input mdm date rt" aria-label="종료 일" placeholder="기간 설정" name="edate" id="edate" value="${edate}" readonly>
									</span>
								</div>
								<input type="text" class="frm_input mdm col shrink w367" aria-label="검색어" placeholder="검색어 입력 (제목 기반 제공)" name="keyWord" id="keyWord" value="${keyWord}">
								<a href="photoListH" class="el_btn refresh" aria-label="새로고침"><span class="p_hide">새로고침</span></a>
							</div>
							<div class="row row2">
								<div class="col grow">
									<select class="frm_select mdm" aria-label="라운드 선택" name="round" id="round" onchange="disabledGame()">
										<option data-display="라운드 선택" hidden></option>
										<option value="all" <c:if test="${round eq 'all'}">selected</c:if>>라운드 선택</option>
										<option value="1" <c:if test="${round eq '1'}">selected</c:if>>1라운드</option>
										<option value="2" <c:if test="${round eq '2'}">selected</c:if>>2라운드</option>
										<option value="3" <c:if test="${round eq '3'}">selected</c:if>>3라운드</option>
										<option value="4" <c:if test="${round eq '4'}">selected</c:if>>4라운드</option>
										<option value="5" <c:if test="${round eq '5'}">selected</c:if>>5라운드</option>
										<option value="6" <c:if test="${round eq '6'}">selected</c:if>>6라운드</option>
									</select>
									<select class="frm_select mdm rt" aria-label="경기 선택" name="game" id="game" onchange="disabledRound()">
										<option data-display="경기 선택" hidden></option>
										<c:forEach items="${selectGame}" var="selectGame">
											<option value="${selectGame.gameCd}" <c:if test="${game eq selectGame.gameCd}">selected</c:if>>${selectGame.gameNm}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col shrink w367">
									<select class="frm_select mdm" aria-label="선수 선택" name="player" id="player">
										<option data-display="선수 선택" hidden></option>
										<c:forEach items="${selectPlayer}" var="selectPlayer">
											<option value="${selectPlayer.playerCd}" <c:if test="${player eq selectPlayer.playerCd}">selected</c:if>>${selectPlayer.playerNm}</option>
										</c:forEach>
									</select>
									<button class="el_btn frm_btn mdm black">검색</button>
								</div>
							</div>
							<div class="tags bl_tag_list">
								<c:forEach items="${searchKeywordList}" var="searchKeywordList">
									<a href="photoListH?keyWord=${searchKeywordList.search_keyword}" class="tag"><span>#${searchKeywordList.search_keyword}</span></a>
								</c:forEach>
							</div>
						</form>

						<!-- date picker 사용시 -->
						<script src="/resources/common/assets/js/jquery-ui.min.js" defer></script>
						<script defer>
							$(function() {
								datePicker();
							});
						</script>
					</article>
					<!-- 검색 -->

					<p class="el_desc_md2 mt10 pml17">라운드, 경기일자, 선수명 검색은 24-25시즌 데이터부터 지원합니다.<br>라운드와 경기 선택 조건은 각각 하나의 설정만 가능합니다.</p>
					
					<!-- 게시판 리스트 -->
					<article class="mt50">
						<!-- board header -->
						<div class="board_header">
							<div class="bbs_cate_list">
								<a href="photoListH?keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}&part=photo&otype=${otype}" class="cate <c:if test="${part =='photo'}">active</c:if>">24-25시즌</a>
								<a href="photoListH?keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}&part=gallery&otype=${otype}" class="cate <c:if test="${part =='gallery'}">active</c:if>">23-24시즌 이전</a>
							</div>

							<div class="bbs_sort_list">
								<a href="photoListH?keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}&part=${part}&otype=num" class="sort <c:if test="${otype =='num'}">active</c:if>">최신순</a>
								<a href="photoListH?keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}&part=${part}&otype=visited" class="sort <c:if test="${otype =='visited'}">active</c:if>">조회순</a>
							</div>
						</div>
						<!-- //board header -->


						<!-- board list -->
						<ul class="board_list type1">
						<c:forEach items="${photoList}" var="photoList">	
							<li class="item">
								<a href="photoListHDetail?num=${photoList.num}&listpage=${currentPage}&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}&part=${part}&otype=${otype}" class="bbs_box">
									<div class="el_thumb rds el_img media">
										<c:if test="${photoList.img1 != null && photoList.img1 != ''}">
											<img src="/resources/common/images/upload/gallery/${photoList.img1 }" alt="" >
										</c:if>
										<c:if test="${photoList.img1 == null || photoList.img1 == ''}">
											<span class="no_img md"></span><!-- 대체이미지 -->
										</c:if>
										<c:if test="${part == 'photo'}">
										<span class="total" data-total="${photoList.photo_count }"></span> <!-- 사진 총 개수 data-total -->
										</c:if>
									</div>
									<p class="bbs_tit txt_line2">${photoList.subject}</p>
									<p class="bbs_info_wrap">
										<span class="bbs_info date">${photoList.wdateformat}</span>
										<span class="bbs_info view">${photoList.visited}</span>
									</p>
								</a>
							</li>
						</c:forEach>
							<!-- (게시물 없을 경우) -->
							<c:if test="${empty photoList}">
							<li class="item no_post hmd">
								등록된 게시물이 없습니다.
							</li>
							</c:if>
						</ul>
						<!-- board list -->
						<c:if test="${not empty photoList}">
						<!-- pagination -->
						<div class="pagination">
					<!-- 맨처음 -->
					<c:if test="${maxPage eq 0}">
					<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					<c:if test="${maxPage > 0}">
					<a href="photoListH?page=1&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}&part=${part}&otype=${otype}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					
					<!-- 이전 블럭으로 이동 -->
					<c:if test="${startPage gt 1 }">
                       	<a href="photoListH?page=${startPage-1}&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}&part=${part}&otype=${otype}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
                    </c:if>
					<c:if test="${startPage eq 1 }">
                       	<a href="#" class="page_link ico prev" disabled><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
                    </c:if>
                    
                    <!-- 페이지 번호 -->
                    <c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
                   	<c:if test="${p eq currentPage }">
                    	<a href="#" class="page_link current">${p}</a>
                    </c:if>
                      <c:if test="${p ne currentPage }">
                      	<c:url var="photoListH" value="photoListH?keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}&part=${part}&otype=${otype}">
	 					<c:param name="page" value="${p}" />
	 					</c:url>
	 					<a href="${photoListH}" class="page_link">${p}</a>
                      </c:if>
                    </c:forEach>
                    
                    <!-- 다음 블럭으로 이동 -->
                    <c:if test="${endPage ne maxPage && maxPage > 1}">
					<a href="photoListH?page=${endPage+1}&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}&part=${part}&otype=${otype}" class="page_link ico next"><span class="blind">다음</span></a>
                    </c:if>
                    <c:if test="${endPage ge maxPage}">
					<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
                    </c:if>
                    
                    <!-- 맨끝 -->
                    <c:if test="${maxPage eq 0}">
                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
                    </c:if>
                    <c:if test="${maxPage > 0}">
					<a href="photoListH?page=${maxPage}&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}&part=${part}&otype=${otype}" class="page_link ico last"><span class="blind">마지막</span></a>
					</c:if>
				</div>
				<!-- // pagination -->
						</c:if>
					</article>
					<!-- //게시판 리스트 -->

				</div>
			</section>

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