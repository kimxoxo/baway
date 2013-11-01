// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function hide_all_forms() {
	$('#budgets_products_list table tr form').hide();
	$('#budgets_products_list table tr').css('background-color', 'transparent');
}

function show_spans() {
	$('#budgets_products_list table tr td span').fadeIn(500);
}

function enable_this_tr_forms(tr_id) {
	
	hide_all_forms();

	show_spans();

	$('#product_id_'+tr_id).find('form').first().fadeIn(500);
	$('#product_id_'+tr_id).find('span').first().hide();

	$('#product_id_'+tr_id).find('td').first().addClass('border_left');
	$('#product_id_'+tr_id).find('td').last().addClass('border_right');

	$('#product_id_'+tr_id).css('background-color', '#f5f5f5');

}



function make_td_same_width_for_budget_tables() {

	//first iteration, fit all TDs to text, using width = 1px
	first_tr = $('#table_products_list').find('tr').first();
 	first_tr.find('td').each(function() {

 		td_class = $(this).attr('class'); 

 		if(td_class != "td_description") {
 			$(this).width('1px');
 		}

	})

 	//second iterarion, after all TDs fit, td_description will get the remain available with
 	//so lets make the THs same with of TDs
 	first_tr.find('td').each(function() {

 		td_width = $(this).width();
 		td_class = $(this).attr('class');


 		if(td_class != "td_description") {
 			$('#budgets_products_list').find('th.'+td_class).width(td_width);
 		}

 	})



 	//third iterarion, if after all the THs are bigger than it's TDs, lets make TDs same with as THs
	first_tr = $('#table_products_list').find('tr').first();
 	first_tr.find('td').each(function() {	

 		td_class = $(this).attr('class'); 


		td_width = $('#budgets_products_list').find('th.'+td_class).width();

 		if(td_class != "td_description") {
 			$(this).width(td_width);
 		}

	})


 	//fourth iterarion, for table results
	first_tr = $('#table_results').find('tr').first();
 	first_tr.find('th').each(function() {	

 		
 		td_class = $(this).attr('class'); 

		td_width = $('#table_products_list').find('td.'+td_class).width();



 		if(td_class != "td_description") {

 			$(this).width(td_width);
 		}

	})


g = $('#products_list').height();
h = $('#table_products_list').height();

alert(h);



}




function search_tax_number_and_populate(tax_number) {
  

	if($('#budget_customer_attributes_tax_number_type').val() == 1) {
		tax_number_length = 18
	}
	else if($('#budget_customer_attributes_tax_number_type').val() == 2) {
		tax_number_length = 14
	}


	if($('#budget_customer_attributes_tax_number').val().length == tax_number_length) {

		//enable spinner
		$("#icon-loading-customer-search").addClass("icon-spinner icon-spin icon-large");

  	$.get('/budgets/new.js?tax_number=' + tax_number);      
  }

}


function enable_form() {

	$('#budget_client_div_show').hide();
	$('#budget_client_div').fadeIn(1000);
}




jQuery(document).ready(function($) {

	
});