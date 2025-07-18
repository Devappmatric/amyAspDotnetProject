document.onscroll = function () { myFunction() };

var navbar = document.getElementById("header");
var topHeader=document.getElementById("top-navigation-headers");
var sticky = navbar.offsetTop;

function myFunction() {
    if (window.pageYOffset >= 40) {
        navbar.classList.add("stickyclass")
        topHeader.style.display = "none";
        $('.navbar-default').addClass('slide-header-background');
        $('.dropdown').addClass('white-dropdown');
        $('.navWhite').addClass('slide-header-style');
        $('#searchIcon').css('color', 'white');
        $("#searchIconImage").attr("src", "/images/site/search-icon-white.png");
        $("#header-logo-homepage").attr("src", "/images/homepage/new-logo.png");
        $("#header-logo-homepage").attr("style", "margin-top:10px;");
    } else {
        navbar.classList.remove("stickyclass");
        topHeader.style.display = "block";
        $('.navbar-default').removeClass('slide-header-background');
        $('.dropdown').removeClass('white-dropdown');
        $('.navWhite').removeClass('slide-header-style');
        $('#searchIcon').removeClass('slide-header-style');
        $('#searchIcon').css('color', 'black');
        if (!isHomePage) {
            $("#searchIconImage").attr("src", "/images/site/Search_icon.png");
            $("#header-logo-homepage").attr("src", "/images/site/PPG_Solutions-01.svg");
            $("#header-logo-homepage").attr("style", "margin-top:-20px;");
        }
       
    }
    if (window.pageYOffset >= 500) {
        $('.searchMenu').hide("slow");
    }
}

(function () {

    document.querySelector("#searchBtn").addEventListener("change", function () {
        if (this.checked == true) {
            document.querySelector("#ctlSearchInputHome").focus();
        }
    });
});

/*This is for showing dropdown menus*/
(function () {

    //$(".dropdown-toggle").hover(function () {
    //    debugger;
    //    var temp = $(this);
    //    console.log("yogi test");
    //    var dropdownMenu = $(this).children(".dropdown-menu");
    //    if (dropdownMenu.is(":visible")) {
    //        debugger;
    //        var temp = dropdownMenu.parent();
    //        dropdownMenu.parent().toggleClass("open");
    //        dropdownMenu.parent().addClass("active");
    //    }
    //    var temp = this.getAttribute('aria-expanded').value;
    //    //this.$('.dropdown-menu').show();
    //})
    $(".dropdown-toggle").click(function () {

        var temp = this.getAttribute('aria-expanded').value;
    })
});

