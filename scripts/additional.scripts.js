$(document).ready(function () {

    // Scroll To Top widget
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.scrollup').fadeIn();
        } else {
            $('.scrollup').fadeOut();
        }
    });

    $('.scrollup').click(function () {
        $("html, body").animate({
                scrollTop: 0
            },
            600);
        return false;
    });
    // End Scroll To Top widget
        
    //Owl Scroller
    $("#imgSlider1").owlCarousel({
        baseClass: "owl-carousel",
        theme: "owl-theme",
        autoPlay: true,
        slideSpeed: 200
    });
    //End Owl Scroller

    //Accordion Toggle
    $('#accordion').find('.accordion-toggle').click(function () {
        //Expand or collapse this panel
        $(this).next().slideToggle('fast');
        //$('#dropIconPlus').hide();
        //$('#dropIconMinus').show();
        //Hide the other panels
        $(".accordion-content").not($(this).next()).slideUp('fast');;
    });
    //End Accordion Toggle

    // Search Input Validator
    $('#ctlSearchHome').click(function (e) {
        var isValid = true;
        $('input[type="text"].requiredHome').each(function () {
            if ($.trim($(this).val()) === '') {
                isValid = false;
                $(this).css({
                    "border": "1px solid #DE888A",
                    "background": "#FEE9EA"
                });
            } else {
                $(this).css({
                    "border": "1px solid #A5D491",
                    "background": "#F0FEE9"
                });
            }
        });
        if (isValid === false)
            e.preventDefault();
    });
    // End Search Input Validator
    
    // Search Input Validator
    $('#ContentPlaceHolder1_ucSearchHome_ctlSearchMobile').click(function (e) {
        var isValid = true;
        $('input[type="text"].required').each(function () {
            if ($.trim($(this).val()) === '') {
                isValid = false;
                $(this).css({
                    "border": "1px solid #DE888A",
                    "background": "#FEE9EA"
                });
            } else {
                $(this).css({
                    "border": "1px solid #A5D491",
                    "background": "#F0FEE9"
                });
            }
        });
        if (isValid === false)
            e.preventDefault();
    });
    // End Search Input Validator

    // Search Input Validator Mobile
    $('#ContentPlaceHolder1_ucSearch_ctlSearchMobile').click(function (e) {
        var isValid = true;
        $('input[type="text"].requiredMobile').each(function () {
            if ($.trim($(this).val()) === '') {
                isValid = false;
                $(this).css({
                    "border": "1px solid #DE888A",
                    "background": "#FEE9EA"
                });
            } else {
                $(this).css({
                    "border": "1px solid #A5D491",
                    "background": "#F0FEE9"
                });
            }
        });
        if (isValid === false)
            e.preventDefault();
    });
    // End Search Input Validator Mobile

    // Validate form
    $("#ctlSearchInput").click(function () {
        $.validate({
            form: '#ctlMasterForm',
            scrollToTopOnError: false,
            ignore: [
                'ctl00$ContentPlaceHolder1$ucSearchHome$ctlSearchInputMobile',
                'ctl00$ContentPlaceHolder1$tbName',
                'ctl00$ContentPlaceHolder1$tbEmail',
                'ctl00$ContentPlaceHolder1$tbPhone',
                'cbIAgree',
                'ctl00$ContentPlaceHolder1$ctl00$ddlGroupSize',
                'ctl00$ContentPlaceHolder1$ctl00$tbName',
                'ctl00$ContentPlaceHolder1$ctl00$tbEmail',
                'ctl00$ContentPlaceHolder1$ctl00$tbPhone',                
            ]
        });
    });

    $("#ContentPlaceHolder1_ucSearchHome_ctlSearchMobile").click(function () {
        $.validate({
            form: '#ctlMasterForm',
            scrollToTopOnError: false,
            ignore: [
                'ctl00$ContentPlaceHolder1$tbName',
                'ctl00$ContentPlaceHolder1$tbEmail',
                'ctl00$ContentPlaceHolder1$tbPhone',
                'cbIAgree',
                'ctl00$ContentPlaceHolder1$ctl00$ddlGroupSize',
                'ctl00$ContentPlaceHolder1$ctl00$tbName',
                'ctl00$ContentPlaceHolder1$ctl00$tbEmail',
                'ctl00$ContentPlaceHolder1$ctl00$tbPhone',
                'ctl00$ctlSearchInput'
            ]
        });
    });

    $("#ContentPlaceHolder1_ucSearch_ctlSearchInputMobile").click(function () {
        $.validate({
            form: '#ctlMasterForm',
            scrollToTopOnError: false,
            ignore: [
                'ctl00$ContentPlaceHolder1$tbName',
                'ctl00$ContentPlaceHolder1$tbEmail',
                'ctl00$ContentPlaceHolder1$tbPhone',
                'cbIAgree',
                'ctl00$ContentPlaceHolder1$ctl00$ddlGroupSize',
                'ctl00$ContentPlaceHolder1$ctl00$tbName',
                'ctl00$ContentPlaceHolder1$ctl00$tbEmail',
                'ctl00$ContentPlaceHolder1$ctl00$tbPhone'
            ]
        });
    });

    $("#ContentPlaceHolder1_btnSubmitHomeForm").click(function () {
        $.validate({
            form: '#ctlMasterForm',
            scrollToTopOnError: false
        });
    });

    $("#ContentPlaceHolder1_ctlAddStudent").click(function () {
        $.validate({
            form: '#ctlMasterForm',
            scrollToTopOnError: false,
            ignore: [
                'ctl00$ContentPlaceHolder1$tbName',
                'ctl00$ContentPlaceHolder1$tbEmail',
                'ctl00$ContentPlaceHolder1$tbPhone',
                'cbIAgree',
                'ctl00$ContentPlaceHolder1$ctl00$ddlGroupSize',
                'ctl00$ContentPlaceHolder1$ctl00$tbName',
                'ctl00$ContentPlaceHolder1$ctl00$tbEmail',
                'ctl00$ContentPlaceHolder1$ctl00$tbPhone'
            ]
        });
    });

    $("#ContentPlaceHolder1_ctl00_btnSubmitHomeForm").click(function () {
        $.validate({
            form: '#ctlMasterForm',
            scrollToTopOnError: false,
            ignore: [
                'ctl00$ContentPlaceHolder1$ctlUsernameNew',
                'ctl00$ContentPlaceHolder1$ctlPassword',
                'ctl00$ContentPlaceHolder1$ctlUsernameNewEmail',
                'ctl00$ContentPlaceHolder1$ctlUsernameNew',
                'ctl00$ContentPlaceHolder1$ctlFirstName',
                'ctl00$ContentPlaceHolder1$ctlLastName',
                'ctl00$ContentPlaceHolder1$ctlPhone',
                'ctl00$ContentPlaceHolder1$ctlCompany',
                'ctl00$ContentPlaceHolder1$ctlAddress',
                'ctl00$ContentPlaceHolder1$ctlCity',
                'ctl00$ContentPlaceHolder1$ctlCountry',
                'ctl00$ContentPlaceHolder1$ctlState',
                'ctl00$ContentPlaceHolder1$ctlZipCode',
                'ctl00$ContentPlaceHolder1$ctlBillingFirstName',
                'ctl00$ContentPlaceHolder1$ctlBillingLastName',
                'ctl00$ContentPlaceHolder1$ctlBillingPhone',
                'ctl00$ContentPlaceHolder1$ctlBillingCompany',
                'ctl00$ContentPlaceHolder1$ctlBillingAddress',
                'ctl00$ContentPlaceHolder1$ctlBillingCity',
                'ctl00$ContentPlaceHolder1$ctlBillingCountry',
                'ctl00$ContentPlaceHolder1$ctlBillingState',
                'ctl00$ContentPlaceHolder1$ctlBillingZipCode',
                'ctl00$ContentPlaceHolder1$ctlCancel',
                'ctl00$ContentPlaceHolder1$ctlBillingInfoNameOnCard',
                'ctl00$ContentPlaceHolder1$ctlBillingInfoCardNumber',
                'ctl00$ContentPlaceHolder1$ctlBillingInfoCCVNumber',
                'ctl00$ContentPlaceHolder1$ctlBillingInfoCCMonth',
                'ctl00$ContentPlaceHolder1$ctlBillingInfoCCYear',
                'ctl00$ContentPlaceHolder1$ctlEmail',
                'ctl00$ContentPlaceHolder1$ctlStudentName',
                'ctl00$ContentPlaceHolder1$ctlStudentEmail',
                'ctl00$ContentPlaceHolder1$ctlPO'
            ]
        });
    });

    $("#ContentPlaceHolder1_ctlSubmitForm").click(function () {
        $.validate({
            form: '#ctlMasterForm',
            scrollToTopOnError: false,
            ignore: [
                'ctl00$ContentPlaceHolder1$ctl00$ddlGroupSize',
                'ctl00$ContentPlaceHolder1$ctl00$tbName',
                'ctl00$ContentPlaceHolder1$ctl00$tbEmail',
                'ctl00$ContentPlaceHolder1$ctl00$tbPhone',
                'cbIAgree'
            ]
        });
    });

    $("#ContentPlaceHolder1_ctlUserLogin").click(function () {
        $.validate({
            form: '#ctlMasterForm',
            scrollToTopOnError: false,
            ignore: [
                'ctl00$ContentPlaceHolder1$ctl00$ddlGroupSize',
                'ctl00$ContentPlaceHolder1$ctl00$tbName',
                'ctl00$ContentPlaceHolder1$ctl00$tbEmail',
                'ctl00$ContentPlaceHolder1$ctl00$tbPhone',
                'cbIAgree'
            ]
        });
    });

    $("#ContentPlaceHolder1_ctlCancelPasswordReset").click(function () {
        $.validate({
            form: '#ctlMasterForm',
            scrollToTopOnError: false,
            ignore: [
                'ctl00$ContentPlaceHolder1$ctl00$ddlGroupSize',
                'ctl00$ContentPlaceHolder1$ctl00$tbName',
                'ctl00$ContentPlaceHolder1$ctl00$tbEmail',
                'ctl00$ContentPlaceHolder1$ctl00$tbPhone',
                'ctl00$ContentPlaceHolder1$ctlUsernameNewEmail',
                'cbIAgree'
            ]
        });
    });

    $("#ContentPlaceHolder1_ctlCreateAccount").click(function () {
        $.validate({
            form: '#ctlMasterForm',
            scrollToTopOnError: false,
            ignore: [
                'ctl00$ContentPlaceHolder1$ctl00$ddlGroupSize',
                'ctl00$ContentPlaceHolder1$ctl00$tbName',
                'ctl00$ContentPlaceHolder1$ctl00$tbEmail',
                'ctl00$ContentPlaceHolder1$ctl00$tbPhone',
                'ctl00$ContentPlaceHolder1$ctlUsernameNewEmail',
                'cbIAgree'
            ]
        });
    });

    $("#ContentPlaceHolder1_ctlSubmitOrder").click(function () {
        $.validate({
            form: '#ctlMasterForm',
            scrollToTopOnError: false,
            ignore: [
                'ctl00$ContentPlaceHolder1$ctl00$ddlGroupSize',
                'ctl00$ContentPlaceHolder1$ctl00$tbName',
                'ctl00$ContentPlaceHolder1$ctl00$tbEmail',
                'ctl00$ContentPlaceHolder1$ctl00$tbPhone',
                'ctl00$ContentPlaceHolder1$ctlUsernameNewEmail',
                'cbIAgree'
            ]
        });
    });
    // End validate form
});