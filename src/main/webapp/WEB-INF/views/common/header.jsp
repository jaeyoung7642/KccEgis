<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
</head>
	<header id="header" class="ly_header preload">
	<div class="header_inner ly_inner">

		<h1 class="header_logo">
			<a href="/">
				<img src="/resources/common/images/common/logo.svg" alt="">
				<span class="blind">KCC EGIS</span>
			</a>
		</h1>

		<!-- toggle (mo only) -->
		<button class="el_btn openNav p_show" aria-label="메뉴 열기" data-svg="menu"></button>
		<!-- //toggle -->
		
		<!-- navigation -->
		<nav id="navigation" class="navigation">
			<div class="inner">
			<h2 id="nav" class="blind">메뉴</h2>
			
				<!-- nav header (mo only) -->
				<div class="nav_header">
					<button class="el_btn closeNav p_show" aria-label="메뉴 닫기">
						<img src="/resources/common/images/common/ico_close.svg" alt="">
					</button>
					<div class="header_logo p_show">
						<a href="/">
							<img src="/resources/common/images/common/logo.svg" alt="">
							<span class="blind">KCC EGIS</span>
						</a>
					</div>
				</div>
				<!-- // nav header (mo only) -->

				<!-- nav body -->
				<div class="nav_body" data-lenis-prevent>
					<ul class="gnb_list">
						<li class="gnb_li hasSub">
							<a href="scheduleList" class="gnb_link">GAME</a>
							<div class="gnb_sub">
								<ul class="sub_list">
									<li><a href="scheduleList" class="sub_link">경기일정/결과</a></li>
									<li><a href="teamRank" class="sub_link">팀/선수 순위</a></li>
									<li><a href="teamRecord" class="sub_link">시즌 기록실</a></li>
									<li><a href="ticket" class="sub_link">티켓팅</a></li>
								</ul>
							</div>
						</li> 
						<li class="gnb_li hasSub">
							<a href="coachList" class="gnb_link">PLAYER</a>
							<div class="gnb_sub">
								<ul class="sub_list">
									<li><a href="coachList" class="sub_link">코칭스탭</a></li>
									<li><a href="playerList" class="sub_link">선수</a></li>
									<li><a href="cheer" class="sub_link">응원단</a></li>
									<li><a href="cheer_song" class="sub_link">응원가</a></li>
								</ul>
							</div>
						</li> 
						<li class="gnb_li hasSub">
							<a href="newsList" class="gnb_link">MEDIA</a>
							<div class="gnb_sub">
								<ul class="sub_list">
									<li><a href="newsList" class="sub_link">뉴스</a></li>
									<li><a href="movieListH" class="sub_link">영상</a></li>
									<li><a href="photoListH" class="sub_link">사진</a></li>
								</ul>
							</div>
						</li> 
						<li class="gnb_li hasSub">
							<a href="noticeList" class="gnb_link">FANZONE</a>
							<div class="gnb_sub">
								<ul class="sub_list">
									<li><a href="noticeList" class="sub_link">공지사항</a></li>
									<li><a href="freeList" class="sub_link">팬게시판</a></li>
									<li><a href="eventList" class="sub_link">이벤트</a></li>
									<li><a href="wallpaperList" class="sub_link">월페이퍼</a></li>
								</ul>
							</div>
						</li> 
						<li class="gnb_li hasSub">
							<a href="#" class="gnb_link">YOUTH</a>
							<div class="gnb_sub">
								<ul class="sub_list">
									<li><a href="#" class="sub_link">JR.KCC 소개</a></li>
									<li><a href="#" class="sub_link">강사진 소개</a></li>
								</ul>
							</div>
						</li> 
						<li class="gnb_li hasSub">
							<a href="front" class="gnb_link">CLUB</a>
							<div class="gnb_sub">
								<ul class="sub_list">
									<li><a href="front" class="sub_link">구단소개</a></li>
									<li><a href="chistory" class="sub_link">역사관</a></li>
									<li><a href="sponsor" class="sub_link">스폰서</a></li>
									<li><a href="kccadList" class="sub_link">KCC광고</a></li>
								</ul>
							</div>
						</li> 
					</ul>

					<!-- sns -->
					<div class="header_utils sns">
						<a href="INSTAGRAM" target="_blank" rel="noreferrer" aria-label="인스타그램(새창열림)" class="el_btn ccl in siteLink">
							<img src="/resources/common/images/common/sns_instagram.svg" alt="">
						</a>
						<a href="FACEBOOK" target="_blank" rel="noreferrer" aria-label="페이스북(새창열림)" class="el_btn ccl fa siteLink">
							<img src="/resources/common/images/common/sns_facebook.svg" alt="">
						</a>
						<a href="NAVERPOST" target="_blank" rel="noreferrer" aria-label="네이버포스트(새창열림)" class="el_btn ccl na siteLink">
							<img src="/resources/common/images/common/sns_post.svg" alt="">
						</a>
					</div>
					<!-- //sns -->

					<!-- nav quick (mo only) -->
					<div class="nav_quick p_show">
						<a href="scheduleList" class="el_btn btn1"><span class="el_ico ico_calendar2"></span> 경기일정</a>
						<a href="coachList" class="el_btn btn1"><span class="el_ico ico_player"></span> 선수단</a>
						<a href="mypage" class="el_btn btn1"><span class="el_ico ico_mypage"></span> 마이페이지</a>
					</div>
					<!-- //nav quick -->

					<!-- header banner (mo only) -->
					<div class="header_bnn p_show">
						<a href="KCCWORLD" target="_blank" rel="noreferrer" aria-label="KCC(새창열림)" class="bnn kcc siteLink">
							<div class="bnn_box">
								<p>글로벌 응용소재화학기업</p>
							</div>
						</a>
					</div>
					<!-- //header banner -->
				</div>
				<!-- //nav body -->

			</div>
		</nav>
		
		<!-- utils -->
		<div class="header_utils utils">
			<c:if test="${loginUserMap == null}">
			<a href="loginForm" aria-label="로그인" class="el_btn" data-svg="login"></a>
			</c:if>
			<c:if test="${loginUserMap != null}">
			<a href="logout" aria-label="로그아웃" class="el_btn" data-svg="logout"></a>
			</c:if>
			<a href="mypage" aria-label="마이페이지" class="el_btn" data-svg="mypage"></a>
			<a href="ticket" class="el_btn p_hide" data-svg="ticket"></a>
			<button type="button" aria-label="전체 메뉴 열기" class="el_btn p_hide openAllMenu" data-svg="menu" aria-expanded="false"></button>
		</div>
		<!-- //utils -->
	</div>

	<!-- allmenu -->
	<div id="allMenu" class="ly_allMenu" data-lenis-prevent> 
		<div class="inner">
			<ul class="allMenu_list">
				<li class="dth1">
					<a href="scheduleList" class="dth1_link">GAME</a>
					<ul class="dth2"> 
						<li><a href="scheduleList" class="dth2_link">경기일정/결과</a></li>
						<li><a href="teamRank" class="dth2_link">팀/선수 순위</a>
							<ul class="dth3">
								<li><a href="teamRank" class="dth3_link">- 팀 순위</a>
								<li><a href="playerRank" class="dth3_link">- 선수 순위</a>
							</ul>
						</li>
						<li><a href="teamRecord" class="dth2_link">시즌 기록실</a>
							<ul class="dth3">
								<li><a href="teamRecord" class="dth3_link">- 팀 기록</a>
								<li><a href="playerRecord" class="dth3_link">- 선수 기록</a>
							</ul>
						</li>
						<li><a href="ticket" class="dth2_link">티켓팅</a>
							<ul class="dth3">
								<li><a href="ticket" class="dth3_link">- 티켓안내</a>
								<li><a href="ticket_faq" class="dth3_link">- 티켓FAQ</a>
							</ul>
						</li>
					</ul>
				</li> 
				<li class="dth1">
					<a href="coachList" class="dth1_link">PLAYER</a>
					<ul class="dth2">
						<li><a href="coachList" class="dth2_link">코칭스탭</a></li>
						<li><a href="playerList" class="dth2_link">선수</a>
							<ul class="dth3">
								<li><a href="playerList" class="dth3_link">- 전체</a>
								<li><a href="playerList?pos_code=g" class="dth3_link">- 가드</a>
								<li><a href="playerList?pos_code=f" class="dth3_link">- 센터</a>
								<li><a href="playerList?pos_code=c" class="dth3_link">- 포워드</a>
								<li><a href="playerList?pos_code=s" class="dth3_link">- 군복무</a>
							</ul>
						</li>
						<li><a href="cheer" class="dth2_link">응원단</a></li>
						<li><a href="cheer_song" class="dth2_link">응원가</a></li>
					</ul>
				</li> 
				<li class="dth1">
					<a href="newsList" class="dth1_link">MEDIA</a>
					<ul class="dth2">
						<li><a href="newsList" class="dth2_link">뉴스</a></li>
						<li><a href="movieListH" class="dth2_link">영상</a>
							<ul class="dth3">
								<li><a href="movieListH" class="dth3_link">- 경기 영상</a>
								<li><a href="movieListE" class="dth3_link">- 이벤트 영상</a>
							</ul>
						</li>
						<li><a href="photoListH" class="dth2_link">사진</a>
							<ul class="dth3">
								<li><a href="photoListH" class="dth3_link">- 경기 사진</a>
								<li><a href="photoListE" class="dth3_link">- 이벤트 사진</a>
							</ul>
						</li>
					</ul>
				</li> 
				<li class="dth1">
					<a href="noticeList" class="dth1_link">FANZONE</a>
					<ul class="dth2">
						<li><a href="noticeList" class="dth2_link">공지사항</a></li>
						<li><a href="freeList" class="dth2_link">팬게시판</a></li>
						<li><a href="eventList" class="dth2_link">이벤트</a></li>
						<li><a href="wallpaperList" class="dth2_link">월페이퍼</a></li>
					</ul>
				</li> 
				<li class="dth1">
					<a href="#" class="dth1_link">YOUTH</a>
					<ul class="dth2">
						<li><a href="#" class="dth2_link">JR.KCC 소개</a></li>
						<li><a href="#" class="dth2_link">강사진소개</a></li>
					</ul>
				</li> 
				<li class="dth1">
					<a href="front" class="dth1_link">CLUB</a>
					<ul class="dth2">
						<li><a href="front" class="dth2_link">구단소개</a>
							<ul class="dth3">
								<li><a href="front" class="dth3_link">- 구단 프론트</a>
								<li><a href="ci" class="dth3_link">- 구단 CI</a>
								<li><a href="busan_gym" class="dth3_link">- 구장 안내</a>
							</ul>
						</li>
						<li><a href="chistory" class="dth2_link">역사관</a>
							<ul class="dth3">
								<li><a href="chistory" class="dth3_link">- 구단 히스토리</a>
								<li><a href="phistory" class="dth3_link">- 선수단 히스토리</a>
								<li><a href="seasonReview" class="dth3_link">- 시즌 리뷰</a>
							</ul>
						</li>
						<li><a href="sponsor" class="dth2_link">스폰서</a></li>
						<li><a href="kccadList" class="dth2_link">KCC광고</a></li>
					</ul>
				</li> 
			</ul>

			<!-- header banner -->
			<div class="header_bnn">
				<a href="KCCWORLD" target="_blank" rel="noreferrer" aria-label="KCC(새창열림)" class="bnn kcc siteLink">
					<div class="bnn_box">
						<p>글로벌 응용소재화학기업</p>
					</div>
				</a>
				<a href="TICKET" target="_blank" rel="noreferrer" aria-label="티켓예매(새창열림)" class="bnn ticket siteLink">
					<div class="bnn_box">
						<p>KCC 이지스 티켓예매</p>
					</div>
				</a>
			</div>
			<!-- //header banner -->
		</div>
	</div>
	<!-- allmenu -->
</header>




