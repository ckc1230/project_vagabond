Rails.application.routes.draw do
	root "cities#index"

	resources :cities
	resources :users do
		resources :posts 
	end

	post '/login',					to: "sessions#create",				as: "login"
	delete '/login',				to: "sessions#destroy"
	delete 	'/users/:user_id/posts/:id',	to: "posts#destroy",		as: "delete_post"
	put '/users/:user_slug/posts/:id', to: "posts#update", 				as: "update_user_post"

end
