jQuery(function($){


$(".show-links").hide();

$("i.fi-list").click(function(){
	
	$(this).children(".show-links").slideToggle();
});


$(function() {
    $( "#subtopics" ).sortable({
    	update: function(){
    		alert("updated")}

    });

    $( "#subtopics" ).disableSelection();
  });


});

$("i.fi-x").click(function(){
	$("#welcome").fadeOut("slow");
});
