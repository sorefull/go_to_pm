// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).ready(function() {
  $("tr[data-link]").click(function() {
    window.location = $(this).data('link');
  });
});
