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


$(function() {
    //マウスを乗せたら発動
    $('.genre__name__list').hover(function() {
      //マウスを乗せたら色が変わる
      $(this).css('color', '#ff4500');
    }, function() {
        //色指定を空欄にすれば元の色に戻る
        $(this).css('color', '');
    });
  });



 
  


  
