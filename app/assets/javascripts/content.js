window.addEventListener('DOMContentLoaded', function() {
    const speech = new webkitSpeechRecognition();
        speech.lang = 'ja-JP';
        // document.getElementById や addEventListener
        const StartTitle = document.getElementById('title-btn');
        const ResultTitle = document.getElementById('contents__title');
  
        speech.addEventListener('result', function (e) {
            var text = '';
        
            for (var i = 0; i < e.results.length; i++) {
                text += e.results[i][0].transcript;
            }
            ResultTitle.value = text;
        }, false);
  
        StartTitle.addEventListener('click', function () {
            ResultTitle.value = '';
            speech.start();
        }, false);
  },false);
  
  
window.addEventListener('DOMContentLoaded', function() {
    const speech = new webkitSpeechRecognition();
        speech.lang = 'ja-JP';
        // document.getElementById や addEventListener
        const StartComment = document.getElementById('comment-btn');
        const ResultComment = document.getElementById('contents__comment');
  
        speech.addEventListener('result', function (e) {
          var text = '';
      
          for (var i = 0; i < e.results.length; i++) {
              text += e.results[i][0].transcript;
          }
          ResultComment.value = text;
      }, false);
  
      StartComment.addEventListener('click', function () {
          ResultComment.value = '';
          speech.start();
      }, false);
  },false);
