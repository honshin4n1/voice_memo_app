window.addEventListener(
  "DOMContentLoaded",
  function () {
    const speech = new webkitSpeechRecognition();
    speech.lang = "ja-JP"; //日本語
    speech.continuous = true; //連続性
    speech.interimResults = true; //途中経過表示
    // document.getElementById や addEventListener
    const StartSearch = document.getElementById("search-btn");
    const ResultSearch = document.getElementById("search__title");
    const StopSearch = document.getElementById("search-btn-stop");

    speech.addEventListener(
      "result",
      function (e) {
        var text = "";
        for (var i = 0; i < e.results.length; i++) {
          text += e.results[i][0].transcript;
        }
        ResultSearch.value = text;
      },
      false
    );

    StartSearch.addEventListener(
      "click",
      function () {
        ResultSearch.value = "";
        speech.start();
      },
      false
    );

    StopSearch.addEventListener(
      "click",
      function () {
        speech.stop();
      },
      false
    );
  },
  false
);
