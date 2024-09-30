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
	<script src="/resources/common/admin/assets/js/jquery-ui.min.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/common.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/script.js" defer></script> 
	<script src="/resources/common/admin/assets/js/jquery-3.6.0.min.js"></script>
	<script>
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
<script>
	var msg = "${msg}"
	if(msg != ""){
		alert(msg);
	}
</script>
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
					<h3 class="aside_title">PLAYER</h3>
					<nav id="snb">
						<ul class="snb_list">
							<li><a href="pCoachProfileList" class="snb_link">코칭스탭</a></li> <!-- 현재 페이지 메뉴 current -->
							<li><a href="pSupportstaffProfileList" class="snb_link current">지원스탭</a></li>
							<li><a href="pPlayerProfileList" class="snb_link">선수</a></li>
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">지원스탭</h3>

				<form action="mergePlayer" enctype="multipart/form-data" method="post">
					<div class="board_write">
						<table class="tbl type1">
							<caption>지원스탭 등록 테이블</caption>
							<colgroup>
								<col width="150">
								<col width="325">
								<col width="150">
								<col>
							</colgroup>
							<input type="hidden" name="num" value="${result.num }">
							<tbody>
								<tr>
									<th scope="row"><label for="pl_name">이름</label></th>
									<td>
										<input type="text" class="frm_input" id="pl_name" name="pl_name" value="${result.pl_name }"placeholder="이름을 입력하세요.">
									</td>
									<th scope="row"><label for="pl_pos_code">역할</label></th>
									<td>
										<select class="frm_select full" id="pl_pos_code" name="pl_pos_code" aria-label="역할 선택">
											<option value="j" <c:if test="${result.pl_pos_code eq 'j'}">selected</c:if>>전력분석</option>
											<option value="m" <c:if test="${result.pl_pos_code eq 'm'}">selected</c:if>>매니저</option>
											<option value="t" <c:if test="${result.pl_pos_code eq 't'}">selected</c:if>>트레이너</option>
											<option value="i" <c:if test="${result.pl_pos_code eq 'i'}">selected</c:if>>통역</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="pl_no">코치코드</label></th>
									<td>
										<input type="text" class="frm_input" id="pl_no" name="pl_no" value="${result.pl_no }" placeholder="000000" required maxlength="6">
									</td>
									<th scope="row">출력여부</th>
									<td>
										<div class="frm_group gap14">
											<label class="frm_radio type1">
												<input type="radio" name="pl_show" id="pl_showY" value="Y" <c:if test="${result.pl_show eq 'Y'}">checked</c:if>>
												출력
											</label>
											<label class="frm_radio type1">
												<input type="radio" name="pl_show" id="pl_showN" value="N" <c:if test="${result.pl_show eq 'N'}">checked</c:if>>
												미출력
											</label>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="pl_order">출력순서</label></th>
									<td colspan="3">
										<input type="text" class="frm_input" id="pl_order" name="pl_order" value="${result.pl_order }">
									</td>
								</tr>
								<tr>
									<th scope="row">사진등록</th>
									<td colspan="3">
										<div class="frm_group txt_sm">
											<div class="frm_file">
												<label>
													<input type="file" aria-label="파일등록" name="pl_webmain" id="pl_webmain" onchange="readURL(this);">
													<span class="frm_input gray m400" id="img1Txt">
													<c:if test="${result.pl_webmain != null }">
														${result.pl_webmain }
													</c:if>
													<c:if test="${result.pl_webmain == null}">
														사진을 첨부하세요.
													</c:if>
													</span>
												</label>
												<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
											</div>
											<button type="button" class="el_btn btn frm_btn line2" onclick="openPhoto()">사진보기</button>
											<button class="openModal" id="img1Pop" data-target="#detailPopup"></button>
											<span class="el_info">※ 이미지 사이즈 [450X424]</span>
											<input type="hidden" name="pl_webmain_bf" id="pl_webmain_bf" value="${result.pl_webmain}">
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_area mt40">
						<button class="el_btn md line">확인</button>
						<button type="button" class="el_btn md line" onclick="javascript:history.back();">취소</button>
						<button type="button" class="el_btn md line" onclick="deletePlayer(${result.num },'${result.pl_pos_code}')">삭제</button>
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
								<img src="/resources/common/images/upload/player/${result.pl_webmain}" id="preview" alt="">
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