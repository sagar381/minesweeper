Rails.application.routes.draw do
  resources :boards, only: [:index, :show]

  post '/create_board', to: 'boards#create', as: :create_board

  root 'boards#index'
end
