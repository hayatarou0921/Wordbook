Rails.application.routes.draw do
  resources :wordlists,except: [:show], shallow: true do
    resources :words, except: [:show]
  end
  
  devise_for :users

  root 'static_pages#home'
  get '/about' => 'static_pages#about'
end
