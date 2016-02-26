Rails.application.routes.draw do

  resources 'announces', only: [:index, :new, :create, :show, :edit]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'pages#contact'

end
