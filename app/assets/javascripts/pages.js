/*global $*/
/*Sets the alert to fade out*/
$(document).on('turbolinks:load', function(){
  $('.alert').delay(1000).fadeOut(4000);
})