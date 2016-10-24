Rails.application.routes.draw do
	root "cities#index"

	resources :cities
	resources :users do
		resources :posts 
	end

	post '/login',					to: "sessions#create",				as: "login"
	delete '/login',				to: "sessions#destroy"

end
