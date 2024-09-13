<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<link rel="stylesheet" href="/resources/common/assets/css/member.css"> <!-- 디렉토리  member only -->
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
	function joinSubmit(){
		var check1 = $("input[name='check1']:checked").val();
		if(check1 != 'Y'){
			alert('이용약관에 동의해 주세요.');
			return;
		}
		var check2 = $("input[name='check2']:checked").val();
		if(check2 != 'Y'){
			alert('개인정보 수집 및 이용에 동의해주세요.');
			return;
		}
		var form = $("#myForm");
		form.submit();
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
		<main id="container" class="ly_container member m_white">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- title -->
					<h3 class="page_title">회원가입</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
				</div>
			</div>
		
			<section class="section member_content">
				<div class="ly_inner sm">
					<nav class="tab_list type3">
						<a href="#" class="tab_link active">1. 약관동의</a>
						<a href="#" class="tab_link">2. 본인인증</a>
						<a href="#" class="tab_link">3. 정보입력</a>
						<a href="#" class="tab_link">4. 가입완료</a>
					</nav>
					<div class="bl_card agreement_card m_full js_check_wrap">
						<form action="joinForm2" id="myForm">
							<p class="el_desc_lg">구단 홈페이지 가입은 무료이며, 제공되는 서비스 중 개인정보 수급이 필요한 경우 별도로 회원님의 동의를 다시 구하고 있습니다.<br> 
								가입하시기 전에 먼저 이용약관을 읽어주시기 바라며, 회원님의 신상정보는 정보통신망 이용촉진 등에 관한 법률에 의거 보호 및 보안이 유지됨을 약속드립니다.</p>

							<div class="agree_form  mt50-30">
								<!-- 이용약관 동의 -->
								<article class="article">
									<dl class="agree_list">
										<dt class="tit">이용약관 동의 <span class="sm req">[필수]</span></dt>
										<dd class="cont">
											<div class="terms_area" data-lenis-prevent>
												<!-- 내용 -->
													<%@ include file="../common/agree_02.jsp" %>
												<!-- //내용 -->
											</div>
										</dd>
										<dd class="forms">
											<label class="frm_checkbox type1">
												<input type="checkbox" class="js_check_each" required name="check1" value="Y">
												<span>이용약관에 동의합니다.</span>
											</label>
										</dd>
									</dl>
								</article>
								<!-- //이용약관 동의 -->
								<!-- 개인정보 수집 및 이용 동의 -->
								<article class="article">
									<dl class="agree_list dropdown">
										<dt class="tit">개인정보 수집 및 이용 동의 <span class="sm req">[필수]</span></dt>
										<dd class="cont">
											<div class="terms_area auto">
												<!-- 내용 -->
												<p>구단 홈페이지 회원가입을 위하여 아래와 같이 개인정보를 수집·이용하고자 합니다. 수집된 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며, 향후 이용 목적이 변경될 경우 사전에 동의를 구합니다.</p>

												<p class="terms_tit lv2">개인정보 수집 및 이용 내역</p>
												
												<div class="swipearea">
													<div class="inner">
														<div class="tbl_terms">
															<table>
																<colgroup>
																	<col width="286">
																	<col width="286">
																	<col width="286">
																</colgroup>
																<thead>
																	<tr>
																		<th>항목</th>
																		<th>수집ㆍ이용목적</th>
																		<th>보유ㆍ이용기간</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>아이디, 비밀번호, 성명, 이메일 주소, 휴대전화번호, 생년월일, 성별, 암호화된 동일인 식별정보(CI), 만 14세 미만 아동)법정대리인의 성명, 생년월일, 성별, 내외국인 구분, 통신사명, 휴대전화번호, 중복가입확인정보(DI)</td>
																		<td>회원가입 및 관리</td>
																		<td>홈페이지 회원 탈퇴 시까지</td>
																	</tr>
																	<tr>
																		<td>아이디, 비밀번호, 성명, 이메일 주소, 전화번호</td>
																		<td>이벤트 등 서비스 제공</td>
																		<td>서비스 기간 종료 및 법률상 보존 기한</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
												<p>※ 위의 개인정보 수집·이용에 대한 동의를 거부할 권리가 있습니다. 그러나 동의를 거부한 경우 홈페이지 이용에 제한을 받을 수 있습니다. </p>
												<!-- //내용 -->
											</div>
										</dd>
										<dd class="forms"> 
											<label class="frm_checkbox type1">
												<input type="checkbox" class="js_check_each" required name="check2" value="Y">
												<span>개인정보 수집 및 이용에 동의합니다.</span>
											</label>

											<button type="button" class="el_btn sm line2 drop_btn">개인정보 수집ㆍ이용상세 내용 보기
											</button>
										</dd>
										<dd class="cont drop_content no_abs">
											<div class="terms_area" data-lenis-prevent>
													<%@ include file="../common/agree_02.jsp" %>
											</div>
										</dd>
									</dl>
								</article>
								<!-- //개인정보 수집 및 이용 동의 -->
								<!-- 광고ㆍ마케팅 정보 활용 동의 -->
								<article class="article">
									<dl class="agree_list">
										<dt class="tit">광고ㆍ마케팅 정보 활용 동의 <span class="sm no_req">[선택]</span></dt>
										<dd class="cont">
											<div class="terms_area auto">
												<!-- 내용 -->
												<p>마케팅 및 광고 정보 수신 여부 및 마케팅을 위한 개인정보 수집 이용을 거부하실 수 있으며, 거부 시에도 홈페이지 이용에는 아무런 제약이 없습니다. 다만, KCC이지스에서 제공하는 이벤트 및 각종 소식, 혜택 등의 정보를 받으실 수 없습니다.</p>

												<p class="terms_tit lv2">개인정보 수집 및 이용 내역</p>
												
												<div class="swipearea">
													<div class="inner">
														<div class="tbl_terms">
															<table>
																<colgroup>
																	<col width="286">
																	<col width="286">
																	<col width="286">
																</colgroup>
																<thead>
																	<tr>
																		<th>항목</th>
																		<th>수집ㆍ이용목적</th>
																		<th>보유ㆍ이용기간</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>아이디, 비밀번호, 성명, 이메일 주소, 휴대전화번호, 생년월일, 성별, 암호화된 동일인 식별정보(CI), 만 14세 미만 아동)법정대리인의 성명, 생년월일, 성별, 내외국인 구분, 통신사명, 휴대전화번호, 중복가입확인정보(DI)</td>
																		<td>회원가입 및 관리</td>
																		<td>홈페이지 회원 탈퇴 시까지</td>
																	</tr>
																	<tr>
																		<td>아이디, 비밀번호, 성명, 이메일 주소, 전화번호</td>
																		<td>이벤트 등 서비스 제공</td>
																		<td>서비스 기간 종료 및 법률상 보존 기한</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
												<!-- //내용 -->
											</div>
										</dd>
										<dd class="forms"> 
											<label class="frm_checkbox type1">
												<input type="checkbox" class="js_check_each" name="check3" value="Y">
												<span>동의합니다.</span>
											</label> 
										</dd>
									</dl>
								</article>
								<!-- //광고ㆍ마케팅 정보 활용 동의 -->
							</div>


							<div class="member_footer type2">
								<label class="frm_checkbox type1">
									<input type="checkbox" class="js_check_all">
									<span>전체 내용에 동의합니다.</span>
								</label> 

								<div class="btn_area gap10b">
									<button type="button" class="el_btn frm_btn gray2" onclick="javascript:history.back();">취소</button>
									<button type="button" class="el_btn frm_btn blue" onclick="joinSubmit()">확인</button>
								</div>
							</div>

						</form>
					</div>
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