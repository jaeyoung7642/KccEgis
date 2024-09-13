const isIphone = /iPhone/.test(navigator.userAgent);
const isAndroid = /Android/.test(navigator.userAgent);
const isAndroidTablet = isAndroid && !/Mobile/.test(navigator.userAgent);
const $document = $(document);
const $window = $(window);
const $html = $('html');
const $body = $('body');
let dur = 200;

$(function() {
	commonInit();
	customSelect();
	checkAll();
	modal();
});

// select update
const selectUpdate = (select) => {
	if (isMobile) return;

	$(select).niceSelect('update');
	selectReset($(select));
}

// select reset
const selectReset = (select) => {
	const $list = $(select).find('.list');
	$list.attr('data-lenis-prevent', true);
	$(select).css('min-width', $list.width());
}

// dim on/off
const dimToggle = (state) => {
	if (state) {
		if ($('.dim').length > 0) return;
		
		$body.append('<div class="dim"></div>');
		$('.dim').fadeIn(dur);
	} else {
		$('.dim').fadeOut(dur);

		setTimeout(function() {
			$('.dim').remove();
		}, dur);
	}
}

// 포커스 이동
const keyFocus = () => { 
	$document.on('keydown', '[data-focus-prev], [data-focus-next]', (e) => {
		var next = $(e.currentTarget).attr('data-focus-next');
		var prev = $(e.currentTarget).attr('data-focus-prev');
		var target = next || prev || false;

		if(!target || e.keyCode != 9) return;

		if( (!e.shiftKey && !!next) || (e.shiftKey && !!prev) ) {
			$('[data-focus="' + target + '"]').focus();
		}  
	});
	
} 

const loaderClose = () => {
	if ($('.loading').length === 0) return;

	$('.loading').fadeOut(dur);

	setTimeout(() => {
		$('.loading').remove();
	}, dur);
}

function commonInit() {
	// 디바이스에 따른 메타태그 적용
	const $viewportMeta = $('meta[name="viewport"]');

	if (isIphone || isAndroid && !isAndroidTablet) {
		$viewportMeta.attr('content', 'width=1270, initial-scale=0.3');
	} 

	// 브라우저 높이 계산
	function setScreenSize() {
		let barWh; 
		setTimeout(() => {
			barWh = window.innerWidth - document.body.clientWidth; // scrollbar width
			$html.attr('style', `--scrollbar: ${barWh}px;`);
		}, 300);
		
	}

	setScreenSize();

	// click event
	$document.on('click', 'a, button', function(e) {
		const href = $(this).attr('href');
		const type = $(this).attr('type');

		if (href === '#' || type === 'submit') {
			e.preventDefault();
			return false;
		}
	});

	// file input
	$document.on('change', '.frm_file input', function(e) {
		const $this = e.target;
		
		$($this).next('.frm_input').empty().append($this.value);
	});

	$document.on('click', '.frm_file .btn', function(e) {
		const $this = e.target;

		$($this).parents('.frm_file').find('input').trigger('click');
	});

	const $dateForm = $('.frm_input.date');

	if ($dateForm.length > 0) {
		$dateForm.datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true,
      changeYear: true,
			yearRange: 'c-20:c+20',
			showMonthAfterYear:true,
			monthNamesShort: ['1 월','2 월','3 월','4 월','5 월','6 월','7 월','8 월','9 월','10 월','11 월','12 월'],
			dayNamesMin: ['일', '월','화','수','목','금','토'],
		});
	}
}

function customSelect() {
	if ($('.frm_select').length === 0) return;

	if ($('.nice-select').length > 0) {
		$('.frm_select').niceSelect('destroy');
	}

	$('.frm_select').niceSelect();

	const $selects = $('.nice-select');

	if ($selects.length > 0) {
		$selects.each((_, select) => {
			selectReset(select);
		});
	}

	$document.on('click.nice_select', '.nice-select', function(event) {
		let $dropdown = $(this);
		let $list = $dropdown.find('.list');

		$('.nice-select').not($dropdown).find('.list').slideUp(200);
		$list.slideToggle(200);
		$list.find('.selected')[0].scrollIntoView({block: 'nearest'});
	});

	// Close when clicking outside
	$document.on('click.nice_select', function(event) {
		if ($(event.target).closest('.nice-select').length === 0) {
			$('.nice-select').find('.list').slideUp(200); // 추가
		}
	});
	
}

// 체크박스 
function checkAll() {
	const $checkEl = $('.js_check_wrap');

	if ($checkEl.length === 0) return;

	$($checkEl).each(function(idx, item) {
		const $all = $(item).find('.js_check_all');
		const $checkbox = $(item).find('.js_check_each');
		let boxNum = $($checkbox).length;

		$($all).on('click', function() {
			$(this).prop('checked') ? $($checkbox).prop('checked', true) : $($checkbox).prop('checked', false);
		});

		$($checkbox).on('click', function() {
			let checkedNum = $($checkbox).filter(":checked").length;

			if (boxNum == checkedNum) {
				$($all).prop("checked", true);
			} else {
				$($all).prop("checked", false);
			}
			
		});

	});
}

// modal
function modal() {
	let targetBtn;
	
	if ($('.modal.open').length > 0) {
		openModal();
	}

	$document.on('click', '.openModal', (e) => {
		const $this = e.currentTarget;
		e.preventDefault();

		openModal($this);
		targetBtn = $this;
	});

	$document.on('click', '.closeModal, .dim', (e) => {
		const $this = e.currentTarget;
		e.preventDefault();
		
		closeModal($this);

		if (targetBtn) {
			targetBtn.focus();
			targetBtn = null;
		}
	});

	// 키보드 esc 닫기
	$document.on('keydown', (e) => { 
		if (!$('.modal.open').length === 0) return;

		if (e.keyCode == 27) { 
			closeModal(e.target);
		}
	});

	function openModal(el) {
		const target = $(el).data('target');

		$(target).attr('tabindex', '0').fadeIn(dur).addClass('open').focus();
		keyFocus();
		dimToggle(true);

		if (!$body.hasClass('noscroll')) {
			$body.addClass('noscroll');
		}
	}

	function closeModal(el) {
		const $target = el.className === '.closeModal' ? $(el).parents('.modal') : $('.modal.open');

		if (!$target.hasClass('open')) return;


		$target.attr('tabindex', '-1').fadeOut(dur);
		dimToggle(false);

		setTimeout(() => {
			$target.removeClass('open');

			if ($body.hasClass('noscroll')) {
				$body.removeClass('noscroll');
			}
		}, dur);
		
	}
}