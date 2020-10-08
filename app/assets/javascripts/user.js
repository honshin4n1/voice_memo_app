// ログアウト //
$(function () {
  $("#user-logout").on("click", function (e) {
    e.preventDefault();
    if (!confirm("ログアウトしますか？")) {
      return false;
    } else {
    }
  });
});
