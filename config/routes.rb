Rails.application.routes.draw do
	namespace :api, defaults: { format: 'json' } do
		namespace :v1 do
			resource :sign_up, only: [:create]
		end
	end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
