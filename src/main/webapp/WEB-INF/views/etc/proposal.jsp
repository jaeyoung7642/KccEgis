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
		<main id="container" class="ly_container etc m_white">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- title -->
					<h3 class="page_title">건의하기</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
				</div>
			</div>
		
			<section class="section member_content">
				<div class="ly_inner sm">
					<div class="bl_card agreement_card type2 m_full">
						<form action="proposal_insert">
							<!-- 약관동의 -->
							<article>
								<div class="terms_area auto">
									<p class="terms_tit lv1 txt_dark3">개인정보 수집·이용에 대한 동의</p>
									<p>당사 홈페이지 건의하기 서비스 이용을 위하여 아래와 같이 개인정보를 수집·이용하고자 합니다.<br>내용을 자세히 읽으신 후 동의 여부를 결정하여 주십시오.</p>

									<p class="terms_tit lv2">[필수] 개인정보 수집·이용 내역</p>
									
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
															<td>성명, 이메일 주소</td>
															<td>건의하기 서비스 제공</td>
															<td>서비스 공급 완료 시까지</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>

								<p class="el_desc_md3 mt10">
									※ 위의 개인정보 수집·이용에 대한 동의를 거부할 권리가 있습니다.<br>
									그러나 동의를 거부한 경우 홈페이지 이용에 제한을 받을 수 있습니다.<br><br>
									위와 같이 개인정보를 수집·이용하는데 동의하십니까?</p>

								<label class="frm_checkbox type1 mt10">
									<input type="checkbox" required>
									<span>개인정보 수집 이용에 동의합니다.</span>
								</label>	
							</article>
							<!-- //약관동의 -->

							<article class="member_inner full line mt30-26">
								<div class="frm_field">
									<div class="row">
										<input type="text" class="frm_input" name="writer" aria-label="작성자명" placeholder="작성자명 입력" required>
									</div>
									<div class="row">
										<input type="text" class="frm_input" name="email" aria-label="이메일" placeholder="이메일 입력" required>
									</div>
									<div class="row">
										<input type="text" class="frm_input" name="subject" aria-label="제목" placeholder="제목 입력" required>
									</div>
									<div class="row">
										<textarea class="frm_input h320" name="content" placeholder="건의 내용 입력" required></textarea>
									</div>
								</div>
							</article>
						
							<div class="member_footer type2 mt50-20">
								<div class="btn_area gap10b">
									<button type="button" class="el_btn frm_btn gray2 openModal" data-target="#rejectPopup">취소</button>
									<button class="el_btn frm_btn blue">확인</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</section>

			<!-- 취소 컨펌 알럿 -->
			<div id="rejectPopup" tabindex="-1" class="alert modal conformPopup" data-focus="modal" style="    --pmax: 370px;">
				<div class="modal_module">
					<div class="modal_content">
						<div class="modal_body">
							<p class="alert_msg md" style="letter-spacing: -0.03em;">취소 시 현재까지 작성된 내용은 저장되지 않습니다.<br>
								계속 진행하시겠습니까?</p>
							<div class="btn_area gap10b mt30-26">
								<button type="button" class="el_btn frm_btn gray2 closeModal">취소</button>
								<a href="/" class="el_btn frm_btn blue" data-focus-next="modal">확인</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 취소 컨펌 알럿 -->

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