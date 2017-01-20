function changeHeaderOpacity() {

  var header       = $(".cover-image");
  var headerHeight = header.outerHeight();

  $(document).scroll(function() {
    var scrollPercent = (headerHeight - window.scrollY) / headerHeight;

    if (scrollPercent >= 0) {
      header.css("opacity", scrollPercent);
    };
  });
};

$(document).on('turbolinks:load', function() {
  changeHeaderOpacity();
});

$(function () {
  $(window).on("load resize", function () {
  changeHeaderOpacity();
  });
});
