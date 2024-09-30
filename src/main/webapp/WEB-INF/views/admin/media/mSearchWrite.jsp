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
	<script>
	$(function() {
		var listCount = $("#listCount").val();
		var appendCnt = 9-listCount;
		var html = '<tr><td class="num"><input type="number" name="orders" class="frm_input numbox type2"></td><td>'
		+'<div class="frm_group gap3"><input type="text" name="keywords" class="frm_input w150">'
		+'<button type="button" class="el_btn remove2" aria-label="삭제" onclick="removeKeyword(this)"></button></div></td></tr>';
		for(var i=0;i<appendCnt;i++){
			$("#searchKeywordTable").append(html);
		}		
		});
	function removeKeyword(str){
		$(str).parents(".frm_group").find("input").val("");
	}
	
	</script>
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
						<li><a href="mMovieList" class="snb_link">영상</a></li>
						<li><a href="mPhotoList" class="snb_link">사진</a></li>
						<li><a href="mGalleryList" class="snb_link">23-24시즌 이전 사진</a></li>
						<li><a href="mSearchWrite" class="snb_link current">검색어 관리</a></li>
					</ul>
				</nav>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">검색어 관리</h3>
				<input type="hidden" id="listCount" value="${listCount}">
				<form action="mergeSearchKeyword" method="post">
					<div class="board_write">
						<table class="tbl type1">
							<caption>검색어 관리 테이블</caption>
							<colgroup>
								<col width="70">
								<col>
							</colgroup>
							<tbody id="searchKeywordTable">
								<c:forEach items="${searchKeywordList}" var="searchKeywordList">
								<tr>
									<td class="num">
										<input type="number" name="orders" class="frm_input numbox type2" value="${searchKeywordList.view_order }">
									</td>
									<td>
										<div class="frm_group gap3">
											<input type="text" name="keywords" class="frm_input w150" value="${searchKeywordList.search_keyword }">
											<button type="button" class="el_btn remove2" aria-label="삭제" onclick="removeKeyword(this)"></button>
										</div>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
			
					<div class="btn_area mt40">
						<button class="el_btn md line">확인</button>
						<button type="button" class="el_btn md line" onclick="location.reload()">취소</button>
					</div>
				</form>
			
			</main>
			<%-- <main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">검색어 관리</h3>

				<form action="updateSearchKeyword" method="post">
					<table class="tbl type4">
						<caption>검색어 관리 테이블</caption>
						<colgroup>
							<col width="120">
							<col width="276">
							<col width="276">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">검색어</th>
								<td>
									<div class="keywords">
										<c:forEach items="${searchKeywordList}" var="searchKeywordList">
										<span class="item">
											<span class="txt">${searchKeywordList.search_keyword}</span>
											<input type="hidden" name="searchKeyword" value="${searchKeywordList.search_keyword}">
											<button type="button" class="el_btn remove2" aria-label="삭제" onclick="keywordRemove(${searchKeywordList.num})"></button>
										</span>
										</c:forEach>
									</div>
								</td>
								<td>
									<input type="text" class="frm_input sm" aria-label="검색어 입력" placeholder="검색어를 입력하세요." id="keyword">
									<div class="btn_area rt mt10">
										<button type="button" class="el_btn frm_btn line gray" onclick="keywordAppend()">추가</button>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			
			</main> --%>
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