// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function search_tax_number_and_populate(tax_number) {
  


	if($('#customer_tax_number_type').val() == 1) {
		tax_number_length = 18
	}
	else if($('#customer_tax_number_type').val() == 2) {
		tax_number_length = 14
	}


	if($('#customer_tax_number').val().length == tax_number_length) {

		//enable spinner
		$("#icon-loading-customer-search").addClass("icon-spinner icon-spin icon-large");

  	$.get('/budgets/new.js?tax_number=' + tax_number);      
  }

}
