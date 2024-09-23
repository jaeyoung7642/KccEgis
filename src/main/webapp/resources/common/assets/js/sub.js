$(function() {
	subPageInit();
	subVisual();
	menuSlider();
	loadMenuSlider();
	playerRanking();
	gallerySlider();
	customSelect();
	formsEvent();
	chartScrollMotion();
	checkAll();
	includeHtml();
	lazyLoad();
});

// select update
const selectUpdate = (select) => {
	if (isMobile) return;

	$(select).niceSelect('update');
	selectReset($(select));
}

// select reset
const selectReset = (select) => {
	const $list = $(select).next('.nice-select').find('.list');
	$list.attr('data-lenis-prevent', true);
}

// table select ctd
const selectCol = (btn, index) => {
	const $table = $(btn).parents('table');
	const $trs = $table.find('tbody tr');

	$trs.each((_, tr) => {
		addOnClass(tr);
	});

	function addOnClass(item) {
		const $tds = $(item).find('td');

		$tds.each((idx, col) => {
			$(col).toggleClass('on', index === idx)
		});
	}
}

function subPageInit() {
	
	function snbFixed() {
		const $snbArea = $('.snb_2dth_area');
		const $inner = $snbArea.find('.inner');
		const $header = $('#header');
		let snbTop = 0;
		let headerHh = 0;

		if ($snbArea.length > 0) {
			snbTop = $snbArea.offset().top;
		}

		if ($header.length > 0) {
			headerHh = $header.height();
		}

		if (scrollY > snbTop) {
			$inner.addClass('fixed');

			if ($body.hasClass('up') && $inner.hasClass('fixed')) {
				$inner.addClass('trans');
			}
		}

		if (scrollY < snbTop - headerHh && $inner.hasClass('fixed')) {
			$inner.removeClass('fixed trans');
		}
	}

	// table select td
	$document.on('click', '[data-pickcol]', function() {
		let index = $(this).data('pickcol');

		if ($(this).hasClass('.sort')) return;

		selectCol($(this), index);
	});

	
	function scrollFixed() {
		const $item = $('.bl_sticky');

		$item.each((_, item) => {
			const $wrap = $(item).parents('.bl_sticky_wrap');
			let itemTop = 0;

			if (!$(item).is(':visible')) return;

			$wrap.css({
				'width': $(item).width(),
				'height': $(item).height(),
			});

			itemTop = $wrap.offset().top;

			if (scrollY > itemTop - $('#header').height()) {
				$(item).addClass('fixed');
			}

			if (scrollY + $('#header').height() * 2 < itemTop) {
				$(item).removeClass('fixed');
			}
			
		}); 
	}

	// table point 
	$window.on('scroll resize', () => {
		snbFixed();
		scrollFixed();
	}).trigger('resize'); 
}

function subVisual() {
	const $pageTop = $('.page_top');

	if ($pageTop.length > 0) {
		$pageTop.append('<div class="bg_wrap"><div class="bg"></div></div>');

		scrollBg();
	}
	
	// scroll img
	function scrollBg() {
		const $bg = $('.page_top .bg');

		if ($bg === 0) return;

		tl = gsap.timeline({
			scrollTrigger: {
				trigger: $pageTop,
				start: "+=0%",
				end: '+=100%',
				scrub: true,
				ease: 'Power1.inOut',
			},
			defaults: {
				transformOrigin: 'center bottom',
			}
		})
		.to($bg, {
			y: 200,
		});
	}
}

function menuSlider() {
	const $sliders = $('.menu_slider');

	if ($sliders.length === 0) return;

	const initSwiper = (el) => {
		const $slider = $(el);
		const $slides = $slider.find('.swiper-slide');
		let start = 0;
		
		$slides.each((idx, sld) => {
			$(sld).hasClass('current') ? start = idx : 0;
		})

		const options = {
			slidesPerView: 'auto',
			freeMode: {
				enabled: true,
				sticky: true,
			},
			initialSlide: start,
			observer: true,
			resistanceRatio: 0.1,
		}

		const swiper = new Swiper($slider[0], options);
	}

	$sliders.each((_, slider) => {
		initSwiper(slider);
	});
}

