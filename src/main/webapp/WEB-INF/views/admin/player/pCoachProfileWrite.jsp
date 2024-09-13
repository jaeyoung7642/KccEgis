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
</head>
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
							<li><a href="pCoachProfileList" class="snb_link current">코칭스탭</a></li> <!-- 현재 페이지 메뉴 current -->
							<li><a href="pSupportstaffProfileList" class="snb_link">지원스탭</a></li>
							<li><a href="pPlayerProfileList" class="snb_link">선수</a></li>
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">코칭스탭</h3>

				<form action="mergePlayer" enctype="multipart/form-data" method="post">
					<div class="board_write">
						<table class="tbl type1">
							<caption>코칭스탭 등록 테이블</caption>
							<colgroup>
								<col width="150">
								<col width="325">
								<col width="150">
								<col>
							</colgroup>
							<input type="hidden" name="num" value="${result.num }">
							<tbody>
								<tr>
									<th scope="row"><label for="pl_name">이름(국문)</label></th>
									<td>
										<input type="text" class="frm_input" id="pl_name" name="pl_name" value="${result.pl_name }"placeholder="이름(국문)을 입력하세요.">
									</td>
									<th scope="row"><label for="pl_pos_code">역할</label></th>
									<td>
										<select class="frm_select full" id="pl_pos_code" name="pl_pos_code" aria-label="역할 선택">
											<option value="a" <c:if test="${result.pl_pos_code eq 'a'}">selected</c:if>>감독</option>
											<option value="b" <c:if test="${result.pl_pos_code eq 'b'}">selected</c:if>>코치</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="pl_ename">이름(영문)</label></th>
									<td>
										<input type="text" class="frm_input" id="pl_ename" name="pl_ename" value="${result.pl_ename }" placeholder="이름(영문)을 입력하세요.">
									</td>
									<th scope="row"><label for="pl_no">코치코드</label></th>
									<td>
										<input type="text" class="frm_input" id="pl_no" name="pl_no" value="${result.pl_no }" placeholder="000000" required maxlength="6">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="pl_birthday">생년월일</label></th>
									<td>
										<input type="text" class="frm_input" id="pl_birthday" name="pl_birthday" value="${result.pl_birthday }" placeholder="0000-00-00" oninput="onInputDateHandler(this)" maxlength="10">
									</td>
									<th scope="row"><label for="pl_height">신장</label></th>
									<td>
										<input type="text" class="frm_input" id="pl_height" name="pl_height" value="${result.pl_height }" placeholder="000">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="pl_weight">체중</label></th>
									<td>
										<input type="text" class="frm_input" id="pl_weight" name="pl_weight" value="${result.pl_weight }" placeholder="00">
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
									<th scope="row"><label for="pl_school">출신학교</label></th>
									<td>
										<input type="text" class="frm_input" id="pl_school" name="pl_school" value="${result.pl_school }" placeholder="출신학교를 입력하세요.">
									</td>
									<th scope="row"><label for="pl_order">출력순서</label></th>
									<td>
										<input type="text" class="frm_input" id="pl_order" name="pl_order" value="${result.pl_order }">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="pl_career">주요경력</label></th>
									<td colspan="3">
										<textarea name="pl_career" id="pl_career"  cols="30" rows="10" class="frm_input">${result.pl_career}</textarea>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="pl_prize">수상경력</label></th>
									<td colspan="3">
										<textarea name="pl_prize" id="pl_prize"  cols="30" rows="10" class="frm_input">${result.pl_prize}</textarea>
									</td>
								</tr>
								<tr>
									<th scope="row">사진등록</th>
									<td colspan="3">
										<div class="frm_group txt_sm">
											<div class="frm_file">
												<label>
													<input type="file" aria-label="파일등록" name="pl_webmain" id="pl_webmain">
													<span class="frm_input gray m400">
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
											<input type="hidden" name="pl_webmain_bf" id="pl_webmain_bf" value="${result.pl_webmain}">
											<span class="el_info">※ 이미지 사이즈 [295X730]</span>
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
			
			</main>
			<!-- //main -->
		</div>
		<!-- //container -->

	</div>
</body>
</html>