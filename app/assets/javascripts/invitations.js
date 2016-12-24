$(document).on('ajax:success', '.new_invitation', function(xhr, data, status) {
  $('.invitation').html(data);
  $('#my_modal').modal();
});
