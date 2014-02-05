$(document).on('ready', function(){
  $('.timer').countdown({
    until: 10, 
    format: 'MS',
    onExpiry: showBox
  });
});

function showBox(){
  alert("Your time is finished");
}