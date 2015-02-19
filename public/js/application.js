$(document).ready(function() {
  
  $('.one-review').find('form').on('submit', function(event) {
    event.preventDefault();
    var $target = $(event.target);

    $.ajax({
      type: 'DELETE',
      url: $target.attr('action')
    }).done(function(response) {
      $target.closest('.one-review').remove()
    });
    

    })

});
