$(function() {
	mainVisual();
	gameSlider();
	mediaGrid();
	scrollMotion();
});

function mainVisual() {
	const $slider = $('.visual_slider');
	const $page = $slider.find('.swiper-pagination');
	let slides;
	let speed = 0;
	let duration = 0;
	sldDelay = 3500;

	const options = {
		lazy: true,
		loop: true,
		speed: sldSpeed,
		autoplay: {
			delay: sldDelay,
			disableOnInteraction: false,
		},
		pagination: {
			el: $page[0],
			clickable: true,
			renderBullet: function (index, className) {
				return `
					<div class="${className}">
						<div class="bar"></div>
						<p class="tit p_hide">${bnnerData[index]}</p>
					</div>
				`;
			},
		},
		on: {
			init: function() {
				slides = this.slides;
				progressBar();
				addAnim(this.activeIndex);
			}
		}
	}

	const swiper = new Swiper($slider[0], options);

	swiper.on('setTransition', function(_, s) {
		speed = s;
	});

	swiper.on('slideChange', function() {
		progressBar();
		addAnim(swiper.activeIndex);
	});

	swiper.on('slideChangeTransitionEnd', () => {
		removeAnim(swiper.activeIndex)
	});
	
	function progressBar() {
		if (duration !== sldDelay + speed) {
			duration = sldDelay + speed;
			$slider.attr('style', `--duration: ${duration}ms`);
		}
	}

	function addAnim(index) {
		slides.forEach((sld, idx) => {
			if (idx === index) {
				$(sld).addClass('anim');
			}
		});
	}

	function removeAnim(index) {
		slides.forEach((sld, idx) => {
			if (idx !== index && $(sld).hasClass('anim')) {
				$(sld).removeClass('anim');
			}
		});
	}
}

function gameSlider() {
	const $slider = $('.game_slider');
	let swiper;

	const options = {
		spaceBetween: 25,
		initialSlide: 1,
		speed: sldSpeed,
		breakpoints: {
			992: {
				spaceBetween: 35,
			},
		}
	}

	const gnbReset = (e) => {
		if (e.currentTarget.matches) { // pc
			if (swiper) {
				swiper.destroy(true, true);
				swiper = null;
			}
		} else { // mobile
			swiper = new Swiper($slider[0], options);
		}
	};

	$(matchMin(1401)).on('change', gnbReset).change();
}

function mediaGrid() {
	const $photos = $('.media_list.photo .item');

	const photo3 = $photos[2];
	const photo5 = $photos[4];

	function gridEnt() {
		if ($window.outerWidth() > 991) {
			$(photo5).attr('style', `--top: ${$(photo3).find('.box').innerHeight()}px`);
		} else {
			$(photo5).removeAttr('style', '--top');
		}
		
	}
	
	$window.on('resize', () =>  gridEnt()).trigger('resize');
}

function scrollMotion() {
	if (lenis) {
		lenis.on('scroll', ScrollTrigger.update);
	}

	// scrollTrigger
	const triggerSet = {
		start: "+=0%",
		end: '+=100%',
		scrub: true,
		ease: 'Power1.inOut',
	}

	// scroll img
	function scrollImg() {
		let items = gsap.utils.toArray('[data-scroll-img]');

		if (items.length === 0) return;

		items.forEach(item => {
			let box = $(item).parents('.scroll_wrap');
			let dataOffset = $(item).data('anim-offset');
			let offset = dataOffset ? dataOffset : 0.3;
			let tl;

			const update = () => {
				tl = gsap.timeline({
					scrollTrigger: {
						trigger: box,
						...triggerSet,
					},
					defaults: {
						transformOrigin: 'center center',
					}
				});
	
				tl.to(item, {
					yPercent: 100 * offset,
				});
			}

			const breakpoint = (e) => {
				if (e.currentTarget.matches) { // pc
					update();
				} else { // mobile
					if (tl) {
						tl.scrollTrigger.kill();
						tl.kill();
						gsap.set(box, {clearProps: "all"});
					}
				}
			};
	
			$(matchMin(1025)).on('change', breakpoint).change();
		});
	}

	function scrollImgZoom() {
		let items = gsap.utils.toArray('[data-scroll-zoom]');

		if (items.length === 0) return;

		items.forEach(item => {
			let box = $(item).parents('.scroll_wrap');
			let dataOffset = $(item).data('anim-offset');

			const tl = gsap.timeline({
				scrollTrigger: {
					trigger: box,
					...triggerSet,
					start: 'top bottom',
				},
				defaults: {
					transformOrigin: 'center bottom',
				}
			});

			tl.fromTo(item, {
				scale: 1.25,
			}, {
				scale: 1,
			});
		});
	}

	function mediaScroll() {
		const $mediaList = $('.media_list');
		let items = [...$mediaList.find('.item')];

		if (items.length === 0) return;

		items.forEach(item => {
			let $inner = $(item).find('.inner');
			let tl1, tl2;

			const update = () => {
				tl1 = gsap.timeline({
					scrollTrigger: {
						trigger: item,
						...triggerSet,
						start: '-=50% bottom',
						end: 'center center',
					},
					defaults: {
						transformOrigin: 'center center',
					}
				});

				tl1.fromTo(item, {
					y: gsap.utils.random(200, 500),
					opacity: 0,
				}, {
					y: 0,
					opacity: 1,
				});

				tl2 = gsap.timeline({
					scrollTrigger: {
						trigger: $inner,
						...triggerSet,
						start: 'top bottom',
						end: 'center center',
					},
					defaults: {
						transformOrigin: 'center center',
					}
				});

				tl2.fromTo($inner, {
					scale: 1.3
				}, {
					scale: 1
				});
			}

			const breakpoint = (e) => {
				if (e.currentTarget.matches) { // pc
					update();
				} else { // mobile
					if (tl1) {
						tl1.scrollTrigger.kill();
						tl1.kill();
						gsap.set(item, {clearProps: "all"});
					}
					if (tl2) {
						tl2.scrollTrigger.kill();
						tl2.kill();
						gsap.set(item, {clearProps: "all"});
					}
				}
			};

			$(matchMin(1025)).on('change', breakpoint).change();
		});
	}

	scrollImg();
	scrollImgZoom();
	mediaScroll();
}