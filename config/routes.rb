Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
}

  root to: 'home#index'

  get 'errors/reservation_error'
  get 'search/index'

  resources :users, :profiles, only: [:show, :edit, :update]
  resources :rooms do
    collection do
      get 'search', to: 'search#search', as: 'search'
    end
  end

  resources :reservations do
    member do
      post :confirm, action: :confirm_new
      patch :confirm_edit
    end
  end

  get '/reservations/:id/confirm', to: 'errors#reservation_error'
  get '/reservations/:id/confirm_edit', to: 'errors#reservation_error'
end
