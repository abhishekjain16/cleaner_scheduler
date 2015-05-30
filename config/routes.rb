Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'bookings#index'

  resources :bookings, only: [:index, :create] do
    get :available_slots, on: :collection, format: :json
  end
end