function loadMenuSlider() {
	const $sliders = $('.load_menu_slider');
	sldSpeed = 600;

	if ($sliders.length === 0) return;

	const initSwiper = (el) => {
		const $slider = $(el);
		const $slides = $slider.find('.swiper-slide');
		const $next = $slider.find('.swiper-button-next'); 
		const $prev = $slider.find('.swiper-button-prev');
		let start = $slider.attr('data-start');
		let swiper;

		const options = {
			speed: sldSpeed,
			slidesPerView: 1,
			spaceBetween: 50,
			freeMode: false,
			initialSlide: start,
			observer: true,
			resistanceRatio: 0.1,
			navigation: {
				nextEl:  $next[0],
				prevEl: $prev[0],
			},
			breakpoints: {
				1025: {
					slidesPerView: 'auto',
					spaceBetween: 0,
					freeMode: {
						enabled: true,
						sticky: true,
					},
				},
			}
		}

		let isChange = false;

		const breakpoint = (e) => {
			if (e.currentTarget.matches) { // mibile

				if (!swiper) {
					swiper = new Swiper($slider[0], options);
				}

				if ($slider.attr('data-start')) {
					isChange = true;

					if (start !== $slider.attr('data-start')) {
						start = $slider.attr('data-start');
					} 
				}
			} else { // pc
				if (swiper) {
					swiper.destroy(true, true);
					swiper = null;
				}
			}
		};

		$(matchMax(1024)).on('change', breakpoint).change();

		if ($slider.attr('data-start')) {
			// 모바일에서 위치 고정
			$window.on('resize', () => {
				if ($window.width() < 1025) {
					if (isChange) {
						swiper.slideTo(start, 0);
						isChange = false;
					}
				}
			}).trigger('resize'); 
		}

	}

	$sliders.each((_, slider) => {
		initSwiper(slider);
	});
}

function playerRanking() {
	const $slider = $('.p_ranking_content');
	let swiper;

	if ($slider.length === 0) return;

	const options = {
		observer: true,
		observeParents: true,
		speed: 400,
		freeMode: false,
		slidesPerView: 'auto',
		slidesPerGroup: 1,
		spaceBetween: 20,
		breakpoints: {
			1025: {
				spaceBetween: 30
			},
		}
	}

	const breakpoint = (e) => {
		if (e.currentTarget.matches) { // pc
			if (swiper) {
				swiper.destroy(true, true);
				swiper = null;
			}
		} else { // mobile
			swiper = new Swiper($slider[0], options);
		}
	};

	$(matchMin(1025)).on('change', breakpoint).change();
}

function gallerySlider() {
	const $sliders = $('.gallery_slider');

	if ($sliders.length === 0) return;

	const initSwiper = (el) => {
		const $bigImgSlider = $(el).find('.gallery_bigimg');
		const $thumbSlider = $(el).find('.gallery_thumb');
		const $thumbNext = $thumbSlider.find('.swiper-button-next'); 
		const $thumbPrev = $thumbSlider.find('.swiper-button-prev');

		// thumbnail
		const swiper = new Swiper($thumbSlider[0], {
			direction: "horizontal",
			spaceBetween: 5,
			slidesPerView: 3,
			slidesPerGroup: 3,
			freeMode: true,
			watchSlidesProgress: true,
			watchOverflow: true,
			speed: 400,
			navigation: {
				nextEl:  $thumbNext[0],
				prevEl: $thumbPrev[0],
			},
			breakpoints: {
				768: {
					direction: "horizontal",
					spaceBetween: 10,
					slidesPerView: 4,
					slidesPerGroup: 4,
				},
				1025: {
					direction: "vertical",
					spaceBetween: 13,
					slidesPerView: 4,
					slidesPerGroup: 4,
				},
			},
			on: {
				init: function() {
					const slides = this.slides;
					const total = slides.length;

					$(slides).each((idx, slide) => {
						$number = $(`
							<span class="count"><em>${idx + 1}</em>/${total}</span>
						`);

						$(slide).append($number);
					});
					
				}
			}
		});

		// big image
		const swiper2 = new Swiper($bigImgSlider[0], {
			autoHeight: true,
			spaceBetween: 10,
			speed: 600,
			thumbs: {
        swiper: swiper,
      },
		});
	}

	$sliders.each((_, slider) => {
		initSwiper(slider);
	});
}

