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
	<link rel="stylesheet" href="/resources/common/admin/assets/css/login.css"> <!-- login only -->
	<script src="/resources/common/admin/assets/js/jquery-3.6.0.min.js"></script> 
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-W384F33H');</script></head>
<body class="page-login">
	<div id="wrap">
		<!-- header -->
		<header class="login_header">
			<img src="/resources/common/admin/images/common/logo.svg" alt="KCC EGIS 로고" class="logo">
			<h1 class="heading">KCC 이지스 프로농구단 홈페이지 관리자</h1>
			<p class="sub">KCC EGIS BASKETBALL CLUB WEBSITE ADMIN</p>
		</header>
		<!-- //header -->
		<!-- container -->
		<main class="login_container" role="main">
			<div class="inner">
				<form action="adminLogin" method="post">
					<div class="login_field">
						<div class="row form_area">
							<div class="col forms">
								<input type="text" class="frm_input" name="id" id="id" aria-label="아이디" placeholder="아이디를 입력해주세요" required="required" value="${remember}">
								<input type="password" class="frm_input" name="password" id="password" aria-label="비밀번호" placeholder="비밀번호를 입력해주세요" required="required">
							</div>
							<div class="col btns">
								<button type="submit" class="el_btn btn_submit">로그인</button>
							</div>
						</div>
						<div class="row">
							<label class="frm_checkbox type1">
								<input type="checkbox" aria-label="자동로그인" name="remember" ${remember != "" ? 'checked' : ''}>
								아이디 저장
							</label>
						</div>
					</div>
				</form>
				<ul class="info_list">
					<li>관련된 모든 정보는 웹사이트 운영 이외의 목적으로 사용할 수 없으며,<br>
						이를 어길 경우 법적 조치를 받을 수 있음을 알려드립니다.</li>
					<li>웹사이트 관리자는 비밀번호 등 관련정보 유출에 주의 하시기 바랍니다.</li>	
				</ul>
			</div>
		</main>
		<!-- //container -->

		<!-- footer -->
		<footer class="login_footer">
			<p class="copy">Copyright @ 2024 KCC EGIS BASKETBALL CLUB. All rights reserved.</p>
		</footer>
		<!--//footer -->
	</div>
</body>
</html>