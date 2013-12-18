jQuery(function($){


$(".show-links").hide();

$("i.fi-list").click(function(){
	
	$(this).children(".show-links").slideToggle();
});


$(function() {
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
  });


});

$("i.fi-x").click(function(){
	$("#welcome").fadeOut("slow");
});

$('.infinite-scroll').jscroll();