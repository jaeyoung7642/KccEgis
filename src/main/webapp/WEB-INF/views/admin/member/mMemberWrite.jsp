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
	function updatePwd() {
		var num = $("#num").val();
		var pwd = $("#pwd").val();
		if(pwd == ''){
			alert('비밀번호를 입력해주세요');
			return false;
		}
		$.ajax({
        	url: "changePwd",
        	type: 'POST',
			data: {
				num : num,
				pwd : pwd
			},
			success: function(data) {
				if(data.result){
					alert("비밀번호가 변경됐습니다.");
					location.href = "mMemberWrite?num="+num;
				}else{
					alert("비밀번호 변경 실패!! 관리자에게 문의 부탁드립니다.");
				}
			},
			error: function() {
				alert("서버에 문제가 있습니다.");
			}
		});
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
					<h3 class="aside_title">MEMBER</h3>
					<nav id="snb">
						<ul class="snb_list">
							<li><a href="mMemberList" class="snb_link current">회원관리</a></li> <!-- 현재 페이지 메뉴 current -->
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">회원관리</h3>

				<form action="" enctype="multipart/form-data" method="post">
					<div class="board_write">
						<table class="tbl type1">
							<caption>회원 관리 테이블</caption>
							<colgroup>
								<col width="150">
								<col width="325">
								<col width="150">
								<col>
							</colgroup>
							<input type="hidden" name="num" id="num" value="${result.num }">
							<tbody>
								<tr>
									<th scope="row">아이디</th>
									<td>
										${result.id }
									</td>
									<th scope="row">이름</th>
									<td>
										${result.name }
									</td>
								</tr>
								<tr>
									<th scope="row">비밀번호</th>
									<td>
										<div class="frm_group">
										<input type="password" class="frm_input" id="pwd" name="pwd">
										<button type="button" class="el_btn md line" onclick="updatePwd()">비밀번호<br>강제변경</button>
										</div>
									</td>
									<th scope="row">생년월일</th>
									<td>
										${result.jumin_dec }
									</td>
								</tr>
								<tr>
									<th scope="row">주소</th>
									<td colspan="3">
										<div class="frm_group">
											${result.addr_dec} ${result.daddr_dec}
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">E-mail</th>
									<td>
										${result.email_dec }
									</td>
									<th scope="row">메일수신</th>
									<td>
										<c:if test="${result.chk_email == 'Y'}">수신</c:if>
										<c:if test="${result.chk_email == 'N'}">거부</c:if>
									</td>
								</tr>
								<tr>
									<th scope="row">연락처</th>
									<td>
										${result.htel_dec }
									</td>
									<th scope="row">휴대폰 수신</th>
									<td>
										<c:if test="${result.chk_sms == 'Y'}">수신</c:if>
										<c:if test="${result.chk_sms == 'N'}">거부</c:if>
									</td>
								</tr>
								<tr>
									<th scope="row">가입일시</th>
									<td>
										${result.regDate }
									</td>
									<th scope="row">최종방문일시</th>
									<td>
										${result.loginDate }
									</td>
								</tr>
								<tr>
								<tr>
									<th scope="row">IP주소</th>
									<td>
										${result.ip }
									</td>
									<th scope="row">상태</th>
									<td>
										<c:if test="${result.chk_state == 'S'}">가입</c:if>
										<c:if test="${result.chk_state == 'N'}">탈퇴</c:if>
										<c:if test="${result.chk_state == 'O'}">임시탈퇴</c:if>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_area mt40">
						<button type="button" class="el_btn md line" onclick="location.href='mMemberList'">목록</button>
					<c:if test="${result.chk_state == 'S'}">
						<button type="button" class="el_btn md line" onclick="updateState(${result.num },'O')">임시탈퇴</button>
						<button type="button" class="el_btn md line" onclick="updateState(${result.num },'N')">탈퇴</button>
					</c:if>
					<c:if test="${result.chk_state == 'O'}">
						<button type="button" class="el_btn md line" onclick="updateState(${result.num },'S')">복구</button>
						<button type="button" class="el_btn md line" onclick="updateState(${result.num },'N')">탈퇴</button>
					</c:if>
					</div>
				</form>
			
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