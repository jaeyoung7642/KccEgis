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
	<script src="/ckeditor/ckeditor.js"></script>
	<!-- <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script> -->
	<script>
	function tailRemove(num){
		if (confirm("정말 삭제하시겠습니까?") == true) {
			$.ajax({
			   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
			        url : "deleteTail",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "num":num
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			          console.log(res);
				        if(res==1){
				       	 location.reload();
				        }else{
				       	 alert("변경에 실패했습니다.");
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
	function eventTailSave(num,str){
		var content = $("#tailWrite").val();
		 $.ajax({
		   	 type : "POST",            // HTTP method type(GET, POST) 형식이다.
		        url : "insertEventTail",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "content":content,
		       	 "num": num,
		       	 "part":str
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        if(res==1){
			        	location.reload();
			        }else{
			       	 alert("변경에 실패했습니다.");
			        }
		        },
		        error: function() {
					alert("서버에 문제가 있습니다.");
				}
		   }); 
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
			<aside id="aside" class="ly_aside">
				<div class="aside_inner custom_scroll">
					<h3 class="aside_title">FANZONE</h3>
					<nav id="snb">
						<ul class="snb_list">
							<li><a href="fNoticeList" class="snb_link">공지사항</a></li> 
							<li><a href="fFreeList" class="snb_link">팬게시판</a></li>
							<li><a href="fEventList" class="snb_link current">이벤트</a></li><!-- 현재 페이지 메뉴 current -->
							<li><a href="fWallpaperList" class="snb_link">월페이퍼</a></li>
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">이벤트</h3>

				<form action="mergeMedia" enctype="multipart/form-data" method="post">
					<input type="hidden" name="num" id="num" value="${result.num }">
					<input type="hidden" name="part" id="part" value="event">
					<input type="hidden" name="visited" id="visited" value="${result.visited }">
					<div class="board_write">
						<table class="tbl type1">
							<caption>이벤트 등록 테이블</caption>
							<colgroup>
								<col width="150">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="subject">제목</label></th>
									<td>
										<input type="text" class="frm_input" id="subject" name="subject" placeholder="제목을 입력하세요." value="${result.subject}">
									</td>
								</tr>
								<tr>
									<th scope="row">기간</th>
									<td>
										<div class="frm_group gap8">
											<div class="col">
												<input type="text" class="frm_input w163 date" aria-label="시작 일" name="sDay" value="${result.s_day}">
												<input type="text" class="frm_input w50" aria-label="시작 시간" name="sTime" value="${result.s_time}"> 시
											</div>
											<div class="col">
												<input type="text" class="frm_input w50" aria-label="시작 분"  name="sMinute" value="${result.s_minute}"> 분
											</div>
											<span class="dash">~</span>
											<div class="col">
												<input type="text" class="frm_input w163 date" aria-label="종료 일" name="eDay" value="${result.e_day}">
												<input type="text" class="frm_input w50" aria-label="종료 시간"  name="eTime" value="${result.e_time}"> 시
											</div>
											<div class="col">
												<input type="text" class="frm_input w50" aria-label="종료 분"  name="eMinute" value="${result.e_minute}"> 분
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">출력여부</th>
									<td>
										<div class="frm_group gap14">
										<c:if test="${result.flag != null }">
											<label class="frm_radio type1">
												<input type="radio" name="flag" value="N" <c:if test="${result.flag == 'N'}">checked</c:if>>
												출력
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="flag" value="Y" <c:if test="${result.flag == 'Y'}">checked</c:if>>
												미출력
											</label>
										</c:if>
										<c:if test="${result.flag == null }">
											<label class="frm_radio type1">
												<input type="radio" name="flag" value="N">
												출력
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="flag" value="Y" checked>
												미출력
											</label>
										</c:if>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">진행여부</th>
									<td>
										<div class="frm_group gap14">
										<c:if test="${result.etc2 != null }">
											<label class="frm_radio type1">
												<input type="radio" name="etc2" value="N" <c:if test="${result.etc2 == 'N'}">checked</c:if>>
												진행중
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="etc2" value="Y" <c:if test="${result.etc2 == 'Y'}">checked</c:if>>
												종료
											</label>
										</c:if>
										<c:if test="${result.etc2 == null }">
											<label class="frm_radio type1">
												<input type="radio" name="etc2" value="N">
												진행중
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="etc2" value="Y" checked>
												종료
											</label>
										</c:if>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">썸네일</th>
									<td>
										<div class="frm_group txt_sm">
											<div class="frm_file">
												<label>
													<input type="file" aria-label="파일등록" name="img1" id="img1">
													<span class="frm_input gray m400">
													<c:if test="${result.img1 != null }">
														${result.img1 }
													</c:if>
													<c:if test="${result.img1 == null}">
														사진을 첨부하세요.
													</c:if>
													</span>
												</label>
												<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
											</div>
											<span class="el_info">※ 이미지 사이즈 [452X200]</span>
											<input type="hidden" name="img1_bf" id="img1_bf" value="${result.img1}">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">내용</th>
									<td>
										<!-- 편집기 영역 -->
										<textarea name="content" id="ckeditor" cols="30" rows="10" class="frm_input">${result.content }</textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_area mt40">
						<button class="el_btn md line">등록</button>
						<button type="button" class="el_btn md line" onclick="javascript:history.back();">취소</button>
						<button type="button" class="el_btn md line" onclick="deleteNews(${result.num },'${result.part}')">삭제</button>
					</div>
				</form>
				<c:if test="${result.num != null}">
				<!-- 댓글 -->
				<article class="article mt94">
					<div class="page_header">
						<h4 class="heading lv2">댓글</h4>
					</div>
					<div class="board_write">
						<form action="">
							<table class="tbl type4">
								<caption>이벤트 댓글 테이블</caption>
								<colgroup>
									<col width="150">
									<col>
								</colgroup>
								<tbody>
									<c:forEach items="${result.eventTailList}" var="eventTailList">
									<tr>
										<th>${eventTailList.writer}</th>
										<td>
											<div class="frm_group gap3">
												<p>${eventTailList.content}</p>
												<button type="button" class="el_btn remove2" aria-label="삭제" onclick="tailRemove(${eventTailList.num})"></button>
											</div>
										</td>
									</tr>
									</c:forEach>
									<tr>
										<td colspan="2">
											<!-- 댓글 작성 -->
											<div class="comment_write frm_group">
												<input type="text" class="frm_input" aria-label="댓글입력" id="tailWrite">
												<button type="button" class="el_btn btn frm_btn deep" onclick="eventTailSave(${result.num},'${result.part}')">댓글작성</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
					<c:if test="${not empty eventTailList}">
					<!-- pagination -->
					<div class="pagination mt20">
						<!-- 맨처음 -->
						<c:if test="${maxPage eq 0}">
						<a href="#" class="page_link ico first" disabled><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
						</c:if>
						<c:if test="${maxPage > 0}">
						<a href="fEventWrite?page=1&num=${result.num}" class="page_link ico first"><span class="blind">처음</span></a> <!-- 비활성화시 disabled 추가 -->
						</c:if>
						
						<!-- 이전 블럭으로 이동 -->
						<c:if test="${startPage gt 1 }">
	                       	<a href="fEventWrite?page=${startPage-1}&num=${result.num}" class="page_link ico prev"><span class="blind">이전</span></a> <!-- 비활성화시 disabled 추가 -->
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
	                      	<c:url var="fEventWrite" value="fEventWrite?&num=${result.num}">
		 					<c:param name="page" value="${p}" />
		 					</c:url>
		 					<a href="${fFreeWrite}" class="page_link">${p}</a>
	                      </c:if>
	                    </c:forEach>
	                    
	                    <!-- 다음 블럭으로 이동 -->
	                    <c:if test="${endPage ne maxPage && maxPage > 1}">
						<a href="fEventWrite?page=${endPage+1}&num=${result.num}" class="page_link ico next"><span class="blind">다음</span></a>
	                    </c:if>
	                    <c:if test="${endPage ge maxPage}">
						<a href="#" class="page_link ico next" disabled><span class="blind">다음</span></a>
	                    </c:if>
	                    
	                    <!-- 맨끝 -->
	                    <c:if test="${maxPage eq 0}">
	                    	<a href="#" class="page_link ico last" disabled><span class="blind">마지막</span></a>
	                    </c:if>
	                    <c:if test="${maxPage > 0}">
						<a href="fEventWrite?page=${maxPage}&num=${result.num}" class="page_link ico last"><span class="blind">마지막</span></a>
						</c:if>
					</div>
				<!-- // pagination -->
				</c:if>
					</article>
					</c:if>
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

	</div>
	<script>
	$(function() {
		CKEDITOR.replace('ckeditor',{
			uploadUrl: "/fileupload.do/drag",
			filebrowserUploadUrl:  "/fileupload.do",
			toolbar: [
			    { name: 'clipboard', items: [ 'Undo', 'Redo' ] },
			    { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike' ] },
			    { name: 'paragraph', items: [ 'Blockquote','Indent','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
			    { name: 'insert', items: [ 'Image', 'Table', 'SpecialChar' ] },
			    { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
			    { name: 'Styles', items: [ 'Font', 'FontSize' ] },
			    { name: 'Links', items: [ 'Link'] },
			],
			font_names: '맑은 고딕/Malgun Gothic;' +
            '돋움/Dotum;' +
            '굴림/Gulim;' +
            '바탕/Batang;' +
            '궁서/Gungsuh;' +
            'HY견고딕/HY견고딕;' +
            'HY견명조/HY견명조'
		});
	});
    </script>
</body>
</html>