function changeHeaderOpacity() {

  var header       = $(".post-header");
  var headerHeight = header.outerHeight();

  $(document).scroll(function() {
    var scrollPercent = (headerHeight - window.scrollY) / headerHeight;
    var color         = "rgba(0, 29, 64, 0.1)";

    if (scrollPercent >= 0) {
      color = color.replace(/[\d.]+\)$/g, scrollPercent);
      header.css("background-color", color);
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
