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

 
  errorList = [];

    function getSessionErrors() {
    $.ajax({
      type: 'GET',
      url: '/session.json',
      success: function(response) { $.each(response, function(x, item) {
       errorList.push(item)
       if (errorList.length == 1)
        error.show(errorList[0]); 
      }) },
      error: function(response) { console.log ("FAIL"); }
    })
  }

  var error = {
    show: function(msg) { $('#basic_nav').append('<div id="error">' + msg + '</div>'); },
    hide: function() { $('#error').remove(); }
    };

    getSessionErrors();   
 

  

});


