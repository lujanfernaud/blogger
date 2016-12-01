function adjustHeader() {
  $(".post-header").css("height", window.innerHeight);

  var headerPadding = parseInt($(".intro-header").css("padding-top"));
  var headingHeight = $(".post-heading").outerHeight();
  $(".post-heading").css("top", window.innerHeight - (headingHeight + headerPadding));

  var postHeadingTop = parseInt($(".post-heading").css("top"));
  var faHeight = $(".row-fa").outerHeight();
  var fontSize = parseInt($("body").css("font-size"));
  $(".row-fa").css("top", postHeadingTop - faHeight - fontSize);
};

$(document).on('turbolinks:load', function() {
  adjustHeader();
});

$(function () {
  $(window).on("load resize", function () {

  adjustHeader();
  });
});
