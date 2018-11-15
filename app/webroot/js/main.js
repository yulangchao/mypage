(function ($) {
 "use strict";
 
        /*----------------------------
		 jQuery Isotope
		------------------------------ */ 
        $(window).on('load', function() {
        var $grid =$('.grid').isotope({
          itemSelector: '.grid-item',
          percentPosition: true,
          masonry: {
            columnWidth: 1
          }
        });
        $('.property-menu').on( 'click', 'button', function() {
          var filterValue = $(this).attr('data-filter');
          $grid.isotope({ filter: filterValue });
        });
 
        });
 
        
        $('.dh-container').directionalHover();

		/*----------------------------
		 jQuery MeanMenu
		------------------------------ */
		jQuery('nav#dropdown').meanmenu();
		
		$('#accordion').collapse();
		$('#accordion2').collapse();
	
		$('.counter').counterUp({
			delay: 10,
			time: 1000
		});
		
		
		$( "#slider-range" ).slider({
	   range: true,
	   min: 400,
	   max: 2000,
	   values: [500,1700],
	   slide: function( event, ui ) {
		$( "#amount" ).val( "$" + ui.values[ 0 ] + "-$" + ui.values[ 1 ] );
	   }
	  });
	  $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
	   "-$" + $( "#slider-range" ).slider( "values", 1 ) ); 

	    
		/*----------------------------
		 jQuery popover
		------------------------------ */
		
		$('[data-toggle="popover"]').popover();
		   /*----------------------------
		 jQuery tooltip
		------------------------------ */
		
		$('[data-toggle="tooltip"]').tooltip();
		   /*--------------------------
		 scrollUp
		---------------------------- */	
		$.scrollUp({
			scrollText: '<i class="fa fa-angle-up"></i>',
			easingType: 'linear',
			scrollSpeed: 900,
			animation: 'fade'
		}); 	 
		/*-----------------------------
			lightbox Stick
		---------------------------------*/
		lightbox.option({
		  'resizeDuration': 200,
		  'wrapAround': true
		});   
		
		/*-----------------------------
			Menu Stick
		---------------------------------*/
		$(".sicker-menu").sticky({topSpacing:0});
	
		/*----------------------------
		 logosDistort 
		------------------------------ */
		var particles = {
			dotColor: '#1ec5ee',
			lineColor: '#0a4e90',
			density: 20000,
			parallax: false
		};
		var particleDensity;
		var options = {
				effectWeight: 1,
				outerBuffer: 1.05,
				elementDepth: 200,
				perspectiveMulti: 1.5,
				enableSmoothing: true,
				onInit: function() {
				  $('#particle-target').particleground(particles);
				}
			};
		
		$('#demo1').logosDistort(options);
			
		/*--------------------------
			Nav cliker
		---------------------------- */	
		// Add Class To body
		if ($('#navigation-right').hasClass( "navigation-style-1" )) {
			$('body').addClass('menu-1-canvas');
		};
		if ($('#navigation-left').hasClass( "navigation-style-2" )) {
			$('body').addClass('menu-2-canvas');
		};
		// Open Navigation
		$('#nav-trigger > a').on('click', function(e) {
			$("#navigation-right").toggleClass('open');
			$('.menu-1-canvas').toggleClass('menu-1-open');
		});
		// Open Navigation
		$('#nav-trigger > a').on('click', function(e) {
			$("#navigation-left").toggleClass('open');
			$('.menu-2-canvas').toggleClass('menu-2-open');
		});
		$('.right-navigation ul.naviagation-list-right li a[href*="#"]').on('click', function() {
			$('body').toggleClass('menu-1-open', false);
			$("#navigation-right").toggleClass('open', false);
			$('body').toggleClass('menu-2-open', false);
			$("#navigation-left").toggleClass('open', false);
			if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
				var target = $(this.hash);
				target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top
					}, 1000);
					return false;
				}
			}
		});
		$('.main-menu-area ul.nav-menu li a[href*="#"]').on('click', function() {
			$('body').toggleClass('menu-1-open', false);
			$("#navigation").toggleClass('open', false);
			if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
				var target = $(this.hash);
				target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top
					}, 1000);
					return false;
				}
			}
		});
	/*----------------------------
	 profile menu active class
	------------------------------ */
	$('.profile-menu ul.profile-nav li a').on('click', function (e) {

        $('.profile-menu ul.profile-nav li a').removeClass('active');

        var $parent = $(this);
        if (!$parent.hasClass('active')) {
            $parent.addClass('active');
        }
        e.preventDefault();
    });
	/*----------------------------
	 wow js active
	------------------------------ */
	 new WOW().init();
	 /*----------------------------
	 owl active
	------------------------------ */  
	$('.owl-carousel-list').owlCarousel({
		loop:true,
		margin:30,
		nav:false,
		responsive:{
			0:{
				items:1
			},
			768:{
				items:2
			},
			980:{
				items:3
			},
			1199:{
				items:3
			}
		}
	});  
	//---------------------------------------------
    //Nivo slider
    //---------------------------------------------
	$('#nivoslider').nivoSlider({
		effect: 'random',
		slices: 15,
		boxCols: 10,
		boxRows: 10,
		animSpeed: 500,
		pauseTime: 5000,
		startSlide: 0,
		directionNav: true,
		controlNavThumbs: false,
		pauseOnHover: false,
		manualAdvance: false
	});
	/*------------------------------------
	Textilate Activation
	--------------------------------------*/
	$('.tlt').textillate({
		loop: true,
		minDisplayTime: 2500
	});
		
	/*------------------------------------
	Video Player
	--------------------------------------*/
	$(".player").YTPlayer({
		showControls: false
	});  	
	/*--------------------------
	 Form input select
	---------------------------- */	
	$(".chosen-select").chosen({ 
		no_results_text: "Oops, nothing found!"
	}); 
	
	/*------------------------------------
		ColorSwitcher
		--------------------------------------*/
		$('.ec-handle').on('click', function(){
			$('.ec-colorswitcher').trigger('click')
			$(this).toggleClass('btnclose');
			$('.ec-colorswitcher') .toggleClass('sidebarmain');
			return false;
		});
		$('.ec-boxed,.pattren-wrap a,.background-wrap a').on('click', function(){
			$('.as-mainwrapper').addClass('wrapper-boxed');
			$('body').addClass('wrapper-boxed-body');
			$('.as-mainwrapper').removeClass('wrapper-wide');
		});
		$('.ec-wide').on('click', function(){
			$('.as-mainwrapper').addClass('wrapper-wide');
			$('.as-mainwrapper').removeClass('wrapper-boxed');
			$('body').removeClass('wrapper-boxed-body');
		});
		
 
})(jQuery); 