$(function(){
  $('.anyClass').liHarmonica({
    onlyOne:true,
    speed:500
  });
});

$(document).on('ajax:success', '.wiki_post', function(xhr, data, status) {
  $("#content").hide();
  $("#content").html(data).fadeIn();
});
