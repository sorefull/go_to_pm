$(document).on('ajax:success', '.close', function(xhr, data, status) {
  $(this).parent().fadeOut();
});
