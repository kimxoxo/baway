// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



function enable_this_tr_forms(tr_id) {


	$('#budgets_products_list table tr form').hide();
	$('#budgets_products_list table tr td span').fadeIn(500);
	$('#budgets_products_list table tr').css('background-color', 'transparent');



	$('#product_id_'+tr_id).find('form').fadeIn(500);
	$('#product_id_'+tr_id).find('span').hide();

	$('#product_id_'+tr_id).find('td').first().addClass('border_left');
	$('#product_id_'+tr_id).find('td').last().addClass('border_right');

	$('#product_id_'+tr_id).css('background-color', '#f5f5f5');
	$('#product_id_'+tr_id).css('background-color', '#f5f5f5');

}



function make_td_same_width_for_budget_tables() {

	//first iteration
	first_tr = $('#table_products_list').find('tr').first();
 	first_tr.find('td').each(function() {

 		td_class = $(this).attr('class'); 

 		if(td_class != "td_description") {
 			$(this).width('1px');
 		}

	})

 	//second iterarion
 	first_tr.find('td').each(function() {

 		td_width = $(this).width();
 		td_class = $(this).attr('class');


 		if(td_class != "td_description") {
 			$('#budgets_products_list').find('th.'+td_class).width(td_width);
 		}

 	})



 	//third iterarion
	first_tr = $('#table_products_list').find('tr').first();
 	first_tr.find('td').each(function() {	

 		td_class = $(this).attr('class'); 


		td_width = $('#budgets_products_list').find('th.'+td_class).width();

 		if(td_class != "td_description") {
 			$(this).width(td_width);
 		}

	})

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