$(function() {
	function loadPage(selector, url, callback) {
		$(selector).load(url, function(res, status) {
			if (status === 'success') {
				$(this).replaceWith($(this).contents());
				if (callback) callback();
			}
		});
	}

	function addCurrentGnb() {
		const gnbLinks = $('.gnb_link');
		var aside_title = $('.aside_title').text();

		let tagUrl = location.href.split("/").reverse()[0].split("?")[0];
		gnbLinks.each((_, link) => {
			let url = $(link).attr('href').split("/")[0];
			
			let gnb_link_title = $(link).children('span').text();
			$(link).toggleClass('current', aside_title === gnb_link_title);
		});
	}

	loadPage('app-header', 'adminHeader #header', addCurrentGnb);
});

function onInputDateHandler(a) {
		let val = a.value.replace(/\D/g, "");
		let leng = val.length;
	    let result = ''; 
	    
	    if(leng < 6) result = val;
	    else if(leng < 8){
	        result += val.substring(0,4);
	        result += "-";
	        result += val.substring(4);
	    } else{
	        result += val.substring(0,4);
	        result += "-";
	        result += val.substring(4,6);
	        result += "-";
	        result += val.substring(6);
	    }
	    a.value = result;
	}
	
	function onInputTimeHandler(a) {
		let val = a.value.replace(/\D/g, "");
		let leng = val.length;
	    let result = ''; 
	    
	    if(leng < 3){
	    	result = val;
	    }else{
	        result += val.substring(0,2);
	        result += ":";
	        result += val.substring(2);
	    }
	    a.value = result;
	}
	function deletePlayer(num,str){
	if (confirm("정말 삭제하시겠습니까?") == true) {
		if(num=="" || num ==null){
			alert('삭제할수 없습니다.');
			return false;
		}
        	$.ajax({
		   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
		        url : "/kccadm/deletePlayer",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "num":num
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        if(res==1){
				        if(str == 'a' || str == 'b'){
				        	location.href = 'pCoachProfileList';
				        }else if(str == 'j' || str == 'm' || str == 't' || str == 'i'){
				        	location.href = 'pSupportstaffProfileList';
				        }else{
				        	location.href = 'pPlayerProfileList';
				        }
			        }else{
			       	 alert("변경에 실패했습니다.");
			        }
		        },
		        error: function() {
					alert("서버 오류!!");
				}
		   });
            
        } else {

            return;
        }
	}
	function deleteNews(num,str){
	if (confirm("정말 삭제하시겠습니까?") == true) {
		if(num=="" || num ==null){
			alert('삭제할수 없습니다.');
			return false;
		}
        	$.ajax({
		   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
		        url : "/kccadm/deleteNews",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "num":num
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        if(res==1){
				        if(str == 'news'){
				        	location.href = 'mNewsList';
				        }else if(str == 'movie'){
				        	location.href = 'mMovieList';
				        }else if(str == 'photo'){
				        	location.href = 'mPhotoList';
				        }else{
				        	location.href = 'fNoticeList';
				        }
			        }else{
			       	 alert("변경에 실패했습니다.");
			        }
		        },
		        error: function() {
					alert("서버 오류!!");
				}
		   });
            
        } else {
            return;
        }
	}
	function deleteKccAd(num){
	if (confirm("정말 삭제하시겠습니까?") == true) {
		if(num=="" || num ==null){
			alert('삭제할수 없습니다.');
			return false;
		}
        	$.ajax({
		   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
		        url : "/kccadm/deleteKccAd",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "num":num
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        if(res==1){
			        	location.href = 'cKccAdList';
			        }else{
			       	 alert("변경에 실패했습니다.");
			        }
		        },
		        error: function() {
					alert("서버 오류!!");
				}
		   });
            
        } else {

            return;
        }
	}
	function deletePopup(num){
	if (confirm("정말 삭제하시겠습니까?") == true) {
		if(num=="" || num ==null){
			alert('삭제할수 없습니다.');
			return false;
		}
        	$.ajax({
		   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
		        url : "/kccadm/deletePopup",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "num":num
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        if(res==1){
			        	location.href = 'ePopupList';
			        }else{
			       	 alert("변경에 실패했습니다.");
			        }
		        },
		        error: function() {
					alert("서버 오류!!");
				}
		   });
            
        } else {

            return;
        }
	}
	function deleteMainSlide(num){
	if (confirm("정말 삭제하시겠습니까?") == true) {
        	$.ajax({
		   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
		        url : "/kccadm/deleteMainSlide",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "num":num
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        if(res==1){
			        	location.href = 'eMainSlideList';
			        }else{
			       	 alert("변경에 실패했습니다.");
			        }
		        },
		        error: function() {
					alert("서버 오류!!");
				}
		   });
            
        } else {

            return;
        }
	}
	function deleteMainGoods(num){
	if (confirm("정말 삭제하시겠습니까?") == true) {
        	$.ajax({
		   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
		        url : "/kccadm/deleteMainGoods",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "num":num
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        if(res==1){
			        	location.href = 'eMainGoodsList';
			        }else{
			       	 alert("변경에 실패했습니다.");
			        }
		        },
		        error: function() {
					alert("서버 오류!!");
				}
		   });
        } else {
            return;
        }
	}
	function deleteMember(num){
	if (confirm("정말 삭제하시겠습니까?") == true) {
        	$.ajax({
		   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
		        url : "/kccadm/deleteMember",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "num":num
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        if(res==1){
			        	location.href = 'mMemberList';
			        }else{
			       	 alert("변경에 실패했습니다.");
			        }
		        },
		        error: function() {
					alert("서버 오류!!");
				}
		   });
            
        } else {

            return;
        }
	}
	function updateState(num){
	if (confirm("정말 탈퇴처리 하시겠습니까?") == true) {
        	$.ajax({
		   	 type : "GET",            // HTTP method type(GET, POST) 형식이다.
		        url : "/kccadm/updateState",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {
		       	 "num":num
		        },            // Json 형식의 데이터이다.
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
			        if(res==1){
			        	location.href = 'mMemberList';
			        }else{
			       	 alert("변경에 실패했습니다.");
			        }
		        },
		        error: function() {
					alert("서버 오류!!");
				}
		   });
            
        } else {

            return;
        }
	}
	function resetSearch() {
		$("#sdate").val("");
		$("#edate").val("");
		$("#keyWord").val("");
		$("#round").val("all");
		$("#game").val("all");
		$("#player").val("all");
		customSelect();
	}
