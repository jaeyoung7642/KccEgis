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
	<title>KCC EGIS</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />

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
	function searchval(){
		var titleChecked = document.getElementById('title').checked;
	    var contentChecked = document.getElementById('content').checked;
	    var writerChecked = document.getElementById('writer').checked;
	    var tailChecked = document.getElementById('tail').checked;
	    var tailWriterChecked = document.getElementById('tailWriter').checked;
	    var form = $("#freeSearchForm");
	    if(!titleChecked && !contentChecked && !writerChecked && !tailChecked && !tailWriterChecked){
	    	alert('검색항목을 한개 이상 체크해주세요.');
	    }else{
	    	form.submit();
	    }
	}
	function loginForm(){
		if(confirm("로그인 후 글작성이 가능합니다. 로그인 하시겠습니까?")){
			location.href = "/loginForm";
		}
	}
	function freeWrite(){
		location.href = "/freeWriteForm";
	}
	function resetSearch() {
		// 오늘 날짜 계산
	    var today = new Date();
	    var yearAgo = new Date();
	    
	    // 1년 전 날짜 계산
	    yearAgo.setFullYear(today.getFullYear() - 1);

	    // 날짜 형식 맞추기 (YYYY-MM-DD)
	    var todayFormatted = today.toISOString().split('T')[0];
	    var yearAgoFormatted = yearAgo.toISOString().split('T')[0];

	    // sdate는 1년 전 날짜로, edate는 오늘 날짜로 설정
	    document.getElementById("sdate").value = yearAgoFormatted;
	    document.getElementById("edate").value = todayFormatted;

	    // 검색어 초기화
	    document.getElementById("keyWord").value = "";

	    // 체크박스 초기화
	    document.getElementById("title").checked = false;
	    document.getElementById("content").checked = false;
	    document.getElementById("writer").checked = false;
	    document.getElementById("tail").checked = false;
	    document.getElementById("tailWriter").checked = false;
		customSelect();
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
		<main id="container" class="ly_container fanzone">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>FANZONE</li>
						<li>팬게시판</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">FANZONE</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="noticeList" class="swiper-slide snb_link"><span>공지사항</span></a> 
								<a href="freeList" class="swiper-slide snb_link current"><span>팬게시판</span></a> <!-- 해당페이지에 current 추가 -->
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
					<div class="search_box type3 lg">
						<form action="freeList" class="search_box_form" id="freeSearchForm">
							<div class="row">
								<div class="col grow col_date frm_date_wrap">
									<span class="frm_date">
										<input type="text" class="frm_input mdm date" aria-label="시작 일" placeholder="기간 설정" name="sdate" id="sdate" value="${sdate}" readonly>
									</span>
									<span class="txt"><span>-</span></span>
									<span class="frm_date rt">
										<input type="text" class="frm_input mdm date rt" aria-label="종료 일" name="edate" id="edate" value="${edate}" readonly>
									</span>
								</div>
								<div class="col shrink radios">
									<label class="frm_checkbox type1 md">
										<input type="checkbox" id="title" name="title" value="Y" <c:if test="${title=='Y' }">checked</c:if>>
										<span>제목</span>
									</label>
									<label class="frm_checkbox type1 md">
										<input type="checkbox" id="content" name="content" value="Y" <c:if test="${content=='Y' }">checked</c:if>>
										<span>내용</span>
									</label>
									<label class="frm_checkbox type1 md">
										<input type="checkbox" id="writer" name="writer" value="Y" <c:if test="${writer=='Y' }">checked</c:if>>
										<span>작성자</span>
									</label>
									<label class="frm_checkbox type1 md">
										<input type="checkbox" id="tail" name="tail" value="Y" <c:if test="${tail=='Y' }">checked</c:if>>
										<span>댓글</span>
									</label>
									<label class="frm_checkbox type1 md">
										<input type="checkbox" id="tailWriter" name="tailWriter" value="Y" <c:if test="${tailWriter=='Y' }">checked</c:if>>
										<span>댓글작성자</span>
									</label> 
								</div>

								<div class="col shrink pmax484">
									<input type="text" class="frm_input mdm" aria-label="검색" placeholder="검색어 " id="keyWord" name="keyWord" value="${keyWord}">
									<button type="button" class="el_btn frm_btn black mdm shrink" onclick="searchval()">검색</button>
									<a href="#" class="el_btn refresh" onclick="resetSearch()" aria-label="새로고침"></a>
								</div>
							</div>
						</form>
					</div>
					<!-- date picker 사용시 -->
						<script src="/resources/common/assets/js/jquery-ui.min.js" defer></script>
						<script defer>
							$(function() {
								datePicker();
							});
						</script>
					<!-- 검색 -->

				<!-- 	<ul class="el_desc_list mt10 pml17">
						<li>팬게시판 성향과 어긋나거나 부적절한 게시물의 경우를 대비하여 회원 신고제도를 도입하였습니다.</li>
						<li>특정 대상 게시물이 총 5회 신고될 경우, 해당 게시물은 자동 블록 처리되어 내용 확인이 불가능합니다.</li>
						<li>신고는 회원 계정당 1회만 가능하며, 무분별한 신고 사례는 검증 후 불이익을 받으실 수 있사오니 유의하여 주시길 바랍니다.</li>
					</ul> -->
					

					<!-- 게시판 리스트 -->
					<article class="mt20 mt30m">
						<!-- board list -->
						<div class="bbs_list_tbl">
							<table>
								<caption>팬게시판 목록</caption>
								<colgroup>
									<col class="num">
									<col class="tit">
									<col class="name">
									<col class="date">
									<col class="view">
								</colgroup>
								<thead class="blind">
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">날짜</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${topFreeList}" var="topFreeList">
									<tr class="notice"> <!-- 공지사항 notice 클래스 추가 -->
										<td class="num">공지</td>
										<td class="tit">
											<div class="tit_inner">
												<a href="freeListDetail?num=${topFreeList.num}&listpage=${currentPage}&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}" class="tit_link">
													<span class="tit_txt txt_line1-2">${topFreeList.subject }</span>
												</a>
												<c:if test="${topFreeList.tail_count != '0' }">
												<span class="count">[${topFreeList.tail_count }]</span>
												</c:if> 
											</div>
										</td>
										<td class="name">${topFreeList.writer }</td>
										<td class="date">
											<span class="bbs_info date">${topFreeList.reg_date }</span>
										</td>
										<td class="view">
											<span class="bbs_info view">${topFreeList.visited }</span>
										</td>
									</tr>
								</c:forEach>
								<c:forEach items="${freeList}" var="freeList">
									<tr>
										<td class="num">${freeList.rownum}</td>
										<td class="tit">
											<div class="tit_inner">
												<a href="freeListDetail?num=${freeList.num}&listpage=${currentPage}&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}" class="tit_link">
													<span class="tit_txt txt_line1-2">${freeList.subject }</span>
												</a>
												<c:if test="${freeList.tail_count != '0' }">
												<span class="count">[${freeList.tail_count }]</span>
												</c:if> 
											</div>
										</td>
										<c:if test="${freeList.writer =='KCC농구단'}">
											<td>${freeList.writer}</td>
										</c:if>
										<c:if test="${freeList.writer !='KCC농구단'}">
											<td class="name">${freeList.writer2 }</td>
										</c:if>
										<td class="date">
											<span class="bbs_info date">${freeList.reg_date }</span>
										</td>
										<td class="view">
											<span class="bbs_info view">${freeList.visited }</span>
										</td>
									</tr>
								</c:forEach>
									<!-- <tr>
										<td class="num">97938</td>
										<td class="tit">
											<div class="tit_inner">
												<a href="#" class="tit_link">
													<span class="tit_txt txt_line1-2 reply">오늘 결정 나긋죠?</span> 답변글은 reply 클래스 추가
												</a>
											</div>
										</td>
										<td class="name">이승</td>
										<td class="date">
											<span class="bbs_info date">2024.03.26</span>
										</td>
										<td class="view">
											<span class="bbs_info view">38</span>
										</td>
									</tr> -->
								<!-- 	<tr class="block">
										<td class="num">97938</td>
										<td class="tit" colspan="4">
											해당 게시물은 사용자 신고에 의해 블록 처리되었습니다.
										</td>
									</tr> -->
									<!-- (게시물 없을 경우) -->
									<c:if test="${empty freeList}">
									<tr>
										<td colspan="5" class="no_post">
											등록된 게시물이 없습니다.
										</td>
									</tr>
									</c:if>
								</tbody>
							</table>
						</div>
						<!-- board list -->
						<div class="gird_footer_type1">
							<div class="btn_area g_btns">
								<c:if test="${loginUserMap != null}">
								<a href="#" class="el_btn frm_btn blue" onclick="freeWrite()">등록</a>
								</c:if>
								<c:if test="${loginUserMap == null}">
								<a href="#" class="el_btn frm_btn blue" onclick="loginForm()">등록</a>
								</c:if>
							</div>
							<c:if test="${not empty freeList}">
						<!-- pagination -->
						<div class="pagination g_page">
							<!-- 맨처음 -->
							<c:if test="${maxPage eq 0}">
							<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
							</c:if>
							<c:if test="${maxPage > 0}">
							<a href="freeList?page=1&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
							</c:if>
							
							<!-- 이전 블럭으로 이동 -->
							<c:if test="${startPage gt 1 }">
		                       	<a href="freeList?page=${startPage-1}&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
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
		                      	<c:url var="freeList" value="freeList?keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}">
			 					<c:param name="page" value="${p}" />
			 					</c:url>
			 					<a href="${freeList}" class="page_link">${p}</a>
		                      </c:if>
		                    </c:forEach>
		                    
		                    <!-- 다음 블럭으로 이동 -->
		                    <c:if test="${endPage ne maxPage && maxPage > 1}">
							<a href="freeList?page=${endPage+1}&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}" class="page_link ico next"><span class="blind">다음</span></a>
		                    </c:if>
		                    <c:if test="${endPage ge maxPage}">
							<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
		                    </c:if>
		                    
		                    <!-- 맨끝 -->
		                    <c:if test="${maxPage eq 0}">
		                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
		                    </c:if>
		                    <c:if test="${maxPage > 0}">
							<a href="freeList?page=${maxPage}&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}" class="page_link ico last"><span class="blind">마지막</span></a>
							</c:if>
						</div>
						<!-- // pagination -->
						</c:if>
						</div>
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
</body>
</html>