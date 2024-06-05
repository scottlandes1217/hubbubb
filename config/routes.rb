Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get 'setup', to: 'setup#dashboard', as: 'setup_dashboard'

  resources :custom_objects do
    resources :custom_fields
    resources :custom_records, only: [:index, :new, :create]
  end

  # Health check route
  get 'up' => 'rails/health#show', as: :rails_health_check
end