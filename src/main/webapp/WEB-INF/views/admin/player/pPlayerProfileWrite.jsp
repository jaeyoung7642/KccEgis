<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=1270, initial-scale=0.3">
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
							<li><a href="pSupportstaffProfileList" class="snb_link">지원스탭</a></li>
							<li><a href="pPlayerProfileList" class="snb_link current">선수</a></li>
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">선수</h3>

				<form action="mergePlayer" enctype="multipart/form-data" method="post">
					<div class="board_write">
						<table class="tbl type1">
							<caption>선수 등록 테이블</caption>
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
										<input type="text" class="frm_input" id="pl_name" name="pl_name" value="${result.pl_name }" placeholder="이름(국문)을 입력하세요.">
									</td>
									<th scope="row"><label for="pl_pos_code">포지션</label></th>
									<td>
										<select class="frm_select full" id="pl_pos_code" name="pl_pos_code" aria-label="포지션 선택">
											<option value="g" <c:if test="${result.pl_pos_code eq 'g'}">selected</c:if>>가드</option>
											<option value="f" <c:if test="${result.pl_pos_code eq 'f'}">selected</c:if>>포워드</option>
											<option value="c" <c:if test="${result.pl_pos_code eq 'c'}">selected</c:if>>센터</option>
											<option value="s" <c:if test="${result.pl_pos_code eq 's'}">selected</c:if>>군입대</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="pl_ename">이름(영문)</label></th>
									<td>
										<input type="text" class="frm_input" id="pl_ename" name="pl_ename" value="${result.pl_ename }" placeholder="이름(영문)을 입력하세요.">
									</td>
									<th scope="row"><label for="pl_no">선수코드</label></th>
									<td>
										<input type="text" class="frm_input" id="pl_no" name="pl_no" value="${result.pl_no }" placeholder="000000" required maxlength="6">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="pl_back">등번호</label></th>
									<td>
										<input type="text" class="frm_input" id="pl_back" name="pl_back" value="${result.pl_back }" placeholder="00">
									</td>
									<th scope="row"><label for="pl_birthday">생년월일</label></th>
									<td>
										<input type="text" class="frm_input" id="pl_birthday" name="pl_birthday" value="${result.pl_birthday }" placeholder="0000-00-00" oninput="onInputDateHandler(this)" maxlength="10">
									</td>
								</tr>
								<tr>
									<th scope="row">신장 / 체중</th>
									<td>
										<div class="frm_group">
											<input type="text" class="frm_input" id="pl_height" name="pl_height" value="${result.pl_height }" placeholder="000" aria-label="신장 등록">
											<span class="dash">/</span>
											<input type="text" class="frm_input" id="pl_weight" name="pl_weight" value="${result.pl_weight }" placeholder="00" aria-label="체중">
										</div>
									</td>
									<th scope="row"><label for="pl_foot">발사이즈</label></th>
									<td>
										<input type="text" class="frm_input" id="pl_foot" name="pl_foot" value="${result.pl_foot }" placeholder="000">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="pl_rank">프로입단</label></th>
									<td>
										<input type="text" class="frm_input" id="pl_rank" name="pl_rank" value="${result.pl_rank}" placeholder="0000년 0R 0순위">
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
									<th scope="row">SNS</th>
									<td colspan="3">
										<div class="frm_group">
											<select class="frm_select m140" id="pl_sns_code" name="pl_sns_code" aria-label="SNS 종류 선택">
												<option value="insta" <c:if test="${result.pl_sns_code eq 'insta'}">selected</c:if>>인스타그램</option>
												<option value="facebook" <c:if test="${result.pl_sns_code eq 'facebook'}">selected</c:if>>페이스북</option>
												<option value="twitter" <c:if test="${result.pl_sns_code eq 'twitter'}">selected</c:if>>X(구, 트워터)</option>
											</select>
											<input type="text" class="frm_input" id="pl_sns_url" name="pl_sns_url" value="${result.pl_sns_url }" placeholder="연결 URL을 입력하세요." aria-label="연결 URL 입력">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">목록 사진</th>
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
											<span class="el_info">※ 이미지 사이즈 [851X1275]</span>
											<input type="hidden" name="pl_webmain_bf" id="pl_webmain_bf" value="${result.pl_webmain}">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">목록 작은 사진</th>
									<td colspan="3">
										<div class="frm_group txt_sm">
											<div class="frm_file">
												<label>
													<input type="file" aria-label="파일등록" name="pl_webdetail" id="pl_webdetail">
													<span class="frm_input gray m400">
													<c:if test="${result.pl_webdetail != null }">
														${result.pl_webdetail }
													</c:if>
													<c:if test="${result.pl_webdetail == null}">
														사진을 첨부하세요.
													</c:if>
													</span>
												</label>
												<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
											</div>
											<span class="el_info">※ 이미지 사이즈 [330X330]</span>
											<input type="hidden" name="pl_webdetail_bf" id="pl_webdetail_bf" value="${result.pl_webdetail}">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">상세 사진</th>
									<td colspan="3">
										<ul class="frm_list">
											<li class="item">
												<div class="frm_group txt_sm">
													<div class="frm_file">
														<label>
															<input type="file" aria-label="파일등록" name="pl_actioncut_1" id="pl_actioncut_1">
															<span class="frm_input gray m400">
															<c:if test="${result.pl_actioncut_1 != null }">
																${result.pl_actioncut_1 }
															</c:if>
															<c:if test="${result.pl_actioncut_1 == null}">
																사진을 첨부하세요.
															</c:if>
															</span>
														</label>
														<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
													</div>
													<span class="el_info">※ 이미지 사이즈 [851X1275]</span>
													<input type="hidden" name="pl_actioncut_1_bf" id="pl_actioncut_1_bf" value="${result.pl_actioncut_1}">
												</div>
											</li>
											<li class="item">
												<div class="frm_group txt_sm">
													<div class="frm_file">
														<label>
															<input type="file" aria-label="파일등록" name="pl_actioncut_2" id="pl_actioncut_2">
															<span class="frm_input gray m400">
															<c:if test="${result.pl_actioncut_2 != null }">
																${result.pl_actioncut_2 }
															</c:if>
															<c:if test="${result.pl_actioncut_2 == null}">
																사진을 첨부하세요.
															</c:if>
															</span>
														</label>
														<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
													</div>
													<span class="el_info">※ 이미지 사이즈 [851X1275]</span>
													<input type="hidden" name="pl_actioncut_2_bf" id="pl_actioncut_2_bf" value="${result.pl_actioncut_2}">
												</div>
											</li>
											<li class="item">
												<div class="frm_group txt_sm">
													<div class="frm_file">
														<label>
															<input type="file" aria-label="파일등록" name="pl_actioncut_3" id="pl_actioncut_3">
															<span class="frm_input gray m400">
															<c:if test="${result.pl_actioncut_3 != null }">
																${result.pl_actioncut_3 }
															</c:if>
															<c:if test="${result.pl_actioncut_3 == null}">
																사진을 첨부하세요.
															</c:if>
															</span>
														</label>
														<a href="#" class="el_btn btn frm_btn line2">파일찾기</a>
													</div>
													<span class="el_info">※ 이미지 사이즈 [851X1275]</span>
													<input type="hidden" name="pl_actioncut_3_bf" id="pl_actioncut_3_bf" value="${result.pl_actioncut_3}">
												</div>
											</li>
										</ul>
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