Rails.application.routes.draw do
  root to: 'pages#home'
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end

end
