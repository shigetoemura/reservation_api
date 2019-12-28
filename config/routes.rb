Rails.application.routes.draw do
	namespace :api, defaults: { format: 'json' } do
		namespace :v1 do
			resource :sign_up, only: [:create]
			resources :users, only: [:index, :show, :update] do
				collection do
					get :men
					get :women
				end
				member do
					resources :blocks, only: [:create]
					resources :reports, only: [:create]
					resources :match_requests, only: [:create]
				end
			end
			resource :me, only: [:show, :update]

			resources :match_requests, only: [:index] do
				post :accept
				post :skip
			end

			resources :matches, only: [:index] do
				member do
					resources :chats, only: [:create, :index]
				end
				resources :candidate_dates, only: [:index, :create] do
					member do
						post :accept
						resources :reservations, only: [:create]
					end
				end
			end

			resources :user_restaurants, only: [:create, :update, :destroy]

			resources :reservations, only: [:destroy, :show] do
				member do
					post :accept
					post :cancel
				end
			end

			resources :restaurants, only: [:create, :index] do
				collection do
					get :search
				end
			end

			resources :user_images, only: [:create, :destroy, :update]
			resources :user_age_verifications, only: [:create] do
		        member do
		          post :pass
		          delete :fail
		        end
      		end
		end
	end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