function customSelect() {
	if (isMobile || $('.frm_select').length === 0) return;

	if ($('.nice-select').length > 0) {
		$('.frm_select').niceSelect('destroy');
	}

	$('.frm_select').niceSelect();

	const $selects = $('select.frm_select');

	if ($selects.length > 0) {
		$selects.each((_, select) => {
			selectReset(select);
		});
	}

	$selects.each((_, select) => {
		const $niceSelect = $(select).next('.nice-select');
		
		if ($niceSelect.length === 0) return;

		placeholder($niceSelect);
	});

	$document.on('click.nice_select', '.nice-select', function(event) {
		let $dropdown = $(this);
		let $list = $dropdown.find('.list');

		$('.nice-select').not($dropdown).find('.list').slideUp(200);
		$list.slideToggle(200);
		$list.find('.selected')[0].scrollIntoView({block: 'nearest'});
		placeholder($dropdown);
	});

	// Close when clicking outside
	$document.on('click.nice_select', function(event) {
		if ($(event.target).closest('.nice-select').length === 0) {
			$('.nice-select').find('.list').slideUp(200); // 추가
		}
	});

	function placeholder(select) {
		const $display = $(select).find('[data-display]');
		const displayText = $display.data('display');
		const $current =  $(select).find('.current');

		if ($display.length === 0) return;

		$current.text() === displayText ? $current.addClass('placeholder') :  $current.removeClass('placeholder');
	}
}

function datePicker() {
	const $dateForm = $('.frm_input.date');

	const options = {
		dateFormat: 'yy-mm-dd',
		showMonthAfterYear:true,
		showOtherMonths: true,
		changeMonth: true,
    changeYear: true,
		yearRange: 'c-20:c+20',
		//monthNames: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		dayNamesMin: ['일', '월','화','수','목','금','토'],
	}

	$dateForm.datepicker({
		beforeShow: function(input, inst) {
			const $datepickerDiv = $(inst.dpDiv);
			const $container = $(input).parents('.frm_date');
			$datepickerDiv.appendTo($container);
		},
		...options
	});
}

function formsEvent() {
	// 라디오 체크
	const $checkGroups = $('.check_group');

	$checkGroups.each((_, group) => {
		const $checks = $(group).find('.group_check');
		
		inputChange();
	
		$checks.on('change', () => {
			inputChange();
		});

		function inputChange() {
			$checks.each((_, item) => {
				const $input = $(item).parents('.group').find('.group_input');
				let checked = $(item).is(':checked') ? true : false;

				$input.attr('disabled', !checked).toggleClass('disabled', !checked);

				if ($input.hasClass('frm_select')) {
					$input.toggleClass('disabled', !checked);
				}
			});
		}
	});

	// checkbox readonly 체크 방지
	$document.on('click', 'input[type="radio"][readonly], input[type="checkbox"][readonly]', () => {
		return false;
	})
}

// bar chart
function barChart() {
	const $graphs = $('.el_graph .bar');

	$graphs.each((_, graph) => {
		const val = $(graph).data('value');
		const max = $(graph).data('max') ? $(graph).data('max') : 100;

		$(graph).attr('style', `--val: ${((val / max) * 100).toFixed(2)}%`);
	});
}

// radar chart
function radarChart() {
	const $charts = $('.chart-radar');

	$charts.each((_, chart) => {
		const dataArr = $(chart).data('chart');
		const myChart = echarts.init(chart, null, {
			renderer: 'canvas',
			useDirtyRect: false
		});

		const option = {
			radar: {
				indicator: [
					{ name: '2P %', max: 100 },
					{ name: '3P %', max: 100 },
					{ name: 'FG %', max: 100 },
					{ name: 'FT %', max: 100 },
				],
				shape: 'circle',
				//radius: '85.16%',
				radius: '85%',
				center: ['49%', '50%'],
				splitArea: {
					areaStyle: {
						color: '#fff',
					},
				},
				splitLine: {
					lineStyle: {
						color: '#DFE4EA'
					}
				},
				axisLine: {
					lineStyle: {
						color: '#DFE4EA'
					},
				},
				axisName: {
					fontFamily: 'Pretendard',
					color: '#181818',
					fontWeight: '600',
					fontSize: 12,
					lineHeight: 1
				},
				nameGap: 11
			},
			series: [
				{
					name: '당해년도 주요 부문 성공율',
					type: 'radar',
					data: [
						{
							value: dataArr,
						},
					],
					symbolSize: 12, // 💡 사이즈 확인
					itemStyle: {
						color: '#6D96C4',
					},
					areaStyle: {
						color: 'rgba(0, 79, 209, 0.1)'
					},
				}
			],
			label: {
				show: true,
				fontFamily: 'Pretendard',
				color: '#4C4C4C',
				fontWeight: '400',
				fontSize: 12,
				lineHeight: 22,
			},
			labelLayout(params) {
				const posArr = [
					{ align: 'center', verticalAlign: 'bottom', y: params.rect.y - 6},
					{ align: 'right', verticalAlign: 'top', x: params.rect.x - 10},
					{ align: 'center', verticalAlign: 'top', y: params.rect.y + 18},
					{ align: 'left', verticalAlign: 'top', x: params.rect.x + 22},
				];
				const posArr2 = [
					{ align: 'center', verticalAlign: 'top', y: params.rect.y + 18},
					{ align: 'left', verticalAlign: 'top', x: params.rect.x + 20},
					{ align: 'center', verticalAlign: 'bottom', y: params.rect.y - 6},
					{ align: 'right', verticalAlign: 'top', x: params.rect.x - 8},
				];
				
				for (let i = 0; i < dataArr.length; i++) {
					if (dataArr[i] === params.text) {
						return dataArr[i] < 71 ? posArr[i] : posArr2[i];
					}
				}
			}
		};

		if (option && typeof option === 'object') {
			myChart.setOption(option);
		}

		window.addEventListener('resize', myChart.resize);
	});
}

