$(document).on('ready', function(){
  $('.timer').countdown({
    until: 10, 
    format: 'MS',
    onExpiry: showBox
  });
  $('#start_button').on('click', function(){
    $('.timer').countdown('resume');
  });
  $('#pause_button').on('click', function(){
    $('.timer').countdown('pause');
  });
});

function showBox(){
  alert("Your time is finished");
}