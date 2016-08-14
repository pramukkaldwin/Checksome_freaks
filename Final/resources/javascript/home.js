/**
 * Created by Pramuk Perera on 13-Aug-16.
 */
/*$(window).scroll(function () {
    if ($(window) . scroll() > stickyNav){
        $('.header') . addClass('fixed');
    }
    else {
        $('.header') . removeClass('fixed');
    }
});*/


/*$(document).ready(function() {
    var stickyNavTop = $('.navbar').offset().top;
    var stickyNav = function(){
        var scrollTop = $(window).scrollTop();

        if (scrollTop > stickyNavTop) {
            $('.navbar').addClass('sticky');
        } else {
            $('.navbar').removeClass('sticky');
        }
    };

    stickyNav();

    $(window).scroll(function() {
        stickyNav();
    });
});*/


 var stickyNavTop = $('#header').offset().top;

 $(window).scroll(function() {
 if ($(window).scrollTop() > stickyNavTop) {
 $('#header').addClass('fixed');
 }
 else {
 $('#header').removeClass('fixed');
 }
 });