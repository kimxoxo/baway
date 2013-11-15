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
	height_table_right = $('.main_content').height();
	body_height = $('body').height();
	window_height = $(window).height();


	if (body_height > window_height) {

		$('#filter_list').css("height", height_table_right);
		$('#vertical_menu').css("height", height_table_right);

	}
}



//define and tooltips
$(function() {

  $('#vertical_menu li a').tooltip({placement: 'right'});



	sets_filter_div_height();


});


