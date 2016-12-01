$(document).on('turbolinks:load', function() {
  $(".post-header").css("height", window.innerHeight);
  $(".post-heading").css("top", window.innerHeight - 313);
});

$(function () {
  $(window).on("load resize", function () {
    $(".post-header").css("height", window.innerHeight);
    $(".post-heading").css("top", window.innerHeight - 313);
  });
});
