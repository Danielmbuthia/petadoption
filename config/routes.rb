Rails.application.routes.draw do
  devise_for :users, path: '',controllers: { omniauth_callbacks: 'omniauth_callbacks',registrations: 'registrations' },
            path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
