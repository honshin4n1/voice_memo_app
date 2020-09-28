window.addEventListener(
  "DOMContentLoaded",
  function () {
    const speech = new webkitSpeechRecognition();
    speech.lang = "ja-JP"; //日本語
    speech.continuous = true; //連続性
    speech.interimResults = true; //途中経過表示
    // document.getElementById や addEventListener
    const StartTitle = document.getElementById("title-btn");
    const ResultTitle = document.getElementById("contents__title");
    const StopTitle = document.getElementById("title-btn-stop");

    speech.addEventListener(
      "result",
      function (e) {
        var text = "";

        for (var i = 0; i < e.results.length; i++) {
          text += e.results[i][0].transcript;
        }
        ResultTitle.value = text;
      },
      false
    );

    StartTitle.addEventListener(
      "click",
      function () {
        ResultTitle.value = "";
        speech.start();
      },
      false
    );
    StopTitle.addEventListener(
      "click",
      function () {
        speech.stop();
      },
      false
    );
  },
  false
);

window.addEventListener(
  "DOMContentLoaded",
  function () {
    const speech = new webkitSpeechRecognition();
    speech.lang = "ja-JP"; //日本語
    speech.continuous = true; //連続性
    speech.interimResults = true; //途中経過表示
    // document.getElementById や addEventListener
    const StartComment = document.getElementById("comment-btn");
    const ResultComment = document.getElementById("contents__comment");
    const StopComment = document.getElementById("comment-btn-stop");

    speech.addEventListener(
      "result",
      function (e) {
        var text = "";

        for (var i = 0; i < e.results.length; i++) {
          text += e.results[i][0].transcript;
        }
        ResultComment.value = text;
      },
      false
    );

    StartComment.addEventListener(
      "click",
      function () {
        ResultComment.value = "";
        speech.start();
      },
      false
    );
    StopComment.addEventListener(
      "click",
      function () {
        speech.stop();
      },
      false
    );
  },
  false
);
