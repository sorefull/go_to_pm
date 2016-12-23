$(document).on('ajax:success', '.show_vacation', function(xhr, data, status) {
  $('.vacation').html(data);
  $('#my_modal').modal();
});

$(document).on('ajax:success', '.search_vacations', function(xhr, data, status) {
  $(".vacations").html(data);
  $(".search_vacations").removeClass('btn-primary');
  $(this).addClass('btn-primary');
});

$(document).on('click', '.to_past', function() {
  $(".future_vacations").hide();
  $(".past_vacations").show();
  $("#to_future").removeClass('active');
  $("#to_past").addClass('active');
});

$(document).on('click', '.to_future', function() {
  $(".past_vacations").hide();
  $(".future_vacations").show();
  $("#to_past").removeClass('active');
  $("#to_future").addClass('active');
});
