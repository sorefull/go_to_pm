$(document).on('turbolinks:load', function() {
  $("tr[data-link]").click(function() {
    window.location = $(this).data('link');
  });
  $(".to_past").click(function() {
    $(".future_vacations").hide();
    $(".past_vacations").show();
    $("#to_past").addClass('active');
    $("#to_future").removeClass('active');
  });
  $(".to_future").click(function() {
    $(".future_vacations").show();
    $(".past_vacations").hide();
    $("#to_past").removeClass('active');
    $("#to_future").addClass('active');
  });
});
