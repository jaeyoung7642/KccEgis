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
			<aside id="aside" class="ly_aside">
				<div class="aside_inner custom_scroll">
					<h3 class="aside_title">ETC</h3>
					<nav id="snb">
						<ul class="snb_list">
							<li><a href="ePopupList" class="snb_link">팝업</a></li> <!-- 현재 페이지 메뉴 current -->
							<li><a href="eMainSlideList" class="snb_link">메인슬라이드 관리</a></li>
							<li><a href="eMainGoodsList" class="snb_link current">메인굿즈 관리</a></li>
							<!-- <li><a href="eProposalList" class="snb_link">건의하기</a></li> -->
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<div class="page_header">
					<h3 class="heading">메인 굿즈 관리</h3>
					<p class="txt_md">총 게시물수: <span class="total">${totalListCount}</span></p>
				</div>
				<!-- tabs -->
				<div class="page_tabs" id="tabs">
					<a href="eMainGoodsList?category=C" class="tab active" id="C">일반</a> <!-- 활성화탭 active -->
					<a href="eMainGoodsList?category=B" class="tab" id="B">베스트</a>
				</div>
				<!-- // tabs -->
				<!-- board list -->
				<table class="tbl type2 mt20">
					<caption>메인굿즈 관리</caption>
					<colgroup>
						<col width="50">
						<col width="130">
						<col width="370">
						<col width="80">
						<col width="160">
						<col width="80">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">썸네일</th>
							<th scope="col">제목</th>
							<th scope="col">가격</th>
							<th scope="col">등록일시</th>
							<th scope="col">출력여부</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${mainGoodsList}" var="mainGoodsList">
						<c:if test="${mainGoodsList.show_yn == 'Y'}">
							<tr class="point">
						</c:if>
						<c:if test="${mainGoodsList.show_yn == 'N'}">
							<tr>
						</c:if>
							<td>${mainGoodsList.num}</td>
							<td>
								<c:if test="${mainGoodsList.goods_img != null && mainGoodsList.goods_img != ''}">
									<a href="eMainGoodsWrite?num=${mainGoodsList.num }"><img src="/resources/common/images/upload/main_goods/${mainGoodsList.goods_img }" alt="" width="100" height="100"></a>
								</c:if>
								<c:if test="${mainGoodsList.goods_img == null || mainGoodsList.goods_img == ''}">
									<a href="eMainGoodsWrite?num=${mainGoodsList.num }"><img src="/resources/common/admin/images/common/no_img.jpg" alt="" class="no_img" width="100" height="100"></a> <!-- 대체이미지 -->
								</c:if>
							</td>
							<td style="text-align: left;"><a href="eMainGoodsWrite?num=${mainGoodsList.num }">${mainGoodsList.goods_nm}</a></td>
							<td>${mainGoodsList.goods_price}</td>
							<td>${mainGoodsList.wdate}</td>
							<td>
								<c:if test="${mainGoodsList.show_yn == 'Y'}">출력(${mainGoodsList.view_order})</c:if>
								<c:if test="${mainGoodsList.show_yn == 'N'}">미출력</c:if>
							</td>
							<td><button type="button" class="" onclick="deleteMainGoods(${mainGoodsList.num })">삭제</button></td>
						</tr>
					</c:forEach>
					<c:if test="${empty mainGoodsList}">
							<tr><td colspan="7">검색된 결과가 없습니다.</td></tr>
					</c:if>
					</tbody>
				</table>
				<!-- //board list -->
				<c:if test="${not empty mainGoodsList}">
				<!-- pagination -->
				<div class="pagination mt20">
					<!-- 맨처음 -->
					<c:if test="${maxPage eq 0}">
					<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					<c:if test="${maxPage > 0}">
					<a href="eMainGoodsList?page=1&category=${category}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
					</c:if>
					
					<!-- 이전 블럭으로 이동 -->
					<c:if test="${startPage gt 1 }">
                       	<a href="eMainGoodsList?page=${startPage-1}&category=${category}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
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
                      	<c:url var="eMainGoodsList" value="eMainGoodsList?category=${category}">
	 					<c:param name="page" value="${p}" />
	 					</c:url>
	 					<a href="${eMainGoodsList}" class="page_link">${p}</a>
                      </c:if>
                    </c:forEach>
                    
                    <!-- 다음 블럭으로 이동 -->
                    <c:if test="${endPage ne maxPage && maxPage > 1}">
					<a href="eMainGoodsList?page=${endPage+1}&category=${category}" class="page_link ico next"><span class="blind">다음</span></a>
                    </c:if>
                    <c:if test="${endPage ge maxPage}">
					<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
                    </c:if>
                    
                    <!-- 맨끝 -->
                    <c:if test="${maxPage eq 0}">
                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
                    </c:if>
                    <c:if test="${maxPage > 0}">
					<a href="eMainGoodsList?page=${maxPage}&category=${category}" class="page_link ico last"><span class="blind">마지막</span></a>
					</c:if>
				</div>
				<!-- // pagination -->
				</c:if>
				<div class="btn_area mt40"> 
					<a href="eMainGoodsWrite" class="el_btn md line">등록</a>
				</div>
			
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

	</div>
		<script>
	var category = "${category}"
	if(category != ""){
		$("#tabs").find("a").removeClass('active');
		$("#"+category).addClass('active');
	}
</script>
</body>
</html>