$(document).on('ajax:success', '.show_vacation', function(xhr, data, status) {
  $('.vacation').html(data);
  $('#my_modal').modal();
});
