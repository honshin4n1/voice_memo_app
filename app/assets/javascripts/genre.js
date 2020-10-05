window.addEventListener(
  "DOMContentLoaded",
  function () {
    const speech = new webkitSpeechRecognition();
    speech.lang = "ja-JP"; //日本語
    speech.continuous = true; //連続性
    speech.interimResults = true; //途中経過表示
    // document.getElementById や addEventListener
    const StartGenre = document.getElementById("genre-btn");
    const ResultGenre = document.getElementById("genre__name");
    const StopGenre = document.getElementById("genre-btn-stop");
    speech.addEventListener(
      "result",
      function (e) {
        var text = "";

        for (var i = 0; i < e.results.length; i++) {
          text += e.results[i][0].transcript;
        }
        ResultGenre.value = text;
      },
      false
    );
    StartGenre.addEventListener(
      "click",
      function () {
        ResultGenre.value = "";
        speech.start();
      },
      false
    );
    StopGenre.addEventListener(
      "click",
      function () {
        speech.stop();
      },
      false
    );
  },
  false
);

$(function () {
  function buildHTML(genre) {
    var html = `
    <li class="genre-list__link">
    <a class="genre-list__link--name" href="/genres/${genre.id}/contents">${genre.name}</a>
    </li> `;
    return html;
  }
  $("#new_genre").on("submit", function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr("action");
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false,
    })
      .done(function (data) {
        var html = buildHTML(data);
        $(".genre-list").append(html);
        $(".genre-form").val(" ");
        $(".submit-btn").prop("disabled", false);
      })
      .fail(function () {
        alert("入力に誤りがあるか、投稿に失敗しました。");
      });
  });
});

$(function () {
  //マウスを乗せたら発動
  $(".genre-list__link").hover(
    function () {
      //マウスを乗せたら色が変わる
      $(this).css("background-color", "#333333");
    },
    function () {
      //色指定を空欄にすれば元の色に戻る
      $(this).css("background-color", "");
    }
  );
});

$(function () {
  //マウスを乗せたら発動
  $(".menu-list__link").hover(
    function () {
      //マウスを乗せたら色が変わる
      $(this).css("background-color", "#333333");
    },
    function () {
      //色指定を空欄にすれば元の色に戻る
      $(this).css("background-color", "");
    }
  );
});