function chartScrollMotion() {
	function updateScroll(entries, observer) {

		entries.forEach(entry => {
			const { target,  isIntersecting} = entry;

			if (isIntersecting) {
				if ($(target).find('.el_graph').length > 0) { // bar chart
					barChart();
				}

				$(target).addClass('on');

				if ($(target).hasClass('chart-radar')) { // radar chart
					radarChart();
				}
				
				if ($(target).data('scollon')) { // 한번 감지
					observer.unobserve(target);
				}
			}
		});
	}

	// IntersectionObserver 생성
	const observer = new IntersectionObserver(updateScroll, { threshold: 0.1 });

	const $items = $('[data-scollOn]');

	$items.each((_, item) => observer.observe(item));
}

function lazyLoad() {
	const $lazyImages = $('.lazy-image');

	if ($lazyImages.length > 0) {
		$lazyImages.each((_, item) => {
			const $loader = $('<span class="lazy-loader"></span>');
			$(item).after($loader);
		});
	}

	function updateImage(entries) {

		entries.forEach(entry => {
			const { target, isIntersecting, intersectionRatio } = entry;
			
			if (isIntersecting) {
				const image = target;
				const src = $(image).attr('data-src');

				if (src) {
					$(image).attr('src', src);
					$(image).removeAttr('data-src');
					$(image).addClass('on');
					$(image).next('.lazy-loader').remove();
					observer.unobserve(image);
				}
			}
		});
	}

	const observer = new IntersectionObserver(updateImage, { threshold: 0.01 });
	$lazyImages.each((_, image) => observer.observe(image));
}

// 체크박스 
function checkAll() {
	var $checkEl = $('.js_check_wrap');

	if ($checkEl.length < 1) { return}

	$($checkEl).each(function(idx, item) {
		var $all = $(item).find('.js_check_all');
		var $checkbox = $(item).find('.js_check_each');
		var boxNum = $($checkbox).length;

		$($all).on('click', function() {
			$(this).prop('checked') ? $($checkbox).prop('checked', true) : $($checkbox).prop('checked', false);
		});

		$($checkbox).on('click', function() {
			var checkedNum = $($checkbox).filter(":checked").length;

			if (boxNum == checkedNum) {
				$($all).prop("checked", true);
			} else {
				$($all).prop("checked", false);
			}
			
		});

	});
}

// include
function includeHtml() {
	const $includes = $('.js-include');

	$includes.each((_, el) => {
		let $targetFile = $(el).attr('data-include');

		if ($targetFile.length === 0) return;

		let xhttp = new XMLHttpRequest();

		xhttp.onreadystatechange = function() {
			if (this.readyState === XMLHttpRequest.DONE) {
				if (this.status === 200) {
						$(el).html(this.responseText);

						// slider 요소가 있는지 확인하고 sliders() 실행
						if ($(el).find('.slider').length > 0) {
							sliders();
						}
						
				} else if (this.status === 404) {
					$(el).html('this.responseText');
				}
			}
		}
		xhttp.open('GET', $targetFile, true);
		xhttp.send();
		return;
	});
};