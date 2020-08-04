$(function() {
  //マウスを乗せたら発動
   $('.session-link').hover(function() {
    //マウスを乗せたら色が変わる
       $(this).css('color', '#0099ff');
   }, function() {
      //色指定を空欄にすれば元の色に戻る
       $(this).css('color', '');
   });
});