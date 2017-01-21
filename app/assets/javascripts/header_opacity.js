function changeHeaderOpacity() {
  if (screen.width < 767) { return; };

  var header       = $(".cover-image");
  var headerHeight = header.outerHeight();

  $(document).scroll(function() {
    if (window.scrollY > headerHeight) { return; };

    var scrollPercent = (headerHeight - window.scrollY) / headerHeight;

    if (scrollPercent >= 0) {
      header.css("opacity", scrollPercent);
    };
  });
};

$(document).on("turbolinks:load", function() {
  changeHeaderOpacity();
});

$(function() {
  $(window).on("load resize", function() {
  changeHeaderOpacity();
  });
});
