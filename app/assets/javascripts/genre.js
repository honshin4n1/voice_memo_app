window.addEventListener('DOMContentLoaded', function() {
    const speech = new webkitSpeechRecognition();
        speech.lang = 'ja-JP';
        // document.getElementById や addEventListener
        const Start = document.getElementById('start-btn');
        const Result = document.getElementById('genre__name');

        speech.addEventListener('result', function (e) {
            var text = '';
        
            for (var i = 0; i < e.results.length; i++) {
                text += e.results[i][0].transcript;
            }
            Result.value = text;
        }, false);

        Start.addEventListener('click', function () {
            Result.value = '';
            speech.start();
        }, false);
    
    


        
},false);

