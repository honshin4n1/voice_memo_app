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
  //マウスを乗せたら発動
  $(".genre__name__list").hover(
    function () {
      //マウスを乗せたら色が変わる
      $(this).css("color", "#ff4500");
    },
    function () {
      //色指定を空欄にすれば元の色に戻る
      $(this).css("color", "");
    }
  );
});

$(function () {
  $(".contents-title-link").hover(
    function () {
      $(this).css("color", "#ff4500");
    },
    function () {
      $(this).css("color", "");
    }
  );
});
