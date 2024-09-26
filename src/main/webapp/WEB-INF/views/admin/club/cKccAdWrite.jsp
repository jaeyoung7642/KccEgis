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
	<script>
	function fileDownload(){
		var fileName = $("#downfile_bf").val();
		var fileNameOrg = $("#downfile_original_bf").val();
		if(fileName=="" || fileName ==null){
			alert('파일이 없습니다.');
			return false;
		}
		location.href="/filedown?fileName="+fileName+"&fileNameOrg="+fileNameOrg+"&filePathTail=kccad";
	}
	function openPhoto(){
		if($('#img1Txt').text().trim() === '' || $('#img1Txt')[0].innerText =='사진을 첨부하세요.'){
			alert("선택된 파일이 없습니다.");
		}else{
			$('#img1Pop').trigger('click');
		}
	}
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = '';
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
					<h3 class="aside_title">CLUB</h3>
					<nav id="snb">
						<ul class="snb_list">
							<li><a href="cKccAdList" class="snb_link current">KCC광고</a></li> <!-- 현재 페이지 메뉴 current -->
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">KCC광고</h3>

				<form action="mergeKccAd" enctype="multipart/form-data" method="post">
					<input type="hidden" name="num" id="num" value="${result.num }">
					<input type="hidden" name="mvideo" id="mvideo" value="N">
					<div class="board_write">
						<table class="tbl type1">
							<caption>KCC광고 등록 테이블</caption>
							<colgroup>
								<col width="150">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="title">제목</label></th>
									<td>
										<input type="text" class="frm_input" id="title" name="title" placeholder="제목을 입력하세요." value="${result.title}">
									</td>
								</tr>
								<tr>
									<th scope="row">계열사 선택</th>
									<td>
										<select class="frm_select m400" aria-label="계열사 구분" name="adgroup" id="adgroup">
											<option value="all" <c:if test="${result.adgroup eq 'all'}">selected</c:if>>계열사</option>
											<option value="미출력" <c:if test="${result.adgroup eq '미출력'}">selected</c:if>>미출력</option>
											<option value="기업PR" <c:if test="${result.adgroup eq '기업PR'}">selected</c:if>>기업PR</option>
											<option value="KCC창호" <c:if test="${result.adgroup eq 'KCC창호'}">selected</c:if>>KCC창호</option>
											<option value="숲으로" <c:if test="${result.adgroup eq '숲으로'}">selected</c:if>>숲으로</option>
											<option value="HOMECC" <c:if test="${result.adgroup eq 'HOMECC'}">selected</c:if>>HOMECC</option>
											<option value="KCC건설 스위첸" <c:if test="${result.adgroup eq 'KCC건설 스위첸'}">selected</c:if>>KCC건설 스위첸</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">썸네일</th>
									<td>
										<div class="frm_group txt_sm">
											<div class="frm_file">
												<label>
													<input type="file" aria-label="파일등록" name="thumbnail" id="thumbnail" onchange="readURL(this);">
													<span class="frm_input gray m400" id="img1Txt">
													<c:if test="${result.thumbnail != null }">
														${result.thumbnail }
													</c:if>
													<c:if test="${result.thumbnail == null}">
														사진을 첨부하세요.
													</c:if>
													</span>
												</label>
												<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
											</div>
											<button type="button" class="el_btn btn frm_btn line2" onclick="openPhoto()">사진보기</button>
											<button class="openModal" id="img1Pop" data-target="#detailPopup"></button>
											<span class="el_info">※ 이미지 사이즈 [500X280]</span>
											<input type="hidden" name="thumbnail_bf" id="thumbnail_bf" value="${result.thumbnail}">
											<input type="hidden" name="thumbnail_original_bf" id="thumbnail_original_bf" value="${result.thumbnail_original}">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">다운로드 파일</th>
									<td>
										<div class="frm_group txt_sm">
											<div class="frm_file">
												<label>
													<input type="file" aria-label="파일등록" name="downfile" id="downfile">
													<span class="frm_input gray m400">
													<c:if test="${result.downfile != null }">
														${result.downfile }
													</c:if>
													<c:if test="${result.downfile == null}">
														파일을 첨부하세요.
													</c:if>
													</span>
												</label>
												<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
											</div>
											<button type="button" class="el_btn btn frm_btn line2" onclick="fileDownload();">다운로드</button>
											<input type="hidden" name="downfile_bf" id="downfile_bf" value="${result.downfile}">
											<input type="hidden" name="downfile_original_bf" id="downfile_original_bf" value="${result.downfile_original}">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="addr">영상링크</label></th>
									<td>
										<input type="text" class="frm_input" id="addr" name="addr" value="${result.addr}">
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_area mt40">
						<button class="el_btn md line">등록</button>
						<button type="button" class="el_btn md line" onclick="javascript:history.back();">취소</button>
						<button type="button" class="el_btn md line" onclick="deleteKccAd(${result.num })">삭제</button>
					</div>
				</form>
				<!-- 미리보기 정보 팝업 -->
				<div id="detailPopup" tabindex="-1" class="memberPopup modal" data-focus="modal">
					<div class="modal_module">
						<div class="modal_content">
							<div class="modal_header">
								<h4 class="modal_title">사진보기</h4>
							</div>

							<div class="modal_body custom_scroll" style="text-align:center;">
								<!-- 작성자 정보 -->
								<img src="/resources/common/images/upload/kccad/${result.thumbnail}" id="preview" alt="">
								<!-- 작//성자 정보 -->
							</div>
							<button type="button" class="el_btn modal_close closeModal" aria-label="팝업 닫기" data-focus-next="modal"></button>
						</div>
					</div>
				</div>
				<!-- 미리보기 팝업 -->
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

	</div>
</body>
</html>