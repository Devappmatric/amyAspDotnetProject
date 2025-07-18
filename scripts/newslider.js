
var header = ['Business Skills', 'Certified Technical Training', 'Desktop Applications'];
var descriptionFirstLine = ['Enhance Your', 'Build Your Technical', 'Boost your End-'];
var descriptionSecondLine = ['Professional', ' Expertise with Industry', 'User Skills with Live'];
var descriptionThirdLine = [' Development Skills', ' Leading Training Courses', 'Online Training'];
var mySwiper = new Swiper('.swiper-container', {
    spaceBetween: 30,
    effect: 'fade',
    loop: true,
    pagination: {
        el: '.swiper-pagination',
    },
    autoplay: {
        delay: 10000,
        disableOnInteraction: false,
    },
    fadeEffect: {
        crossFade: false
    }
});




/*---------------------------
    HOME SLIDER
-----------------------------*/
var $homeSlider = $('.welcome-slider-area');
$homeSlider.owlCarousel({
    merge: true,
    smartSpeed: 1000,
    loop: true,
    nav: true,
    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
    autoplay: true,
    autoplayTimeout: 3000,
    margin: 0,
    /*animateIn: 'fadeIn',
    animateOut: 'fadeOut',*/
    responsiveClass: true,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 1
        },
        1000: {
            items: 1
        },
        1200: {
            items: 1
        }
    }
});

(function () {
    

    mySwiper.slideTo(2);
    $('.first-caraousel-slide').hover(function () {
        mySwiper.slideTo(2);
    });

    $('.second-caraousel-slide').hover(function () {
        mySwiper.slideTo(1);
    });
    $('.third-caraousel-slide').hover(function () {
        mySwiper.slideTo(3);
    });

})();




