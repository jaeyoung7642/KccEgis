$(function() {
	siteLink();
});


function siteLink() {
	const linkURL = {
		TICKET: 'https://egis.kbl.or.kr/', // 티켓예매
		// SNS
		FACEBOOK: 'https://www.facebook.com/kccegissns/', // 페이스북
		INSTAGRAM: 'https://www.instagram.com/kcc_egis/', // 인스타그램
		NAVERPOST: 'http://m.post.naver.com/my.nhn?memberNo=31091641&navigationType=push', // 네이버포스트
		//관련사이트
		KCC: 'https://www.kccworld.co.kr/', // KCC
		KCCWORLD: 'https://www.kccworld.net/', // KCC건설
		KCCGOLF: 'https://www.kccgolf.co.kr/', // KCC 금강레저
		HOMECC: 'https://www.homecc.com/n', // HOMECC
		// 스폰서
		KLENZE: 'https://www.klenze.co.kr/', // KLENZE
		KCCGLASS: 'https://www.kccglass.co.kr/', // KCC글라스
		SWITZEN: 'https://www.switzen.com/', // KCC스위첸
		KCCSILICONE: 'https://www.kccsilicone.com/', // KCC실리콘
		BMK: 'https://www.bnkfg.com/', // BNK금융그룹
		PLAYERS: 'https://withplayers.com/', // 플레이어스
		ADVENTURER: 'https://www.adventurer.co.kr', // 승부사온라인
		UNICITY: 'http://www.makelifebetter.co.kr/', // 유니시티코리아
		HITE: 'https://www.hitejinro.com/', // 하이트진로
		PANSTAR: 'https://www.panstarcruise.com/', // 팬스타크루즈
		WILSON: 'https://kr.wilson.com/', // 윌슨
		호식이두마리치킨: 'https://www.9922.co.kr/', // 호식이두마리치킨
		MOMOS: 'https://www.momos.co.kr/', // 모모스
	}

	const updateLink = (link, url) => $(link).attr('href', linkURL[url]);

	const links = document.querySelectorAll('.siteLink');

	links.forEach((link) => {
		const url = $(link).attr('href');

		updateLink(link, url);
	});
}