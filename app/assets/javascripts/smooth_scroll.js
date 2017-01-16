function smoothScroll() {

  $('a[href*="#"]:not([href="#"])').click(function() {

    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {

      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');

      if (screen.width > 767) {

        var headingHeight = $(".post-heading").outerHeight();
        var faHeight      = $(".row-fa").outerHeight();
        var fontSize      = parseInt($("body").css("font-size"));

        if (target.length) {
          $('html, body').animate({
            scrollTop: target.offset().top - (headingHeight + faHeight + (fontSize * 4))
          }, 1000);
          return false;
        }

      } else {

        var headingHeight = $(".post-heading-xs").outerHeight();

        if (target.length) {
          $('html, body').animate({
            scrollTop: target.offset().top - headingHeight
          }, 1000);
          return false;
        }

      };
    };
  });
};

$(document).on('turbolinks:load', function() {
  smoothScroll();
});

$(function () {
  $(window).on("load resize", function () {
  smoothScroll();
  });
});
