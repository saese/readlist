jQuery(function($){

	$(".show-links").hide();

	$("i.fi-list").click(function(){
		$(this).children(".show-links").slideToggle();
	});



  	$('#subtopics').sortable({
    	update: function() {
      		return $.post($(this).data('update-url'), $(this).sortable('serialize'));
    	}
 	});


	$("i.fi-x").click(function(){
		$("#welcome").fadeOut("slow");
	});

});
