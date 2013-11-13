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
 			$('#budgets_products_list table tr th.'+td_class).width('1px');
 			$('#table_results th.'+td_class).width('1px');
 		}
	})




	//first iteration, fit all TDs to text, using width = 1px
	first_tr = $('#budgets_products_list table').first().find('tr');
 	first_tr.find('th').each(function() {

 		td_class = $(this).attr('class'); 

 		if(td_class != "td_description") {

 			td_width1 = $(this).width();
 			td_width2 = $('#table_products_list tr').first().find('.'+td_class).width();
 			td_width3 = $('#table_results th.'+td_class).width();


 			//alert("1:"+td_width1+"-2:"+td_width2+"-3:"+td_width3);


			max_td_width = Math.max(td_width1, td_width2, td_width3);

			$(this).width(max_td_width);
			$('#table_products_list tr').first().find('.'+td_class).width(max_td_width);
			$('#table_results th.'+td_class).width(max_td_width);

 		}


 		if(td_class == "td_delete") {

			products_list_height = $('#products_list').height();
			table_products_list_height = $('#table_products_list').height();


			if(table_products_list_height > products_list_height) {
				
				$('#budgets_products_list table tr th.'+td_class).first().width('27px');
				$('#table_results th.td_delete').width('27px');
				$('#table_products_list tr').first().find('.td_delete').width('10px');

			} else if(table_products_list_height < products_list_height) {
				
				$('#budgets_products_list table').first().find('th.td_delete').width(max_td_width);
				$('#table_results th.td_delete').width(max_td_width);

			}
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