(function () {
    //$('.technology-course').show();
    //$('.technology-brand').hide();
    let isMenuOpen = false;
    $('.searchMenu').hide();

    $("#searchIcon").click(function () {
        if (isMenuOpen) {
            $('.searchMenu').hide("slow");
        } else {
            $('.searchMenu').show("slow");
            $('#ctlSearchInputHome').focus();
        }
        isMenuOpen = !isMenuOpen;
    })

    $(".search-close-icon").click(function () {
        $('.searchMenu').hide("slow");
    })

    //relating to cart
    $('.shopping-cart-list').hide();
    $('.logout-box').hide();
    $('.contact-box').hide();
    $('.login-box').hide();

    $("#ctlCart").hover(function () {
        $('.logout-box').hide();
        $('.contact-box').hide();
        $('.login-box').hide();
        $('.shopping-cart-list').show();
    })
    $(".shopping-cart-list").mouseleave(function () {
        $('.shopping-cart-list').hide();
    })

    $("#ctlLogOut").click(function (event) {
        if ($('.logout-box').is(":visible")) {
            $('.logout-box').hide();
            return;
        }
        $('.shopping-cart-list').hide();
        $('.contact-box').hide();
        $('.login-box').hide();
        $('.logout-box').show();
        event.stopPropagation();
    })
    

    $("#ctlViewCart").click(function (event) {
        if ($('.login-box').is(":visible")) {
            $('.login-box').hide();
            return;
        }
        $('.shopping-cart-list').hide();
        $('.logout-box').hide();
        $('.contact-box').hide();
        $('.login-box').show();
        event.stopPropagation();
    })
    


    $("#ctlContactBox").click(function (event) {
        if ($('.contact-box').is(":visible")) {
            $('.contact-box').hide();
            return;
        }
        $('.shopping-cart-list').hide();
        $('.logout-box').hide();
        $('.login-box').hide();
        $('.contact-box').show();
        event.stopPropagation();
    });

    $(".login-box").click(function () {
        if ($('.login-box').is(":visible")) {
            $('.login-box').hide();
            return;
        }
        if ($("#Username").is(":focus")) {
            $('.login-box').show();
        }
        else if ($("#Password").is(":focus")) {
            $('.login-box').show();
        } else {
            $('.login-box').hide();
        }
    })

    $(window).click(function (event) {

        if ($(event.target).parents('.login-box').length) {
            $('.login-box').show();
            event.stopPropagation();
            return;
        }

        if ($(event.target).parents('.contact-box').length) {
            $('.contact-box').show();
            event.stopPropagation();
            return;
        }
            
        $('.contact-box').hide();
        $('.logout-box').hide();
        if ($("#Username").is(":focus")) {
            $('.login-box').show();
        }
        else if ($("#Password").is(":focus")) {
            $('.login-box').show();
        } else {
            $('.login-box').hide();
        }
    });


    $(".ctlChatBox").hover(function () {
        $('.contact-box').hide();
        $('.shopping-cart-list').hide();
        $('.logout-box').hide();
        $('.login-box').hide();
        
    })


    $('ul.nav li.dropdown').hover(function () {
        $('.technology-brand').show();
        $('.technology-topic').hide();
        $('.technology-desktop').hide();
        $('.technology-professional').hide();
        //if ($(window).width() > 767) {
        //    $(this).find('.dropdown-menu').show();
        //}
    }, function () {
        $('.technology-brand').show();
        $('.technology-topic').hide();
        $('.technology-desktop').hide();
        $('.technology-professional').hide();
        //if ($(window).width() > 767) {
        //    $(this).find('.dropdown-menu').hide().css('display', '');
        //}
    });


    $('.technology-brand-link').hover(function () {
        $(this).children().focus();
        $('.technology-course').hide();
        $('.technology-brand').show();
        $('.technology-topic').hide();
        $('.technology-desktop').hide();
        $('.technology-professional').hide();
    });

    $('.technology-category-main').hover(function () {
        $('.technology-category-main').children().focus();
        $('.technology-course').hide();
        $('.technology-brand').show();
        $('.technology-topic').hide();
        $('.technology-desktop').hide();
        $('.technology-professional').hide();
    });

    $('.technology-topic-link').hover(function () {
        $(this).children().focus();
        $('.technology-course').hide();
        $('.technology-brand').hide();
        $('.technology-topic').show();
        $('.technology-desktop').hide();
        $('.technology-professional').hide();
    });

    $('.technology-desktop-link').hover(function () {
        $(this).children().focus();
        $('.technology-course').hide();
        $('.technology-brand').hide();
        $('.technology-topic').hide();
        $('.technology-desktop').show();
        $('.technology-professional').hide();
    });

    $('.technology-professional-link').hover(function () {
        $(this).children().focus();
        $('.technology-course').hide();
        $('.technology-brand').hide();
        $('.technology-topic').hide();
        $('.technology-desktop').hide();
        $('.technology-professional').show();
    });

    $('.dropdown').hover(function () {
        var temp = $(this).find('.glyphicon');
        temp.removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
        var temp2 = $(this).find('submenu-glyphicon');
        temp2.removeClass('glyphicon-chevron-up').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-right');
    })
    $('.dropdown').mouseleave(function () {
        var temp = $(this).find('.glyphicon');
        temp.removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
        var temp2 = $(this).find('submenu-glyphicon');
        temp2.removeClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-right');
    })
})();