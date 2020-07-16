window.addEventListener('DOMContentLoaded', function() {
    const speech = new webkitSpeechRecognition();
        speech.lang = 'ja-JP';
        // document.getElementById や addEventListener
        const StartGenre = document.getElementById('genre-btn');
        const ResultGenre = document.getElementById('genre__name');
        speech.addEventListener('result', function (e) {
            var text = '';
        
            for (var i = 0; i < e.results.length; i++) {
                text += e.results[i][0].transcript;
            }
            ResultGenre.value = text;
        }, false);
        StartGenre.addEventListener('click', function () {
            ResultGenre.value = '';
            speech.start();
        }, false);
},false);



 
  


  
