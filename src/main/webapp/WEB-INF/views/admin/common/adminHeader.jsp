<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=1270, initial-scale=1">
	<link rel="stylesheet preload" as="style" crossorigin href="/resources/common/admin/assets/font/font.css" />
	
	<link rel="stylesheet" href="/resources/common/admin/assets/css/common.css">
	<link rel="stylesheet" href="/resources/common/admin/assets/css/subpage.css"> 
	
	<script src="/resources/common/admin/assets/js/jquery.nice-select.min.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/common.js" defer></script> <!-- sub page only -->
	<script src="/resources/common/admin/assets/js/jquery-3.6.0.min.js"></script>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-W384F33H');</script></head>
	<header id="header" class="ly_header">
				<!-- logo -->
				<h1 class="header_logo">
					<img src="/resources/common/admin/images/common/logo.svg" alt="">
					<span class="blind">KCC EGIS</span>
				</h1>

				<!-- gnb -->
				<nav id="gnb" class="header_gnb">
					<h2 id="nav" class="blind">메뉴</h2>
					<ul class="gnb_list">
						<c:if test="${user.chk_grade == '70'}">
						</c:if>
						<c:if test="${user.chk_grade != '70'}">
						<li><a href="gScheduleList" class="gnb_link"><span>GAME</span></a></li>
						<li><a href="pCoachProfileList" class="gnb_link"><span>PLAYER</span></a></li>
						<li><a href="mNewsList" class="gnb_link"><span>MEDIA</span></a></li>
						<li><a href="fNoticeList" class="gnb_link"><span>FANZONE</span></a></li> <!-- 현재 페이지 메뉴 current -->
						<li><a href="cKccAdList" class="gnb_link"><span>CLUB</span></a></li>
						<li><a href="ePopupList" class="gnb_link"><span>ETC</span></a></li>
						<li><a href="mMemberList" class="gnb_link"><span>MEMBER</span></a></li>
						</c:if>
					</ul>
				</nav>

				<div class="header_utils">
					<a href="adminLogout" class="util_link">로그아웃</a>
					<a href="/" class="util_link" target="_blank" rel="noreferrer">홈페이지</a>
				</div>
	</header>
<script>
	var msg = "${msg}"
	if(msg != ""){
		alert(msg);
	}
</script>
