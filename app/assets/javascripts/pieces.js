$(function() {
	$('.piece').draggable({ containment: "table", revert: 'invalid' });

	$('td').droppable({
		drop: function(ev, ui) {
			$( this ).addClass( "ui-state-highlight" )
      var dropped = ui.draggable;
      var droppedOn = $(this);
      $(droppedOn).droppable("disable");
      $(dropped).parent().droppable("enable");
      $(dropped).detach().css({top: 0, left: 0}).appendTo(droppedOn);
      var data = JSON.parse(dropped.attr("data"));
      $.ajax({
        url: '/games/'+ data.game_id + '/pieces/' + data.id,
        type: 'PUT',
        success: function(result) {
            // Do something with the result
        }
      });
  	}
	});

});


// $(function() {
// 	$('.piece').draggable({ containment: "table", revert: 'invalid' });

// 	$('td').droppable({
//     drop: function(ev, ui) {
//       var dropped = ui.draggable;
//       var droppedOn = $(this);
//       $(droppedOn).droppable("disable");
//       $(dropped).parent().droppable("enable");
//       $(dropped).detach().css({top: 0, left: 0}).appendTo(droppedOn);
//   	}
// 	});

// 	$('td').not('td:empty').droppable("disable");

// });



// $(function() {
//     $( ".piece" ).draggable({
//     	containment: "table",
//     	revert: 'invalid'
//     });
//     $( "td" ).droppable({
//       accept: ".piece",
//       activeClass: "ui-state-hover",
//       hoverClass: "ui-state-active",
//       drop: function( event, ui ) {
        // $( this )
        //   .addClass( "ui-state-highlight" )
//       }
//     });
//   });







// $(function() {
// 	$(".piece").draggable();
// 	$(".piece").droppable({
// 		drop: function() {
// 			alert("piece moved");
// 		}
// 	});
// });




// $(function(){
// 	console.log("login");
// 	$(".piece").draggable();
// });