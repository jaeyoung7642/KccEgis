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
	function fileDownload(){
		var fileName = $("#img1_bf").val();
		var fileNameOrg = $("#img1_org_bf").val();
		if(fileName=="" || fileName ==null){
			alert('파일이 없습니다.');
			return false;
		}
		location.href="/filedown?fileName="+fileName+"&fileNameOrg="+fileNameOrg+"&filePathTail=wallpaper";
	}
	function fileDownload2(){
		var fileName = $("#img2_bf").val();
		var fileNameOrg = $("#img2_org_bf").val();
		if(fileName=="" || fileName ==null){
			alert('파일이 없습니다.');
			return false;
		}
		location.href="/filedown?fileName="+fileName+"&fileNameOrg="+fileNameOrg+"&filePathTail=wallpaper";
	}
	function deleteWallpaper(num){
		if (confirm("정말 삭제하시겠습니까?") == true) {
			if(num=="" || num ==null){
				alert('삭제할수 없습니다.');
				return false;
			}
	        	$.ajax({
			   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
			        url : "/kccadm/deleteWallpaper",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "num":num
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				        if(res==1){
				        	location.href = 'fWallpaperList';
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
							<li><a href="fEventList" class="snb_link">이벤트</a></li><!-- 현재 페이지 메뉴 current -->
							<li><a href="fWallpaperList" class="snb_link current">월페이퍼</a></li>
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">월페이퍼</h3>

				<form action="mergeWallpaper" enctype="multipart/form-data" method="post">
					<input type="hidden" name="num" id="num" value="${result.num }">
					<div class="board_write">
						<table class="tbl type1">
							<caption>공지사항 등록 테이블</caption>
							<colgroup>
								<col width="150">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="subject">제목</label></th>
									<td>
										<input type="text" class="frm_input" id="subject" name="subject" placeholder="제목을 입력하세요." value="${result.subject}" required>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="subject">일자</label></th>
									<td>
										<input type="number" class="frm_input" id="year" name="year" placeholder="년도를 입력하세요." value="${result.year}" required>
										<input type="number" class="frm_input" id="month" name="month" placeholder="월을 입력하세요." value="${result.month}" required>
									</td>
								</tr>
								<tr>
									<th scope="row">1280X960</th>
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
											<input type="hidden" name="img1_bf" id="img1_bf" value="${result.img1}">
											<button type="button" class="el_btn btn frm_btn line2" onclick="fileDownload();">다운로드</button>
											<input type="hidden" name="img1_org_bf" id="img1_org_bf" value="${result.img1_org}">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">1600X1200</th>
									<td>
										<div class="frm_group txt_sm">
											<div class="frm_file">
												<label>
													<input type="file" aria-label="파일등록" name="img2" id="img2">
													<span class="frm_input gray m400">
													<c:if test="${result.img2 != null }">
														${result.img2 }
													</c:if>
													<c:if test="${result.img2 == null}">
														사진을 첨부하세요.
													</c:if>
													</span>
												</label>
												<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
											</div>
											<input type="hidden" name="img2_bf" id="img2_bf" value="${result.img2}">
											<button type="button" class="el_btn btn frm_btn line2" onclick="fileDownload2();">다운로드</button>
											<input type="hidden" name="img2_org_bf" id="img2_org_bf" value="${result.img2_org}">
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_area mt40">
						<button class="el_btn md line">등록</button>
						<button type="button" class="el_btn md line" onclick="javascript:history.back();">취소</button>
						<button type="button" class="el_btn md line" onclick="deleteWallpaper(${result.num })">삭제</button>
					</div>
				</form>
			
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

	</div>
</body>
</html>