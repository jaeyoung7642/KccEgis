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
				<h3 class="aside_title">CLUB</h3>
				
				<nav id="snb">
					<ul class="snb_list">
						<li><a href="cKccAdList" class="snb_link current">KCC광고</a></li> <!-- 현재 페이지 메뉴 current -->
					</ul>
				</nav>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>
				<div class="page_header">
				<h3 class="heading">KCC광고</h3>
				<p class="txt_md">총 게시물수: <span class="total">${totalListCount}</span></p>

				<!-- search -->
					<form action="cKccAdList" class="forms frm_group">
						<select class="frm_select sm m140" aria-label="검색 구분" name="select">
							<option value="all" <c:if test="${select eq 'all'}">selected</c:if>>계열사</option>
							<option value="미출력" <c:if test="${select eq '미출력'}">selected</c:if>>미출력</option>
							<option value="기업PR" <c:if test="${select eq '기업PR'}">selected</c:if>>기업PR</option>
							<option value="KCC창호" <c:if test="${select eq 'KCC창호'}">selected</c:if>>KCC창호</option>
							<option value="숲으로" <c:if test="${select eq '숲으로'}">selected</c:if>>숲으로</option>
							<option value="HOMECC" <c:if test="${select eq 'HOMECC'}">selected</c:if>>HOMECC</option>
							<option value="KCC건설 스위첸" <c:if test="${select eq 'KCC건설 스위첸'}">selected</c:if>>KCC건설 스위첸</option>
						</select>

						<input type="text" class="frm_input sm m240" aria-label="검색어 입력" name="keyWord" placeholder="검색어를 입력하세요." value="${keyWord}">
						<button class="el_btn frm_btn deep sm w100">검색</button>
					</form>
					<!-- //search -->
				</div>
				<!-- board list -->
				<ul class="board_list type1 mt30">
					<c:forEach items="${cKccAdList}" var="cKccAdList">
					<li class="item">
						<div class="bbs_box">
							<a href="cKccAdWrite?num=${cKccAdList.num }">
								<div class="thumb">
									<c:if test="${cKccAdList.thumbnail != null && cKccAdList.thumbnail != '' }">
										<img src="/resources/common/images/upload/kccad/${cKccAdList.thumbnail }" alt="" >
									</c:if>
									<c:if test="${cKccAdList.thumbnail == null || cKccAdList.thumbnail == ''}">
										<img src="/resources/common/admin/images/common/no_img.jpg" alt="" class="no_img"> <!-- 대체이미지 -->
									</c:if>
								</div>
									<p class="tit">[${cKccAdList.adgroup}] ${cKccAdList.title}</p>
							</a>
							<p class="info">
								<span class="date">${cKccAdList.regdate}</span>
							</p>
						</div>
					</li>
					</c:forEach>
					<c:if test="${empty cKccAdList}">
						<li class="item">검색된 결과가 없습니다.</li>
					</c:if>
				</ul>
				<!-- //board list -->

				<!-- pagination -->
				<c:if test="${not empty cKccAdList}">
				<div class="pagination mt20">
					<!-- 맨처음 -->
					<c:if test="${maxPage eq 0}">
					<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					<c:if test="${maxPage > 0}">
					<a href="cKccAdList?page=1&keyWord=${keyWord}&select=${select}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					
					<!-- 이전 블럭으로 이동 -->
					<c:if test="${startPage gt 1 }">
                       	<a href="cKccAdList?page=${startPage-1}&keyWord=${keyWord}&select=${select}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
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
                      	<c:url var="cKccAdList" value="cKccAdList?&keyWord=${keyWord}&select=${select}">
	 					<c:param name="page" value="${p}" />
	 					</c:url>
	 					<a href="${cKccAdList}" class="page_link">${p}</a>
                      </c:if>
                    </c:forEach>
                    
                    <!-- 다음 블럭으로 이동 -->
                    <c:if test="${endPage ne maxPage && maxPage > 1}">
					<a href="cKccAdList?page=${endPage+1}&keyWord=${keyWord}&select=${select}" class="page_link ico next"><span class="blind">다음</span></a>
                    </c:if>
                    <c:if test="${endPage ge maxPage}">
					<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
                    </c:if>
                    
                    <!-- 맨끝 -->
                    <c:if test="${maxPage eq 0}">
                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
                    </c:if>
                    <c:if test="${maxPage > 0}">
					<a href="cKccAdList?page=${maxPage}&keyWord=${keyWord}&select=${select}" class="page_link ico last"><span class="blind">마지막</span></a>
					</c:if>
				</div>
				<!-- // pagination -->
				</c:if>
				<div class="btn_area mt40">
					<a href="cKccAdWrite" class="el_btn md line">글쓰기</a>
				</div>
			
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

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