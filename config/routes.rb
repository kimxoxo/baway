Baway::Application.routes.draw do


  root :to => redirect("/budgets")


  devise_for :users

  resources :budgets do
    collection { get :products_search }
    collection { get :update_products_list }
    collection { get :update_products_list_show_hide }
		collection { get :show_hidden_products }
    collection { get :update_product_attributes }
    collection { get :validate_budget }
    collection { post :compute_product_type3 }
    collection { get :make_pair }
  end


	resources :products do
	  collection { post :import }
	end


  resources :payment_conditions


  resources :users do
    collection { get :new_architect }
    collection { get :create_architect }
    member { get :edit_architect }  
    member { put :update_architect }
  end


  resources :suppliers

  resources :customers

  resources :requests

end
