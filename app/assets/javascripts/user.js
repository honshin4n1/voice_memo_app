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

// ゲストユーザーログアウト //
$(function () {
  $("#guest_user-logout").on("click", function (e) {
    e.preventDefault();
    if (!confirm("ログアウトしますか？")) {
      return false;
    } else {
    }
  });
});
