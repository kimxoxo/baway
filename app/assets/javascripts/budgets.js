// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.




function make_pair_and_submit(budget_product_id, product_type) {


	product_id_val = $('#product_id').val();
	labor_id1_val  = $('#labor_id1').val();
	labor_id2_val  = $('#labor_id2').val();
	
	
	if(product_type != 0) {

		$('#product_id').val(budget_product_id);

	}
	else if(product_type == 0) {

		if((labor_id1_val == "")) {
		
			$('#labor_id1').val(budget_product_id);
		
		} else if((labor_id1_val != "") && (labor_id2_val == "")) {
			
			$('#labor_id2').val(budget_product_id);
		
		} else if((labor_id1_val != "") && (labor_id2_val != "")) {

			$('#labor_id1').val(budget_product_id);
			$('#labor_id2').val('');
		}

	}

	product_id_val = $('#product_id').val();
	labor_id1_val = $('#labor_id1').val();
	labor_id2_val = $('#labor_id2').val();
	


	if(product_type != 0) {
		$('#make_pair_form').submit();

		$('#product_id').val('');
		$('#labor_id1').val('');
		$('#labor_id2').val('');
	}

	if ((labor_id1_val == labor_id2_val)) {

		$('#make_pair_form').submit();

		$('#product_id').val('');
		$('#labor_id1').val('');
		$('#labor_id2').val('');
	}

}



function enable_payment_condition_input() {

	$('#custom_monthly_payment_option').show();
}



function enable_form_budget_more_details() {

	$('#div_budget_more_details_show').hide();
	$('#div_budget_more_details_edit').fadeIn(500);

}



function enable_form_budget_delivery_details() {

	$('#div_budget_delivery_details_show').hide();
	$('#div_budget_delivery_details_edit').fadeIn(500);

}




function hide_all_forms() {
	//$('#table_budgets_products_list tr form').hide();
	$('.hide_this_form').hide();
	$('#table_budgets_products_list tr').css('background-color', 'transparent');
}



function show_spans() {
	$('#budgets_products_list table tr td span').fadeIn(500);
}



function show_pencils() {
	$('#budgets_products_list table tr td a i').fadeIn(500);
}



function enable_this_tr_forms(tr_id, attr) {
	
	hide_all_forms();

	show_spans();


	$('#form_' + attr + '_' + tr_id).fadeIn(500);
	$('#form_' + attr + '_' + tr_id).parent('td').find('span').hide();

	$('#form_' + attr + '_' + tr_id).find('td').first().addClass('border_left');
	$('#form_' + attr + '_' + tr_id).find('td').last().addClass('border_right');

	$('#form_' + attr + '_' + tr_id).css('background-color', '#f5f5f5');


	$('#product_id_' + tr_id + ' .td_pencil_' + attr).find('a').first().find('i').hide();

	$('#form_'+ attr + '_' + tr_id).find('input').focus();
}



function enable_this_form_discount() {

	$('#form_budget_discount').show();

	$('#span_discount_show').hide();

	$('#span_pencil_discount_show').hide();

}



function make_td_same_width_for_budget_tables() {

	//first iteration, fit all TDs to text, using width = 1px
	first_tr = $('#table_products_list').find('tr').first();
 	first_tr.find('td').each(function() {

 		td_class = $(this).attr('class'); 

 		//alert(td_class);


 		if(td_class != "td_description") {
 			$(this).width('1%');
 			$('#budgets_products_list table tr th.'+td_class).width('1%');
 			$('#table_results th.'+td_class).width('1%');
 		}
	})




	first_tr = $('#budgets_products_list table').first().find('tr');
 	first_tr.find('th').each(function() {

 		td_class = $(this).attr('class'); 

 		if(td_class != "td_description") {


 			td_width1 = $(this).width();
 			td_width2 = $('#table_products_list tr').first().find('.'+td_class).width();
 			td_width3 = $('#table_results th.'+td_class).width();


 			//alert(td_class+"--a:"+td_width1+"-b:"+td_width2+"-c:"+td_width3);


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


	w = $('#table_results th.td_price').width();
	$('#table_results2 th.td_price').width(w);

	w = $('#table_results th.td_delete').width();
	$('#table_results2 th.td_delete').width(w);

}



function search_tax_number_and_populate(tax_number) {
  

	if($('#budget_customer_attributes_tax_number_type').val() == 1) {
		tax_number_length = 14
	}
	else if($('#budget_customer_attributes_tax_number_type').val() == 2) {
		tax_number_length = 18
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





function create_popovers() {

	$('.td_product_type:not(:eq(0))').each(function() {

		id = $(this).find('a').attr('id');

	  // Associa o evento do popover ao clicar no link.
	  $('#' + id).popover({
	     trigger: 'manual',
	     html: true,
	     class: 'popover',
	     title: 'Cálculo Cortina',
	     content: $('#div_popover' + id).html() // Adiciona o conteúdo da div oculta para dentro do popover.
	  }).click(function (e) {
	     e.preventDefault();
	     // Exibe o popover.
	     $(this).popover('show');
	  });


		$('#btn_fechar' + id).on('click', function (e) {
    	$('#' + id).popover('hide');
		});

	})

}


function close_please(id) {
	$('#' + id).popover('hide');
}





jQuery(document).ready(function($) {

	
});