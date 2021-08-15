Rails.application.routes.draw do
 resources :pets do 
    member do
      delete :delete_pet_photo
      post  :upload_pet_photos
    end
 end
  get '/dashboard', to: 'users#dashboard'
  post '/edit/user', to: 'users#update'
  devise_for :users, path: '',controllers: { omniauth_callbacks: 'omniauth_callbacks',registrations: 'registrations' },
            path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register',edit: 'profile' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
