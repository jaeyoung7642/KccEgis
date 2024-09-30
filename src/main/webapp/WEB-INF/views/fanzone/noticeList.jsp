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
	<meta property="og:title" content="공지사항 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 웹사이트">
	<title>공지사항 : KCC이지스 프로농구단</title>
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
		<main id="container" class="ly_container fanzone">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>FANZONE</li>
						<li>공지사항</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">FANZONE</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="noticeList" class="swiper-slide snb_link current"><span>공지사항</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="freeList" class="swiper-slide snb_link"><span>팬게시판</span></a> 
								<a href="eventList" class="swiper-slide snb_link"><span>이벤트</span></a>
								<a href="wallpaperList" class="swiper-slide snb_link"><span>월페이퍼</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<section class="section">
				<div class="ly_inner md">

					<!-- 검색 -->
					<div class="search_box type4">
						<form action="noticeList" class="search_box_form">
							<div class="row">
								<div class="col grow pmax484 p_rt">
									<input type="text" class="frm_input mdm" aria-label="검색" placeholder="제목 및 내용 검색 " name="keyWord" value="${keyWord}">
									<button  class="el_btn frm_btn black mdm shrink">검색</button>
								</div>
							</div>
						</form>
					</div>
					<!-- 검색 -->

					<!-- 게시판 리스트 -->
					<article class="mt40-30">
						<!-- board list -->
						<div class="bbs_list_tbl">
							<table>
								<caption>팬게시판 목록</caption>
								<colgroup>
									<col class="num">
									<col class="tit">
									<col class="date">
									<col class="view">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">NO</th>
										<th scope="col">제목</th>
										<th scope="col">날짜</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${topNoticeList}" var="topNoticeList">
									<tr class="notice"> <!-- 공지사항 notice 클래스 추가 -->
										<td class="num">공지</td>
										<td class="tit">
											<div class="tit_inner">
												<a href="noticeListDetail?num=${topNoticeList.num}&listpage=${currentPage}&keyWord=${keyWord}" class="tit_link">
													<span class="tit_inner">
														<span class="tit_txt txt_line1-2">${topNoticeList.subject }</span>
														<c:if test="${topNoticeList.tail_count != '0' }">
														<span class="count">[${topNoticeList.tail_count }]</span>
														</c:if> 
													</span>
													<c:if test="${fn:trim(topNoticeList.content2) != ''}">
														<span class="tit_cont txt_line2-3">${fn:trim(topNoticeList.content2)}</span> <!-- 콘텐츠 내용이 있을 경우 추출 -->
													</c:if>
												</a>
											</div>
										</td>
										<td class="date">
											<span class="bbs_info date">${topNoticeList.reg_date }</span>
										</td>
										<td class="view">
											<span class="bbs_info view">${topNoticeList.visited }</span>
										</td>
									</tr>
									</c:forEach>
									<c:forEach items="${noticeList}" var="noticeList" varStatus="status">
									<c:choose>
									  <c:when test="${status.first}">
										<tr style="border-top: 2px solid #bcc3d194;">
									  </c:when>
									<c:otherwise>
									   <tr>
									</c:otherwise>
									</c:choose>
										<td class="num">${noticeList.rownum}</td>
										<td class="tit">
											<div class="tit_inner">
												<a href="noticeListDetail?num=${noticeList.num}&listpage=${currentPage}&keyWord=${keyWord}" class="tit_link">
													<span class="tit_inner">
														<span class="tit_txt txt_line1-2">${noticeList.subject }</span>
														<c:if test="${noticeList.tail_count != '0' }">
														<span class="count">[${noticeList.tail_count }]</span>
														</c:if> 
													</span>
													<c:if test="${fn:trim(noticeList.content2) != ''}">
														<span class="tit_cont txt_line2-3">${fn:trim(noticeList.content2)}</span> <!-- 콘텐츠 내용이 있을 경우 추출 -->
													</c:if>
												</a>
											</div>
										</td>
										<td class="date">
											<span class="bbs_info date">${noticeList.reg_date }</span>
										</td>
										<td class="view">
											<span class="bbs_info view">${noticeList.visited }</span>
										</td>
									</tr>
									</c:forEach>
									<!-- (게시물 없을 경우) -->
									<c:if test="${empty noticeList}">
										<td colspan="5" class="no_post">
											등록된 게시물이 없습니다.
										</td>
									</c:if>
								</tbody>
							</table>
						</div>
						<!-- board list -->
						<c:if test="${not empty noticeList}">
						<!-- pagination -->
						<div class="pagination">
							<!-- 맨처음 -->
							<c:if test="${maxPage eq 0}">
							<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
							</c:if>
							<c:if test="${maxPage > 0}">
							<a href="noticeList?page=1&keyWord=${keyWord}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
							</c:if>
							
							<!-- 이전 블럭으로 이동 -->
							<c:if test="${startPage gt 1 }">
		                       	<a href="noticeList?page=${startPage-1}&keyWord=${keyWord}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
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
		                      	<c:url var="noticeList" value="noticeList?keyWord=${keyWord}">
			 					<c:param name="page" value="${p}" />
			 					</c:url>
			 					<a href="${noticeList}" class="page_link">${p}</a>
		                      </c:if>
		                    </c:forEach>
		                    
		                    <!-- 다음 블럭으로 이동 -->
		                    <c:if test="${endPage ne maxPage && maxPage > 1}">
							<a href="noticeList?page=${endPage+1}&keyWord=${keyWord}" class="page_link ico next"><span class="blind">다음</span></a>
		                    </c:if>
		                    <c:if test="${endPage ge maxPage}">
							<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
		                    </c:if>
		                    
		                    <!-- 맨끝 -->
		                    <c:if test="${maxPage eq 0}">
		                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
		                    </c:if>
		                    <c:if test="${maxPage > 0}">
							<a href="noticeList?page=${maxPage}&keyWord=${keyWord}" class="page_link ico last"><span class="blind">마지막</span></a>
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
