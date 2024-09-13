$(function() {
updateCountdown();
updateCountdown1();
	function loadPage(selector, url, callback) {
		$(selector).load(url, function(res, status) {
			if (status === 'success') {
				$(this).replaceWith($(this).contents());
				if (callback) callback();
			}
		});
	}

	loadPage('app-header', 'header #header', headerEvt); // 선택요소, 로드요소, 이벤트(추가)
	loadPage('app-footer', 'footer #footer', footerEvt); 
});

// header event
function headerEvt() {
	headerFixed();
	headerUtils();
	gnbUI();
	siteLink();
}

// footer event
function footerEvt() {
	siteLink();
}
function searchReset() {
		$("#sdate").val("");
		$("#edate").val("");
		$("#keyWord").val("");
		$("#round").val("all");
		$("#game").val("all");
		$("#player").val("all");
		customSelect();
	}

function updateCountdown() {
  var target = 	$("#game_date_0");
  if(target.val() == null || target.val() ==''){
  	clearInterval(time0);
  	return ;
  }
  const targetDate0 = new Date(target.val());
  const testTargetDate = new Date('2024-07-22 16:18');
  const now = new Date().getTime();
  const distance0 = testTargetDate - now;

  if (distance0 < 0) {
    // 설정한 날짜가 지난 경우
    target.prevAll('a').remove();
    target.prevAll('.time').remove();
    target.prevAll('.score').remove();
    target.parent('.state').append('<div class="score"><span>VS</span></div>');
    clearInterval(time0);
    return;
  }

  // 남은 시간 계산
  let hours0 = Math.floor(distance0 / (1000 * 60 * 60));
  let minutes0 = Math.floor((distance0 % (1000 * 60 * 60)) / (1000 * 60));
  let seconds0 = Math.floor((distance0 % (1000 * 60)) / 1000);
  if(hours0 <10){
  	hours0 = '0' + hours0;
  }
  if(minutes0 <10){
  	minutes0 = '0' + minutes0;
  }
  if(seconds0 <10){
  	seconds0 = '0' + seconds0;
  }

  // 화면에 표시
  document.getElementById('countdown0').innerText = `${hours0} : ${minutes0} : ${seconds0}`;
}
function updateCountdown1() {
  var target = 	$("#game_date_1");
  if(target.val() == null || target.val() ==''){
  	clearInterval(time1);
  	return ;
  }
  const targetDate1 = new Date(target.val());
  const now = new Date().getTime();
  const distance1 = targetDate1 - now;

  if (distance1 < 0) {
    // 설정한 날짜가 지난 경우
    target.prevAll('a').remove();
	target.prevAll('.time').remove();												
	target.prevAll('.score').remove();
	target.parent('.state').append('<div class="score"><span>VS</span></div>');												
    clearInterval(time1);
    return;
  }

  // 남은 시간 계산
  let hours1 = Math.floor(distance1 / (1000 * 60 * 60));
  let minutes1 = Math.floor((distance1 % (1000 * 60 * 60)) / (1000 * 60));
  let seconds1 = Math.floor((distance1 % (1000 * 60)) / 1000);
	if(hours1 <10){
  	hours1 = '0' + hours1;
  }
  if(minutes1 <10){
  	minutes1 = '0' + minutes1;
  }
  if(seconds1 <10){
  	seconds1 = '0' + seconds1;
  }
  // 화면에 표시
  document.getElementById('countdown1').innerText = `${hours1} : ${minutes1} : ${seconds1}`;
}

// 1초마다 업데이트
let time0 = setInterval(updateCountdown, 1000);
let time1 = setInterval(updateCountdown1, 1000);

