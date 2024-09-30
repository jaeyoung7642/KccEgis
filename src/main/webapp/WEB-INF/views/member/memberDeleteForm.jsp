<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<meta property="og:title" content="회원정보수정 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 웹사이트">
	<title>회원정보수정 : KCC이지스 프로농구단</title>
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/assets/font/font.css" />
	<link rel="shortcut icon" href="/resources/common/images/common/favicon_kccegis.png">
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
	function memberDelete(){
		var member_id = $("#member_id").val();
		var member_pwd = $("#member_pwd").val();
		var delete_reason = $("#delete_reason").val();
		if(member_id != '' && member_pwd !='' && delete_reason !=''){
			if (confirm("회원탈퇴 시 30일 동안 재가입이 불가능합니다. 회원탈퇴를 완료하시겠습니까?") == true) {
				$.ajax({
					type:'post',
					data : {
						"member_id" : member_id,
						"member_pwd" : member_pwd,
						"delete_reason" : delete_reason
					},
					url: 'deleteMember',
					success:function(result){
						if(result.deleteMsg != ''){
							alertPop(result.deleteMsg);
						}else{
							location.href="/deleteResult";
						}
			         },
			         error:function(){
			            alert("서버에 문제가 있습니다.");
			         }
				});//ajax
			}
		}else{
			alertPop("필수값을 입력해주세요.");
		}
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
		<main id="container" class="ly_container member m_white">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- title -->
					<h3 class="page_title">회원탈퇴</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
				</div>
			</div>
		
			<section class="section member_content">
				<div class="ly_inner sm">
					<div class="bl_card agreement_card m_full">
						<article>
							<dl class="agree_list gap17">
								<dt class="tit icon">
									<span class="el_ccl check"></span> 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.
								</dt>
								<dd class="cont">
									<div class="terms_area auto">
										<ol class="terms_list">
											<li>
												<p class="terms_tit lv2 txt_black">사용하고 계신 아이디(${user.id})는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</p>
												<p>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</p> 
												<p>또한, 탈퇴 후 30일 동안 재가입이 불가능합니다.</p>
											</li>
											<li>
												<p class="terms_tit lv2 txt_black">탈퇴 후 회원정보는 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</p>
												<p>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</p>
											</li>
											<li>
												<p class="terms_tit lv2 txt_black">탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</p>
												<p>팬게시판, 이벤트, 단관신청 등의 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.</p>
												<p>삭제를 원하는 게시글 및 댓글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.</p>
												<p>탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없으므로 임의로 삭제해드릴 수 없습니다.</p>
											</li>
										</ol>
									</div>
								</dd>
							</dl>
						</article>

						<form id="deleteForm" action="deleteMember">
							<article class="member_inner max470 mt50">
								<div class="frm_field">
									<div class="row">
										<input type="text" class="frm_input" aria-label="탈퇴할 아이디" placeholder="탈퇴할 아이디 입력" name="member_id" id="member_id">
									</div>
									<div class="row">
										<input type="password" class="frm_input" aria-label="탈퇴할 아이디의 비밀번호" placeholder="탈퇴할 아이디의 비밀번호 입력" name="member_pwd" id="member_pwd">
									</div>
									<div class="row">
										<textarea class="frm_input" aria-label="탈퇴 사유" placeholder="탈퇴 사유 입력" data-lenis-prevent name="delete_reason" id="delete_reason"></textarea>
										<p class="el_desc_frm mt10">탈퇴 사유를 적어주시면 회원님의 의견을 수용하여 좀 더 발전하는 KCC가 되도록 노력하겠습니다.</p>
									</div>
								</div>
							</article>

							<div class="member_footer type2 mt50-20">
								<div class="btn_area gap10b">
									<button type="button" class="el_btn frm_btn gray2">취소</button>
									<button type="button" class="el_btn frm_btn error" onclick="memberDelete()">탈퇴</button>
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