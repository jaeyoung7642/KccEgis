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
	<meta property="og:title" content="팬게시판 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>팬게시판 : KCC이지스 프로농구단</title>
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
	<script src="/resources/common/assets/js/snsShare.js" defer></script> <!-- 개발용 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="/resources/common/assets/js/gsap.min.js" defer></script> <!-- main only -->
	<script src="/resources/common/assets/js/ScrollTrigger.min.js" defer></script> <!-- main only -->
	<script>
	window.onload = function() {
		var titleChecked = document.getElementById('title').checked;
	    var contentChecked = document.getElementById('content').checked;
	    var writerChecked = document.getElementById('writer').checked;
	    var tailChecked = document.getElementById('tail').checked;
	    var tailWriterChecked = document.getElementById('tailWriter').checked;
		if(!titleChecked && !contentChecked && !writerChecked && !tailChecked && !tailWriterChecked){
			document.getElementById("title").checked = true;
	    }
    }
	function contentPage(page){
		var num = $("#num").val();
		$.ajax({
   			type:'Get',
   			data : {
   					"num" : num,
   					"page" : page
					},
   			url: 'contentPageFree',
   			success:function(result){
   				$('#contentPageArea').html(result);
   			 // contentPageArea의 높이를 구한 후 스크롤 이동
   	         	scrollTarget('#tailfocus');
/* 
   	            var contentPageArea = document.getElementById('tailfocus');
	                // contentPageArea의 높이 구하기
	                var contentPageAreaHeight = contentPageArea.offsetTop + 280;
  	                
  	                // 페이지를 contentPageArea 위치로 스크롤하고 tailfocus 위치로 부드럽게 이동
  	                window.scrollTo({
  	                    top: contentPageAreaHeight,  // contentPageArea까지의 높이만큼 스크롤
  	                    behavior: 'smooth'           // 부드럽게 스크롤
  	                }); */
   	         },
   	         error:function(){
   	            alert('서버에 문제가 있습니다.');
   	         }
   		});//ajax
		
	}
	function contentWrite(){
		var num = $("#num").val();
		var content = $("#content").val();
		if(content ==""){
			alertPop("댓글을 입력해주세요.");
			return;
		}else{
			$.ajax({
			   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
			        url : "/contentWriteFree",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "content":content,
			       	 "num" : num
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				        if(res==1){
				        	contentPage(1);
				        }else{
				        	alertPop("댓글 작성에 실패했습니다.");
				        }
			        },
			        error: function() {
						alert("서버에 문제가있습니다.");
					}
			   });
		}
	}
	function contentDelete(num){
		if (confirm("정말 삭제 하시겠습니까?") == true) {
	        	$.ajax({
			   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
			        url : "/contentDeleteFree",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "num":num
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				        if(res==1){
				        	contentPage(1);
				        }else{
				        	alertPop("삭제에 실패했습니다.");
				        }
			        },
			        error: function() {
						alert("서버에 문제가 있습니다.");
					}
			   });
	            
	        } else {

	            return;
	        }
		}
	function free_delete(num){
		if (confirm("정말 삭제 하시겠습니까?") == true) {
	        	$.ajax({
			   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
			        url : "/freeDelete",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "num":num
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				        if(res==1){
				        	location.href="/freeList";
				        }else{
				        	alertPop("삭제에 실패했습니다.");
				        }
			        },
			        error: function() {
						alert("서버에 문제가있습니다.");
					}
			   });
	            
	        } else {

	            return;
	        }
		}
	function handleKeyPress(event) {
	    if (event.key === 'Enter') {
	        // Enter 키가 눌렸을 때 searchval 함수 호출
	        searchval();
	    }
	}
	function searchval(){
		var form = $("#freeSearchForm");
		form.submit();
    	$("body").append('<div class="loading"><span class="loading_box"></span></div>');
		/* var titleChecked = document.getElementById('title').checked;
	    var contentChecked = document.getElementById('content').checked;
	    var writerChecked = document.getElementById('writer').checked;
	    var tailChecked = document.getElementById('tail').checked;
	    var tailWriterChecked = document.getElementById('tailWriter').checked;
	    var keyWord = document.getElementById('keyWord').value;
	    var form = $("#freeSearchForm");
	    if(titleChecked || contentChecked || writerChecked || tailChecked || tailWriterChecked){
	    	if (keyWord.length < 2) {
	            alertPop('검색어는 2글자 이상 입력해주세요.');
	            return false;
	        }
	    }
	    if(keyWord != ''){
		    if(!titleChecked && !contentChecked && !writerChecked && !tailChecked && !tailWriterChecked){
		    	alertPop('검색항목을 한개 이상 체크해주세요.');
		    	return false;
		    }else{
		    	form.submit();
		    	$("body").append('<div class="loading"><span class="loading_box"></span></div>');
		    }
	    }else{
	    	form.submit();
	    	$("body").append('<div class="loading"><span class="loading_box"></span></div>');
	    } */
	}
	function freeWrite(){
		location.href = "/freeWriteForm";
	}
	function resetSearch() {
		// 오늘 날짜 계산
	 /*    var today = new Date();
	    var yearAgo = new Date();
	    
	    // 1년 전 날짜 계산
	    yearAgo.setFullYear(today.getFullYear() - 1);

	    // 날짜 형식 맞추기 (YYYY-MM-DD)
	    var todayFormatted = today.toISOString().split('T')[0];
	    var yearAgoFormatted = yearAgo.toISOString().split('T')[0];

	    // sdate는 1년 전 날짜로, edate는 오늘 날짜로 설정
	    document.getElementById("sdate").value = yearAgoFormatted;
	    document.getElementById("edate").value = todayFormatted; */

	    // 검색어 초기화
	    document.getElementById("keyWord").value = "";

	    // 체크박스 초기화
	    document.getElementById("title").checked = true;
	    document.getElementById("content").checked = false;
	    document.getElementById("writer").checked = false;
	    document.getElementById("tail").checked = false;
	    document.getElementById("tailWriter").checked = false;
		customSelect();
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

			<!-- 게시판 상세페이지 -->
			<section class="section board_view">
				<div class="ly_inner md">
					<!-- board header -->
					<div class="board_view_header">
						<div class="inner">
							<h4 class="subject">${freeDetail.subject}</h4>
							<input type="hidden" id="num" value="${freeDetail.num}">
							<input type="hidden" id="shareTitle" value="${freeDetail.subject}">
							<input type="hidden" id="shareImg" value="/resources/common/images/common/logo.svg">
							<input type="text" id="Url" value="" style="position: absolute; top: 0; left: 0; width: 1px; height: 1px; border: 0; padding: 0; opacity: 0;" readonly>
						</div>
						<div class="bbs_info_wrap md">
							<dl class="info">
								<dt>작성자</dt>
								<c:if test="${freeDetail.writer =='KCC농구단'}">
								<dd><strong>${freeDetail.writer}</strong></dd>
								</c:if>
								<c:if test="${freeDetail.writer !='KCC농구단'}">
								<dd><strong>${freeDetail.writer2}</strong>(${freeDetail.id2})</dd>
								</c:if>
							</dl>
							<span class="bbs_info date">${freeDetail.reg_date}</span>
							<span class="bbs_info view">${freeDetail.visited}</span>

							<div class="dropdown sns_share">
								<button type="button" class="drop_btn el_btn btn_share" aria-expanded="false" aria-label="SNS 공유 리스트"></button>
								<div class="drop_content bubble">
									<div class="inner">
										<a href="#" class="el_btn share kakao" devSnsShare="kakaotalk"><span class="blind">카카오톡</span></a>
										<a href="#" class="el_btn share facebook" devSnsShare="facebook"><span class="blind">페이스북</span></a>
										<a href="#" class="el_btn share X" devSnsShare="twitter"><span class="blind">X</span></a>
										<a href="#" class="el_btn share link" devSnsShare="url-copy"><span class="blind">링크</span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- //board header -->

					<!-- board content -->
					<div class="board_view_content">
						<div class="inner">
								
							<!-- detail -->
							<article class="board_view_detail">${freeDetail.content}</article>
							<!-- //detail -->

							<!-- 첨부파일 -->
							<!-- <article class="board_view_file">
								<p class="tit">첨부파일</p>
								
								<div class="file_list">
									<a href="#" class="download">PO기념 티셔츠_단체 주문 신청서.docx</a>
								</div>
							</article> -->
							<!-- //첨부파일 -->
							<!-- comment -->
							<article class="board_view_comment" id="contentPageArea">
								<div class="inputs">
									<c:if test="${loginUserMap != null}">
									<textarea class="frm_input" id="content" placeholder="공개된 댓글에 개인정보 노출은 자제를 부탁드립니다." data-lenis-prevent></textarea>
									<button type="button" onclick="contentWrite()" class="el_btn frm_btn black">댓글 작성</button>
									</c:if>
									<c:if test="${loginUserMap == null}">
									<textarea class="frm_input" placeholder="로그인 후 댓글 입력이 가능합니다.&#13;공개된 댓글에 개인정보 노출은 자제를 부탁드립니다." data-lenis-prevent></textarea>
									<button type="button" data-target="#loginForm" class="el_btn frm_btn black openModal">댓글 작성</button>
									</c:if>
								</div>
								<c:if test="${not empty tailList}">
								<div class="anchor_wrap">
									<span class="anchor type2" id="tailfocus"></span>
								</div>
								<h5 class="tit">댓글</h5>
								<div class="comments">
									<c:forEach items="${tailList}" var="tailList">
									<!-- row -->
									<div class="row">
										<div class="cont">${tailList.content}</div>  <!-- 줄바꿈 없이 데이터 넣기 -->
										<div class="info">
											<c:if test="${tailList.writer =='KCC농구단'}">
											<span class="name"><strong>${tailList.writer }</strong></span>
											</c:if>
											<c:if test="${tailList.writer !='KCC농구단'}">
											<span class="name"><strong>${tailList.writer2 }</strong>(${tailList.id2 })</span>
											</c:if>
											<span class="date">${tailList.formatted_date }</span>
											<span class="time">${tailList.formatted_time }</span>
										</div>
										<c:if test="${loginUserMap.id == tailList.id}">
										<div class="btns"> <!-- 본인 댓글에만 삭제버튼 노출 -->
											<button type="button" class="el_btn delete" aria-label="삭제" onclick="contentDelete(${tailList.num})"></button>
										</div>
										</c:if>
									</div>
									</c:forEach>
									<!-- //row -->
								</div>
								<!-- pagination -->
								<div class="pagination">
								<!-- 맨처음 -->
								<c:if test="${maxPage eq 0}">
								<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
								</c:if>
								<c:if test="${maxPage > 0}">
								<a href="#" onclick="contentPage(1)" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
								</c:if>
								
								<!-- 이전 블럭으로 이동 -->
								<c:if test="${startPage gt 1 }">
			                       	<a href="#" onclick="contentPage(${startPage-1})" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
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
				 					<a href="#" onclick="contentPage(${p})" class="page_link">${p}</a>
			                      </c:if>
			                    </c:forEach>
			                    
			                    <!-- 다음 블럭으로 이동 -->
			                    <c:if test="${endPage ne maxPage && maxPage > 1}">
								<a href="#" onclick="contentPage(${endPage+1})" class="page_link ico next"><span class="blind">다음</span></a>
			                    </c:if>
			                    <c:if test="${endPage ge maxPage}">
								<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
			                    </c:if>
			                    <!-- 맨끝 -->
			                    <c:if test="${maxPage eq 0}">
			                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
			                    </c:if>
			                    <c:if test="${maxPage > 0}">
								<a href="#" onclick="contentPage(${maxPage})" class="page_link ico last"><span class="blind">마지막</span></a>
								</c:if>
								</div>
							<!-- // pagination -->
							</c:if>
							</article>
							<!-- comment -->
							<c:if test="${loginUserMap.id != freeDetail.id}">
							<div class="btn_area mt50-30">
								<a href="freeList?page=${listpage }&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}" class="el_btn frm_btn gray">목록</a>
							</div>
							</c:if>
							<c:if test="${loginUserMap.id == freeDetail.id}">
								<div class="btn_area space mt50-30">
									<a href="freeList?page=${listpage }&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}" class="el_btn frm_btn gray">목록</a>
									<a href="#" class="el_btn frm_btn gray2 ml_auto" onclick="free_delete(${freeDetail.num })">삭제</a>
									<a href="freeWriteForm?num=${freeDetail.num }" class="el_btn frm_btn blue">수정</a>
								</div>
							</c:if>
						</div>
					</div>
					<!-- //board content -->

					<%-- <!-- board nav -->
					<div class="board_view_nav type2">
						<div class="inner">
							<div class="bbs_list_tbl nav">
								<table>
									<caption>팬게시판 목록</caption>
									<colgroup>
										<col class="num">
										<col class="tit">
										<col class="date">
										<col class="view">
									</colgroup>
									<thead class="blind">
										<tr>
											<th scope="col">이전글/다음글</th>
											<th scope="col">제목</th>
											<th scope="col">날짜</th>
											<th scope="col">조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${nextDetail == null }">
										<tr class="no_post_nav">
											<td class="num">다음글</td>
											<td colspan="3" class="tit">
												<div class="tit_inner">
													<span class="no_post">다음글이 없습니다.</span>
												</td>
										</tr>
										</c:if>
										<c:if test="${nextDetail != null }">
										<tr>
											<td class="num">다음글</td>
											<td class="tit">
												<div class="tit_inner">
													<a href="freeListDetail?num=${nextDetail.num}" class="tit_link txt_line1-2">${nextDetail.subject }</a>
													<c:if test="${nextDetail.tail_count != '0' }">
													<span class="count">[${nextDetail.tail_count }]</span>
													</c:if> 
												</div>
											</td>
											<td class="date">
												<span class="bbs_info date">${nextDetail.reg_date }</span>
											</td>
											<td class="view">
												<span class="bbs_info view">${nextDetail.visited }</span>
											</td>
										</tr>
										</c:if>
										<c:if test="${prevDetail == null }">
										<tr class="no_post_nav">
											<td class="num">이전글</td>
											<td colspan="3" class="tit">
												<div class="tit_inner">
													<span class="no_post">이전글이 없습니다.</span>
												</td>
										</tr>
										</c:if>
										<c:if test="${prevDetail != null }">
										<tr>
											<td class="num">이전글</td>
											<td class="tit">
												<div class="tit_inner">
													<a href="freeListDetail?num=${prevDetail.num}" class="tit_link txt_line1-2">${prevDetail.subject }</a>
													<c:if test="${prevDetail.tail_count != '0' }">
													<span class="count">[${prevDetail.tail_count }]</span>
													</c:if> 
												</div>
											</td>
											<td class="date">
												<span class="bbs_info date">${prevDetail.reg_date }</span>
											</td>
											<td class="view">
												<span class="bbs_info view">${prevDetail.visited }</span>
											</td>
										</tr>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- board nav --> --%>

				</div>
			</section>
			<!-- 게시판 상세페이지 -->
			<section class="section">
				<div class="ly_inner md">

				<!-- 	<ul class="el_desc_list mt10 pml17">
						<li>팬게시판 성향과 어긋나거나 부적절한 게시물의 경우를 대비하여 회원 신고제도를 도입하였습니다.</li>
						<li>특정 대상 게시물이 총 5회 신고될 경우, 해당 게시물은 자동 블록 처리되어 내용 확인이 불가능합니다.</li>
						<li>신고는 회원 계정당 1회만 가능하며, 무분별한 신고 사례는 검증 후 불이익을 받으실 수 있사오니 유의하여 주시길 바랍니다.</li>
					</ul> -->
					

					<!-- 게시판 리스트 -->
					<article class="">
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
								<thead>
									<tr>
										<th scope="col">NO</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">날짜</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${topFreeList}" var="topFreeList">
									<c:if test="${freeDetail.num == topFreeList.num}">
									<tr class="current">
										<td class="num">[현재글]</td>								
									</c:if>
									<c:if test="${freeDetail.num != topFreeList.num}">
									<tr class="notice"> <!-- 공지사항 notice 클래스 추가 -->
										<td class="num">공지</td>
									</c:if>
										<td class="tit">
											<div class="tit_inner">
												<a href="freeListDetail?num=${topFreeList.num}&listpage=${currentPage2}&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}" class="tit_link">
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
									<c:if test="${freeDetail.num == freeList.num}">
									<tr class="current">
										<td class="num">[현재글]</td>								
									</c:if>
									<c:if test="${freeDetail.num != freeList.num}">
									<tr>
										<td class="num">${freeList.rownum}</td>
									</c:if>
										<td class="tit">
											<div class="tit_inner">
												<c:if test="${freeList.chk_m == 'Y' }">
												<span class="el_ico phone"></span> <!-- 모바일 접속 아이콘 -->
												</c:if>
												<a href="freeListDetail?num=${freeList.num}&listpage=${currentPage2}&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}" class="tit_link">
													<c:if test="${freeList.step == '0' }">
													<span class="tit_txt txt_line1-2">${freeList.subject }</span>
													</c:if>
													<c:if test="${freeList.step != '0' }">
													<span class="tit_txt txt_line1-2 reply">${freeList.subject }</span>
													</c:if>
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
								<a href="#" class="el_btn frm_btn blue openModal" data-target="#loginForm2">등록</a>
								</c:if>
							</div>
							<c:if test="${not empty freeList}">
						<!-- pagination -->
						<div class="pagination g_page xm_hide">
							<!-- 맨처음 -->
							<c:if test="${maxPage3 eq 0}">
							<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
							</c:if>
							<c:if test="${maxPage3 > 0}">
							<a href="freeList?page=1&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
							</c:if>
							
							<!-- 이전 블럭으로 이동 -->
							<c:if test="${startPage3 gt 1 }">
		                       	<a href="freeList?page=${startPage3-1}&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
		                    </c:if>
							<c:if test="${startPage3 eq 1 }">
		                       	<a href="#" class="page_link ico prev" disabled><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
		                    </c:if>
		                    
		                    <!-- 페이지 번호 -->
		                    <c:forEach var="p" begin="${startPage3}" end="${endPage3}" step="1">
		                   	<c:if test="${p eq currentPage2 }">
		                    	<a href="#" class="page_link current">${p}</a>
		                    </c:if>
		                      <c:if test="${p ne currentPage2 }">
		                      	<c:url var="freeList" value="freeList?keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}">
			 					<c:param name="page" value="${p}" />
			 					</c:url>
			 					<a href="${freeList}" class="page_link">${p}</a>
		                      </c:if>
		                    </c:forEach>
		                    
		                    <!-- 다음 블럭으로 이동 -->
		                    <c:if test="${endPage3 ne maxPage3 && maxPage3 > 1}">
							<a href="freeList?page=${endPage2+1}&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}" class="page_link ico next"><span class="blind">다음</span></a>
		                    </c:if>
		                    <c:if test="${endPage3 ge maxPage3}">
							<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
		                    </c:if>
		                    
		                    <!-- 맨끝 -->
		                    <c:if test="${maxPage3 eq 0}">
		                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
		                    </c:if>
		                    <c:if test="${maxPage3 > 0}">
							<a href="freeList?page=${maxPage3}&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}" class="page_link ico last"><span class="blind">마지막</span></a>
							</c:if>
						</div>
						<!-- // pagination -->
						<!-- pagination -->
						<div class="pagination g_page xm_show">
							<!-- 맨처음 -->
							<c:if test="${maxPage2 eq 0}">
							<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
							</c:if>
							<c:if test="${maxPage2 > 0}">
							<a href="freeList?page=1&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
							</c:if>
							
							<!-- 이전 블럭으로 이동 -->
							<c:if test="${startPage2 gt 1 }">
		                       	<a href="freeList?page=${startPage2-1}&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
		                    </c:if>
							<c:if test="${startPage2 eq 1 }">
		                       	<a href="#" class="page_link ico prev" disabled><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
		                    </c:if>
		                    
		                    <!-- 페이지 번호 -->
		                    <c:forEach var="p" begin="${startPage2}" end="${endPage2}" step="1">
		                   	<c:if test="${p eq currentPage2 }">
		                    	<a href="#" class="page_link current">${p}</a>
		                    </c:if>
		                      <c:if test="${p ne currentPage2 }">
		                      	<c:url var="freeList" value="freeList?keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}">
			 					<c:param name="page" value="${p}" />
			 					</c:url>
			 					<a href="${freeList}" class="page_link">${p}</a>
		                      </c:if>
		                    </c:forEach>
		                    
		                    <!-- 다음 블럭으로 이동 -->
		                    <c:if test="${endPage2 ne maxPage2 && maxPage2 > 1}">
							<a href="freeList?page=${endPage2+1}&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}" class="page_link ico next"><span class="blind">다음</span></a>
		                    </c:if>
		                    <c:if test="${endPage2 ge maxPage2}">
							<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
		                    </c:if>
		                    
		                    <!-- 맨끝 -->
		                    <c:if test="${maxPage2 eq 0}">
		                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
		                    </c:if>
		                    <c:if test="${maxPage2 > 0}">
							<a href="freeList?page=${maxPage2}&keyWord=${keyWord}&title=${title}&content=${content}&writer=${writer}&tail=${tail}&tailWriter=${tailWriter}&sdate=${sdate}&edate=${edate}" class="page_link ico last"><span class="blind">마지막</span></a>
							</c:if>
						</div>
						<!-- // pagination -->
						</c:if>
						</div>
						
						<!-- 검색 -->
					<div class="search_box type3 lg mt30b">
						<form action="freeList" class="search_box_form" id="freeSearchForm">
							<div class="row">
								<%-- <div class="col grow col_date frm_date_wrap">
									<span class="frm_date">
										<input type="text" class="frm_input mdm date" aria-label="시작 일" placeholder="기간 설정" name="sdate" id="sdate" value="${sdate}" readonly>
									</span>
									<span class="txt"><span>-</span></span>
									<span class="frm_date rt">
										<input type="text" class="frm_input mdm date rt" aria-label="종료 일" name="edate" id="edate" value="${edate}" readonly>
									</span>
								</div> --%>
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
									<input type="text" class="frm_input mdm" aria-label="검색" placeholder="검색어 " id="keyWord" name="keyWord" value="${keyWord}" onkeypress="handleKeyPress(event)">
									<button type="button" class="el_btn frm_btn black mdm shrink" onclick="searchval()">검색</button>
									<a href="freeList" class="el_btn refresh"  aria-label="새로고침"><span class="p_hide">새로고침</span></a>
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
					</article>
					<!-- //게시판 리스트 -->

				</div> 
			</section>	
			<a href="#wrap" class="el_btn gotoTop" aria-label="맨 위로 이동">
				<img src="/resources/common/images/common/ico_gotoTop.svg" alt="">
			</a>
		</main>
		<!-- //container -->
		<!-- 알럿 -->
			<div id="loginForm" tabindex="-1" class="alert alertPopup modal" data-focus="alert">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_body">
							<p class="alert_msg md">로그인 후 댓글 입력이 가능합니다.<br> 로그인 하시겠습니까?</p>
							<div class="btn_area gap10b mt30-26">
								<a href="#" class="el_btn frm_btn gray2 closeModal">취소</a>
								<a href="loginForm" class="el_btn frm_btn blue">확인</a>
							</div>
						</div>
						<button type="button" class="el_btn close closeModal" data-focus-next="alert"></button>
					</div>
				</div>
			</div>
			<!--  알럿 -->
		<!-- 알럿 -->
			<div id="loginForm2" tabindex="-1" class="alert alertPopup modal" data-focus="alert">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_body">
							<p class="alert_msg md">로그인 후 글작성이 가능합니다.<br> 로그인 하시겠습니까?</p>
							<div class="btn_area gap10b mt30-26">
								<a href="#" class="el_btn frm_btn gray2 closeModal">취소</a>
								<a href="loginForm" class="el_btn frm_btn blue">확인</a>
							</div>
						</div>
						<button type="button" class="el_btn close closeModal" data-focus-next="alert"></button>
					</div>
				</div>
			</div>
			<!--  알럿 -->
		<!-- footer -->
		<app-footer></app-footer>
		<!-- footer -->

	</div>
	<script>
		window.onpageshow = function(event){
			if(event.persisted || (window.performance && window.performance.navigation.type == 2)){
				console.log(0);
				$('.loading').remove();
			}
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
