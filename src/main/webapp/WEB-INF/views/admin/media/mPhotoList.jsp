<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=1270, initial-scale=1">
	<title>KCC EGIS 관리자</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/admin/assets/font/font.css" />
	<link rel="stylesheet" href="/resources/common/admin/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/admin/assets/css/subpage.css"> 
	
	<script src="/resources/common/admin/assets/js/jquery.nice-select.min.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/common.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/jquery-ui.min.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/script.js" defer></script> 
	<script src="/resources/common/admin/assets/js/jquery-3.6.0.min.js"></script>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-W384F33H');</script></head>
<body class="page-sub">
	<div id="wrap">
		<!-- skip navigation -->
		<nav id="accessibility">
			<h2 class="blind">컨텐츠 바로가기</h2>
			<ul>
				<li><a href="#nav">메뉴 바로가기</a></li>
				<li><a href="#con">본문 바로가기</a></li>
			</ul>
		</nav>

		<!-- header -->
		<app-header></app-header>
		<!-- //header -->
		<!-- container -->
		<div id="container" class="ly_container"> 
			<!-- aside -->
			<aside id="aside" class="ly_aside custom_scroll">
				<h3 class="aside_title">MEDIA</h3>
				
				<nav id="snb">
					<ul class="snb_list">
						<li><a href="mNewsList" class="snb_link">뉴스</a></li> <!-- 현재 페이지 메뉴 current -->
						<li><a href="mMovieList" class="snb_link ">영상</a></li>
						<li><a href="mPhotoList" class="snb_link current">사진</a></li>
						<li><a href="mGalleryList" class="snb_link">23-24시즌 이전 사진</a></li>
						<li><a href="mSearchWrite" class="snb_link">검색어 관리</a></li>
					</ul>
				</nav>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>
				<div class="page_header">
				<h3 class="heading">사진</h3>
				<p class="txt_md">총 게시물수: <span class="total">${totalListCount}</span></p>
				</div>
				<!-- search -->
				<div class="board_search">
					<form action="mPhotoList" class="search_group">
						<div class="forms frm_field">
							<div class="row">
								<div class="frm_group">
									<input type="text" class="frm_input sm w140 date" aria-label="시작 일" placeholder="기간 설정" name="sdate" id="sdate" value="${sdate}" readonly>
									<span class="dash">-</span>
									<input type="text" class="frm_input sm w140 date" aria-label="종료 일" placeholder="기간 설정" name="edate" id="edate" value="${edate}" readonly>
									<input type="text" class="frm_input sm" aria-label="검색어 입력" placeholder="검색어를 입력하세요." name="keyWord" id="keyWord" value="${keyWord}">
									<button type="button" class="el_btn frm_btn deep sm w100" onclick="resetSearch()">검색초기화</button>
								</div>
							</div>

							<div class="row">
								<div class="frm_group">
									<select class="frm_select sm m137" aria-label="라운드 선택" name="round" id="round">
										<option value="all" <c:if test="${round eq 'all'}">selected</c:if>>라운드 선택</option>
										<option value="1" <c:if test="${round eq '1'}">selected</c:if>>1라운드</option>
										<option value="2" <c:if test="${round eq '2'}">selected</c:if>>2라운드</option>
										<option value="3" <c:if test="${round eq '3'}">selected</c:if>>3라운드</option>
										<option value="4" <c:if test="${round eq '4'}">selected</c:if>>4라운드</option>
										<option value="5" <c:if test="${round eq '5'}">selected</c:if>>5라운드</option>
										<option value="6" <c:if test="${round eq '6'}">selected</c:if>>6라운드</option>
									</select>
									<select class="frm_select sm full" aria-label="경기 선택" name="game" id="game">
										<c:forEach items="${selectGame}" var="selectGame">
											<option value="${selectGame.gameCd}" <c:if test="${game eq selectGame.gameCd}">selected</c:if>>${selectGame.gameNm}</option>
										</c:forEach>
									</select>
									<select class="frm_select sm m153" aria-label="선수 선택" name="player" id="player">
										<c:forEach items="${selectPlayer}" var="selectPlayer">
											<option value="${selectPlayer.playerCd}" <c:if test="${player eq selectPlayer.playerCd}">selected</c:if>>${selectPlayer.playerNm}</option>
										</c:forEach>
									</select>
									<button class="el_btn frm_btn deep sm w100">검색</button>
								</div>
							</div>
						</div>

						<!-- 최대 9개 추출 -->
						<div class="tags">
							<c:forEach items="${searchKeywordList}" var="searchKeywordList">
								<a href="mPhotoList?keyWord=${searchKeywordList.search_keyword}" class="tag"><span>#${searchKeywordList.search_keyword}</span></a>
							</c:forEach>
						</div>
					</form>
				</div>
				<!-- //search -->
				<!-- tabs -->
				<div class="page_tabs mt20" id="tabs">
					<a href="mPhotoList?keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}" class="tab active" id="all">전체</a> <!-- 활성화탭 active -->
					<a href="mPhotoList?etc1=H&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}" class="tab" id="H">경기</a>
					<a href="mPhotoList?etc1=E&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}" class="tab" id="E">이벤트</a>
				</div>
				<!-- // tabs -->
				<!-- board list -->
				<ul class="board_list type1 mt30">
					<c:forEach items="${photoList}" var="photoList">
					<li class="item">
						<div class="bbs_box">
							<a href="mPhotoWrite?num=${photoList.num }">
								<div class="thumb">
									<c:if test="${photoList.img1 != null && photoList.img1 != ''}">
										<img src="/resources/common/images/upload/gallery/${photoList.img1 }" alt="" >
									</c:if>
									<c:if test="${photoList.img1 == null || photoList.img1 == ''}">
										<img src="/resources/common/admin/images/common/no_img.jpg" alt="" class="no_img"> <!-- 대체이미지 -->
									</c:if>
								</div>
								<p class="tit">${photoList.subject}</p>
							</a>
							<p class="info">
								<span class="date">${photoList.wdateformat}</span>
								<span class="view">${photoList.visited }</span>
							</p>
						</div>
					</li>
					</c:forEach>
					<c:if test="${empty photoList}">
						<li class="item">검색된 결과가 없습니다.</li>
					</c:if>
				</ul>
				<!-- //board list -->
				<c:if test="${not empty photoList}">
				<!-- pagination -->
				<div class="pagination mt20">
					<!-- 맨처음 -->
					<c:if test="${maxPage eq 0}">
					<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					<c:if test="${maxPage > 0}">
					<a href="mPhotoList?page=1&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					
					<!-- 이전 블럭으로 이동 -->
					<c:if test="${startPage gt 1 }">
                       	<a href="mPhotoList?page=${startPage-1}&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
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
                      	<c:url var="mPhotoList" value="mPhotoList?&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}">
	 					<c:param name="page" value="${p}" />
	 					</c:url>
	 					<a href="${mPhotoList}" class="page_link">${p}</a>
                      </c:if>
                    </c:forEach>
                    
                    <!-- 다음 블럭으로 이동 -->
                    <c:if test="${endPage ne maxPage && maxPage > 1}">
					<a href="mPhotoList?page=${endPage+1}&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}" class="page_link ico next"><span class="blind">다음</span></a>
                    </c:if>
                    <c:if test="${endPage ge maxPage}">
					<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
                    </c:if>
                    
                    <!-- 맨끝 -->
                    <c:if test="${maxPage eq 0}">
                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
                    </c:if>
                    <c:if test="${maxPage > 0}">
					<a href="mPhotoList?page=${maxPage}&keyWord=${keyWord}&sdate=${sdate}&edate=${edate}&round=${round}&game=${game}&player=${player}" class="page_link ico last"><span class="blind">마지막</span></a>
					</c:if>
				</div>
				<!-- // pagination -->
				</c:if>
				<div class="btn_area mt40">
					<a href="mPhotoWrite" class="el_btn md line">등록</a>
				</div>
			
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

	</div>
	<script>
	var etc1 = "${etc1}"
	if(etc1 != ""){
		$("#tabs").find("a").removeClass('active');
		$("#"+etc1).addClass('active');
	}
</script>
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