Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "menus#index"

  resources :menus do
    collection do
      post :import, to: 'menus#import'
    end
  end
end
