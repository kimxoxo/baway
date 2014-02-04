// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require bootstrap
//= require_self
//= require_tree .



function sets_filter_div_height() {
	//when the table with the form with check boxes is longer than body executes the following
	header_height = $('header').height();
	body_height = $(document).height();
	footer_height = $('footer').height();

	// -1 for the border, otherwise the scrollbar would always be there
	computed_height = body_height - header_height - footer_height

	$('#vertical_menu').css("height", computed_height);

}



//define and tooltips
$(function() {

  $('#vertical_menu li a').tooltip({placement: 'right'});

	sets_filter_div_height();

});


