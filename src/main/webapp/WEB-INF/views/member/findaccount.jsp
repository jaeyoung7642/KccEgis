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
	<meta property="og:title" content="아이디/비번찾기 : KCC이지스 프로농구단">
	<meta property="og:image" content="https://kccegis.com/resources/common/images/common/kcc_og_thum.jpg">
	<meta property="og:description" content="부산KCC이지스 공식 홈페이지">
	<title>아이디/비번찾기 : KCC이지스 프로농구단</title>
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
	function findId(){
		var member_name = $("#member_name").val();
		var email_id = $("#email_id").val();
		var email_domain = $("#email_domain").val();
		var yyyy = $("#yyyy").val(); 
		var mm = $("#mm").val(); 
		var dd = $("#dd").val(); 
		if(member_name == ''){
			alertPop('이름을 입력해주세요.');
			return;
		}
		if(email_id == '' || email_domain == ''){
			alertPop('이메일을 입력해주세요.');
			return;
		}
		if(yyyy == '' || mm == '' || dd == ''){
			alertPop('생년월일을 입력해주세요.');
			return;
		}
		$.ajax({
   			type:'Post',
   			data : {
   					"member_name" : member_name,
   					"email_id" : email_id,
   					"email_domain" : email_domain,
   					"yyyy" : yyyy,
   					"mm" : mm,
   					"dd" : dd
					},
   			url: 'findId',
   			success:function(result){
   				if(result.msg != ''){
   					$("#findIdMsg").show();
   					$("#findIdMsg").html(result.msg);
   				}else{
   					location.href = "findaccountResult?id="+result.id;
   				}
   	         },
   	         error:function(){
   	            alert("서버에 문제가 있습니다.");
   	         }
   		});//ajax
	}
	function findPwd(){
		var member_id = $("#member_id").val();
		var member_name2 = $("#member_name2").val();
		var email_id2 = $("#email_id2").val();
		var email_domain2 = $("#email_domain2").val();
		if(member_id == ''){
			alertPop('아이디를 입력해주세요.');
			return;
		}
		if(member_name == ''){
			alertPop('이름을 입력해주세요.');
			return;
		}
		if(email_id == '' || email_domain == ''){
			alertPop('이메일을 입력해주세요.');
			return;
		}
		$.ajax({
   			type:'Post',
   			data : {
   					"member_id" : member_id,
   					"member_name" : member_name2,
   					"email_id" : email_id2,
   					"email_domain" : email_domain2
					},
   			url: 'findPwd',
   			success:function(result){
   				if(result.msg != ''){
   					$("#findPwdMsg").show();
   					$("#findPwdMsg").html(result.msg);
   				}else{
   					location.href = "loginForm?msg=메일이 발송되었습니다.";
   				}
   	         },
   	         error:function(){
   	            alert("서버에 문제가 있습니다.");
   	         }
   		});//ajax
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
					<h3 class="page_title">아이디/비밀번호 찾기</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
				</div>
			</div>
		
			<section class="section member_content">
				<div class="ly_inner xsm">
					<!-- 아이디 찾기 -->
					<article class="bl_card findaccount_card m_full">
						<div class="member_inner">
							<div class="member_header">
								<p class="mb_heading">아이디 찾기</p>
							</div> 
							<p class="el_desc_md">가입하신 계정의 이름 및 휴대폰 번호로<br class="xm_show">  아이디를 확인하실 수 있습니다.</p>

							<form class="frm_field mt40">
								<div class="row">
									<input type="text" class="frm_input" id="member_name" name="member_name" aria-label="이름" placeholder="이름 입력" required>
								</div>
								<div class="row">
									<div class="frm_email type2">
										<div class="col frm_group gap10b">
											<input type="text" class="frm_input" id="email_id" name="email_id" aria-label="이메일 아이디" placeholder="이메일 입력"  required>
											<span class="txt">@</span>
											<input type="text" class="frm_input email_input" id="email_domain" name="email_domain" aria-label="이메일 도메인" required>
										</div>
										<div class="col frm_group">
											<select class="frm_select email_select" aria-label="이메일 도메인 선택">
												<option value="">직접입력</option>
												<option value="1">naver.com</option>
												<option value="2">gmali.com</option>
												<option value="3">daum.net</option>
												<option value="4">hanmail.net</option>
												<option value="5">nate.com</option>
												<option value="6">paran.com</option>
												<option value="7">yahoo.com</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="frm_group gap10">
										<select class="frm_select" aria-label="태어난 해 선택" name="yyyy" id="yyyy">
											<option value="">출생년도</option>
											<c:set var="nowNum" value="2001"></c:set>
											<c:forEach var="i" begin="1945" end="${nowNum}" step="1">
						                        <option value="${nowNum-i+1945}">${nowNum-i+1945}</option>
								            </c:forEach>
										</select>
										<select class="frm_select" aria-label="태어난 달 선택" name="mm" id="mm">
											<option value="">월</option>
											<c:forEach var="i" begin="1" end="12">
						                        <c:if test="${i<10}">
							                        <option value="0${i}">0${i}</option>
						                    	</c:if>
						                    	<c:if test="${i>9}">
							                        <option value="${i}">${i}</option>
						                    	</c:if>
								            </c:forEach>
										</select>
										<select class="frm_select" aria-label="태어난 일 선택" name="dd" id="dd">
											<option value="">일</option>
											<c:forEach var="i" begin="1" end="31">
						                        <c:if test="${i<10}">
							                        <option value="0${i}">0${i}</option>
						                    	</c:if>
						                    	<c:if test="${i>9}">
							                        <option value="${i}">${i}</option>
						                    	</c:if>
								            </c:forEach>
										</select>
										</div>
									</div>
								<!-- 에러 메시지 -->
								<p class="el_error" id="findIdMsg" style="display: none;">잘못된 형식입니다.</p>
							</form>

							<div class="member_footer type2">
								<div class="btn_area">
									<button type="button" class="el_btn frm_btn blue" onclick="findId()">확인</button>
								</div>
							</div>
						</div>
					</article>
					<!-- //아이디 찾기 -->

					<!-- 비밀번호 찾기 -->
					<article class="bl_card findaccount_card m_full space50">
						<div class="member_inner">
							<div class="member_header">
								<p class="mb_heading">비밀번호 찾기</p>
							</div> 
							<p class="el_desc_md">가입하신 계정의 아이디 및 휴대폰 번호로<br class="xm_show">  임시비밀번호를 발급받을 수 있습니다. </p>

							<form class="frm_field mt40">
								<div class="row">
									<input type="text" class="frm_input" id="member_id" aria-label="아이디" placeholder="아이디 입력" required>
								</div>
								<div class="row">
									<input type="text" class="frm_input" id="member_name2" aria-label="이름" placeholder="이름 입력" required>
								</div>
								<div class="row">
									<div class="frm_email type2">
										<div class="col frm_group gap10b">
											<input type="text" class="frm_input" id="email_id2" name="email_id2" aria-label="이메일 아이디" placeholder="이메일 입력"  required>
											<span class="txt">@</span>
											<input type="text" class="frm_input email_input" id="email_domain2" name="email_domain2" aria-label="이메일 도메인" required>
										</div>
										<div class="col frm_group">
											<select class="frm_select email_select" aria-label="이메일 도메인 선택">
												<option value="">직접입력</option>
												<option value="1">naver.com</option>
												<option value="2">gmali.com</option>
												<option value="3">daum.net</option>
												<option value="4">hanmail.net</option>
												<option value="5">nate.com</option>
												<option value="6">paran.com</option>
												<option value="7">yahoo.com</option>
											</select>
										</div>
									</div>
								</div>
								
								<!-- 에러 메시지 -->
								<p class="el_error" id="findPwdMsg" style="display: none;"></p>
							</form>

							<div class="member_footer type2">
								<div class="btn_area">
									<button type="button" class="el_btn frm_btn blue" onclick="findPwd()">확인</button>
								</div>
							</div>
						</div>
					</article>
					<!-- //비밀번호 찾기 -->
				</div>
			</section>

			<script>
				// email input
				$(document).on('change', '.email_select', function() {
					const selectText = $(this).find('option').filter(':checked').text();
					const $input =$(this).parents('.frm_email').find('.email_input');
					
					if (selectText === '직접입력') {
						$input.val('').attr('readonly', false);
					} else {
						$input.val(selectText).attr('readonly', true);
					}
				});
			</script>

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