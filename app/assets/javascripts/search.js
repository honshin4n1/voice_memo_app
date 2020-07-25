window.addEventListener('DOMContentLoaded', function() {
  const speech = new webkitSpeechRecognition();
        speech.lang = 'ja-JP';
        // document.getElementById や addEventListener
        const StartSearch = document.getElementById('search-btn');
        const ResultSearch = document.getElementById('search__title');

        speech.addEventListener('result', function (e) {
          var text = '';
      
          for (var i = 0; i < e.results.length; i++) {
              text += e.results[i][0].transcript;
          }
          ResultSearch.value = text;
      }, false);

      StartSearch.addEventListener('click', function () {
          ResultSearch.value = '';
          speech.start();
      }, false);
},false);