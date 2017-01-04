function adjustHeader() {
  if (screen.width > 767) {

    // Landscape orientation:
    if (screen.innerWidth > screen.innerHeight) {

      $(".post-header").css("height", window.innerHeight);

      var headerPadding = parseInt($(".intro-header").css("padding-top"));
      var headingHeight = $(".post-heading").outerHeight();
      $(".post-heading").css("top", window.innerHeight - (headingHeight + headerPadding));

      var postHeadingTop = parseInt($(".post-heading").css("top"));
      var faHeight = $(".row-fa").outerHeight();
      var fontSize = parseInt($("body").css("font-size"));
      $(".row-fa").css("top", postHeadingTop - faHeight - (fontSize * 2));

    // Portrait orientation:
    } else {

      var headerHeight;
      // Set headerHeight always to the size of the shortest side.
      // We do this to keep the header always the same height in landscape
      // and portrait orientation.
      if (window.innerWidth > window.innerHeight) {
        headerHeight = window.innerHeight;
      } else {
        headerHeight = window.innerWidth;
      };
      $(".post-header").css("height", headerHeight);

      var headerPadding = parseInt($(".intro-header").css("padding-top"));
      var headingHeight = $(".post-heading").outerHeight();
      $(".post-heading").css("top", headerHeight - (headingHeight + headerPadding));

      var postHeadingTop = parseInt($(".post-heading").css("top"));
      var faHeight = $(".row-fa").outerHeight();
      var fontSize = parseInt($("body").css("font-size"));
      $(".row-fa").css("top", postHeadingTop - faHeight - (fontSize * 2));

    };

  // If the screen is smaller than 767px:
  } else {

    var home = document.getElementsByClassName("featured-header-xs").length > 0;

    // Landscape orientation:
    if (window.innerWidth > window.innerHeight) {

      if (home) {

        var headerPadding = parseInt($(".intro-header").css("padding-top"));
        var headingHeight = $(".site-heading").outerHeight();
        $(".featured-header-xs").css("height", window.innerHeight - (headingHeight + headerPadding));

      } else {

        var navbarHeight = parseInt($(".navbar").css("min-height"));
        $(".post-header-xs").css("height", window.innerHeight - navbarHeight);

      };

    // Portrait orientation:
    } else {

      var headerHeight;
      // Set headerHeight always to the size of the shortest side.
      // We do this to keep the header always the same height in landscape
      // and portrait orientation.
      if (window.innerWidth > window.innerHeight) {
        headerHeight = window.innerHeight;
      } else {
        headerHeight = window.innerWidth;
      };

      if (home) {

        var headerPadding = parseInt($(".intro-header").css("padding-top"));
        var headingHeight = $(".site-heading").outerHeight();
        $(".featured-header-xs").css("height", headerHeight - (headingHeight + headerPadding));

      } else {

        var navbarHeight = parseInt($(".navbar").css("min-height"));
        $(".post-header-xs").css("height", headerHeight - navbarHeight);

      };

    };

  };
};

$(document).on('turbolinks:load', function() {
  adjustHeader();
});

$(function () {
  $(window).on("load resize", function () {
  adjustHeader();
  });
});
