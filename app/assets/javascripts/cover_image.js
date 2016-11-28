$(function () {
  $(window).on("load resize", function () {
    // Make post-header cover the whole viewport height.
    $(".post-header").css("height", window.innerHeight);
    // We apply it also to .post-heading taking out its height.
    $(".post-heading").css("top", window.innerHeight - 313);
  });
});
