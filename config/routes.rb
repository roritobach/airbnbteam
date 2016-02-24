Rails.application.routes.draw do

  resources 'announces', only: [:index, :new, :create, :show]
  devise_for :users
  root 'pages#contact'

end
