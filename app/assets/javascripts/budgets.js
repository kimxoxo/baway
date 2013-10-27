// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function make_td_same_width_for_budget_tables() {


	first_tr = $('#table_products_list').find('tr').first();

	first_tr.find('td').each(function() {




	 	td_class = $(this).attr('class'); 
	 	td_width = $(this).width();


	 	

	 	$('.'+td_class).css('width', td_width);

	 	alert(td_class + td_width);

	});


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
	$('#budget_client_div').fadeIn(1000);;
}




jQuery(document).ready(function($) {

	
});