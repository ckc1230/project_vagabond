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
	post '/sessions/verify_login',		to: "sessions#verify_login"
	post '/posts/new_post',						to: "posts#verify_new_post"
	delete 	'/users/:user_id/posts/:id',	to: "posts#destroy",		as: "delete_post"
	put '/users/:user_slug/posts/:id', to: "posts#update", 				as: "update_user_post"

end
