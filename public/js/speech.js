//  0 "Alex"
//  1 "Alice"
//  2 "Alva"
//  3 "Amelie"
//  4 "Anna"
//  5 "Carmit"
//  6 "Damayanti"
//  7 "Daniel"
//  8 "Diego"
//  9 "Ellen"
//  10 "Fiona"
//  11 "Fred"
//  12 "Ioana"
//  13 "Joana"
//  14 "Jorge"
//  15 "Juan"
//  16 "Kanya"
//  17 "Karen"
//  18 "Kyoko"
//  19 "Laura"
//  20 "Lekha"
//  21 "Luca"
//  22 "Luciana"
//  23 "Maged"
//  24 "Mariska"
//  25 "Mei-Jia"
//  26 "Melina"
//  27 "Milena"
//  28 "Moira"
//  29 "Monica"
//  30 "Nora"
//  31 "Paulina"
//  32 "Samantha"
//  33 "Sara"
//  34 "Satu"
//  35 "Sin-ji"
//  36 "Tessa"
//  37 "Thomas"
//  38 "Ting-Ting"
//  39 "Veena"
//  40 "Victoria"
//  41 "Xander"
//  42 "Yelda"
//  43 "Yuna"
//  44 "Yuri"
//  45 "Zosia"
//  46 "Zuzana"
//  47 "Google Deutsch"
//  48 "Google US English"
//  49 "Google UK English Female"
//  50 "Google UK English Male"
//  51 "Google español"
//  52 "Google español de Estados Unidos"
//  53 "Google français"
//  54 "Google हिन्दी"
//  55 "Google Bahasa Indonesia"
//  56 "Google italiano"
//  57 "Google 日本語"
//  58 "Google 한국의"
//  59 "Google Nederlands"
//  60 "Google polski"
//  61 "Google português do Brasil"
//  62 "Google русский"
//  63 "Google 普通话（中国大陆）"
//  64 "Google 粤語（香港）"
//  65 "Google 國語（臺灣）"

$(function speak(message){
  if ('speechSynthesis' in window) {
    // speechSynthesis.onvoiceschanged = function() {
    //   var $voicelist = $('#voices');

    //   if($voicelist.find('option').length == 0) {
    //     speechSynthesis.getVoices().forEach(function(voice, index) {
    //       var $option = $('<option>')
    //       .val(index)
    //       .html(voice.name + (voice.default ? ' (default)' :''));

    //       $voicelist.append($option);
    //     });
    //     // var voices = speechSynthesis.getVoices()
    //     speechSynthesis.getVoices().forEach(function(voice, index) {
    //       console.log(index, voice.name);
    //     });
    //     console.log(speechSynthesis.getVoices());
        
    //     $voicelist.material_select();
    //   }
    // }

    // function speak(){
      var text = $('#message').val();
      var msg = new SpeechSynthesisUtterance();
      var voices = window.speechSynthesis.getVoices();
      msg.voice = voices[48];
    //   msg.rate = $('#rate').val() / 10;
    //   msg.pitch = $('#pitch').val();
      msg.text = text;

    //   msg.onend = function(e) {
    //     console.log('Finished in ' + event.elapsedTime + ' seconds.');
    //   };

      speechSynthesis.speak(msg);
    // }
  } else {
    $('#modal1').openModal();
  }
});