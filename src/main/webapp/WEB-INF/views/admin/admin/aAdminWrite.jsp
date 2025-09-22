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
	function adminUpdate() {
		var form = $("#adminForm");
		var name = $("#adminName").val();
		var email = $("#email").val();
		if(name == ''){
			alert("이름을 입력해주세요.");
			return false;
		}
		if(email == ''){
			alert("이메일을 입력해주세요.");
			return false;
		}
		form.submit();
	
	}
	function adminInsert() {
		var form = $("#adminForm");
		var id = $("#adminId").val();
		var pwd = $("#pwd").val();
		var name = $("#adminName").val();
		var email = $("#email").val();
		if(id == ''){
			alert("아이디를 입력해주세요.");
			return false;
		}
		if(pwd == ''){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		if(name == ''){
			alert("이름을 입력해주세요.");
			return false;
		}
		if(email == ''){
			alert("이메일을 입력해주세요.");
			return false;
		}
		form.submit();
	
	}
	function adminDelete(num){
		if (confirm("정말 삭제하시겠습니까?") == true) {
			if(num=="" || num ==null){
				alert('삭제할수 없습니다.');
				return false;
			}
	        	$.ajax({
			   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
			        url : "deleteAdmin",      // 컨트롤러에서 대기중인 URL 주소이다.
			        data : {
			       	 "num":num
			        },            // Json 형식의 데이터이다.
			        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				        if(res==1){
				        	location.href = 'aAdminList';
				        }else{
				       	 alert("변경에 실패했습니다.");
				        }
			        },
			        error: function() {
						alert("서버에 문제가 있습니다.");
					}
			   });
	            
	        } else {
	            return;
	        }
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
					<h3 class="aside_title">ADMIN</h3>
					<nav id="snb">
						<ul class="snb_list">
							<li><a href="aAdminList" class="snb_link current">관리자관리</a></li> <!-- 현재 페이지 메뉴 current -->
							<li><a href="aAdminLogList" class="snb_link">관리자 접속로그</a></li> <!-- 현재 페이지 메뉴 current -->
						</ul>
					</nav>
				</div>
			</aside>
			<!-- //aside -->

			<!-- main -->
			<main id="contents" class="ly_contents">
				<h2 id="con" class="blind">본문</h2>

				<h3 class="heading">회원관리</h3>

				<form action="mergeAdmin" enctype="multipart/form-data" method="post" id="adminForm">
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
								<c:if test="${result.num != null }">
								<tr>
									<th scope="row">아이디</th>
									<td>
										${result.id}
									</td>
									<th scope="row">이름</th>
									<td>
										<input type="text" class="frm_input" id="adminName" name="adminName" value="${result.name }">
									</td>
								</tr>
								<tr>
									<th scope="row">E-mail</th>
									<td>
										<input type="text" class="frm_input" id="email" name="email" value="${result.email}">
									</td>
									<th scope="row">권한</th>
									<td>
										<select class="frm_select m240" aria-label="권한" name="chk_grade" id="chk_grade">
											<option value="90" <c:if test="${result.chk_grade eq '90'}">selected</c:if>>마스터 관리자</option>
											<option value="80" <c:if test="${result.chk_grade eq '80'}">selected</c:if>>일반 관리자</option>
											<option value="70" <c:if test="${result.chk_grade eq '70'}">selected</c:if>>임시 관리자</option>
										</select>
									</td>
								</tr>
								</c:if>
								<c:if test="${result.num == null }">
								<tr>
									<th scope="row">아이디</th>
									<td>
										<input type="text" class="frm_input" id="adminId" name="adminId" value="${result.id}">
									</td>
									<th scope="row">이름</th>
									<td>
										<input type="text" class="frm_input" id="adminName" name="adminName" value="${result.name }">
									</td>
								</tr>
								<tr>
									<th scope="row">비밀번호</th>
									<td>
										<div class="frm_group">
										<input type="password" class="frm_input" id="pwd" name="pwd">
										</div>
									</td>
									<th scope="row">E-mail</th>
									<td>
										<input type="text" class="frm_input" id="email" name="email" value="${result.email}">
									</td>
								</tr>
								<tr>
									<th scope="row">권한</th>
									<td>
										<select class="frm_select m400" aria-label="권한" name="chk_grade" id="chk_grade">
											<option value="90" <c:if test="${result.chk_grade eq '90'}">selected</c:if>>마스터 관리자</option>
											<option value="80" <c:if test="${result.chk_grade eq '80'}">selected</c:if>>일반 관리자</option>
											<option value="70" <c:if test="${result.chk_grade eq '70'}">selected</c:if>>임시 관리자</option>
										</select>
									</td>
								</tr>
								</c:if>
							</tbody>
						</table>
					</div>

					<div class="btn_area mt40">
						<button type="button" class="el_btn md line" onclick="location.href='aAdminList'">목록</button>
						<c:if test="${result.num != null }">
							<button type="button" class="el_btn md line" onclick="adminUpdate()">수정</button>
						</c:if>
						<c:if test="${result.num == null }">
							<button type="button" class="el_btn md line" onclick="adminInsert()">등록</button>
						</c:if>
						<c:if test="${result.num != null }">
							<button type="button" class="el_btn md line" onclick="adminDelete(${result.num});">삭제</button>
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