$(document).ready(function() {

$('#spin').click(function() {
    $.ajax({
      type: 'GET',
      url: '/api/v1/chores',
      success: function(chore) {
      $('#chore').html(chore.title)
      }
    });
  });

});