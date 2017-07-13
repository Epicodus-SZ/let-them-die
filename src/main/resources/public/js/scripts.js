
  //  // Initializing timer variable.
  //  var x = 5;
  //  var y = document.getElementById("timer");
   //
  //  // Display count down for 5 seconds
  //  setInterval(function(){
  //    while (x>=1) {
  //      x--;
  //      y.innerHTML= ''+x+'';
  //     }
  //   }, 1000);
   //
   //
  //  // Form Submitting after 5 seconds.
  //  var auto_refresh = setInterval(function() { submitform(); }, 5000);
   //
  //  // Form submit function.
  //  function submitform(){
  //    document.getElementById("form").submit();
  //  }


$(document).ready(function() {
  $('input[name=winner]').change(function(){
       $('form').submit();
  });
});
