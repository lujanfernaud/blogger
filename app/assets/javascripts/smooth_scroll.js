function smoothScroll() {

  $('a[href*="#"]:not([href="#"])').click(function() {

    function stopAnimationIfUserScrolls() {
      $('html, body').on("scroll mousedown DOMMouseScroll mousewheel touchstart keyup", function(e) {
        if ( e.which > 0 || e.type === "mousedown" || e.type === "mousewheel" || e.type === "touchstart") {
          $('html, body').stop();
        };
      });
    };

    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {

      var target = $(this.hash);
      target     = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (!target.length) { throw new Error("Section id not found") }

      if (screen.width > 767) {

        var headingHeight = $(".post-heading").outerHeight();
        var faHeight      = $(".row-fa").outerHeight();
        var fontSize      = parseInt($("body").css("font-size"));

        $('html, body').animate({
          scrollTop: target.offset().top - (headingHeight + faHeight + (fontSize * 4))
        }, 1000);
        stopAnimationIfUserScrolls();
        return false;

      } else {

        var headingHeight = $(".post-heading-xs").outerHeight();

        $('html, body').animate({
          scrollTop: target.offset().top - (headingHeight - 1)
        }, 1000);
        stopAnimationIfUserScrolls();
        return false;

      };
    };
  });
};

$(document).on("turbolinks:load", function() {
  smoothScroll();
});

$(function() {
  $(window).on("load resize", function() {
  smoothScroll();
  });
});
