Rails.application.routes.draw do
	root "cities#index"

	resources :users do
		resources :posts 
	end
end
