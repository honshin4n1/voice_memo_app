$(function () {
  var menu = $(".side-bar");
  var menuWidth = menu.outerWidth();
  $(".wrapper").on("click", "#top-menu", function (e) {
    e.preventDefault();
    menu.toggleClass("open");
    if (menu.hasClass("open")) {
      menu.animate({ left: 0 }, 300);
    } else {
      menu.animate({ left: -menuWidth }, 300);
    }
  });
});
