Rails.application.routes.draw do
	root "cities#index"

	resources :cities
	resources :users do
		resources :posts

		collection do
			post '/validate_user', to: "users#validate_user"
		end 
	end

	post '/login',					to: "sessions#create",				as: "login"
	delete '/login',				to: "sessions#destroy"
	delete 	'/users/:user_id/posts/:id',	to: "posts#destroy",				as: "delete_post"

end
