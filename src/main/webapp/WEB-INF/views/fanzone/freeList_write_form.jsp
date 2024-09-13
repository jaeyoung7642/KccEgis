<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<link rel="stylesheet" href="/resources/common/assets/css/board.css"> <!-- 디렉토리 media/fan only -->
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
	<script src="/resources/common/assets/js/snsShare.js" defer></script> <!-- 개발용 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="/ckeditor/ckeditor.js"></script>
	<script src="https://www.google.com/recaptcha/api.js?render=6Le1xioqAAAAANCbdJzIjbh9FG1OVfCpSSL32a1Y"></script>
	<script src="/resources/common/assets/js/gsap.min.js" defer></script> <!-- main only -->
	<script src="/resources/common/assets/js/ScrollTrigger.min.js" defer></script> <!-- main only -->
	<script>
	function getQueryParam(name) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }

    window.onload = function() {
        // URL에서 'msg' 파라미터 읽기
        var msg = getQueryParam('msg') || '';

        // URL 디코딩
        msg = decodeURIComponent(msg).trim();

        // 콘솔에서 값 확인
        console.log('msg:', msg);

        // 메시지가 있을 경우 알림 표시
        if (msg !== '') {
            alert(msg);
        }
    }
    function onSubmit(e) {
        e.preventDefault();
        grecaptcha.ready(function() {
            grecaptcha.execute("6Le1xioqAAAAANCbdJzIjbh9FG1OVfCpSSL32a1Y", { action: 'freeWrite' }).then(function(token) {
                document.getElementById('recaptchaResponse').value = token;
                document.getElementById('postForm').submit();
            }).catch(function(error) {
                console.error("reCAPTCHA error:", error);
            });
        });
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
		<main id="container" class="ly_container fanzone">
			<h2 id="con" class="blind">본문</h2>
			<!-- page top -->
			<div class="page_top">
				<div class="content">
					<!-- location -->
					<ul class="location p_hide">
						<li class="home"><span class="blind">홈</span></li>
						<li>FANZONE</li>
						<li>팬게시판</li>
					</ul>

					<!-- title -->
					<h3 class="page_title">FANZONE</h3>
				</div>

				<!-- snb 2depth -->
				<div class="snb_2dth_area">
					<div class="inner">
						<div class="snb_2dth snb_list menu_slider">
							<div class="swiper-wrapper">
								<a href="noticeList" class="swiper-slide snb_link"><span>공지사항</span></a> 
								<a href="freeList" class="swiper-slide snb_link current"><span>팬게시판</span></a> <!-- 해당페이지에 current 추가 -->
								<a href="eventList" class="swiper-slide snb_link"><span>이벤트</span></a>
								<a href="wallpaperList" class="swiper-slide snb_link"><span>월페이퍼</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 게시판 등록 -->
			<section class="section board_write">
				<div class="ly_inner sm">
					<article class="bl_card board_write_card m_full">
						<form action="freeWrite" method="post" id="postForm" onsubmit="onSubmit(event)">
							<div class="frm_field">
								<div class="row">
									<input type="text" class="frm_input" aria-label="작성자" value="${loginUserMap.name}(${loginUserMap.id})" readonly>
									<input type="hidden" name="id" value="${loginUserMap.id }">
									<input type="hidden" name="writer" value="${loginUserMap.name }">
									<input type="hidden" name="num" value="${freeDetail.num }">
								</div>
								<div class="row">
									<input type="text" name="subject" class="frm_input" aria-label="제목" placeholder="제목을 입력하세요" required value="${freeDetail.subject }">
								</div>
								<div class="row">
									<!-- 편집기 영역 -->
									<textarea name="content" id="ckeditor" cols="30" rows="10" class="frm_input h320" required>${freeDetail.content }</textarea>
								</div>
							</div>
							<script>
							$(function() {
								CKEDITOR.replace('ckeditor',{
									uploadUrl: "/fileupload.do/drag",
									filebrowserUploadUrl:  "/fileupload.do",
									toolbar: [
									    { name: 'clipboard', items: [ 'Undo', 'Redo' ] },
									    { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike' ] },
									    { name: 'paragraph', items: [ 'Blockquote','Indent','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
									    { name: 'insert', items: [ 'Image', 'Table', 'SpecialChar' ] },
									    { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
									    { name: 'Styles', items: [ 'Font', 'FontSize' ] },
									    { name: 'Links', items: [ 'Link'] },
									],
									font_names: '맑은 고딕/Malgun Gothic;' +
					                '돋움/Dotum;' +
					                '굴림/Gulim;' +
					                '바탕/Batang;' +
					                '궁서/Gungsuh;' +
					                'HY견고딕/HY견고딕;' +
					                'HY견명조/HY견명조'
								});
							});
						    </script>	
							
							<div class="board_write_footer">
								<div class="btn_area gap10b">
									<button type="button" class="el_btn frm_btn gray2" onclick="javascript:history.back();">취소</button>
									<input type="hidden" id="recaptchaResponse" name="recaptchaResponse"/>
									<button class="el_btn frm_btn blue" data-target="#rejectPopup">확인</button>
								</div>
							</div>
						</form>
					</article>
				</div>
			</section>
			<!-- 게시판 등록 -->


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
