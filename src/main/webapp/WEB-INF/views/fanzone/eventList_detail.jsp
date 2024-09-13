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
	<script src="/resources/common/assets/js/snsShare.js" defer></script> <!-- 개발용 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="/resources/common/assets/js/gsap.min.js" defer></script> <!-- main only -->
	<script src="/resources/common/assets/js/ScrollTrigger.min.js" defer></script> <!-- main only -->
	<script>
	function loginForm(){
		if(confirm("로그인 후 댓글 입력이 가능합니다. 로그인 하시겠습니까?")){
			location.href = "/loginForm";
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
   			url: 'contentPage',
   			success:function(result){
   				$('#contentPageArea').html(result);
   	         },
   	         error:function(){
   	            alert('서버에 문제가 있어욤!');
   	         }
   		});//ajax
		
	}
	function contentWrite(){
		var num = $("#num").val();
		var content = $("#content").val();
		var part = "notice";
		if(content ==""){
			alert("댓글을 입력해주세요.");
			return;
		}else{
			$.ajax({
			   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
			        url : "/contentWrite",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "content":content,
			       	 "num" : num,
			       	 "part": part
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				        if(res==1){
				        	contentPage(1);
				        }else{
				       	 alert("댓글 작성에 실패했습니다.");
				        }
			        },
			        error: function() {
						alert("서버 오류!!");
					}
			   });
		}
	}
	function contentDelete(num){
		if (confirm("정말 삭제 하시겠습니까?") == true) {
	        	$.ajax({
			   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
			        url : "/contentDelete",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "num":num
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				        if(res==1){
				        	contentPage(1);
				        }else{
				       	 alert("삭제에 실패했습니다.");
				        }
			        },
			        error: function() {
						alert("서버 오류!!");
					}
			   });
	            
	        } else {

	            return;
	        }
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
						<li>이벤트</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">FANZONE</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="noticeList" class="swiper-slide snb_link"><span>공지사항</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="freeList" class="swiper-slide snb_link"><span>팬게시판</span></a> 
								<a href="eventList" class="swiper-slide snb_link current"><span>이벤트</span></a>
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
							<h4 class="subject">${eventDetail.subject}</h4>
							<input type="hidden" id="num" value="${eventDetail.num}">
							<input type="hidden" id="shareTitle" value="${eventDetail.subject}">
							<input type="hidden" id="shareImg" value="${eventDetail.img1}">
							<input type="text" id="Url" value="" style="position: absolute; top: 0; left: 0; width: 1px; height: 1px; border: 0; padding: 0; opacity: 0;" readonly>
						</div>
						<div class="bbs_info_wrap md">
							<span class="bbs_info date type2">${eventDetail.sdate_format} ~ ${eventDetail.edate_format}</span>
							<span class="bbs_info view">${eventDetail.visited}</span>

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
							<article class="board_view_detail">${eventDetail.content}</article>
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
									<textarea class="frm_input" id="content" placeholder="로그인 후 댓글 입력이 가능합니다.&#13;공개된 댓글에 개인정보 노출은 자제를 부탁드립니다." data-lenis-prevent></textarea>
									<button type="button" onclick="contentWrite()" class="el_btn frm_btn black">댓글 작성</button>
									</c:if>
									<c:if test="${loginUserMap == null}">
									<textarea class="frm_input" onclick="loginForm()" placeholder="로그인 후 댓글 입력이 가능합니다.&#13;공개된 댓글에 개인정보 노출은 자제를 부탁드립니다." data-lenis-prevent></textarea>
									<button type="button" onclick="loginForm()" class="el_btn frm_btn black">댓글 작성</button>
									</c:if>
								</div>
								<h5 class="tit">댓글</h5>
								<div class="comments">
									<c:forEach items="${tailList}" var="tailList">
									<!-- row -->
									<div class="row">
										<div class="cont">${tailList.content}</div>  <!-- 줄바꿈 없이 데이터 넣기 -->
										<div class="info">
											<span class="name"><strong>${tailList.writer2 }</strong>(${tailList.id2 })</span>
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
								<c:if test="${not empty tailList}">
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

							<div class="btn_area mt50-30">
								<a href="eventList?page=${listpage }&keyWord=${keyWord}" class="el_btn frm_btn gray">목록</a>
							</div>
						</div>
					</div>
					<!-- //board content -->

					<!-- board nav -->
					<div class="board_view_nav type2">
						<div class="inner">
							<div class="bbs_list_tbl nav">
								<table>
									<caption>팬게시판 목록</caption>
									<colgroup>
										<col class="num">
										<col class="tit">
										<col class="date2">
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
													<a href="eventListDetail?num=${nextDetail.num}" class="tit_link txt_line1-2">${nextDetail.subject }</a>
													<c:if test="${nextDetail.tail_count != '0' }">
													<span class="count">[${nextDetail.tail_count }]</span>
													</c:if> 
												</div>
											</td>
											<td class="date">
												<span class="bbs_info date">${nextDetail.sdate_format } ~ ${nextDetail.edate_format }</span>
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
													<a href="eventListDetail?num=${prevDetail.num}" class="tit_link txt_line1-2">${prevDetail.subject }</a>
													<c:if test="${prevDetail.tail_count != '0' }">
													<span class="count">[${prevDetail.tail_count }]</span>
													</c:if> 
												</div>
											</td>
											<td class="date">
												<span class="bbs_info date">${prevDetail.sdate_format } ~ ${prevDetail.edate_format }</span>
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
					<!-- board nav -->

				</div>
			</section>
			<!-- 게시판 상세페이지 -->

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
