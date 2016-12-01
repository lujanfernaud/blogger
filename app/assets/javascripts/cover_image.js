$(document).on('turbolinks:load', function() {
  $(".post-header").css("height", window.innerHeight);

  var headerPadding = parseInt($(".intro-header").css("padding-top"));
  var headingHeight = $(".post-heading").outerHeight();

  $(".post-heading").css("top", window.innerHeight - (headingHeight + headerPadding));
});

$(function () {
  $(window).on("load resize", function () {
    $(".post-header").css("height", window.innerHeight);

    var headerPadding = parseInt($(".intro-header").css("padding-top"));
    var headingHeight = $(".post-heading").outerHeight();

    $(".post-heading").css("top", window.innerHeight - (headingHeight + headerPadding));
  });
});
