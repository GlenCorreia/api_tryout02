Rails.application.routes.draw do
  delete 'sample/delete_record'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :books, only: [:index, :create, :destroy]
end
