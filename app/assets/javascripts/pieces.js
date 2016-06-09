$(function() {
  $('.piece').draggable({ containment: "table", revert: 'invalid' });

  $('td').droppable({
    drop: function(ev, ui) {
      $( this ).addClass( "ui-state-highlight" )

      // Get Dropped item and drop location
      var dropped = ui.draggable;
      var droppedOn = $(this);

      // Move the Piece in the UI
      $(droppedOn).droppable("disable");
      $(dropped).parent().droppable("enable");
      $(dropped).detach().css({top: 0, left: 0}).appendTo(droppedOn);

      // Send the new coordinates to the controller
      var data = JSON.parse(dropped.attr("data"));
      var url = "/games/" + data.game_id + "/pieces/" + data.id;
      data.x_position = null; // Add x position here, need to obtain from board
      data.y_position = null; // Add y position here, need to obtain from board
      $.ajax({
        url: url,
        type: 'PUT',
        dataType: 'json',
        data: data,
      }).done(function(data) {
        console.log("done", data);
      }).fail(function(error) {
        console.log("error", error);
      });
    }
  });

});
